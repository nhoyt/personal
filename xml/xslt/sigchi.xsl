<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- imports -->
<xsl:import href="../common/variables.xsl"/>
<xsl:import href="../common/attribute-sets.xsl"/>
<xsl:import href="../common/document.xsl"/>

<!-- includes -->
<xsl:include href="sigchi-custom.xsl"/>
<xsl:include href="sigchi-menu.xsl"/>

<!-- output -->
<xsl:output doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" method="html"/>
<xsl:strip-space elements="*"/>

<!-- variables -->
<xsl:variable name="next-meeting" select="document('..\SIGCHI\next-meeting.txt')/next-meeting"/>

<!-- root template -->
<xsl:template match="/">
	<xsl:variable name="prefix">
		<xsl:choose>
		<xsl:when test="/page"></xsl:when>
		<xsl:when test="/meeting">../</xsl:when>
		</xsl:choose>
	</xsl:variable>

	<html>
	<head>
	<title><xsl:call-template name="html-title"/></title>
	<link href="{$prefix}{$cssStylesheet}" type="text/css" rel="stylesheet"/>
	</head>

	<xsl:comment><xsl:value-of select="concat(' ssv ',$stylesheetVersion,' ')"/> </xsl:comment>
	<xsl:apply-templates/>
	</html>
</xsl:template>

<xsl:template name="logo">
	<xsl:variable name="prefix">
		<xsl:choose>
		<xsl:when test="/page"></xsl:when>
		<xsl:when test="/meeting">../</xsl:when>
		</xsl:choose>
	</xsl:variable>

	<td width="{$menuWidth}" valign="middle"><a href="{$prefix}index.html"><img src="{$prefix}{$imagePath}logo-x2.gif" width="150" height="110" border="0" alt="CHI-Squared Logo"/></a></td>
</xsl:template>

<!-- doctype: page -->
<xsl:template match="page">
	<body>

	<table xsl:use-attribute-sets="layout-table">
	<tr>
	<xsl:call-template name="logo"/>
	<xsl:call-template name="next-meeting"/>
	<td width="{$menuWidth}"></td>
	</tr>
	</table>

	<table xsl:use-attribute-sets="layout-table">
	<tr>
	<xsl:call-template name="menu"/>
	<td valign="top">
	<table xsl:use-attribute-sets="inner-table">
	<tr>
	<td valign="top">
	<xsl:apply-templates/>

	<xsl:call-template name="footer"/>
	</td>
	</tr>
	</table>
	</td>
	<td width="{$menuWidth}"></td>
	</tr>
	</table>
	</body>
</xsl:template>

<xsl:template match="page/title">
	<h2><xsl:apply-templates/></h2>
</xsl:template>

<xsl:template match="page/subtitle">
	<h3><xsl:apply-templates/></h3>
</xsl:template>

<!-- doctype: meeting -->
<xsl:template match="meeting">
	<body>

	<table xsl:use-attribute-sets="layout-table">
	<tr>
	<xsl:call-template name="logo"/>
	<xsl:call-template name="meeting-breadcrumb"/>
	<td width="{$menuWidth}"></td>
	</tr>
	</table>

	<table xsl:use-attribute-sets="layout-table">
	<tr>
	<xsl:call-template name="menu"/>
	<td valign="top">
	<table xsl:use-attribute-sets="inner-table">
	<tr>
	<td valign="top">
	<xsl:comment>begin content</xsl:comment>
	<xsl:apply-templates/>
	<xsl:comment>end content</xsl:comment>

	<xsl:call-template name="meeting-back-link"/>
	<xsl:call-template name="footer"/>
	</td>
	</tr>
	</table>
	</td>
	<td width="{$menuWidth}"></td>
	</tr>
	</table>
	</body>
</xsl:template>

<xsl:template match="meeting/title">
	<h2><xsl:apply-templates/></h2>
</xsl:template>

<xsl:template match="meeting/subtitle">
	<h3><xsl:apply-templates/></h3>
</xsl:template>

<xsl:template name="meeting-parent-name">
	<xsl:choose>
	<xsl:when test="/meeting/@code='next'">Upcoming Events</xsl:when>
	<xsl:when test="/meeting/@code='prev'">Previous Meetings</xsl:when>
	</xsl:choose>
</xsl:template>

<xsl:template name="meeting-parent-href">
	<xsl:choose>
	<xsl:when test="/meeting/@code='next'">../next.html</xsl:when>
	<xsl:when test="/meeting/@code='prev'">../prevMeetings.html</xsl:when>
	</xsl:choose>
</xsl:template>

<xsl:template name="meeting-back-link">
	<xsl:variable name="href"><xsl:call-template name="meeting-parent-href"/></xsl:variable>

	<h4><a href="{$href}">Back to <xsl:call-template name="meeting-parent-name"/></a></h4>
</xsl:template>

<xsl:template name="meeting-breadcrumb">
	<xsl:variable name="href"><xsl:call-template name="meeting-parent-href"/></xsl:variable>

	<td class="announce" valign="middle">
	<table xsl:use-attribute-sets="inner-table">
	<tr>
	<td>

	<table cellpadding="2" cellspacing="0" width="{$tableWidth}">
	<tr>
	<td colspan="3" class="subtitle"><a href="{$href}"><xsl:call-template name="meeting-parent-name"/></a>: <xsl:value-of select="/meeting/@date"/></td>
	</tr>
	</table>

	</td>
	</tr>
	</table>
	</td>
</xsl:template>

<xsl:template name="next-meeting">
	<td class="announce">
	<table xsl:use-attribute-sets="inner-table">
	<tr>
	<td>

	<table cellpadding="2" cellspacing="0" width="{$tableWidth}">
	<tr>
	<td class="subtitle" colspan="3">
	<xsl:apply-templates select="$next-meeting/prefix"/>:
	<xsl:if test="$next-meeting/date/day-of-week">
	<xsl:apply-templates select="$next-meeting/date/day-of-week"/>,
	</xsl:if>

	<xsl:if test="$next-meeting/date/month-day-year">
	<xsl:apply-templates select="$next-meeting/date/month-day-year"/>
	</xsl:if>

	<xsl:if test="$next-meeting/date/start-time">,
	<xsl:apply-templates select="$next-meeting/date/start-time"/>
	</xsl:if>

	<xsl:if test="$next-meeting/date/end-time"> &#8211;
	<xsl:apply-templates select="$next-meeting/date/end-time"/>
	</xsl:if>
	</td>
	</tr>

	<tr><td height="6"></td></tr>

	<xsl:for-each select="$next-meeting/info">
	<tr>
	<td valign="top"><b><xsl:apply-templates select="name"/>:</b></td>
	<td width="{$spacerWidth}"></td>
	<td><xsl:apply-templates select="value"/></td>
	</tr>
	</xsl:for-each>
	</table>

	</td>
	</tr>
	</table>
	</td>
</xsl:template>

<xsl:template name="footer">
	<!--
	<br/><hr width="100%"/>
	<span class="footer">Last updated: <xsl:value-of select="/page/@date"/></span>
	-->
	<!--
	<tr><td class="footer" valign="top"><hr width="100%"/>Updated <xsl:value-of select="/page/@date"/></td></tr>
	-->
</xsl:template>

<xsl:template match="html">
	<xsl:copy-of select="*"/>
</xsl:template>

</xsl:stylesheet>
