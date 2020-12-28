<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- EXTERNAL DEPENDENCIES

variables:
	language
	output

-->

<!-- ================================================ -->
<xsl:template match="choose">
	<xsl:choose>
	<xsl:when test="when[contains($output, @output)]">
		<xsl:apply-templates select="when[contains($output, @output)]"/>
	</xsl:when>
	<xsl:otherwise>
		<xsl:apply-templates select="otherwise"/>
	</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="if">
	<xsl:if test="contains($output, @output)">
		<xsl:apply-templates/>
	</xsl:if>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="div">
	<xsl:if test="contains($output, @output)">
		<xsl:apply-templates/>
	</xsl:if>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="sp">
	<xsl:apply-templates select="var[@type=$language]"/>
</xsl:template>

<!-- ================================================ -->
<xsl:template name="lowercase">
	<xsl:param name="text"/>
	<xsl:value-of select="translate($text, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
</xsl:template>

<!-- ================================================ -->
<xsl:template name="uppercase">
	<xsl:param name="text"/>
	<xsl:value-of select="translate($text, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
</xsl:template>

</xsl:stylesheet>
