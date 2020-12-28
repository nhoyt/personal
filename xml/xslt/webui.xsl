<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- imports -->
<xsl:import href="../common/xslt/custom.xsl"/>
<xsl:import href="../common/xslt/date.xsl"/>
<xsl:import href="../common/xslt/inline-block.xsl"/>
<xsl:import href="../common/xslt/javascript.xsl"/>
<xsl:import href="../common/xsl/text.xsl"/>

<!-- includes -->
<xsl:include href="webui-custom.xsl"/>
<xsl:include href="webui-menu.xsl"/>

<!-- output -->
<xsl:output
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  encoding="UTF-8"
  indent="yes"
  omit-xml-declaration="yes"
  method="html"/>

<xsl:strip-space elements="*"/>

<!-- root template -->
<xsl:template match="/">
<html lang="en">

<head>
<xsl:call-template name="meta-tags">
  <xsl:with-param name="description">Web UI, Inc. User Interface &amp; Interaction Design</xsl:with-param>
  <xsl:with-param name="keywords">interaction design usability user-centered design user interface design information architecture human factors analysis user experience architecture human-computer interaction hci computer-human interaction chi</xsl:with-param>
</xsl:call-template>
<title><xsl:value-of select="concat('Web UI - ', page/@name)"/></title>
<link href="style/webui.css" rel="stylesheet" type="text/css"/>
<link media="print" href="style/webui-print.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
  <xsl:call-template name="popup"/>
  <xsl:call-template name="newWindow"/>
</script>
</head>

<xsl:comment> ssv: <xsl:value-of select="$timestamp"/><xsl:text> </xsl:text></xsl:comment>

<body>
  <xsl:apply-templates/>
</body>

</html>
</xsl:template>

<!-- doctype: page -->
<xsl:template match="page">
  <div id="container">

  <div id="header">
    <xsl:choose>
    <xsl:when test="@name='Home'">
      <img height="36" width="127" alt="Web UI" src="images/logo.gif" class="logo"/>
    </xsl:when>
    <xsl:otherwise>
      <a href="index.html"><img height="36" width="127" alt="Web UI" src="images/logo.gif" class="logo"/></a>
    </xsl:otherwise>
    </xsl:choose>
    <img height="36" width="228" alt="USER INTERACTION DESIGN" src="images/blurb.gif" class="blurb"/>
  </div>

  <xsl:call-template name="menu">
    <xsl:with-param name="name" select="@name"/>
  </xsl:call-template>

  <div id="content">
    <xsl:call-template name="sidebar"/>

    <div class="text">
      <xsl:if test="title">
        <h1><xsl:apply-templates select="/page/title"/></h1>
      </xsl:if>
      <xsl:apply-templates select="body"/>
    </div>

    <div id="footer">
      <div class="text"><xsl:call-template name="copyright-notice"/></div>
    </div>
  </div>

  </div>
</xsl:template>

</xsl:stylesheet>
