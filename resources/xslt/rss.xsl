<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:my="http://patrick.wagstrom.net/xml/blog/1">
    <xsl:output method="xml" indent="yes"
                omit-xml-declaration="no"/>
    <xsl:strip-space elements="my:tag my:tags"/>
    <xsl:template match="my:doc">
      <rss version="2.0">
        <channel>
          <title><xsl:value-of select="@title"/></title>
          <link><xsl:value-of select="@url"/></link>
          <language>
            <xsl:choose>
              <xsl:when test="@language"><xsl:value-of select="@language"/></xsl:when>
              <xsl:otherwise>en-us</xsl:otherwise>
            </xsl:choose>
          </language>
          <webMaster>wagspat.AT.@iit.DAWT.edu</webMaster>
          <managingEditor>wagspat.AT.@iit.DAWT.edu</managingEditor>
          <generator>rss.xsl - Copyright (c) 2005 Patrick Wagstrom</generator>
          <description>Just your ordinary liberal Christian civil-libertarian hacker who likes to rant</description>
          <xsl:apply-templates select="my:blogEntry"/>
        </channel>
      </rss>
    </xsl:template>

    <xsl:template match="my:blogEntry">
      <item>
        <title><xsl:value-of select="@title"/></title>
        <link><xsl:value-of select="@permalinkURL"/></link>
        <guid isPermaLink="true"><xsl:value-of select="@permalinkURL"/></guid>
        <pubDate><xsl:value-of select="@canonicalDay"/></pubDate>
        <category><xsl:value-of select="@category"/></category>
        <description>
          <xsl:apply-templates select="my:tags" mode="tags"/>
          <xsl:apply-templates/>
        </description>
      </item>
    </xsl:template>

    <!-- ******* -->
    <!-- my:tags -->
    <!-- ******* -->
    <xsl:template match="//my:blogEntry/my:tags"/>

    <xsl:template match="my:tags" mode="tags">
      <xsl:if test="my:tag">
        <p class="tags" style="border: thin 1px #aaa;">
        Tags:<xsl:text> </xsl:text>
        <xsl:apply-templates mode="tags"/>
        </p>
      </xsl:if>
    </xsl:template>
    
    <xsl:template match="//my:blogEntry/my:tags/my:tag" mode="tags">
      <xsl:variable name="tagName" select="."/>
      <xsl:if test="count(preceding-sibling::*)"><xsl:text>, </xsl:text></xsl:if>
      <a rel="tag" href="http://www.technorati.com/tag/{$tagName}"><xsl:value-of select="."/></a>
    </xsl:template>

	<!-- ************* -->
	<!-- my:imagestrip -->
	<!-- ************* -->
	<xsl:template match="//my:blogEntry//my:imagestrip">
		<div class="imageStrip">
			<xsl:apply-templates/>
		</div>
	</xsl:template>

	<!-- ******** -->
	<!-- my:image -->
	<!-- ******** -->
	<xsl:template match="//my:blogEntry//my:imagestrip/my:image">
		<span class="imageBlock">
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
		</span>
	</xsl:template>

    <!-- restyle any of the verbatim tags -->
    <xsl:template match="//my:blogEntry//my:verbatim">
      <span style="font-family: courier, monospace; font-weight: bold; background: #fef;"><xsl:value-of select="."/></span>
    </xsl:template>

    <!-- catch any of the other stuff in an blog entry -->
    <xsl:template match="//my:blogEntry//*">
      <xsl:element name="{name()}">
        <xsl:copy-of select="@*"/>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:template>
</xsl:stylesheet>
