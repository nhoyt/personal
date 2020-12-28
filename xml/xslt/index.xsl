<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- imports -->
<xsl:import href="../common/xslt/custom.xsl"/>
<xsl:import href="../common/xslt/date.xsl"/>
<xsl:import href="../common/xslt/inline-block.xsl"/>
<xsl:import href="../common/xsl/text.xsl"/>

<!-- includes -->
<xsl:include href="index-custom.xsl"/>
<xsl:include href="index-menu.xsl"/>

<!-- output -->
<xsl:output
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  encoding="iso-8859-1"
  indent="yes"
  omit-xml-declaration="yes"
  method="xml"/>

<xsl:strip-space elements="*"/>

<!-- root template -->
<xsl:template match="/">
  <xsl:variable name="date">
    <xsl:call-template name="numerical-date">
      <xsl:with-param name="text" select="*/@date"/>
    </xsl:call-template>
  </xsl:variable>

  <html lang="en">

  <head>
  <xsl:call-template name="meta-tags"/>
  <title><xsl:if test="not(starts-with($htmlFile, 'index'))"><xsl:text>Web Index: </xsl:text></xsl:if><xsl:call-template name="title"/></title>
  <link href="{$css}" rel="stylesheet" type="text/css"/>
  <script type="text/javascript">
  function search (formIndex, url) {
    var form = document.forms[formIndex];
    if (form.elements[0].value.length == 0) location = 'http://' + url;
    else form.submit();
  }
  </script>
  </head>

  <xsl:comment><xsl:value-of select="concat(' ssv ', $timestamp, ' lc ', $date, ' ')"/></xsl:comment>

  <body>

    <div id="header">
      <xsl:call-template name="logo">
        <xsl:with-param name="local" select="contains($filePath, 'local')"/>
      </xsl:call-template>

      <h1><xsl:call-template name="title"/></h1>
    </div>

    <div id="left">
      <div class="pad">
        <xsl:call-template name="menu">
          <xsl:with-param name="local" select="contains($filePath, 'local')"/>
        </xsl:call-template>
      </div>
    </div>

    <div id="center">

      <div id="content">
        <xsl:apply-templates/>
      </div>

      <div id="footer">
        <xsl:call-template name="footer"/>
      </div>
    </div>

    <div id="right">
      <div class="pad">
        <xsl:call-template name="search"/>
      </div>
    </div>
  </body>
  </html>
</xsl:template>

<!-- title -->
<xsl:template name="title">
  <xsl:apply-templates select="*[1]/title" />
</xsl:template>

<!-- footer -->
<xsl:template name="footer">
  <xsl:choose>
  <xsl:when test="index">
    Updated <xsl:value-of select="$dateLastModified"/>; <xsl:value-of select="count(index//site)"/> links
  </xsl:when>
  <xsl:otherwise>
    <xsl:apply-templates select="*/footer"/>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- doctype: index -->
<xsl:template match="index">
  <table class="content" cellpadding="0" cellspacing="0">
  <tr>
    <xsl:apply-templates select="column"/>
  </tr>
  </table>
</xsl:template>

<!-- column -->
<xsl:template match="column[1]">
  <td class="left">
    <xsl:if test="$columnCount=1">
      <xsl:attribute name="class">single</xsl:attribute>
    </xsl:if>
    <xsl:apply-templates select="category"/>
  </td>
</xsl:template>

<xsl:template match="column[2]">
  <td class="right">
    <xsl:apply-templates select="category"/>
  </td>
</xsl:template>

<!-- category -->
<xsl:template match="category">
  <h2 class="category">
    <xsl:if test="position() = 1">
      <xsl:attribute name="class">category first</xsl:attribute>
    </xsl:if>
    <xsl:value-of select="@name"/>
  </h2>

  <ul class="category">

    <xsl:choose>
    <xsl:when test="@sort='yes'">
      <xsl:for-each select="site">
        <xsl:sort select="name"/>
        <xsl:call-template name="site"/>
      </xsl:for-each>
    </xsl:when>
    <xsl:otherwise>
      <xsl:for-each select="site">
        <xsl:call-template name="site"/>
      </xsl:for-each>
    </xsl:otherwise>
    </xsl:choose>

  </ul>
</xsl:template>

<!-- site -->
<xsl:template name="site">
  <li><a href="{@href}"><xsl:apply-templates select="name"/></a><xsl:if test="@new"><xsl:call-template name="new"/></xsl:if><xsl:if test="@rec"><xsl:call-template name="rec"/></xsl:if></li>
  <xsl:apply-templates select="desc"/>
</xsl:template>

<xsl:template name="new">
  <span class="new">*</span>
</xsl:template>

<xsl:template name="rec">
  <span class="rec">*</span>
</xsl:template>

<!-- name -->
<xsl:template match="name">
  <xsl:value-of select="."/>
</xsl:template>

<!-- desc -->
<xsl:template match="desc">
  <li class="desc"><xsl:value-of select="."/></li>
</xsl:template>

<!-- doctype: article -->
<xsl:template match="article">
  <xsl:apply-templates select="body"/>
</xsl:template>

<!-- doctype: home -->
<xsl:template match="home">
  <xsl:apply-templates select="preface"/>
  <br/>

  <table class="content" cellpadding="0" cellspacing="0">
  <tr>
    <xsl:apply-templates select="column"/>
  </tr>
  </table>

  <hr/>
  <xsl:apply-templates select="prologue"/>
</xsl:template>

<!-- generic -->
<xsl:template match="generic">
  <xsl:choose>

  <xsl:when test="@type='47-saab'">
  <img src="{$imagePath}/saab-01.jpg" alt="1947 Saab" width="300" height="140"/>
  </xsl:when>

  <xsl:when test="@type='fallingwater'">
  <img src="{$imagePath}/fallingwater.jpg" alt="Frank Lloyd Wright house" width="350" height="289"/>
  </xsl:when>

  <xsl:when test="@type='herrick-lake'">
  <img src="{$imagePath}/herrick-lake.jpg" alt="Herrick Lake" width="320" height="219"/>
  </xsl:when>

  <xsl:when test="@type='nauset-lighthouse'">
  <img src="{$imagePath}/nauset-lighthouse.jpg" alt="Nauset Lighthouse" width="200" height="128"/>
  </xsl:when>

  </xsl:choose>
</xsl:template>

</xsl:stylesheet>
