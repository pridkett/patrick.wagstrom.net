<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://patrick.wagstrom.net/xml/tutorial/1">
  <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" indent="yes" method="html"/>

  <xsl:variable name="statusExpandHTML">[+]</xsl:variable>
  <xsl:variable name="statusCollapseHTML">[-]</xsl:variable>

  <xsl:template match="t:tutorial">
    <html>
      <head>
        <title><xsl:value-of select="t:title"/></title>
        <link rel="stylesheet" type="text/css" href="tutorial.css"/>
        <script language="javascript" type="text/javascript"><![CDATA[
          function setStatusIndicatorExpand(statusLayer) {
            document.getElementById(statusLayer).innerHTML="[+]";
          }
          function setStatusIndicatorCollapse(statusLayer) {
            document.getElementById(statusLayer).innerHTML="[-]";
          }
          function toggleLayer(whichLayer)
          {
            var statusLayer = whichLayer + "Status";
            if (document.getElementById)
            {
              // Mozilla et al
              var style2 = document.getElementById(whichLayer).style;
              style2.display = style2.display=="none"? "block":"none";
              if (style2.display == "none") {
                  setStatusIndicatorExpand(statusLayer);
              } else {
                  setStatusIndicatorCollapse(statusLayer);
              }
            }
            else if (document.all)
            {
              // MSIE
              var style2 = document.all[whichLayer].style;
              style2.display = style2.display=="none"? "block":"none";
              if (style2.display == "none") {
                  setStatusIndicatorExpand(statusLayer);
              } else {
                  setStatusIndicatorCollapse(statusLayer);
              }
            }
            else if (document.layers)
            {
              // FIXME: Status indicator not properly updated for NN4...oh well...
              // Netscape Navigator 4
              var style2 = document.layers[whichLayer].style;
              style2.display = style2.display=="none"? "block":"none";
            }
          }
        ]]></script>
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
        <div style="background: #ffcccc; border: 3px solid black; margin: 2em; padding: 1em;"><b>WARNING:</b> This document is a work in progress.  Many things are likely incomplete and files
        may not work yet.  This is a massive project to document everything.  I hope to eventually finish everything and make this a useful
        resource.  At this point, you cannot consider this document to be a complete walkthrough on how to install MythTV on a system described
        below.</div>

        <xsl:apply-templates select="t:section"/>
      </body>
    </html>
  </xsl:template>

  <!-- ********* -->
  <!-- t:section -->
  <!-- ********* -->
  <xsl:template match="t:section">
    <xsl:variable name="sectionNum">
      <xsl:apply-templates select="ancestor::t:section" mode="print"/><xsl:value-of select="count(preceding-sibling::t:section) + 1"/>
    </xsl:variable>
    <xsl:variable name="statusIndicatorHTML">
      <xsl:choose>
        <xsl:when test="@hidden='true'"><xsl:value-of select="$statusExpandHTML"/></xsl:when>
        <xsl:otherwise><xsl:value-of select="$statusCollapseHTML"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="sectionDepth"><xsl:value-of select="count(ancestor::t:section)+1"/></xsl:variable>
    <div class="level{$sectionDepth}" id="section-{$sectionNum}">
    <a name="section{$sectionNum}"/>
    <xsl:variable name="elementName">h<xsl:value-of select="count(ancestor::t:section)+1"/></xsl:variable>
    <xsl:element name="{$elementName}">
      <xsl:attribute name="class">sectionTitle</xsl:attribute>
      <xsl:value-of select="$sectionNum"/>. <a onclick="toggleLayer('span-{$sectionNum}');"><xsl:value-of select="@title"/>
      <!-- <xsl:value-of select="$sectionNum"/>. <a href="#section-{$sectionNum}" onclick="toggleLayer('span-{$sectionNum}');"><xsl:value-of select="@title"/> -->
      <span class="expandStatus" id="span-{$sectionNum}Status"><xsl:value-of select="$statusIndicatorHTML"/></span></a>
    </xsl:element>
    <xsl:element name="span">
      <xsl:if test="@hidden='true'">
        <xsl:attribute name="style">display: none;</xsl:attribute>
      </xsl:if>
      <xsl:attribute name="id">span-<xsl:value-of select="$sectionNum"/></xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
    </div>
  </xsl:template>

  <!-- hierarchy stuff for section numbers -->
  <xsl:template match = "t:section" mode = "print"><xsl:value-of select="count(preceding-sibling::t:section) + 1"/>.</xsl:template>


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
        <xsl:when test="@thumb">
          <a href="{@src}">
          <xsl:element name="img">
            <xsl:choose>
              <xsl:when test="@thumb">
                <xsl:attribute name="src"><xsl:value-of select="@thumb"/></xsl:attribute>
              </xsl:when>
              <xsl:otherwise>
                <xsl:attribute name="src"><xsl:value-of select="@src"/></xsl:attribute>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="@width"><xsl:attribute name="width"><xsl:value-of select="@width"/></xsl:attribute></xsl:if>
            <xsl:if test="@height"><xsl:attribute name="height"><xsl:value-of select="@height"/></xsl:attribute></xsl:if>
            <xsl:if test="@alt"><xsl:attribute name="alt"><xsl:value-of select="@alt"/></xsl:attribute></xsl:if>
          </xsl:element></a>
        </xsl:when>
        <xsl:otherwise>
          <img src="{@src}" width="{@width}" height="{@height}" alt="{@alt}"/>
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
    <div class="snippet" id="{@id}"><pre><xsl:apply-templates/></pre></div>
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

  <!-- ************* -->
  <!-- t:commandRoot -->
  <!-- ************* -->
  <xsl:template match="t:commandRoot">
    <span class="commandRoot"><xsl:value-of select="."/></span>
  </xsl:template>

  <!-- ******* -->
  <!-- t:quote -->
  <!-- ******* -->
  <xsl:template match="t:quote">
    <span class="quote"><xsl:value-of select="."/></span>
  </xsl:template>

  <!-- ********* -->
  <!-- t:program -->
  <!-- ********* -->
  <xsl:template match="t:program">
    <span class="programname"><xsl:value-of select="."/></span>
  </xsl:template>

  <!-- ********** -->
  <!-- t:pathname -->
  <!-- ********** -->
  <xsl:template match="t:pathname">
    <span class="pathname"><xsl:value-of select="."/></span>
  </xsl:template>

  <!-- ********** -->
  <!-- t:commands -->
  <!-- ********** -->
  <xsl:template match="t:commands">
    <div class="commandBlock"><xsl:apply-templates/></div>
  </xsl:template>

  <xsl:template match="t:prompt">
    <xsl:if test="preceding-sibling::t:prompt"><br/></xsl:if>
    <span class="commandPrompt"><xsl:value-of select="."/></span>
  </xsl:template>
  
  <!-- *************** -->
  <!-- t:commandOutput -->
  <!-- *************** -->
  <xsl:template match="t:commandOutput">
    <div class="commandOutput"><pre><xsl:apply-templates/></pre></div>
  </xsl:template>

  <!-- ****** -->
  <!-- t:todo -->
  <!-- ****** -->
  <xsl:template match="t:todo">
    <div class="todo"><span class="todoHeader">TODO:</span><xsl:apply-templates/></div>
  </xsl:template>

  <!-- ********* -->
  <!-- t:warning -->
  <!-- ********* -->
  <xsl:template match="t:warning">
    <span class="warning"><xsl:apply-templates/></span>
  </xsl:template>

  <!-- the wildcard should copy all other tags verbatim -->
  <xsl:template match="*">
    <xsl:element name="{name()}">
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
