<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- variables -->

<xsl:variable name="columnCount" select="count(//column)"/>
<xsl:variable name="htmlFile" select="concat(substring-before($inputFile, '.xml'), '.html')"/>

<xsl:variable name="css">
	<xsl:choose>
		<xsl:when test="contains($filePath, 'local')">../../style/index.css</xsl:when>
		<xsl:otherwise>../style/index.css</xsl:otherwise>
	</xsl:choose>
</xsl:variable>

<xsl:variable name="imagePath">
	<xsl:choose>
		<xsl:when test="contains($filePath, 'local')">../images</xsl:when>
		<xsl:otherwise>images</xsl:otherwise>
	</xsl:choose>
</xsl:variable>

<!-- named templates -->

<xsl:template name="copyright-notice">
	<xsl:text disable-output-escaping="yes">Copyright &amp;copy; 1996-</xsl:text><xsl:value-of select="$year"/><xsl:text> N. Hoyt</xsl:text>
</xsl:template>

</xsl:stylesheet>
