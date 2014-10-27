<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:my="http://patrick.wagstrom.net/">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" indent="yes" method="html"/>

	<xsl:param name="dynamic" select="'true'"/>
	<xsl:variable name="xsltRevision" select="'$Revision: 1.1 $'"/>

	<xsl:template match="my:doc">
		<html>
			<head>
				<title>
					<xsl:value-of select="@title"/>
				</title>
				<link rel="stylesheet" href="/resources/css/{@style}.css"/>
				<meta name="ICBM" content="40.46769, -79.957"/>
				<meta name="DC.title" content="{@title}"/>
				<meta name="Copyright" content="Copyright (c) 2003 Patrick Wagstrom"/>
			</head>
		<body>
		<div class="sidebar">
		<div class="sidebarTitle">
			Links
		</div>
		<ul class="sidebar">
		<xsl:apply-templates select="//my:links/*" mode="menu" />
		</ul>
		<div class="sidebarTitle">
			Other Stuff
		</div>
		<ul class="sidebarSmall">
		<li>Document Version: <xsl:value-of select="@revision"/></li>
		<li>XSLT Version: <xsl:value-of select="$xsltRevision"/></li>
		</ul>
		<center>
			<div class="blueButton">
			<a href="http://geourl.org/near/?p=http://dreams.wagstrom.net:8080/" title="check out my neighbors in meatspace" class="buttonLink">
			GeoURL</a></div>
			<a href="http://creativecommons.org/licenses/by-nc-sa/1.0/" class="buttonLink"><img src="resources/images/creativeCommons.png" width="88" height="31" border="0"/></a>
		</center>
		</div>
	
		<div class="mainbody">
		<h1><xsl:value-of select="@title"/></h1>
		<xsl:apply-templates/>
		</div>
		<div class="menubar">
		<xsl:choose>
		<xsl:when test="$dynamic = 'true'">
			<a href="index.html">HTML Version</a>	
		</xsl:when>
		<xsl:otherwise>
			<a href="index.xml">XML Version</a>	
		</xsl:otherwise>
		</xsl:choose>
		</div>
		</body>
		</html>
	</xsl:template>

	<xsl:template match="my:infobox">
		<div class="infobox">
		<h2><xsl:value-of select="@title"/></h2>
		<xsl:apply-templates/>
		</div>
	</xsl:template>

	<xsl:template match="my:infoboxSub">
		<div class="infoboxSub">
		<h3><xsl:value-of select="@title"/></h3>
		<xsl:apply-templates/>
		</div>
	</xsl:template>

	<!-- in the normal case, this shouldn't do anything -->
	<xsl:template match="my:links"/>

	<!-- a little macro to show what version of the page this is -->
	<xsl:template match="my:pageVersion">
		<xsl:choose>
			<xsl:when test="$dynamic = 'true'">
				<xsl:text>XML</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>HTML</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="my:otherPageVersion">
		<xsl:choose>
			<xsl:when test="$dynamic = 'true'">
				<xsl:text>HTML</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>XML</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<!-- the wildcard should copy all other tags verbatim -->
	<xsl:template match="*">
		<xsl:element name="{name()}">
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<!-- the links are handled a bit differently at the beginning -->
	<xsl:template match="my:link" mode="menu">
		<li><a href="{@url}"><xsl:value-of select="@name"/></a>
		<xsl:value-of select="concat(' ',.)"/></li>
	</xsl:template>
</xsl:stylesheet>
