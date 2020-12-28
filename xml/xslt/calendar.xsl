<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- output -->
<xsl:output doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" method="html"/>
<xsl:strip-space elements="*"/>

<!-- variables -->
<xsl:variable name="column-count" select="7"/>
<xsl:variable name="channel-count" select="6"/>
<xsl:variable name="table-width" select="700"/>

<!-- root template -->
<xsl:template match="/weekly">
	<html>
	<head>
	<link rel="stylesheet" type="text/css" href="style.css"/>
	<title>TV Listings</title>
	</head>

	<body bgcolor="#ffffff" link="#000099" vlink="#000099">
	<table xsl:use-attribute-sets="table-with-border" width="{$table-width}">

	<xsl:apply-templates select="title"/>

	<tr class="hdr">
	<td><xsl:call-template name="nbsp"/></td>
	<td>Ch</td>
	<td width="15%">7:00</td>
	<td width="15%">7:30</td>
	<td width="15%">8:00</td>
	<td width="15%">8:30</td>
	<td width="30%">9:00</td>
	</tr>

	<xsl:call-template name="days"/>

	</table>
	</body>

	</html>
</xsl:template>

<xsl:template match="title">
	<tr><td colspan="{$column-count}" class="title">TV Listings</td></tr>
</xsl:template>

<xsl:template name="days">
	<xsl:for-each select="day">
		<xsl:call-template name="day"/>
	</xsl:for-each>
</xsl:template>

<xsl:template name="day">
	<tr class="sep"><td colspan="{$column-count}"></td></tr>

	<tr class="odd">
	<td class="day" rowspan="{$channel-count}"><xsl:call-template name="get-day-label"/></td>
	<xsl:call-template name="process-channel">
		<xsl:with-param name="channel" select="2"/>
	</xsl:call-template>
	</tr>

	<tr class="even">
	<xsl:call-template name="process-channel">
		<xsl:with-param name="channel" select="5"/>
	</xsl:call-template>
	</tr>

	<tr class="odd">
	<xsl:call-template name="process-channel">
		<xsl:with-param name="channel" select="6"/>
	</xsl:call-template>
	</tr>

	<tr class="even">
	<xsl:call-template name="process-channel">
		<xsl:with-param name="channel" select="7"/>
	</xsl:call-template>
	</tr>

	<tr class="odd">
	<xsl:call-template name="process-channel">
		<xsl:with-param name="channel" select="11"/>
	</xsl:call-template>
	</tr>

	<tr class="even">
	<xsl:call-template name="process-channel">
		<xsl:with-param name="channel" select="20"/>
	</xsl:call-template>
	</tr>
</xsl:template>

<xsl:template name="process-channel">
	<xsl:param name="channel"/>

	<td class="ch"><xsl:value-of select="$channel"/></td>

	<xsl:call-template name="process-channel-time-slot">
		<xsl:with-param name="channel" select="$channel"/>
		<xsl:with-param name="time-slot" select="700"/>
	</xsl:call-template>

	<xsl:call-template name="process-channel-time-slot">
		<xsl:with-param name="channel" select="$channel"/>
		<xsl:with-param name="time-slot" select="730"/>
	</xsl:call-template>

	<xsl:call-template name="process-channel-time-slot">
		<xsl:with-param name="channel" select="$channel"/>
		<xsl:with-param name="time-slot" select="800"/>
	</xsl:call-template>

	<xsl:call-template name="process-channel-time-slot">
		<xsl:with-param name="channel" select="$channel"/>
		<xsl:with-param name="time-slot" select="830"/>
	</xsl:call-template>

	<xsl:call-template name="process-channel-time-slot">
		<xsl:with-param name="channel" select="$channel"/>
		<xsl:with-param name="time-slot" select="900"/>
	</xsl:call-template>
</xsl:template>

