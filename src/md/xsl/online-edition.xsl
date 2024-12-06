<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="html" encoding="UTF-8" indent="no"/>
    
    <!-- TODO: add header for hugo -->

    <xsl:template match="/">
        <!-- Select text node -->
        <xsl:apply-templates select="descendent::tei:text"/>
    </xsl:template>
    
    <xsl:template match="tei:text">
        <!-- Set up two-column layout -->
        <div class="ogr-row">
            <div class="ogr-column">
                <xsl:apply-templates mode="#norm"/>
            </div>
            <div class="ogr-column">
                <xsl:apply-template mode="#dipl"/>
            </div>
        </div>
    </xsl:template>
    
    <!-- TEXT STRUCTURES (ps, abs, lgs) -->
    
    <xsl:template match="tei:p | tei:ab | tei:lg" mode="#all">
        <!-- Turn abs, ps, lgs into HTML p elements -->
        <xsl:element name="p">
            <xsl:attribute name="class">
                <!-- Class contains ogr-lang-X and ogr-Y, where X is the
                language and Y is the original block type -->
                <xsl:text>ogr-lang-</xsl:text>
                <xsl:choose>
                    <xsl:when test="@lang">
                        <xsl:value-of select="@lang"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="ancestor::*[@lang][position() = 1]"/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:text> ogr-</xsl:text>
                <xsl:value-of="./parent::node()/local-name()"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Verse lines -->
    
    <xsl:template match="tei:l" mode="#all">
        <xsl:variable name="lineno" select="@n"/>
        <!-- Print words first -->
        <xsl:apply-templates mode="#current"/>
        <span class="ogr-lineno">
            <xsl:if test="ends-with(@n, '0') or ends-with(@n, '5')">
                <xsl:value-of select="@n"/>
            </xsl:if>
        </span>
        <xsl:if test="following-sibling::tei:l">
            <br/>
        </xsl:if>
    </xsl:template>
    
    <!-- WORDS -->
    
    <xsl:template match="tei:w" mode="#all">
        <xsl:element name="span">
            <xsl:attribute name="id" select="@id"/>
            <xsl:attribute name="class">ogr-w</xsl:attribute>
            <!-- Place in italics any word whose lang tag does not correspond to the 
                language of the closest ancestor node with a lang specification.-->
            <xsl:if test="@lang != ancestor::node()[@lang != ''][position()=1]/@lang">
                <xsl:attribute name="style">font-style: italic;</xsl:attribute>
            </xsl:if>
            <xsl:attribute name="title">
                <xsl:value-of select="@lemma"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="@pos"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="@msd"/>
            </xsl:attribute>
            <xsl:apply-templates select="@ana" mode="#current"/>
            <xsl:apply-templates select="text()" mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="@ana" mode="#dipl"/>
        <!-- TODO: Process @ana to derive @dipl form -->
        
    </xsl:template>
    
    <xsl:template match="text()" mode"#norm"/>
        <xsl:value-of select="."/>
        <xsl:text> </xsl:text>
    </xsl:template>
    
    <!-- TODO: complete stylesheet -->

    <!-- Theatre texts -->
    
    <xsl:template match="tei:speaker">
        <!-- Encode speaker as h3. Will always be within <sp>, outside <lg> (TEI guidelines). -->
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
    
    <xsl:template match="tei:secl">
        <!-- Text which is out of place and ASSUMED not to be included in a table for verse -->
        <div class="secl">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <!-- Lists -->
    
    <xsl:template match="tei:list">
        <xsl:choose>
            <xsl:when test="@type='label'">
                <dl>
                    <xsl:apply-templates mode="dl"/>
                </dl>
            </xsl:when>
            <xsl:otherwise>
                <ul>
                    <xsl:apply-templates mode="ul"/>
                </ul>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:label" mode="dl">
        <dt><xsl:apply-templates/></dt>
    </xsl:template>
    
    <xsl:template match="tei:label" mode="ul">
        <!-- This template shouldn't be called; turns labels into separate lis -->
        <li><xsl:apply-templates/></li>
    </xsl:template>
    
    <xsl:template match="tei:item" mode="dl">
        <dd><xsl:apply-templates/></dd>
    </xsl:template>
    
    <xsl:template match="tei:item" mode="ul">
        <li><xsl:apply-templates/></li>
    </xsl:template>


    <!--Render TEI elements -->



    <xsl:template match="tei:pb | tei:cb">
        <xsl:element name="span">
            <xsl:attribute name="class">milestone</xsl:attribute>
            <xsl:choose>
                <xsl:when test="@facs">
                    <!-- Deactivated link <a href="{@facs}"> -->
                        <xsl:apply-templates select="." mode="string"/>
                    <!-- Deactivated link </a> -->
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="." mode="string"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
        <xsl:text> </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:pb" mode="string">
        <xsl:text>[</xsl:text>
        <xsl:value-of select="local-name()"/>
        <xsl:text>:</xsl:text>
        <xsl:value-of select="@n"/>
        <xsl:text>]</xsl:text>
    </xsl:template>

    <xsl:template match="tei:gap|tei:supplied">
        <xsl:element name="span">
            <!-- Material marked as "supplied" -->
            <xsl:attribute name="class">supplied</xsl:attribute>
            <xsl:attribute name="title">missing or reconstructed section of text not included in corpus tokens</xsl:attribute>
            <xsl:text>[</xsl:text>
            <xsl:choose>
                <xsl:when test="local-name()='gap' and @unit = 'line'">
                    <xsl:text>............................</xsl:text>
                </xsl:when>
                <xsl:when test="local-name()='gap'">
                    <xsl:text>...</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>]</xsl:text>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:surplus">
        <!-- Don't print -->
    </xsl:template>
    
    <xsl:template match="tei:*">
        <xsl:choose>
            <xsl:when test="not(descendant::tei:lg or descendant::tei:ab or descendant::tei:p)">
                <!-- Spans if it doesn't contain abs, lgs or ps.-->
                <xsl:element name="span">
                    <xsl:attribute name="class" select="local-name()"/>
                    <xsl:if test="@lang">
                        <xsl:attribute name="lang" select="@lang"/>
                    </xsl:if>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <!-- Use a div -->
                <xsl:element name="div">
                    <xsl:attribute name="class" select="local-name()"/>
                    <xsl:if test="@lang">
                        <xsl:attribute name="lang" select="@lang"/>
                    </xsl:if>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="local-name() = 's' and ancestor::tei:p">
            <!-- Print a slash at the end of a sentence in prose texts -->
            <xsl:text>/ </xsl:text>
        </xsl:if>
    </xsl:template>

    <!-- NO COPY EVERYTHING TEMPLATES -->

</xsl:stylesheet>
