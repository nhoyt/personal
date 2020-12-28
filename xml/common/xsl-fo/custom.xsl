<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format">

<!-- parameters -->

<!-- stylesheet parameter passed in by update.java -->
<xsl:param name="inputFile"/>

<!-- ================================================ -->
<xsl:template name="footnotes">
	<fo:list-block space-before="{$space-before}"
		provisional-distance-between-starts="{$font-size}">
		<xsl:for-each select="footnote">
			<xsl:call-template name="list-item">
				<xsl:with-param name="label">
					<xsl:choose>
					<xsl:when test="starts-with(@symbol, '*')">
						<fo:inline font-size="{$font-size-small}" font-style="italic">
							<xsl:value-of select="@symbol"/>
						</fo:inline>
					</xsl:when>
					<xsl:otherwise>
						<fo:inline font-size="{$font-size-small}"
							font-style="italic" baseline-shift="super">
							<xsl:value-of select="@symbol"/>
						</fo:inline>
					</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
				<xsl:with-param name="body">
					<fo:inline font-size="{$font-size-small}" font-style="italic">
						<xsl:apply-templates/>
					</fo:inline>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>
	</fo:list-block>
</xsl:template>

</xsl:stylesheet>
