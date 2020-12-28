<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- ================================================ -->
<!-- variables -->

<xsl:variable name="language" select="'amer'"/>

<!--
	Recommended combinations for uxa uxg gui gue eng:
					uxa: uxa uxg
					gui: uxg gui gue
					eng: gue eng
-->

<xsl:variable name="output-prefix" select="/resume/@filter"/>

<!-- ================================================ -->
<xsl:template match="employment-info">
	<xsl:if test="@output='all' or contains($output, @output)">
		<xsl:call-template name="employment-info"/>
		<xsl:apply-templates select="overview"/>
		<xsl:apply-templates select="project-list"/>
	</xsl:if>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="project-list[project]">
	<xsl:for-each select="project[@output='all' or contains($output, @output)]">
		<xsl:apply-templates/>
	</xsl:for-each>
</xsl:template>

</xsl:stylesheet>
