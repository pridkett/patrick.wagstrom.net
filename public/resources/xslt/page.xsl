<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:my="http://patrick.wagstrom.net/xml/webpage/1">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" indent="yes" method="html"/>

	<xsl:param name="dynamic" select="'true'"/>
	<xsl:variable name="xsltRevision" select="'$Revision: 1.17 $'"/>

	<xsl:template match="my:doc">
		<html>
			<head>
				<title>
					<xsl:value-of select="@title"/>
				</title>
				<link rel="stylesheet" href="/resources/css/{@style}.css"/>
				<link rel="meta" type="application/rdf+xml" title="FOAF" href="/foaf.rdf"/>
				<meta name="DC.title" content="{@title}"/>
				<meta name="Copyright" content="Copyright (c) 1997-2008 Patrick Wagstrom"/>
<!-- google analytics --><script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
var pageTracker = _gat._getTracker("UA-3441054-1");
pageTracker._initData();
pageTracker._trackPageview();
</script><!-- end google analytics -->
			</head>
		<body>

		<div class="mainbody">
		<h1><xsl:value-of select="@title"/></h1>
		<xsl:apply-templates/>
		</div>
		<div class="menubar">
		<a href="/">Home</a>
		<!--
		<xsl:choose>
		<xsl:when test="$dynamic = 'true'">
			<a href="index.html">HTML Version</a>	
		</xsl:when>
		<xsl:otherwise>
			<a href="index.xml">XML Version</a>	
		</xsl:otherwise>
		</xsl:choose>
		-->
		</div>

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
			<!-- <div class="blueButton">
			<a href="http://geourl.org/near/?p=http://dreams.wagstrom.net:8080/" title="check out my neighbors in meatspace" class="buttonLink">
			GeoURL</a></div> -->
			<a href="http://creativecommons.org/licenses/by-nc-sa/1.0/" class="buttonLink"><img src="/resources/images/creativeCommons.png" width="88" height="31" border="0" alt="Licensed under a Creative Commonse license"/></a>
			<br/><a href="mailto:patrick+webspam@wagstrom.REMOVETHIS.net"><img src="/resources/images/emailAddress.png" width="180" height="21" alt="email me" border="0"/></a>
			<br/><a href="/foaf.rdf"><img src="/resources/images/foaf8015.png" width="80" height="15" border="0" alt="FOAF!"/></a><a href="http://xml.mfd-consult.dk/foaf/explorer/?foaf=http%3A%2F%2Fpatrick.wagstrom.net%2Ffoaf.rdf"><img src="/resources/images/foaf-explorer.24.png" border="0" alt="FOAF Explorer" width="24" height="24"/></a><br />
<!-- <a href="http://www.spreadfirefox.com/?q=affiliates&amp;id=38177&amp;t=83"><img border="0" alt="Get Firefox!" title="Get Firefox!" src="http://sfx-images.mozilla.org/affiliates/Buttons/80x15/white_1.gif"/></a> -->
		<!-- <iframe width="120" height="240" style="border:0px" src="/resources/google/googleFirefox.html"/>
		<div class="sidebarTitle">Current Music</div>
		<div style="text-align: left;">
		Recent Tracks:<br/>
		<a href="http://www.last.fm/user/pridkett?chartstyle=SuperClean3"><img src="http://imagegen.last.fm/SuperClean3/recenttracks/pridkett.gif" border="0" /></a>
		<br/>Recent Artists<br/>
		<a href="http://www.last.fm/user/pridkett?chartstyle=SuperClean3"><img src="http://imagegen.last.fm/SuperClean3/artists/pridkett.gif" border="0" /></a>
		</div> -->
		</center>
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
