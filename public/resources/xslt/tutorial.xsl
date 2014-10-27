<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://patrick.wagstrom.net/xml/tutorial/1">
  <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" indent="yes" method="html"/>

  <xsl:template match="t:tutorial">
    <html>
      <head>
        <title><xsl:value-of select="t:title"/></title>
        <link rel="stylesheet" type="text/css" href="/resources/css/tutorial.css"/>
      </head>
      <body>
        <h1><xsl:value-of select="t:title"/></h1>
        <h2>By <xsl:value-of select="t:author"/></h2>
        <h2><xsl:value-of select="t:date"/></h2>
        <h2>Overview</h2>
        <xsl:for-each select="t:section">
          <xsl:variable name="sectionNum">
            <xsl:value-of select="count(preceding-sibling::t:section) + 1"/>
          </xsl:variable>
          <xsl:value-of select="$sectionNum"/>. <a href="#section{$sectionNum}"><xsl:value-of select="@title"/></a><br />
        </xsl:for-each>

        <xsl:apply-templates select="t:section"/>
      </body>
    </html>
  </xsl:template>

  <!-- ********* -->
  <!-- t:section -->
  <!-- ********* -->
  <xsl:template match="t:section">
    <xsl:variable name="sectionNum">
      <xsl:value-of select="count(preceding-sibling::t:section) + 1"/>
    </xsl:variable>
    <a name="section{$sectionNum}"/>
    <h2 class="sectionTitle"><xsl:value-of select="$sectionNum"/>.  <xsl:value-of select="@title"/></h2>
    <xsl:apply-templates/>
  </xsl:template>

  <!-- ******** -->
  <!-- t:figure -->
  <!-- ******** -->
  <xsl:template match="t:figure">
    <xsl:variable name="figureNum">
      <xsl:value-of select="count(preceding::t:figure) + 1"/>
    </xsl:variable>
    <a name="figure{$figureNum}"/><a name="figure-{@id}"/>
    <div class="figure" id="{@id}">
      <xsl:choose>
        <xsl:when test="@href">
          <a href="{@href}"><img src="{@src}" width="{@width}" height="{@height}" alt="{@alt}"/></a><br />
        </xsl:when>
        <xsl:otherwise>
          <img src="{@src}" width="{@width}" height="{@height}" alt="{@alt}"/><br />
        </xsl:otherwise>
      </xsl:choose>
    </div>
    <div class="figureTitle">
      Figure <xsl:value-of select="$figureNum"/>: <xsl:value-of select="@alt"/>
    </div>
  </xsl:template>

  <!-- ****** -->
  <!-- t:snip -->
  <!-- ****** -->
  <xsl:template match="t:snip">
    <xsl:variable name="snipNum">
      <xsl:value-of select="count(preceding::t:snip) + 1"/>
    </xsl:variable>

    <a name="snippet{$snipNum}"/><a name="snippet-{@id}"/>
    <div class="snippet" id="{@id}">
      <xsl:apply-templates/>
    </div>
    <div class="snippetTitle">
      Snippet <xsl:value-of select="$snipNum"/>: <xsl:value-of select="@alt"/>
    </div>
  </xsl:template>

  <!-- ********* -->
  <!-- t:snipref -->
  <!-- ********* -->
  <xsl:template match="t:snipref">
    <xsl:variable name="id" select="@id"/>
    <a href="#snippet-{@id}"><xsl:value-of select="count(//t:snip[@id=$id]/preceding::t:snip)+1"/></a>
  </xsl:template>

  <!-- ******** -->
  <!-- t:figref -->
  <!-- ******** -->
  <xsl:template match="t:figref">
    <xsl:variable name="id" select="@id"/>
    <a href="#figure-{@id}"><xsl:value-of select="count(//t:figure[@id=$id]/preceding::t:figure)+1"/></a>
  </xsl:template>

  <!-- ********* -->
  <!-- t:command -->
  <!-- ********* -->
  <xsl:template match="t:command">
    <span class="command"><xsl:value-of select="."/></span>
  </xsl:template>

  <!-- the wildcard should copy all other tags verbatim -->
  <xsl:template match="*">
    <xsl:element name="{name()}">
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
