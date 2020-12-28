<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- imports -->
<xsl:import href="../common/xslt/custom.xsl"/>
<xsl:import href="../common/xslt/inline-block.xsl"/>
<xsl:import href="../common/xslt/javascript.xsl"/>
<xsl:import href="../common/xsl/text.xsl"/>

<!-- includes -->
<xsl:include href="../common/xsl/resume.xsl"/>

<!-- output -->
<xsl:output
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  encoding="iso-8859-1"
  indent="yes"
  omit-xml-declaration="yes"
  method="html"/>

<xsl:strip-space elements="*"/>

<!-- ================================================ -->
<!-- variables -->

<xsl:variable name="output" select="concat($output-prefix, ' web')"/>

<!-- ================================================ -->
<!-- templates -->

<xsl:template match="/">
  <html lang="en">
  <head>
  <xsl:call-template name="meta-tags">
    <xsl:with-param name="description" select="/resume/title"/>
    <xsl:with-param name="keywords" select="/resume/keywords"/>
  </xsl:call-template>
  <title><xsl:apply-templates select="resume/title"/></title>
  <link href="style/resume.css" rel="stylesheet" type="text/css"/>
  <link media="print" href="style/resume-print.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript">
    <xsl:call-template name="popup"/>
  </script>
  <xsl:comment>[if IE]&gt;
&lt;style type="text/css"&gt;
ul.noindent { margin-left: 1.4em; }
&lt;/style&gt;
&lt;![endif]</xsl:comment>
  </head>

  <body>
    <xsl:call-template name="header"/>
    <xsl:apply-templates select="resume/section"/>
  </body>
  </html>
</xsl:template>

<!-- ================================================ -->
<xsl:template name="header">
  <div id="header">
    <img height="38" width="258" alt="Nicholas Hoyt" src="images/name.gif"/>
  </div>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="section">
  <xsl:if test="@output='all' or contains($output, @output)">
    <xsl:apply-templates/>
  </xsl:if>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="section/title">
  <div class="subtitle">
    <xsl:apply-templates/>
  </div>
</xsl:template>

<!-- ================================================ -->
<xsl:template name="employment-info">
  <div class="roles">
    <xsl:for-each select="role[@output='all' or contains($output, @output)]">
      <xsl:if test="position() &gt; 1"><xsl:text>, </xsl:text></xsl:if><xsl:value-of select="."/>
    </xsl:for-each>
  </div>

  <div class="company">
    <xsl:apply-templates select="client/company"/>, <xsl:apply-templates select="client/location"/>
  </div>

  <div>
    <xsl:value-of select="client/time-span"/>
  </div>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="project-list[project-ref]">
  <ul class="noindent">
  <xsl:for-each select="project-ref">
    <xsl:variable name="id" select="@id"/>
    <xsl:variable name="company" select="//employment-info[@id=$id]/client/company"/>

    <li><xsl:value-of select="$company"/></li>
  </xsl:for-each>
  </ul>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="school">
  <div class="school">
    <xsl:apply-templates select="name"/>
  </div>
  <xsl:for-each select="desc">
    <div><xsl:value-of select="."/></div>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
