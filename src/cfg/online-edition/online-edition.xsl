<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="html" encoding="UTF-8" indent="no"/>
    
    <xsl:template match="/">
        <!-- Write header -->
        <xsl:text>---&#x000A;title: "Texts: </xsl:text>
        <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@type='main' and @xml:lang='en']/text()"/>
        <xsl:text>"&#x000A;date: "</xsl:text>
        <xsl:value-of select="current-date()"/>
        <xsl:text>"&#x000A;summary: "Old Gallo-Romance Corpus - Transcription of </xsl:text>
        <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@type='formal']/text()"/>
        <xsl:text>"&#x000A;weight: 20&#x000A;---&#x000A;&#x000A;</xsl:text>
        <xsl:apply-templates select="descendant::tei:teiHeader"/>
        <!-- Select text node -->
        <xsl:apply-templates select="descendant::tei:text"/>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader">
        <xsl:element name="div">
            <xsl:attribute name="class">ogr-header</xsl:attribute>
            <xsl:text>Composed </xsl:text>
            <xsl:value-of select="tei:profileDesc/tei:creation/tei:date[@type = 'text'][position() = 1]"/>
            <xsl:text> in </xsl:text>
            <xsl:if test="tei:profileDesc/tei:creation/tei:settlement[@type = 'text']">
                <xsl:value-of select="tei:profileDesc/tei:creation/tei:settlement[@type = 'text'][position() = 1]"/>
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:value-of select="tei:profileDesc/tei:creation/tei:region[@type = 'text'][position() = 1]"/>
            <xsl:text>; manuscript copied </xsl:text>
            <xsl:value-of select="tei:profileDesc/tei:creation/tei:date[@type = 'ms'][position() = 1]"/>
            <xsl:text> in </xsl:text>
            <xsl:if test="tei:profileDesc/tei:creation/tei:settlement[@type = 'ms']">
                <xsl:value-of select="tei:profileDesc/tei:creation/tei:settlement[@type = 'ms'][position() = 1]"/>
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:value-of select="tei:profileDesc/tei:creation/tei:region[@type = 'ms'][position() = 1]"/>
            <xsl:text>. Source manuscript: </xsl:text>
            <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:settlement/text()"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:repository/text()"/>
            <xsl:if test="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno[@type = 'catalogue']">
                <xsl:text>, </xsl:text>
                <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno[@type = 'catalogue']"/>
            </xsl:if>
            <xsl:text>.</xsl:text>
            <xsl:if test="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno[@type = 'URI']">
                <xsl:text> Manuscript image: </xsl:text>
                <xsl:element name="a">
                    <xsl:attribute name="href">
                        <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno[@type = 'URI']"/>
                    </xsl:attribute>
                    <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno[@type = 'URI']"/>
                </xsl:element>
            </xsl:if>
            <xsl:element name="blockquote">
                <xsl:apply-templates select="tei:fileDesc/tei:publicationStmt/tei:availability/tei:licence/tei:ab/tei:bibl"/>
            </xsl:element>
            <xsl:if test="tei:encodingDesc/tei:editorialDecl/tei:interpretation[@resp != '#ogrsrc']">
                <xsl:apply-templates select="tei:encodingDesc/tei:editorialDecl/tei:interpretation[@resp != '#ogrsrc']" mode="norm"/>
            </xsl:if>
        </xsl:element>
        <div class="ogr-row">
            <div class="ogr-column">
                <p class="ogr-transcription-title">Uniform transcription</p>
            </div>
            <div class="ogr-column">
                <p class="ogr-transcription-title">Diplomatic transcription</p>
            </div>
        </div>
    </xsl:template>
    
    <!-- TOP-LEVEL UNITS (FOR ALIGNMENT) -->
    
    <xsl:template match="tei:p | tei:ab | tei:lg | tei:sp | tei:stage | tei:docTitle">
        <div class="ogr-row">
            <div class="ogr-column">
                <xsl:apply-templates select="." mode="norm"/>
            </div>
            <div class="ogr-column">
                <xsl:apply-templates select="." mode="dipl"/>
            </div>
        </div>
    </xsl:template>
    
    <!-- TOP-LEVEL UNITS (TO PRINT) -->
    
    <xsl:template match="tei:sp | tei:stage" mode="dipl norm">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template match="tei:p | tei:ab | tei:lg | tei:head" mode="norm">
        <!-- Turn abs, ps, lgs and heads into HTML p elements, adding lang attribute -->
        <xsl:element name="p">
            <xsl:attribute name="class">
                <!-- Class contains ogr-lang-X and ogr-Y, where X is the
                language and Y is the original block type -->
                <xsl:text>ogr-lang-</xsl:text>
                <xsl:choose>
                    <xsl:when test="@xml:lang">
                        <xsl:value-of select="@xml:lang"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="ancestor::*[@lang][position() = 1]"/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:text> ogr-</xsl:text>
                <xsl:value-of select="local-name()"/>
                <!-- If in a stage direction, add here -->
                <xsl:if test="ancestor::tei:stage">
                    <xsl:text> ogr-stage</xsl:text>
                </xsl:if>
            </xsl:attribute>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:p | tei:ab | tei:lg | tei:head" mode="dipl">
        <!-- Turn abs, ps, lgs into HTML p elements, no lang attribute -->
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:text>ogr-</xsl:text>
                <xsl:value-of select="local-name()"/>
            </xsl:attribute>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <!-- LINES AND SENTENCES AND THE LIKE -->
    
    <xsl:template match="tei:l" mode="dipl">
        <span class="ogr-lineno">
            <xsl:if test="ends-with(@n, '0') or ends-with(@n, '5')">
                <xsl:value-of select="@n"/>
            </xsl:if>
        </span>
        <xsl:apply-templates mode="#current"/>
        <xsl:if test="following-sibling::tei:l">
            <br/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:l" mode="norm">
        <span class="ogr-lineno">
            <xsl:if test="ends-with(@n, '0') or ends-with(@n, '5')">
                <xsl:value-of select="@n"/>
            </xsl:if>
        </span>
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:text>ogr-l</xsl:text>
                <xsl:if test="@xml:lang">
                    <xsl:text> ogr-lang-</xsl:text>
                    <xsl:value-of select="@xml:lang"/>
                </xsl:if>
            </xsl:attribute>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
        <xsl:if test="following-sibling::tei:l">
            <br/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:s | tei:cl | tei:phr" mode="norm">       
        <!-- cl and phr elements used in Jonas for the many code-switches --> 
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:text>ogr-</xsl:text>
                <xsl:value-of select="local-name()"/>
                <xsl:if test="@xml:lang">
                    <xsl:text> ogr-lang-</xsl:text>
                    <xsl:value-of select="@xml:lang"/>
                </xsl:if>
            </xsl:attribute>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
        <xsl:if test="local-name() = 's'">
            <xsl:text>/ </xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:secl" mode="norm">
        <!-- Out-of-place text. Within a p element -->
        <xsl:text>( </xsl:text>
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:text>ogr-secl</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
        <xsl:text> )</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:q" mode="norm">
        <!-- Add span -->
        <xsl:element name="span">
            <xsl:attribute name="class">ogr-q</xsl:attribute>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:q" mode="dipl">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <!-- WORDS -->
    
    <xsl:template match="tei:w" mode="norm">
        <xsl:element name="span">
            <xsl:attribute name="id" select="@xml:id"/>
            <xsl:attribute name="class">ogr-w</xsl:attribute>
            <!-- Place in italics any word whose lang tag does not correspond to the 
                language of the closest ancestor node with a lang specification.-->
            <xsl:if test="substring-before(substring-after(@ana, '#lang£'), ' ') != ancestor::node()[@xml:lang != ''][position()=1]/@xml:lang">
                <xsl:attribute name="style">font-style: italic;</xsl:attribute>
            </xsl:if>
            <xsl:attribute name="title">
                <xsl:value-of select="@lemma"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="@pos"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="@msd"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="substring-before(substring-after(@ana, '#phon£'), ' ')"/>
            </xsl:attribute>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
        <xsl:text>&#x000A;</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:w" mode="dipl">
        <xsl:element name="span">
            <xsl:attribute name="id" select="@xml:id"/>
            <xsl:attribute name="class">ogr-w</xsl:attribute>
            <xsl:attribute name="title">
                <xsl:value-of select="@lemma"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="@pos"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="@msd"/>
            </xsl:attribute>
            <xsl:apply-templates select="@ana" mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="@ana" mode="dipl">
        <!-- Step 1. Extract $dipl and $wddiv from the long @ana attribute. -->
        <xsl:variable name="dipl" select="substring-before(substring-after(., '#dipl£'), ' ')"/>
        <xsl:variable name="wddiv" select="substring-before(substring-after(., '#wd_div£'), ' ')"/>
        <!-- Step 2. Generate dipl-expanded.
            - replace (i) open brackets with hash + open bracket 
            - (ii) close brackets with hash
            - Can't handle nested brackets though. -->
        <xsl:variable name="dipl-expanded" 
            select="replace(replace(replace(replace(replace(replace(replace($dipl, '\[', '#['),'\]', '#'), '\(', '#('), '\)', '#'), '\{', '#{'), '\}', '#'), '_', '&#xa0;')"/>
        <!-- Step 3. Tokenize by blocks, then add spans and extra characters appropriate to the markup:
            - class="ogr-corr": editorial corrections using [= or [+ 
            - class="ogr-abbr": manuscript abbreviation denoted by [
            - class="ogr-surplus": extra character in MS, denoted by (
            - class="ogr-shorthand": Shorthand in the Jonas, denoted by {
            -->
        <xsl:for-each select="tokenize($dipl-expanded,'#')">
            <xsl:choose>
                <xsl:when test="substring(., 1,2) = '[=' or substring(., 1,2) = '[+'">
                    <!-- Corrections denoted by [= or [+ (an added token) -->
                    <span class="ogr-corr">
                        <xsl:text>[</xsl:text>
                        <xsl:value-of select="substring-after(., '[')"/>
                        <xsl:text>]</xsl:text>
                    </span>
                </xsl:when>
                 <xsl:when test="substring(., 1, 1) = '['">
                     <span class="ogr-abbr">
                         <xsl:value-of select="substring-after(., '[')"/>
                     </span>
                </xsl:when>
                    <xsl:when test="substring(., 1, 1) = '('">
                        <span class="ogr-surplus">
                            <xsl:value-of select="substring-after(., '(')"/>
                        </span>
                    </xsl:when>
                <xsl:when test="substring(., 1, 1) = '{'">
                    <span class="ogr-shorthand">
                        <xsl:value-of select="substring-after(., '{')"/>
                    </span>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        <!-- Step 4. Process $wddiv to add space or following punctuation -->
        <xsl:choose>
            <xsl:when test="$wddiv = '_'">
                <!-- Print a CR -->
                <xsl:text>&#x000A;</xsl:text>
            </xsl:when>
            <xsl:when test="$wddiv = '+'">
                <!-- Print nothing at all -->
            </xsl:when>
            <xsl:when test="contains($wddiv, '|')">
                <!-- Print everything before the vertical bar,
                then a space,
                then the vertical bar 
                then a CR -->
                <xsl:value-of select="substring-before($wddiv, '|')"/>
                <xsl:text> </xsl:text>
                <xsl:text>|</xsl:text>
                <xsl:text>&#x000A;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <!-- Print wd_div followed by a CR -->
                <xsl:value-of select="$wddiv"/>
                <xsl:text>&#x000A;</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="@ana" mode="norm">
        <!-- Ignore ana in norm mode -->
    </xsl:template>
    
    <xsl:template match="tei:pc" mode="#all">
        <!-- Ignore pc nodes -->
    </xsl:template>
    
    <xsl:template match="text()" mode="dipl">
        <!-- Ignore text nodes for diplomatic text -->
    </xsl:template>
    
    <!-- MILESTONES -->
    
    <xsl:template match="tei:pb | tei:cb" mode="#all">
        <xsl:element name="span">
            <xsl:attribute name="class">ogr-milestone</xsl:attribute>
            <xsl:text>[</xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:text>]</xsl:text>
        </xsl:element>
        <xsl:text> </xsl:text>
    </xsl:template>
    
    <!-- TITLES -->
    
    <xsl:template match="tei:speaker" mode="#all">
        <!-- Encode speaker as h3. Will always be within <sp>, outside <lg> (TEI guidelines). -->
        <h3>
            <xsl:apply-templates mode="#current"/>
        </h3>
    </xsl:template>
    
    <xsl:template match="tei:docTitle" mode="dipl norm">
        <h2>
            <xsl:apply-templates mode="#current"/>
        </h2>
    </xsl:template>
    
    <!-- GAPS AND SUPPLIED -->
    
    <xsl:template match="tei:gap|tei:supplied" mode="norm">
        <xsl:element name="span">
            <!-- Material marked as "supplied" -->
            <xsl:attribute name="class">ogr-supplied</xsl:attribute>
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
    
    <xsl:template match="tei:gap|tei:supplied" mode="dipl">
        <xsl:if test="@reason='illegible'">
            <xsl:element name="span">
                <xsl:attribute name="class">ogr-gap</xsl:attribute>
                <xsl:text>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;</xsl:text>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:surplus" mode="dipl">
        <!-- Surplus, untokenized text, not included in the corpus -->
        <xsl:element name="span">
            <xsl:attribute name="class">ogr-surplus</xsl:attribute>
            <xsl:attribute name="title">
                <xsl:text>surplus text excluded from corpus, reason: </xsl:text>
                <xsl:value-of select="@reason"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:surplus" mode="norm">
        <!-- Surplus, untokenized text, not included in the corpus 
        Ignored in normalized edition. -->
    </xsl:template>
    
    <!-- LISTS -->
    
    <xsl:template match="tei:list" mode="#all">
        <!-- Everything becomes a UL -->
        <ul>
            <xsl:apply-templates mode="#current"/>
        </ul>
    </xsl:template>
    
    <xsl:template match="tei:item" mode="dipl">
        <!-- Items select the chidren of the preceding label -->
        <li>
            <xsl:apply-templates select="preceding-sibling::tei:label[position() = 1]/*" mode="#current"/>
            <xsl:apply-templates mode="#current"/>
        </li>
    </xsl:template>
    
    <xsl:template match="tei:item" mode="norm">
        <!-- Items select the children of the preceding label -->
        <li>
            <strong>
                <xsl:apply-templates select="preceding-sibling::tei:label[position() = 1]/*" mode="#current"/>
            </strong>
            <xsl:apply-templates mode="#current"/>
        </li>
    </xsl:template>
    
    <xsl:template match="tei:label" mode="#all">
        <!-- Ignore labels and their children (processed by ITEM). -->
    </xsl:template>
    
    <!-- RENDERING IN MANUSCRIPT -->

    <xsl:template match="tei:hi" mode="dipl">
        <!-- Underlining in Jonas manuscript -->
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:if test="@rend='underline'">
                    <xsl:text>ogr-underline</xsl:text>
                </xsl:if>
            </xsl:attribute>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:hi" mode="norm">
        <!-- Ignore in normalized mode -->
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
</xsl:stylesheet>
