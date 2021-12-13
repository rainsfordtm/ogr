<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:txm="http://textometrie.org/1.0" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="xhtml" encoding="UTF-8" indent="no"/>

    <xsl:param name="edition-name"> dipl </xsl:param>

    <xsl:param name="number-words-per-page"><!-- Ignored by this stylesheet --> 999999 </xsl:param>

    <xsl:param name="pagination-element"><!-- Ignored by this stylesheet --> a[@class='txm-page'] </xsl:param>

    <xsl:param name="css-name"><!-- Ignored by this stylesheet --> ogr-txm-dipl.css </xsl:param>

    <xsl:param name="output-directory">
        <xsl:value-of select="concat($current-file-directory, '/', $edition-name)"/>
    </xsl:param>

    <xsl:variable name="current-file-name">
        <!-- Copied from TXM default stylesheets -->
        <xsl:analyze-string select="document-uri(.)" regex="^(.*)/([^/]+)\.[^/]+$">
            <xsl:matching-substring>
                <xsl:value-of select="regex-group(2)"/>
            </xsl:matching-substring>
        </xsl:analyze-string>
    </xsl:variable>

    <xsl:variable name="current-file-directory">
        <!-- Copied from TXM default stylesheets -->
        <xsl:analyze-string select="document-uri(.)" regex="^(.*)/([^/]+)\.[^/]+$">
            <xsl:matching-substring>
                <xsl:value-of select="regex-group(1)"/>
            </xsl:matching-substring>
        </xsl:analyze-string>
    </xsl:variable>

    <xsl:template match="/">
        <!-- Adapted from TXM default stylesheets, combines edition and pager -->
        <!-- xsl:result-document href="{$output-directory}/{$current-file-name}_1.html/" -->
        <html>
            <head>
                <title>
                    <xsl:choose>
                        <xsl:when test="//tei:text/@id">
                            <xsl:value-of select="//tei:text[1]/@id"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$current-file-name"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </title>
                <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
                <meta name="description" content="{//tei:text/descendant::tei:w[1]/@id}"/>
                <meta name="txm:first-word-id" content="{//tei:text/descendant::tei:w[1]/@id}"/>
                <!-- As required by TXM docs -->
                <link rel="stylesheet" media="all" type="text/css" href="css/ogr-txm-dipl.css"/>
            </head>
            <xsl:apply-templates select="descendant::tei:text"/>
        </html>
        <!-- /xsl:result-document -->
    </xsl:template>

    <xsl:template match="tei:text">
        <!-- Add lb/cb/pb elements to each tei element -->
        <xsl:variable name="text">
            <xsl:apply-templates mode="add-lb"/>
        </xsl:variable>
        <!-- Adapted from default TXM stylesheet -->
        <body>
            <!-- a class="txm-page" title="1" next-word-id="w_0"/ -->
            <div class="txmeditionpage">
                <h1>
                    <xsl:value-of select="@id"/>
                </h1>
                <br/>
                <table>
                    <xsl:for-each select="@*">
                        <tr>
                            <td>
                                <xsl:value-of select="name()"/>
                            </td>
                            <td>
                                <xsl:value-of select="."/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </div>
            <xsl:for-each select="$text//tei:pb">
                <xsl:variable name="this-page" select="@n"/>
                <div class="txmeditionpage">
                    <h2>
                        <xsl:value-of select="@n"/>
                    </h2>
                    <xsl:choose>
                        <xsl:when test="following::tei:cb">
                            <!-- A one-row table -->
                            <table>
                                <tr>
                                    <xsl:for-each select="$text//tei:cb[@tei-pb = $this-page]">
                                        <td>
                                            <xsl:apply-templates select="$text/tei:*"
                                                mode="render-test">
                                                <xsl:with-param name="this-page" select="$this-page"/>
                                                <xsl:with-param name="this-col" select="@n"/>
                                            </xsl:apply-templates>
                                        </td>
                                    </xsl:for-each>
                                </tr>
                            </table>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- Just print the text -->
                            <xsl:apply-templates select="$text/tei:*" mode="render-test">
                                <xsl:with-param name="this-page" select="$this-page"/>
                            </xsl:apply-templates>
                        </xsl:otherwise>
                    </xsl:choose>
                </div>
            </xsl:for-each>
        </body>
    </xsl:template>

    <!-- Add lb / cb / pb elements -->
    <xsl:template match="*" mode="add-lb">
        <!-- Result of applying this template is a tree with "tei:lb/pb/cb" attribute on each and every element -->
        <xsl:copy>
            <xsl:attribute name="tei-lb" select="preceding::tei:lb[position() = 1]/@n"/>
            <xsl:attribute name="tei-pb" select="preceding::tei:pb[position() = 1]/@n"/>
            <xsl:attribute name="tei-cb" select="preceding::tei:cb[position() = 1]/@n"/>
            <xsl:apply-templates select="@*" mode="copy"/>
            <xsl:apply-templates mode="add-lb"/>
        </xsl:copy>
    </xsl:template>

    <!-- Render test 1 -->
    <xsl:template match="tei:w | tei:pc | tei:lb | tei:surplus" mode="render-test">
        <!-- Evaluates whether the element should be rendered.-->
        <xsl:param name="this-page">false</xsl:param>
        <xsl:param name="this-col">false</xsl:param>
        <xsl:if
            test="($this-page = 'false' or $this-page = @tei-pb) and ($this-col = 'false' or $this-col = @tei-cb)">
            <xsl:apply-templates select="."/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="tei:*" mode="render-test">
        <!-- Apply render test to child elements -->
        <xsl:param name="this-page">false</xsl:param>
        <xsl:param name="this-col">false</xsl:param>
        <xsl:apply-templates mode="render-test">
            <xsl:with-param name="this-page" select="$this-page"/>
            <xsl:with-param name="this-col" select="$this-col"/>
        </xsl:apply-templates>
    </xsl:template>

    <!-- Render words, punctuation, lbs and surplus elements; ignore everything else. -->

    <xsl:template match="tei:w">
        <xsl:element name="span">
            <xsl:attribute name="id" select="@id"/>
            <xsl:attribute name="class">w</xsl:attribute>
            <xsl:attribute name="title">
                <xsl:apply-templates
                    select="txm:ana[@type = ('#dipl', '#pos_syn', '#morph', '#lemma', '#lemma_dmf')]"
                    mode="title-string"/>
            </xsl:attribute>
            <xsl:apply-templates select="txm:ana[@type = '#dipl']"/>
        </xsl:element>
        <xsl:apply-templates select="txm:ana[@type = '#wd_div']"/>
        <!-- Will use txm:ana wd_div to print following punctuation, non-break space, etc. -->
    </xsl:template>

    <xsl:template match="tei:lb">
        <br/>
        <xsl:text>
            
        </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:surplus">
        <!-- Surplus, untokenized text, not included in the corpus -->
        <xsl:element name="span">
            <xsl:attribute name="class">surplus</xsl:attribute>
            <xsl:attribute name="title">
                <xsl:apply-templates select="@*" mode="title-string"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="txm:ana" mode="title-string">
        <xsl:value-of select="substring(@type, 2)"/>
        <xsl:text>:</xsl:text>
        <xsl:value-of select="text()"/>
        <xsl:if test="not(position() = last())">
            <xsl:text> </xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="@*[not(name()='tei-lb' or name()='tei-pb')]" mode="title-string">
        <!-- For <ab> properties -->
        <xsl:value-of select="name()"/>
        <xsl:text>:</xsl:text>
        <xsl:value-of select="."/>
        <xsl:if test="not(position() = last())">
            <xsl:text> </xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="txm:ana">
        <!-- Render of both dipl and wd_div. Will only mark first abbrv. -->
        <xsl:if test="@type = '#dipl'">
            <xsl:for-each select="tokenize(., '\]')">
                <xsl:choose>
                    <xsl:when test="contains(., '[')">
                        <xsl:value-of select="replace(substring-before(., '['), '_', '&#xa0;')"/>
                        <xsl:choose>
                            <xsl:when test="contains(., '[=') or contains(.,'[+')">
                            <!-- Corrections denoted by [= or [+ (an added token) -->
                                <span class="corr">
                                    <xsl:text>[</xsl:text>
                                    <xsl:value-of select="substring-after(., '[')"/>
                                    <xsl:text>]</xsl:text>
                                </span>
                            </xsl:when>
                            <xsl:otherwise>
                                <span class="abbr">
                                    <xsl:value-of select="replace(substring-after(., '['), '_', '&#xa0;')"/>
                                </span>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="replace(., '_', '&#xa0;')"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="@type = '#wd_div'">
            <!-- semi-colon > underscore is an issue here -->
            <xsl:choose>
                <xsl:when test="text() = '_'">
                    <xsl:text>&#xa0;</xsl:text>
                </xsl:when>
                <xsl:when test="text() = '+'"/>
                <xsl:when test="contains(text(), '|')">
                    <xsl:value-of select="substring-before(text(), '|')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="text()"/>
                    <xsl:text>&#xa0;</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <!-- What to do with non-rendered elements: process children (elements) or ignore (others) -->
    <xsl:template match="tei:*">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="text()" mode="#default render-test"/>

    <!-- Copy everything templates (NOT for elements) -->

    <xsl:template match="@*" mode="copy">
        <xsl:copy/>
    </xsl:template>

    <xsl:template match="text()" mode="copy">
        <xsl:copy/>
    </xsl:template>

</xsl:stylesheet>