<xsl:template name="process-channel-time-slot">
	<xsl:param name="channel"/>
	<xsl:param name="time-slot"/>

	<xsl:choose>
	<xsl:when test="time[@val=$time-slot]/program[@ch=$channel]">
		<xsl:for-each select="time[@val=$time-slot]/program[@ch=$channel]">
			<xsl:call-template name="process-program"/>
		</xsl:for-each>
	</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="empty-slot">
			<xsl:with-param name="channel" select="$channel"/>
			<xsl:with-param name="time-slot" select="$time-slot"/>
		</xsl:call-template>
	</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="process-program">
	<xsl:variable name="time-slot" select="ancestor::time/@val"/>

	<xsl:variable name="colspan">
	<xsl:choose>
	<xsl:when test="$time-slot=700 or $time-slot=730 or $time-slot=800 or $time-slot=830">
		<xsl:value-of select="number(@min div 30)"/>
	</xsl:when>
	<xsl:otherwise>1</xsl:otherwise>
	</xsl:choose>
	</xsl:variable>

	<td class="program" colspan="{$colspan}"><xsl:apply-templates/></td>
</xsl:template>

<xsl:template name="empty-slot">
	<xsl:param name="channel"/>
	<xsl:param name="time-slot"/>

	<xsl:variable name="colspan">
	<xsl:choose>
	<xsl:when test="$time-slot=700">
		<xsl:choose>
		<xsl:when test="time[@val=730]/program[@ch=$channel]">1</xsl:when>
		<xsl:otherwise>2</xsl:otherwise>
		</xsl:choose>
	</xsl:when>
	<xsl:when test="$time-slot=730">
		<xsl:choose>
		<xsl:when test="time[@val=700]/program[@ch=$channel]">
			<xsl:choose>
			<xsl:when test="time[@val=700]/program[@ch=$channel and @min=30]">1</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:when>
		<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:when>
	<xsl:when test="$time-slot=800">
		<xsl:choose>
		<xsl:when test="time[@val=830]/program[@ch=$channel]">1</xsl:when>
		<xsl:otherwise>2</xsl:otherwise>
		</xsl:choose>
	</xsl:when>
	<xsl:when test="$time-slot=830">
		<xsl:choose>
		<xsl:when test="time[@val=800]/program[@ch=$channel]">
			<xsl:choose>
			<xsl:when test="time[@val=800]/program[@ch=$channel and @min=30]">1</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:when>
		<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:when>
	<xsl:otherwise>2</xsl:otherwise>
	</xsl:choose>
	</xsl:variable>

	<xsl:if test="$colspan!=0">
	<td colspan="{$colspan}"><!--xsl:value-of select="$time-slot"/--><xsl:call-template name="nbsp"/></td>
	</xsl:if>
</xsl:template>

<xsl:template name="get-day-label">
	<xsl:choose>
		<xsl:when test="@id='sun'">Sunday</xsl:when>
		<xsl:when test="@id='mon'">Monday</xsl:when>
		<xsl:when test="@id='tue'">Tuesday</xsl:when>
		<xsl:when test="@id='wed'">Wednesday</xsl:when>
		<xsl:when test="@id='thu'">Thursday</xsl:when>
		<xsl:when test="@id='fri'">Friday</xsl:when>
		<xsl:when test="@id='sat'">Saturday</xsl:when>
	</xsl:choose>
</xsl:template>

<xsl:template name="nbsp">
	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
</xsl:template>

<xsl:attribute-set name="table-sans-border">
	<xsl:attribute name="cellpadding">2</xsl:attribute>
	<xsl:attribute name="cellspacing">0</xsl:attribute>
	<xsl:attribute name="border">0</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="table-with-border">
	<xsl:attribute name="cellpadding">2</xsl:attribute>
	<xsl:attribute name="cellspacing">0</xsl:attribute>
	<xsl:attribute name="border">1</xsl:attribute>
</xsl:attribute-set>

</xsl:stylesheet>
