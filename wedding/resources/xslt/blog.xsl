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
				<link rel="alternate" type="application/rss+xml" title="RSS" href="$url/?flav=rss"/>
				<link rel="alternate" type="text/plain" title="RSS3" href="$url/?flav=rss3"/>
				<meta name="ICBM" content="40.46769, -79.957"/>
				<meta name="DC.title" content="{@title}"/>
				<meta name="Copyright" content="Copyright (c) 2003 Patrick Wagstrom"/>
			</head>
		<body>
		<div class="sidebar">
		<div class="calendar">
			<xsl:apply-templates select="//my:calendar" mode="calendar" />
		</div>
		<br />
		<div class="sidebarTitle">
			Category Archives
		</div>
		<ul class="sidebar">
			<xsl:apply-templates select="//my:categories/*" mode="menu" />
		</ul>
		<br />
		<!-- <div class="sidebarTitle">
			Links
		</div>
		<ul class="sidebar">
			<xsl:apply-templates select="//my:links/*" mode="menu" />
		</ul>
		<br /> -->
		<div class="sidebarTitle">
			Syndication
		</div>
		<span class="rssButton">
		<a href="?flav=rss" title="Syndicate this site" class="buttonLink">
		RSS</a></span>&#160;
		<span class="txtButton">
		<a href="?flav=rss3" title="Syndicate this site" class="buttonLink">
		TXT</a></span>&#160;
		<span class="blueButton">
		<a href="?flav=esf" title="Syndicate this site" class="buttonLink">
		ESF</a></span>
		</div>
	
		<div class="mainbody">
		<h1><xsl:value-of select="@title"/></h1>
		<xsl:apply-templates/>
		</div>
		<div class="menubar">
		July 10th, 2004 in Round Rock, Texas
		<!-- <xsl:choose>
		<xsl:when test="$dynamic = 'true'">
			<a href="index.html">HTML Version</a>
		</xsl:when>
		<xsl:otherwise>
			<a href="index.xml">XML Version</a>
		</xsl:otherwise>
		</xsl:choose> -->
		</div>
		</body>
		</html>
	</xsl:template>

	<xsl:template match="my:blogEntry">
		<xsl:if test="not(@dateFull=preceding-sibling::my:blogEntry/@dateFull)">
			<div class="blogDate"><xsl:value-of select="@dateFull"/></div>
		</xsl:if>
		<div class="blogEntry">
		<h2><xsl:value-of select="@title"/></h2>
		<xsl:apply-templates/>
		<div class="blogEntryLinks">
		[<a href="{@dateLinkURL}" title="date"><xsl:value-of select="@dateTime"/></a>] |
		[<a href="{@categoryURL}" title="category"><xsl:value-of select="@category"/></a>] |
		<a href="{@permalinkURL}" title="permalink">#</a> |
		<a href="http://www.google.com/search?q={@title}" title="Google Search!">g</a>
		</div>
		</div>
	</xsl:template>
	
	<!-- in the normal case, this shouldn't do anything -->
	<xsl:template match="my:links"/>
	<xsl:template match="my:categories"/>
	<xsl:template match="my:calendar"/>

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

	<!-- this mess creates the calendar -->
	<xsl:template match="my:calendar" mode="calendar">
		<table class="calendar">
		<!-- previous month link -->
		<tr><td class="calendarMonthLink"><xsl:if test="@leftLink"><a href="{@leftLink}" class="calendarMonthLink">&lt;&lt;</a></xsl:if></td>
		<!-- if there is a link attribute, we link the title, otherwise no linky -->
		<xsl:choose>
			<xsl:when test="@link">
				<td colspan="5" class="calendarTitle"><a href="{@link}" class="calendarTitle"><xsl:value-of select="@title"/></a></td>
			</xsl:when>
			<xsl:otherwise>
				<td colspan="5" class="calendarTitle"><xsl:value-of select="@title"/></td>
			</xsl:otherwise>
		</xsl:choose>
		<!-- next month link -->
		<td class="calendarMonthLink"><xsl:if test="@rightLink"><a href="{@rightLink}" class="calendarMonthLink">&gt;&gt;</a></xsl:if></td>
		</tr>
		<xsl:apply-templates mode="calendar"/>
		</table>
	</xsl:template>

	<xsl:template match="my:calendarHeader" mode="calendar">
		<tr class="calendarHeader">
		<xsl:apply-templates mode="calendar"/>
		</tr>
	</xsl:template>

	<xsl:template match="my:calendarRow" mode="calendar">
		<tr class="calendarRow">
		<xsl:apply-templates mode="calendar"/>
		</tr>
	</xsl:template>

	<xsl:template match="my:calendarDay" mode="calendar">
		<xsl:choose>
			<xsl:when test="@link">
				<td class="calendarDay{@type}"><a href="{@link}"><xsl:value-of select="."/></a></td>
			</xsl:when>
			<xsl:otherwise>
				<td class="calendarDay{@type}"><xsl:value-of select="."/></td>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- handle the verbatim tag I created -->
	<xsl:template match="my:verbatim">
		<span class="verbatim"><xsl:value-of select="."/></span>
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

	<xsl:template match="my:category" mode="menu">
		<xsl:if test="not(@fullname = '')">
			<li><a href="{@url}"><xsl:value-of select="@fullname"/></a> (<xsl:value-of select="@num"/>)
			<xsl:value-of select="concat(' ',.)"/></li>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
