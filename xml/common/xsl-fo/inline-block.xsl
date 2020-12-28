<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format">

<!-- EXTERNAL DEPENDENCIES

variables:
	bullet
	output

	font-size
	font-size-small
	level
	list-indent
	list-indent-num
	list-indent-unit
	space-before
	space-before-list-item

-->

<!-- INLINE ELEMENTS -->

<!-- ================================================ -->
<xsl:template match="b">
	<fo:inline font-weight="bold"><xsl:apply-templates/></fo:inline>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="br">
	<fo:block/>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="i">
	<fo:inline font-style="italic"><xsl:apply-templates/></fo:inline>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="line">
	<fo:block>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="link[@href]">
	<xsl:variable name="text">
		<xsl:choose>
		<xsl:when test="string-length(normalize-space(.))">
			<xsl:apply-templates/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:choose>
				<xsl:when test="starts-with(@href, 'http://')">
					<xsl:value-of select="substring-after(@href, 'http://')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="@href"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<fo:inline><xsl:value-of select="$text"/></fo:inline>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="link[@name]"/>

<!-- ================================================ -->
<xsl:template match="note-ref">
	<xsl:choose>
	<xsl:when test="starts-with(@symbol, '*')">
		<xsl:value-of select="@symbol"/>
	</xsl:when>
	<xsl:otherwise>
		<fo:inline baseline-shift="super"><xsl:value-of select="@symbol"/></fo:inline>
	</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="sub">
	<fo:inline baseline-shift="sub"><xsl:apply-templates/></fo:inline>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="sup">
	<fo:inline baseline-shift="super"><xsl:apply-templates/></fo:inline>
</xsl:template>

<!-- BLOCK ELEMENTS -->

<!-- ================================================ -->
<xsl:template match="list">
	<xsl:if test="@output='all' or contains($output, @output)">
		<xsl:variable name="level" select="count(ancestor-or-self::list)"/>
		<xsl:variable name="list-indent"
			select="concat($level * $list-indent-num, $list-indent-unit)"/>

		<xsl:if test="headline">
			<fo:block space-before="{$space-before}" font-weight="bold">
				<xsl:apply-templates select="headline"/>
			</fo:block>
		</xsl:if>

		<fo:list-block start-indent="{$list-indent}"
			provisional-distance-between-starts="{$font-size}">
			<xsl:if test="not(headline or preceding-sibling::*[1]/self::para)">
				<xsl:attribute name="space-before"><xsl:value-of select="$space-before"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="item"/>
		</fo:list-block>
	</xsl:if>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="list/item">
	<xsl:if test="@output='all' or contains($output, @output)">
		<fo:list-item space-before="{$space-before-list-item}">
			<fo:list-item-label>
				<xsl:copy-of select="$list-item-label"/>
			</fo:list-item-label>
			<fo:list-item-body start-indent="body-start()">
				<fo:block><xsl:apply-templates/></fo:block>
			</fo:list-item-body>
		</fo:list-item>
	</xsl:if>
</xsl:template>

<!-- ================================================ -->
<xsl:template name="list-item">
	<xsl:param name="label"/>
	<xsl:param name="body"/>

	<fo:list-item space-before="{$space-before-list-item}">
		<fo:list-item-label>
			<fo:block><xsl:copy-of select="$label"/></fo:block>
		</fo:list-item-label>
		<fo:list-item-body start-indent="body-start()">
			<fo:block><xsl:copy-of select="$body"/></fo:block>
		</fo:list-item-body>
	</fo:list-item>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="note">
	<xsl:if test="@output='all' or contains($output, @output)">
		<fo:block space-before="{$space-before}" font-size="{$font-size-small}" font-style="italic">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:if>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="para">
	<xsl:if test="@output='all' or contains($output, @output)">
		<fo:block space-before="{$space-before}">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:if>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="para[child::headline]">
	<xsl:if test="@output='all' or contains($output, @output)">
		<fo:block space-before="{$space-before}" font-weight="bold">
			<xsl:apply-templates select="headline" mode="allow"/>
		</fo:block>
		<fo:block>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:if>
</xsl:template>

<xsl:template match="para/headline"/>

<xsl:template match="para/headline" mode="allow">
	<xsl:apply-templates/>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="subtitle">
	<xsl:if test="@output='all' or contains($output, @output)">
		<fo:block space-before="{$space-before}" font-weight="bold">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:if>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="table">
	<xsl:if test="@output='all' or contains($output, @output)">
		<fo:block>&#160;</fo:block>
		<fo:table>
			<xsl:if test="@border='yes' or not(@border)">
				<xsl:attribute name="border">0.5pt solid black</xsl:attribute>
			</xsl:if>
			<xsl:if test="@width">
				<xsl:attribute name="width"><xsl:value-of select="@width"/></xsl:attribute>
			</xsl:if>
			<fo:table-body>
				<xsl:apply-templates/>
			</fo:table-body>
		</fo:table>
	</xsl:if>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="table/tr">
	<fo:table-row>
		<xsl:if test="@valign"><xsl:attribute name="vertical-align"><xsl:value-of select="@valign"/></xsl:attribute>
		</xsl:if>
		<xsl:apply-templates/>
	</fo:table-row>
</xsl:template>

<!-- ================================================ -->
<xsl:template match="table/tr/th | table/tr/td">
	<fo:table-cell>
		<xsl:if test="@align">
			<xsl:attribute name="text-align"><xsl:value-of select="@align"/></xsl:attribute>
		</xsl:if>
		<xsl:if test="@colspan">
			<xsl:attribute name="number-columns-spanned"><xsl:value-of select="@colspan"/></xsl:attribute>
		</xsl:if>
		<xsl:if test="@rowspan">
			<xsl:attribute name="number-rows-spanned"><xsl:value-of select="@rowspan"/></xsl:attribute>
		</xsl:if>
		<xsl:if test="@valign">
			<xsl:attribute name="vertical-align"><xsl:value-of select="@valign"/></xsl:attribute>
		</xsl:if>
		<xsl:if test="@width">
			<xsl:attribute name="width"><xsl:value-of select="@width"/></xsl:attribute>
		</xsl:if>
		<fo:block>
			<xsl:if test="name()='th'">
				<xsl:attribute name="font-weight">bold</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>
	</fo:table-cell>
</xsl:template>

</xsl:stylesheet>
