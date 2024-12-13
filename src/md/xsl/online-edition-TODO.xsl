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

