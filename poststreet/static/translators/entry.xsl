<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:my="http://patrick.wagstrom.net/xml/blog/1">
    <xsl:output method="html" indent="yes" omit-xml-declaration="yes"/>
    <!-- <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" indent="yes" method="html"/> -->
	<xsl:strip-space elements="my:tag my:tags my:blogEntry"/>

    <xsl:template match="my:entry">
      <xsl:apply-templates/>
    </xsl:template>

	<!-- handle the verbatim tag I created -->
	<xsl:template match="my:verbatim">
      <xsl:element name="span">
        <xsl:attribute name="class">verbatim</xsl:attribute>
        <xsl:value-of select="."/>
      </xsl:element>
	</xsl:template>

	<!-- ************* -->
	<!-- my:imagestrip -->
	<!-- ************* -->
	<xsl:template match="my:imagestrip">
      <xsl:element name="div">
        <xsl:attribute name="class">imageStrip</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
	</xsl:template>

	<!-- ********************** -->
	<!-- my:imagestrip/my:image -->
	<!-- ********************** -->
	<xsl:template match="my:imagestrip/my:image">
        <xsl:element name="imageBlock">
          <xsl:attribute name="class">imageBlock</xsl:attribute>
          <xsl:choose>
            <xsl:when test="@href">
              <xsl:choose>
                <xsl:when test="@caption">
                  <a href="{@href}">
                    <p class="image"><img src="{@src}" width="{@width}"
                    height="{@height}" alt="{@alt}"/></p>
                    <p class="imageCaption"><xsl:value-of select="@caption"/></p>
                  </a>
                </xsl:when>
                <xsl:otherwise>
                  <a href="{@href}">
                    <p class="image"><img src="{@src}" width="{@width}"
                    height="{@height}" alt="{@alt}"/></p>
                  </a>
                  <p class="imageCaption"><xsl:text> </xsl:text></p>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
              <p class="image"><img src="{@src}" width="{@width}"
              height="{@height}" alt="{@alt}"/></p>
              <p class="imageCaption"><xsl:value-of select="@caption"/></p>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:element>
	</xsl:template>

    <!--  *************** -->
    <!--  my:captionimage -->
    <!--  *************** -->
    <xsl:template match="my:captionimage">
      <xsl:variable name="divwidth"><xsl:choose><xsl:when test="@width > 200"><xsl:value-of select="@width"/></xsl:when><xsl:otherwise>200</xsl:otherwise></xsl:choose></xsl:variable> 
      <div class="captionimage" style="width: {$divwidth}px;">
        <xsl:choose>
          <xsl:when test="@href">
            <a href="{@href}">
              <xsl:element name="img">
                <xsl:copy-of select="@*[not(name()='href')]"/>
              </xsl:element>
            </a>
          </xsl:when>
          <xsl:otherwise>
            <xsl:element name="img">
              <xsl:copy-of select="@*[not(name()='href')]"/>
            </xsl:element>
          </xsl:otherwise>
        </xsl:choose>
        <div class="caption" style="width: {$divwidth}px;">
            <xsl:apply-templates/>
        </div>
      </div>
    </xsl:template>
    
    <!-- ********** -->
    <!-- my:verbose -->
    <!-- ********** -->
    <xsl:template match="my:verbose">
      <xsl:element name="span">
        <xsl:attribute name="class">verbose</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:template>

    <!-- ********** -->
    <!-- my:program -->
    <!-- ********** -->
    <xsl:template match="my:program">
      <xsl:element name="span">
        <xsl:attribute name="class">program</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:template>

    <!-- ********** -->
    <!-- my:command -->
    <!-- ********** -->
    <xsl:template match="my:command">
      <xsl:element name="span">
        <xsl:attribute name="class">program</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:template>

    <!-- *********** -->
    <!-- my:pathname -->
    <!-- *********** -->
    <xsl:template match="my:pathname">
      <xsl:element name="span">
        <xsl:attribute name="class">pathname</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:template>

    <!-- *********** -->
    <!-- my:filename -->
    <!-- *********** -->
    <xsl:template match="my:filename">
      <xsl:element name="span">
        <xsl:attribute name="class">pathname</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:template>

	<!-- the wildcard should copy all other tags verbatim -->
	<xsl:template match="*">
		<xsl:element name="{name()}">
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
