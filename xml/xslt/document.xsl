<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- imports -->
<xsl:import href="../common/inline-block.dtd"/

<!--
		add templates for other document elements
-->


<!-- footer -->
<xsl:template match="footer">
	<xsl:if test="@output='all' or contains(@output,$output)">
		<xsl:apply-templates/>
		<xsl:if test="@copyright='yes'">
		<p/><xsl:call-template name="copyright-notice"/>
		</xsl:if>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>
