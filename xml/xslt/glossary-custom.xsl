<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- REQUIRED DEFINITIONS -->

<!-- VARIABLES -->

<xsl:variable name="stylesheetVersion">2.0</xsl:variable>

<xsl:variable name="fontSizeSubtitle">+0</xsl:variable>
<xsl:variable name="fontColorSubtitle">#000000</xsl:variable>

<xsl:variable name="bgImage">images/grey-stripe.gif</xsl:variable>

<xsl:variable name="linkColor">#000000</xsl:variable>
<xsl:variable name="alinkColor">#ff0033</xsl:variable>
<xsl:variable name="vlinkColor">#000000</xsl:variable>

<xsl:variable name="bulletImage">images/bullet.gif</xsl:variable>
<xsl:variable name="bulletWidth">5</xsl:variable>
<xsl:variable name="bulletHeight">5</xsl:variable>
<xsl:variable name="bulletHSpace">1</xsl:variable>
<xsl:variable name="bulletVSpace">6</xsl:variable>

<xsl:variable name="hrImage">images/rule.gif</xsl:variable>
<xsl:variable name="hrWidth">480</xsl:variable>
<xsl:variable name="hrHeight">2</xsl:variable>

<xsl:variable name="menuWidth">130</xsl:variable>
<xsl:variable name="spacerWidth">30</xsl:variable>
<xsl:variable name="tableWidth">400</xsl:variable>

<!-- NAMED-TEMPLATES -->

<xsl:template name="copyright-notice">
<xsl:text disable-output-escaping="yes">&amp;copy; Copyright 1996-2002 N. Hoyt</xsl:text>
</xsl:template>


<!-- SITE-SPECIFIC DEFINITIONS -->

<!-- VARIABLES -->

<xsl:variable name="bgColorMenu">#99ccff</xsl:variable>
<xsl:variable name="columnSpacer">20</xsl:variable>
<xsl:variable name="fontColorMenu">#000000</xsl:variable>
<xsl:variable name="fontColorHighlight">#ff0033</xsl:variable>
<xsl:variable name="fontSizeDefault">+0</xsl:variable>
<xsl:variable name="fontSizeTitle">+0</xsl:variable>
<xsl:variable name="fontSizeMenu">-1</xsl:variable>
<xsl:variable name="emphColor">#ff0033</xsl:variable>

<!-- ATTRIBUTE-SETS -->

<xsl:attribute-set name="table-glossary">
<xsl:attribute name="cellpadding">3</xsl:attribute>
<xsl:attribute name="cellspacing">0</xsl:attribute>
<xsl:attribute name="border">0</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="table-inner">
<xsl:attribute name="cellpadding">2</xsl:attribute>
<xsl:attribute name="cellspacing">0</xsl:attribute>
<xsl:attribute name="width"><xsl:value-of select="$tableWidth"/></xsl:attribute>
<xsl:attribute name="border">0</xsl:attribute>
</xsl:attribute-set>

</xsl:stylesheet>
