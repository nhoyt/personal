<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- EXTERNAL DEPENDENCIES

CSS classes:
	blockquote
	emph
	headline
	note
	subtitle

variables:
	output

-->

<!-- ATTRIBUTE SETS -->

<xsl:attribute-set name="image-default">
	<xsl:attribute name="src"><xsl:value-of select="@src"/></xsl:attribute>
	<xsl:attribute name="alt"><xsl:value-of select="@alt"/></xsl:attribute>
	<xsl:attribute name="border">0</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="table-default">
	<xsl:attribute name="cellpadding">0</xsl:attribute>
	<xsl:attribute name="cellspacing">0</xsl:attribute>
	<xsl:attribute name="border">1</xsl:attribute>
</xsl:attribute-set>

<!-- INLINE ELEMENTS -->

<xsl:template match="b">
	<b><xsl:apply-templates/></b>
</xsl:template>

<xsl:template match="br">
	<br/>
</xsl:template>

<xsl:template match="emph">
	<em><xsl:apply-templates/></em>
</xsl:template>

<xsl:template match="i">
	<i><xsl:apply-templates/></i>
</xsl:template>

<!-- image -->
<xsl:template match="image[not(@href)]">
	<img xsl:use-attribute-sets="image-default">
	<xsl:if test="@width and @height">
		<xsl:attribute name="width"><xsl:value-of select="@width"/></xsl:attribute>
		<xsl:attribute name="height"><xsl:value-of select="@height"/></xsl:attribute>
	</xsl:if>
	<xsl:if test="@usemap">
		<xsl:attribute name="usemap">#<xsl:value-of select="@usemap"/></xsl:attribute>
	</xsl:if>
	</img>
</xsl:template>

<xsl:template match="image[@href]">
	<a href="{@href}"><img xsl:use-attribute-sets="image-default">
	<xsl:if test="@width and @height">
		<xsl:attribute name="width"><xsl:value-of select="@width"/></xsl:attribute>
		<xsl:attribute name="height"><xsl:value-of select="@height"/></xsl:attribute>
	</xsl:if>
	<xsl:if test="@usemap">
		<xsl:attribute name="usemap">#<xsl:value-of select="@usemap"/></xsl:attribute>
	</xsl:if>
	</img></a>
</xsl:template>

<!-- line -->
<xsl:template match="line">
	<xsl:if test="position() &gt; 1"><br/></xsl:if>
	<xsl:apply-templates/>
</xsl:template>

<!-- link -->
<xsl:template match="link[@href]">
	<xsl:variable name="href">
		<xsl:value-of disable-output-escaping="yes" select="@href"/>
	</xsl:variable>

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

	<a href="{$href}"><xsl:value-of select="$text"/></a>
</xsl:template>

<xsl:template match="link[@name]">
	<a name="{@name}"><xsl:apply-templates/></a>
</xsl:template>

<!-- note-ref -->
<xsl:template match="note-ref">
	<xsl:choose>
	<xsl:when test="starts-with(@symbol, '*')">
		<xsl:value-of select="@symbol"/>
	</xsl:when>
	<xsl:otherwise>
		<sup><xsl:value-of select="@symbol"/></sup>
	</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="small">
	<small><xsl:apply-templates/></small>
</xsl:template>

<xsl:template match="sub">
	<sub><xsl:apply-templates/></sub>
</xsl:template>

<xsl:template match="sup">
	<sup><xsl:apply-templates/></sup>
</xsl:template>

<!-- BLOCK ELEMENTS -->

<!-- blockquote -->
<xsl:template match="blockquote">
	<xsl:if test="@output='all' or contains($output, @output)">
		<div class="blockquote">
			<xsl:apply-templates/>
		</div>
	</xsl:if>
</xsl:template>

<!-- list -->
<xsl:template match="list[@type='a']">
	<xsl:if test="@output='all' or contains($output, @output)">
		<xsl:apply-templates select="headline"/>
		<ol style="list-style-type: lower-alpha" class="noindent">
			<xsl:apply-templates select="item"/>
		</ol>
	</xsl:if>
</xsl:template>

