<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- imports -->
<xsl:import href="../common/xslt/custom.xsl"/>
<xsl:import href="../common/xslt/date.xsl"/>

<!-- includes -->
<xsl:include href="index.xsl"/>
<xsl:include href="menu.xsl"/>

<xsl:output
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  encoding="iso-8859-1"
  indent="yes"
  omit-xml-declaration="yes"
  method="xml"/>

<xsl:strip-space elements="*"/>

<xsl:variable name="menu" select="document('../xml/menu.xml')"/>

<!-- root template -->
<xsl:template match="/">
  <html lang="en">
  <head>
  <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
  <title>Web Index: <xsl:call-template name="title"/></title>
  <link type="text/css" rel="stylesheet" href="../style/index.css" />
  <script type="text/javascript">
  function search (formIndex, url) {
    var form = document.forms[formIndex];
    if (form.elements[0].value.length == 0) location = 'http://' + url;
    else form.submit();
  }
  </script>
  </head>
  <body>

  <div id="header">
    <div id="logo">
      <a href="/index/" title="N. Hoyt's Web Index - Home"><img alt="N. Hoyt's Web Index - Home" src="images/logo.gif" /></a>
    </div>
    <h1><xsl:call-template name="title"/></h1>
  </div>

  <div id="left">
    <div class="pad">
      <xsl:call-template name="menu"/>
    </div>
  </div>

  <div id="center">
    <div id="content">
      <xsl:apply-templates select="index"/>
    </div>
    <div id="footer">
  <?php if ($copyright): ?>
  Copyright &copy; 1996-2006 N. Hoyt
  <?php else: ?>
  Updated <?= $dateLastModified ?>; <?= $numLinks ?> links
  <?php endif; ?>
    </div>
  </div>

  <div id="right">
    <div class="pad">
      <div class="label">Search/Lookup:</div>
      <!-- Google Search -->
      <form action="http://www.google.com/search" method="get">
        <div>
          <input class="first" onfocus="select()" id="google-search" name="q" tabindex="1" type="text" />
        </div>
        <div>
          <label for="google-search"><a href="javascript:search(0,'www.google.com')">Google</a></label>
        </div>
      </form>
      <!-- Yahoo! Search -->
      <form action="http://search.yahoo.com/search" method="get">
        <div>
          <input onfocus="select()" id="yahoo-search" name="p" tabindex="2" type="text" />
        </div>
        <div>
          <label for="yahoo-search"><a href="javascript:search(1,'search.yahoo.com')">Yahoo!&nbsp;Search</a></label>
        </div>
        <div>
          <input value="yscpb" name="fr" type="hidden" />
        </div>
      </form>
      <!-- Webster Collegiate Dictionary -->
      <form action="http://www.merriam-webstercollegiate.com/cgi-bin/collegiate" method="get">
        <div>
          <input onfocus="select()" id="collegiate" name="va" tabindex="3" type="text" />
        </div>
        <div>
          <label for="collegiate"><a href="javascript:search(2,'www.merriam-webstercollegiate.com')">Merriam-Webster</a></label>
        </div>
      </form>
      <!-- W3C Validator -->
      <div class="validator">
        <a href="http://validator.w3.org/check/referer" tabindex="4"><img height="31" width="88" alt="Valid XHTML 1.0!" src="images/valid-xhtml10.png" /></a>
      </div>
    </div>
  </div>

  </body>
  </html>
</xsl:template>

<!-- title -->
<xsl:template name="title">
  <xsl:apply-templates select="*[1]/title" />
</xsl:template>

<xsl:template name="menu">
  <xsl:apply-templates select="$menu"/>
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

</xsl:transform>
