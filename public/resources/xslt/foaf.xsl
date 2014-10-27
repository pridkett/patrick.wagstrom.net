<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:foaf="http://xmlns.com/foaf/0.1/"
                xmlns:wot="http://xmlns.com/wot/0.1/">
  <xsl:output method="xml" version="1.0" omit-xml-declaration="no"
              doctype-public="-//W3C//DTD XHTML 1.1//EN"
              doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
              indent="yes" encoding="utf-8"/>
  <xsl:template match="/">

    <!-- set the subject of the document -->
    <xsl:variable name="foafSubjectID">
      <xsl:choose>
        <xsl:when test="/rdf:RDF/foaf:PersonalProfileDocument/foaf:primaryTopic/@rdf:nodeID">
          <xsl:value-of select="/rdf:RDF/foaf:PersonalProfileDocument/foaf:primaryTopic/@rdf:nodeID"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="/rdf:RDF/foaf:Person[0]/@rdf:nodeID"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
      <head>
        <meta http-equiv="Content-Language" content="en"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="stylesheet" href="/resources/css/foaf.css" type="text/css"
              media="screen, tv, projection"/>
        <title>FOAF :: <xsl:value-of select="/rdf:RDF/foaf:Person/foaf:name"/></title>
      </head>
      <body>
        <h1>Primary Record</h1>
        <xsl:if test="$foafSubjectID">
          <xsl:apply-templates select="/rdf:RDF/foaf:Person[@rdf:nodeID=$foafSubjectID]"/>
        </xsl:if>
        <xsl:if test="not($foafSubjectID)">
          <xsl:apply-templates select="/rdf:RDF/foaf:person[0]"/>
        </xsl:if>
        <!-- <h1><xsl:value-of select="$foafSubjectNode/foaf:name[0]"/></h1> -->
      </body>
    </html>
  </xsl:template>

  <xsl:template match="foaf:Person">
    <div class="foafPerson">
      <xsl:call-template name="dataValue">
        <xsl:with-param name="label">Name:</xsl:with-param>
        <xsl:with-param name="value"><xsl:value-of select="foaf:name"/></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="dataValue">
        <xsl:with-param name="label">Proper Name:</xsl:with-param>
        <xsl:with-param name="value">
          <xsl:value-of select="foaf:title"/><xsl:text> </xsl:text>
          <xsl:value-of select="foaf:firstName"/><xsl:text> </xsl:text>
          <xsl:value-of select="foaf:middleName"/><xsl:text> </xsl:text>
          <xsl:value-of select="foaf:surname"/>
        </xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="dataValue">
        <xsl:with-param name="label">Nick names:</xsl:with-param>
        <xsl:with-param name="value">
          <xsl:for-each select="foaf:nick">
            <xsl:if test="preceding-sibling::foaf:nick"><xsl:text>, </xsl:text></xsl:if>
            <xsl:value-of select="."/>
          </xsl:for-each>
        </xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="dataValue">
        <xsl:with-param name="label">Myers Briggs:</xsl:with-param>
        <xsl:with-param name="value"><xsl:value-of select="foaf:myersBriggs"/></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="dataValue">
        <xsl:with-param name="label">Plan:</xsl:with-param>
        <xsl:with-param name="value"><xsl:value-of select="foaf:plan"/></xsl:with-param>
      </xsl:call-template>
      <xsl:for-each select="foaf:homepage">
        <xsl:call-template name="dataValue">
          <xsl:with-param name="label">Home page:</xsl:with-param>
          <xsl:with-param name="value"><xsl:value-of select="@rdf:resource"/></xsl:with-param>
          <xsl:with-param name="href"><xsl:value-of select="@rdf:resource"/></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:for-each select="foaf:weblog">
        <xsl:call-template name="dataValue">
          <xsl:with-param name="label">Weblog:</xsl:with-param>
          <xsl:with-param name="value"><xsl:value-of select="@dc:title"/></xsl:with-param>
          <xsl:with-param name="href"><xsl:value-of select="@rdf:resource"/></xsl:with-param>
          <xsl:with-param name="desc"><xsl:value-of select="@dc:description"/></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:for-each select="foaf:workplaceHomepage">
        <xsl:call-template name="dataValue">
          <xsl:with-param name="label">Work home page:</xsl:with-param>
          <xsl:with-param name="value"><xsl:value-of select="@rdf:resource"/></xsl:with-param>
          <xsl:with-param name="href"><xsl:value-of select="@rdf:resource"/></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:for-each select="foaf:schoolHomepage">
        <xsl:call-template name="dataValue">
          <xsl:with-param name="label">School home page:</xsl:with-param>
          <xsl:with-param name="value"><xsl:value-of select="@rdf:resource"/></xsl:with-param>
          <xsl:with-param name="href"><xsl:value-of select="@rdf:resource"/></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:for-each select="foaf:mbox_sha1sum">
        <xsl:call-template name="dataValue">
          <xsl:with-param name="label">Email (sha1sum):</xsl:with-param>
          <xsl:with-param name="value"><xsl:value-of select="."/></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
    </div>
  </xsl:template>

  <xsl:template name="dataValue">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="href" select="''"/>
    <xsl:if test="string-length($value) > 0">
      <p><span class="dataLabel"><xsl:value-of select="$label"/><xsl:text> </xsl:text></span>
      <xsl:if test="string-length($href) > 0">
        <span class="dataValue"><a href="{$href}"><xsl:value-of select="$value"/></a></span>
      </xsl:if>
      <xsl:if test="string-length($href) = 0">
        <span class="dataValue"><xsl:value-of select="$value"/></span>
      </xsl:if>
      </p>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
