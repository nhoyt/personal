<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template name="menu">
	<xsl:variable name="prefix">
		<xsl:choose>
		<xsl:when test="/meeting">../</xsl:when>
		<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<td class="menu" valign="top" width="{$menuWidth}">
	<img src="{$prefix}{$imagePath}transparent.gif" width="{$menuWidth}" height="2"/><br/>

	<table cellspacing="0" cellpadding="10" width="100%" border="0">
	<tr>
	<td valign="top">

	<table cellspacing="0" cellpadding="1" width="100%" border="0">

	<tr><td height="4"></td></tr>

	<xsl:call-template name="menu-bold">
		<xsl:with-param name="code">index</xsl:with-param>
		<xsl:with-param name="href">index.html</xsl:with-param>
		<xsl:with-param name="text">Home</xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="spacer-row"/>

	<xsl:call-template name="menu-category">
		<xsl:with-param name="text">Meetings and Events</xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="menu-item">
		<xsl:with-param name="code">nextMtg</xsl:with-param>
		<xsl:with-param name="href">next.html</xsl:with-param>
		<xsl:with-param name="text">Upcoming Events</xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="menu-item">
		<xsl:with-param name="code">prevMtgs</xsl:with-param>
		<xsl:with-param name="href">prevMeetings.html</xsl:with-param>
		<xsl:with-param name="text">Previous Meetings</xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="spacer-row"/>

	<xsl:call-template name="menu-category">
		<xsl:with-param name="text">About CHI-Squared</xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="menu-item">
		<xsl:with-param name="code">about</xsl:with-param>
		<xsl:with-param name="href">about.html</xsl:with-param>
		<xsl:with-param name="text">Who We Are</xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="menu-item">
		<xsl:with-param name="code">history</xsl:with-param>
		<xsl:with-param name="href">history.html</xsl:with-param>
		<xsl:with-param name="text">History</xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="menu-item">
		<xsl:with-param name="code">parents</xsl:with-param>
		<xsl:with-param name="href">parents.html</xsl:with-param>
		<xsl:with-param name="text">Parent Organizations</xsl:with-param>
	</xsl:call-template>

	<tr>
	<td valign="top" width="12"><!--xsl:call-template name="bullet"/--></td>
	<td class="menu">[<a href="http://www.acm.org/sigchi/">SIGCHI</a>,
	<a href="http://www.acm.org/">ACM</a>]</td>
	</tr>

	<xsl:call-template name="menu-item">
		<xsl:with-param name="code">bylaws</xsl:with-param>
		<xsl:with-param name="href">bylaws.html</xsl:with-param>
		<xsl:with-param name="text">Bylaws</xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="spacer-row"/>

	<xsl:call-template name="menu-category">
		<xsl:with-param name="text">Membership</xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="menu-item">
		<xsl:with-param name="code">join</xsl:with-param>
		<xsl:with-param name="href">join.html</xsl:with-param>
		<xsl:with-param name="text">Join CHI-Squared</xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="menu-item">
		<xsl:with-param name="code">mail</xsl:with-param>
		<xsl:with-param name="href">mail.html</xsl:with-param>
		<xsl:with-param name="text">Mailing List</xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="menu-item">
		<xsl:with-param name="code">library</xsl:with-param>
		<xsl:with-param name="href">library.html</xsl:with-param>
		<xsl:with-param name="text">Library</xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="menu-item">
		<xsl:with-param name="code">volunteer</xsl:with-param>
		<xsl:with-param name="href">volunteer.html</xsl:with-param>
		<xsl:with-param name="text">Volunteers</xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="spacer-row"/>

	<xsl:call-template name="menu-category">
		<xsl:with-param name="text">Contact Us</xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="menu-item">
		<xsl:with-param name="code">officers</xsl:with-param>
		<xsl:with-param name="href">officers.html</xsl:with-param>
		<xsl:with-param name="text">Officers</xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="menu-item">
		<xsl:with-param name="code">feedback</xsl:with-param>
		<xsl:with-param name="href">feedback.html</xsl:with-param>
		<xsl:with-param name="text">Feedback</xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="spacer-row"/>

	<xsl:call-template name="menu-bold">
		<xsl:with-param name="code">sponsors</xsl:with-param>
		<xsl:with-param name="href">sponsors.html</xsl:with-param>
		<xsl:with-param name="text">Sponsors</xsl:with-param>
	</xsl:call-template>

	</table>

	</td>
	</tr>
	</table>

	</td>
</xsl:template>

<xsl:template name="menu-item">
	<xsl:param name="code"/>
	<xsl:param name="href"/>
	<xsl:param name="text"/>

	<tr>
	<td width="4" valign="top"><xsl:call-template name="bullet"/></td>
	<td class="menu" width="140">
	<xsl:choose>
	<xsl:when test="/meeting">
		<a href="../{$href}"><xsl:value-of select="$text"/></a>
	</xsl:when>
	<xsl:when test="/page">
		<xsl:choose>
		<xsl:when test="not($code=/page/@code)">
		<a href="{$href}"><xsl:value-of select="$text"/></a>
		</xsl:when>
		<xsl:otherwise>
		<span class="menu-selected"><xsl:value-of select="$text"/></span>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:when>
	</xsl:choose>
	</td>
	</tr>
</xsl:template>

<xsl:template name="menu-bold">
	<xsl:param name="code"/>
	<xsl:param name="href"/>
	<xsl:param name="text"/>

	<tr>
	<th class="menu" colspan="2" align="left">
	<xsl:choose>
	<xsl:when test="/meeting">
		<a href="../{$href}"><xsl:value-of select="$text"/></a>
	</xsl:when>
	<xsl:when test="/page">
		<xsl:choose>
		<xsl:when test="not($code=/page/@code)">
		<a href="{$href}"><xsl:value-of select="$text"/></a>
		</xsl:when>
		<xsl:otherwise>
		<span class="menu-selected"><xsl:value-of select="$text"/></span>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:when>
	</xsl:choose>
	</th>
	</tr>
</xsl:template>

<xsl:template name="menu-category">
	<xsl:param name="text"/>

	<tr>
	<th class="menu" colspan="2" align="left"><xsl:value-of select="$text"/></th>
	</tr>
</xsl:template>

</xsl:stylesheet>
