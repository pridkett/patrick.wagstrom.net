<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:my="http://patrick.wagstrom.net/xml/blog/1">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" indent="yes" method="html"/>
	<xsl:strip-space elements="my:tag my:tags my:blogEntry"/>
	<xsl:param name="dynamic" select="'true'"/>

	<xsl:template match="my:doc">
		<html>
			<head>
				<title>
					<xsl:value-of select="@title"/>
				</title>
				<link rel="stylesheet" href="/resources/css/blog.css"/>
				<link rel="alternate" type="application/rss+xml" title="RSS" href="http://patrick.wagstrom.net/index.rss"/>
				<meta name="ICBM" content="40.46769, -79.957"/>
				<meta name="DC.title" content="{@title}"/>
				<meta name="Copyright" content="Copyright (c) 1995-2007 Patrick Wagstrom"/>
			</head>
		<body onLoad="document.getElementById('blogBody').style.height = Math.max(document.getElementById('blogBody').clientHeight, document.getElementById('sidebarLinks').clientHeight+2)+'px';">
		<div id="blogHeader">
		<xsl:variable name="weblogname">
			<xsl:value-of select="normalize-space(substring-before(@title,':'))"/>
		</xsl:variable>
		<xsl:variable name="restOfName">
			<xsl:value-of select="normalize-space(substring-after(@title,':'))"/>
		</xsl:variable>
		<h1 class="header">
		<xsl:choose>
			<xsl:when test="contains(@title,':')">
				<a href="/weblog/"><xsl:value-of select="$weblogname"/></a> : <a href="/weblog/{$restOfName}"><xsl:value-of select="$restOfName"/></a>
			</xsl:when>
			<xsl:otherwise>
				<a href="/weblog/"><xsl:value-of select="@title"/></a>
			</xsl:otherwise>
		</xsl:choose>
		</h1>
		<h2 class="header">Thoughts of a Cautious Technocrat</h2>
		</div>
		<div class="blogBody" id="blogBody">
			<div class="sidebarLinks" id="sidebarLinks">
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
		
				<div class="sidebarTitle">
					Links
				</div>
				<ul class="sidebar">
					<xsl:apply-templates select="//my:links/*" mode="menu" />
				</ul>
				<div class="sidebarTitle">
					BlogRollin!
				</div>
				<a href="http://kenneths.org/flog">Kenneth</a><br/>
				<a href="http://blogs.sun.com/roller/page/pwags">Phil</a><br/>
				<a href="http://tylerbutler.com/">Tyler</a><br/>
				<a href="http://www.livejournal.com/users/rnh/">Hoss</a><br/>
				<br />
				<div class="sidebarTitle">
					Syndication
				</div>
				<span class="rssButton">
				<a href="/weblog/index.rss" title="Syndicate this site" class="buttonLink">
				RSS</a></span>
				<br />
				<br />
				<div class="sidebarTitle">
					Other Stuff
				</div>
				<a href="http://roughingit.subtlehints.net/pyblosxom/" class="buttonLink"><img src="/resources/images/pyblosxomButton.png" width="95" height="29" border="0" alt="Powered by pyBlosxom"/></a>
				<br />
				<a href="mailto:patrick+webspam@wagstrom.REMOVETHIS.net"><img src="/resources/images/emailAddress.png" width="180" height="21" alt="email me" border="0"/></a>
				<br/><a href="/foaf.rdf"><img src="/resources/images/foaf8015.png" width="80" height="15" border="0" alt="FOAF!"/></a><a href="http://xml.mfd-consult.dk/foaf/explorer/?foaf=http%3A%2F%2Fpatrick.wagstrom.net%2Ffoaf.rdf"><img src="/resources/images/foaf-explorer.24.png" border="0" alt="FOAF Explorer" width="24" height="24"/></a><br/>
				<a href="http://www.spreadfirefox.com/?q=affiliates&amp;id=38177&amp;t=82"><img border="0" alt="Get Firefox!" title="Get Firefox!" src="http://sfx-images.mozilla.org/affiliates/Buttons/80x15/white_1.gif"/></a>
			</div>
		<xsl:choose>
			<xsl:when test="/my:doc/@viewType='404'">
				<div class="blogEntry"><h2>Unable to find that article</h2><p>Sorry, that article can't be found.</p></div>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
		</div>
		</body>
		</html>
	</xsl:template>

	<xsl:template match="my:blogEntry">
		<div class="blogEntry">
		<h2><a href="{@permalinkURL}"><xsl:value-of select="@title"/></a></h2>
		<h2 class="blogDate">Posted to <a href="{@categoryURL}" title="category"><xsl:value-of select="@category"/></a> on <xsl:value-of select="@dateFull"/> at <xsl:value-of select="@dateTime"/></h2>
		<xsl:if test="my:tags">
			<span class="technoratiTags"><xsl:apply-templates select="my:tags" mode="tags"/></span>
		</xsl:if>
		<xsl:apply-templates/>
		<xsl:if test="/my:doc/@viewType!='file'"><xsl:if test="@numComments"><div class="commentLink"><a href="{@permalinkURL}#comments"><xsl:value-of select="@numComments"/> comment<xsl:choose><xsl:when test="@numComments=1"/><xsl:otherwise>s</xsl:otherwise></xsl:choose></a></div></xsl:if></xsl:if>
		<a name="comments"/>
		<xsl:if test="/my:doc/@viewType='file'">
			<xsl:apply-templates select="my:comments" mode="comments"/>
			<div class="commentForm">
				Add Your Own Comment<br/>
				<form method="post" action="/weblog/comments.cgi">
					<span class="formField"><span class="formTitle">Your Name:</span><input type="text" name="yourName" size="40"/></span>
					<span class="formField"><span class="formTitle">URL:</span><input type="text" name="url" size="40"/></span>
					<span class="formField"><span class="formTitle">Email (not published):</span><input type="text" name="email" size="40"/></span>
					<span class="formField"><span class="formTitle">3.14 is closest to what integer?</span><input type="text" name="answer" size="40"/></span>
					<textarea name="commentBody" rows="20" cols="70"/>
					<input type="hidden" name="story" value="{//my:blogEntry/@category}/{//my:blogEntry/@name}"/>
					<input type="hidden" name="storyURL" value="{//my:blogEntry/@permalinkURL}"/>
					<input type="submit" value="Add Comment"/>
				</form>
			</div>
		</xsl:if>
		</div>
	</xsl:template>
	
	<!-- in the normal case, this shouldn't do anything -->
	<xsl:template match="my:links"/>
	<xsl:template match="my:categories"/>
	<xsl:template match="my:calendar"/>
	<xsl:template match="my:tags"/>
	<xsl:template match="my:comments"/>

	<!-- ******** -->
	<!-- comments -->
	<!-- ******** -->
	<xsl:template match="my:comments" mode="comments">
		<xsl:apply-templates select="my:comment" mode="comments"/>
	</xsl:template>

	<xsl:template match="my:comment" mode="comments">
		<div class="comment">
			<div class="commentHeader">Comment from <xsl:choose><xsl:when test="my:url"><a href="{my:url}"><xsl:value-of select="my:author"/></a></xsl:when><xsl:otherwise><xsl:value-of select="my:author"/></xsl:otherwise></xsl:choose> on <xsl:value-of select="my:commentTime"/></div>
			<div class="commentBody"><xsl:apply-templates select="my:body"/></div>
		</div>
	</xsl:template>

	<xsl:template match="my:body">
		<xsl:apply-templates/>
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
				<td class="calendarDay{@type}Link"><a href="{@link}"><xsl:value-of select="."/></a></td>
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

    <xsl:template match="my:program">
      <span class="program"><xsl:value-of select="."/></span>
    </xsl:template>

    <xsl:template match="my:pathname">
      <span class="program"><xsl:value-of select="."/></span>
    </xsl:template>

	<!-- ******* -->
	<!-- my:tags -->
	<!-- ******* -->
	<xsl:template match="my:tags" mode="tags">
		<div class="technoratiTags">
			<xsl:if test="my:tag">
				<span class="technoratiTagsLabel">Tags</span><xsl:text>: </xsl:text>
				<ul class="technoratiTags">
				<xsl:apply-templates mode="tags"/>
				</ul>
			</xsl:if>
		</div>
	</xsl:template>

	<xsl:template match="my:tag" mode="tags">
		<xsl:variable name="tagName" select="."/>
		<xsl:variable name="className"><xsl:choose><xsl:when test="following-sibling::node()">technoratiTags</xsl:when><xsl:otherwise>technoratiTagsLast</xsl:otherwise></xsl:choose></xsl:variable>
		<li class="{$className}"><a rel="tag" href="http://www.technorati.com/tag/{$tagName}"><xsl:value-of select="."/></a></li>
	</xsl:template>

	<!-- ************* -->
	<!-- my:imagestrip -->
	<!-- ************* -->
	<xsl:template match="my:imagestrip">
		<div class="imageStrip">
			<xsl:apply-templates/>
		</div>
	</xsl:template>

	<!-- ******** -->
	<!-- my:image -->
	<!-- ******** -->
	<xsl:template match="my:imagestrip/my:image">
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

	<!-- fix me: this should probably be redone -->
	<xsl:template match="my:category" mode="menu">
		<xsl:param name="indent" value=""/>
		<xsl:param name="fullNameParam" value=""/>
		<xsl:variable name="linkName">
			<xsl:choose>
				<xsl:when test="$fullNameParam">
					<xsl:value-of select="substring-after($fullNameParam,'/')"/>
				</xsl:when>
				<xsl:otherwise>	
					<xsl:value-of select="substring-after(@fullname,'/')"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="string-length(normalize-space(substring-after($linkName,'/')))">
				<li><xsl:text>&#160;&#160;</xsl:text><a href="{@url}"><xsl:value-of select="substring-after($linkName,'/')"/></a> (<xsl:value-of select="@num"/>)</li>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="string-length(normalize-space($linkName))">
				<li><xsl:value-of select="$indent"/>
				<a href="{@url}"><xsl:value-of select="$linkName"/></a> (<xsl:value-of select="@num"/>)</li>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<!-- <xsl:value-of select="concat(' ',.)"/></li> -->
	</xsl:template>

</xsl:stylesheet>
