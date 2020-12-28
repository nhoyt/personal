<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- menu -->
<xsl:template name="menu">
	<xsl:comment> begin navigation </xsl:comment>
	<table xsl:use-attribute-sets="table-inner">
	<tr>

	<xsl:call-template name="menu-cell">
		<xsl:with-param name="href">index.html</xsl:with-param>
		<xsl:with-param name="text">Files &amp; Buffers</xsl:with-param>
		<xsl:with-param name="space">yes</xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="menu-cell">
		<xsl:with-param name="href">cursor.html</xsl:with-param>
		<xsl:with-param name="text">Moving the Cursor</xsl:with-param>
		<xsl:with-param name="space">yes</xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="menu-cell">
		<xsl:with-param name="href">windows.html</xsl:with-param>
		<xsl:with-param name="text">Windows</xsl:with-param>
	</xsl:call-template>

	</tr>
	<tr><td height="4"></td></tr>
	<tr>

	<xsl:call-template name="menu-cell">
		<xsl:with-param name="href">delete.html</xsl:with-param>
		<xsl:with-param name="text">Delete, Copy &amp; Yank</xsl:with-param>
		<xsl:with-param name="space">yes</xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="menu-cell">
		<xsl:with-param name="href">misc.html</xsl:with-param>
		<xsl:with-param name="text">Miscellaneous</xsl:with-param>
		<xsl:with-param name="space">yes</xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="menu-cell">
		<xsl:with-param name="href">help.html</xsl:with-param>
		<xsl:with-param name="text">Help</xsl:with-param>
	</xsl:call-template>

	</tr>
	</table>
	<xsl:comment> end navigation </xsl:comment>
</xsl:template>

<!-- menu-cell -->
<xsl:template name="menu-cell">
	<xsl:param name="href"/>
	<xsl:param name="text"/>
	<xsl:param name="space"/>

	<td width="{$menuWidth}" class="menu"><a href="{$href}"><xsl:value-of select="$text"/></a></td>
	<xsl:if test="$space='yes'">
		<td width="1"><img src="images/pixel.gif" width="1" height="1"/></td>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>
