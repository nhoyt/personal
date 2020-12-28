<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- output -->
<xsl:output
	encoding="iso-8859-1"
	indent="yes"
	method="text"
/>

<xsl:strip-space elements="*"/>

<xsl:template match="/">
	<xsl:for-each select="color-scheme/color-mapping/rule">
<xsl:if test="position()&gt;1"><xsl:text>
</xsl:text></xsl:if>
<xsl:value-of select="sel"/> {
<xsl:apply-templates select="prop"/>
<xsl:text>}
</xsl:text>
	</xsl:for-each>
</xsl:template>

<xsl:template match="prop">
	<xsl:variable name="ref" select="@ref"/>
	<xsl:variable name="val" select="//color[@id=$ref]/@val"/>
<xsl:text>	</xsl:text><xsl:value-of select="@name"/>: #<xsl:value-of select="$val"/><xsl:text>;
</xsl:text>
</xsl:template>

</xsl:stylesheet>