<xsl:template match="list[@type='n']">
	<xsl:if test="@output='all' or contains($output, @output)">
		<xsl:apply-templates select="headline"/>
		<dl>
			<xsl:apply-templates select="item"/>
		</dl>
	</xsl:if>
</xsl:template>

<xsl:template match="list[@type='o']">
	<xsl:if test="@output='all' or contains($output, @output)">
		<xsl:apply-templates select="headline"/>
		<ol style="list-style-type: decimal" class="noindent">
			<xsl:if test="@start">
				<xsl:attribute name="start"><xsl:value-of select="@start"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="item"/>
		</ol>
	</xsl:if>
</xsl:template>

<xsl:template match="list[@type='u' or not(@type)]">
	<xsl:if test="@output='all' or contains($output, @output)">
		<xsl:apply-templates select="headline"/>
		<ul class="noindent">
			<xsl:apply-templates select="item"/>
		</ul>
	</xsl:if>
</xsl:template>

<!-- list headline -->
<xsl:template match="list/headline">
	<div class="headline"><xsl:apply-templates/></div>
</xsl:template>

<!-- list item -->
<xsl:template match="list[@type='n']/item">
	<xsl:if test="@output='all' or contains($output, @output)">
		<dd><xsl:apply-templates/></dd>
	</xsl:if>
</xsl:template>

<xsl:template match="list[not(@type='n')]/item">
	<xsl:if test="@output='all' or contains($output, @output)">
		<li><xsl:apply-templates/></li>
	</xsl:if>
</xsl:template>

<!-- note -->
<xsl:template match="note">
	<xsl:if test="@output='all' or contains($output, @output)">
		<p class="note"><xsl:apply-templates/></p>
	</xsl:if>
</xsl:template>

<!-- para -->
<xsl:template match="para">
	<xsl:if test="@output='all' or contains($output, @output)">
		<p><xsl:apply-templates/></p>
	</xsl:if>
</xsl:template>

<!-- para headline -->
<xsl:template match="para/headline">
	<span class="headline"><xsl:apply-templates/></span>
</xsl:template>

<!-- subtitle -->
<xsl:template match="subtitle">
	<xsl:if test="@output='all' or contains($output, @output)">
		<div class="subtitle"><xsl:apply-templates/></div>
	</xsl:if>
</xsl:template>

<!-- table -->
<xsl:template match="table">
	<xsl:if test="@output='all' or contains($output, @output)">
		<table xsl:use-attribute-sets="table-default">
			<!-- default is table with border -->
			<xsl:if test="@border='no'">
				<xsl:attribute name="border">0</xsl:attribute>
			</xsl:if>
			<xsl:if test="@align">
				<xsl:attribute name="align"><xsl:value-of select="@align"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="@width">
				<xsl:attribute name="width"><xsl:value-of select="@width"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</table>
	</xsl:if>
</xsl:template>

<!-- table tr -->
<xsl:template match="table/tr">
	<tr><xsl:apply-templates/></tr>
</xsl:template>

<!-- table tr th -->
<xsl:template match="table/tr/th">
	<th>
		<xsl:if test="@align">
			<xsl:attribute name="align"><xsl:value-of select="@align"/></xsl:attribute>
		</xsl:if>
		<xsl:if test="@colspan">
			<xsl:attribute name="colspan"><xsl:value-of select="@colspan"/></xsl:attribute>
		</xsl:if>
		<xsl:apply-templates/>
	</th>
</xsl:template>

<!-- table tr td -->
<xsl:template match="table/tr/td">
	<td>
		<xsl:if test="@align">
			<xsl:attribute name="align"><xsl:value-of select="@align"/></xsl:attribute>
		</xsl:if>
		<xsl:if test="@colspan">
			<xsl:attribute name="colspan"><xsl:value-of select="@colspan"/></xsl:attribute>
		</xsl:if>
		<xsl:if test="@width">
			<xsl:attribute name="width"><xsl:value-of select="@width"/></xsl:attribute>
		</xsl:if>
		<xsl:if test="@valign">
			<xsl:attribute name="valign"><xsl:value-of select="@valign"/></xsl:attribute>
		</xsl:if>
		<xsl:apply-templates/>
	</td>
</xsl:template>

</xsl:stylesheet>
