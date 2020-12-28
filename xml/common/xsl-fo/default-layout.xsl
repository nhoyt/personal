<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:redirect="http://xml.apache.org/xalan/redirect"
	extension-element-prefixes="redirect">

<xsl:strip-space elements="*"/>

<!-- page-related -->
<xsl:variable name="default-page"		select="'letter'"/>
<xsl:variable name="page-width"			select="'8.5in'"/>
<xsl:variable name="page-height"		select="'11in'"/>
<xsl:variable name="outer-margin"		select="'0.5in'"/>
<xsl:variable name="inner-margin"		select="'0.5in'"/>

<xsl:variable name="font-family"		select="'Times New Roman'"/>
<xsl:variable name="font-size-num"		select="12"/>
<xsl:variable name="font-size-unit"		select="'pt'"/>
<xsl:variable name="font-size"			select="concat($font-size-num, $font-size-unit)"/>

<xsl:variable name="font-size-small"	select="concat($font-size-num - 2, $font-size-unit)"/>
<xsl:variable name="font-size-large"	select="concat($font-size-num + 2, $font-size-unit)"/>

<xsl:variable name="list-indent-num"	select="0.0"/>
<xsl:variable name="list-indent-unit"	select="'in'"/>
<xsl:variable name="list-indent"		select="concat($list-indent-num, $list-indent-unit)"/>

<xsl:variable name="space-before"		select="$font-size"/>
<xsl:variable name="space-before-list-item" select="'3pt'"/>
<xsl:variable name="table-cell-padding"	select="'2pt'"/>

<xsl:variable name="output-ext"			select="'.fo'"/>

<xsl:template name="layout-master-set">
	<fo:layout-master-set>
		<fo:simple-page-master	master-name="{$default-page}"
			page-width="{$page-width}"		page-height="{$page-height}"
			margin-top="{$outer-margin}"	margin-bottom="{$outer-margin}"
			margin-left="{$outer-margin}"	margin-right="{$outer-margin}">
			<fo:region-start  extent="{$inner-margin}"/>
			<fo:region-before extent="{$inner-margin}"/>
			<fo:region-body   margin="{$inner-margin}"/>
			<fo:region-end    extent="{$inner-margin}"/>
			<fo:region-after  extent="{$inner-margin}"/>
		</fo:simple-page-master>
	</fo:layout-master-set>
</xsl:template>

<!-- punctuation -->
<xsl:variable name="bullet"				select="'&#8226;'"/>

<xsl:variable name="list-item-label">
	<fo:block><xsl:value-of select="$bullet"/></fo:block>
</xsl:variable>

<!-- ================================================ -->
<xsl:template name="write-output-file">
	<xsl:param name="filename"/>
	<xsl:param name="content"/>

	<redirect:write file="{$path}/{$filename}">
		<xsl:copy-of select="$content"/>
	</redirect:write>
</xsl:template>

</xsl:stylesheet>
