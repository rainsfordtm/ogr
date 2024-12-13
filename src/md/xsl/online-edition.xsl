<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="html" encoding="UTF-8" indent="no"/>
    
    <!-- TODO: add header for hugo -->

    <xsl:template match="/">
        <!-- Select text node -->
        <xsl:apply-templates select="descendant::tei:text"/>
    </xsl:template>
    
    <xsl:template match="tei:text">
        <!-- Set up two-column layout -->
        <div class="ogr-row">
            <div class="ogr-column">
                <xsl:apply-templates mode="norm"/>
            </div>
            <div class="ogr-column">
                <xsl:apply-templates mode="dipl"/>
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
                <xsl:value-of select="./parent::node()/local-name()"/>
            </xsl:attribute>
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
            <xsl:apply-templates mode="#current"/>
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
                            <xsl:text>(</xsl:text>
                            <xsl:value-of select="substring-after(., '(')"/>
                            <xsl:text>)</xsl:text>
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
                <!-- Print a space -->
                <xsl:text>&#xa0;</xsl:text>
            </xsl:when>
            <xsl:when test="$wddiv = '+'">
                <!-- Print nothing at all -->
            </xsl:when>
            <xsl:when test="contains($wddiv, '|')">
                <!-- Print everything before the vertical bar,
                then a space,
                then the vertical bar -->
                <xsl:value-of select="substring-before($wddiv, '|')"/>
                <xsl:text>&#xa0;</xsl:text>
                <xsl:text>|</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <!-- Print wd_div followed by a space -->
                <xsl:value-of select="$wddiv"/>
                <xsl:text>&#xa0;</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="@ana" mode="norm">
        <!-- Ignore @ana for the normalized text -->
    </xsl:template>
    
    <xsl:template match="text()" mode="norm">
        <!-- Print the text node for the normalized text -->
        <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="text()" mode="dipl">
        <!-- Ignore text nodes for diplomatic text -->
    </xsl:template>
    
</xsl:stylesheet>
