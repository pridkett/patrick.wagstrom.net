<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:my="http://patrick.wagstrom.net/xml/blog/1">
    <xsl:output method="html" indent="yes" omit-xml-declaration="yes"/>
  <!-- <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" indent="yes" method="html"/> -->
	<xsl:strip-space elements="my:tag my:tags my:blogEntry"/>

    <xsl:template match="b">
      <b><xsl:apply-templates/></b>
    </xsl:template>

    <xsl:template match="br">
      <br/>
    </xsl:template>

    <xsl:template match="p">
      <p><xsl:apply-templates/></p>
    </xsl:template>

	<!-- the wildcard should copy all other tags verbatim
	<xsl:template match="*">
		<xsl:element name="{name()}">
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template> -->
</xsl:stylesheet>
