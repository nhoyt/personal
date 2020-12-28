<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- imports -->
<xsl:import href="../common/variables.xsl"/>

<!-- includes -->
<xsl:include href="../common/attribute-sets.xsl"/>
<xsl:include href="../common/htmldoc.xsl"/>
<xsl:include href="glossary-custom.xsl"/>
<xsl:include href="glossary-menu.xsl"/>

<!-- output -->
<xsl:output doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" method="html"/>

<!-- variables -->
<xsl:variable name="columnCount"><xsl:value-of select="count(//column)"/></xsl:variable>

<!-- root template -->
<xsl:template match="/">
	<html>
	<head>
	<title><xsl:value-of select="*/@name"/></title>
	<link href="style.css" type="text/css" rel="stylesheet"/>
	</head>
	<xsl:apply-templates/>
	</html>
</xsl:template>

<!-- doctype: glossary -->
<xsl:template match="/glossary">
	<body xsl:use-attribute-sets="body">

	<table xsl:use-attribute-sets="table-glossary">
	<tr><td>
	<xsl:call-template name="menu"/>
	</td></tr>

	<xsl:call-template name="spacer-row"/>

	<tr><td>
	<table xsl:use-attribute-sets="table-inner">
	<tr><td class="title"><xsl:value-of select="@name" /></td></tr>
	</table>
	</td></tr>

	<xsl:call-template name="spacer-row-min"/>

	<tr>
	<xsl:apply-templates/>
	</tr>

	<xsl:call-template name="spacer-row"/>

	<tr><td>
	<table xsl:use-attribute-sets="table-inner">
	<tr><td class="menu"><a href="../../">nhoyt.com</a></td></tr>
	</table>
	</td></tr>
	</table>
	</body>
</xsl:template>

<!-- column -->
<xsl:template match="column">
	<xsl:variable name="position"><xsl:value-of select="position() div 2"/></xsl:variable>

	<xsl:if test="$position>1">
		<td><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</td>
	</xsl:if>

	<td valign="top">
	<table xsl:use-attribute-sets="table-inner">
	<xsl:apply-templates/>
	</table>
	</td>
</xsl:template>

<!-- entry -->
<xsl:template match="entry">
	<xsl:variable name="position"><xsl:value-of select="position() div 2"/></xsl:variable>

	<xsl:variable name="contrast">
		<xsl:choose>
			<xsl:when test="($position mod 2)!=0">dark</xsl:when>
			<xsl:otherwise>light</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<tr class="{$contrast}">
	<td valign="top"><xsl:apply-templates select="term"/></td>
	<td><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</td>
	<td><xsl:apply-templates select="desc"/></td>
	</tr>
</xsl:template>

<!-- term -->
<xsl:template match="term">
	<xsl:apply-templates/>
</xsl:template>

<!-- desc -->
<xsl:template match="desc">
	<xsl:apply-templates/>
</xsl:template>

</xsl:stylesheet>
