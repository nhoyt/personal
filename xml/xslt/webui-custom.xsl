<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template name="copyright-notice">
  <!--
  <xsl:text disable-output-escaping="yes">&amp;copy; </xsl:text><xsl:value-of select="$year"/><xsl:text> Web UI, Inc.&#160;&#160;&#160;&#160;Phone: (217) 344-6229&#160;&#160;&#160;&#160;E-mail: info at webui.com</xsl:text>
  -->
  <xsl:text disable-output-escaping="yes">Copyright &amp;copy; </xsl:text><xsl:value-of select="$year"/><xsl:text> Web UI, Inc.</xsl:text>
</xsl:template>

<!-- ================================================ -->
<xsl:template name="sidebar">
  <xsl:variable name="id" select="'sidebar'"/>

  <xsl:choose>

  <!--
  <xsl:when test="starts-with(@name, 'Home') or starts-with(@name, 'Contact')">
    <xsl:call-template name="main-menu">
      <xsl:with-param name="id" select="$id"/>
    </xsl:call-template>
  </xsl:when>

  <xsl:when test="starts-with(@name, 'Services')">
    <div id="{$id}">
      <div class="text">
        <b>To Learn More:</b>
        <ul class="nav-menu">
          <li>Consulting Services</li>
          <li><a href="method.html">Design Methodology</a></li>
          <li><a href="clients.html">Clients &amp; Case Studies</a></li>
        </ul>
      </div>
    </div>
  </xsl:when>

  <xsl:when test="starts-with(@name, 'Method')">
    <div id="{$id}">
      <div class="text">
        <b>To Learn More:</b>
        <ul class="nav-menu">
          <li><a href="services.html">Consulting Services</a></li>
          <li>Design Methodology</li>
          <li><a href="clients.html">Clients &amp; Case Studies</a></li>
        </ul>
      </div>
    </div>
  </xsl:when>
  -->

  <xsl:when test="starts-with(@name, 'Clients')">
    <div id="{$id}">
      <div class="text">
        <h2>Case Studies</h2>
        <ul class="nav-menu">
          <li><a href="fidelity.html">Fidelity Investments</a></li>
          <!--
          <li><a href="holt.html">HOLT Value Associates</a></li>
          -->
          <li><a href="allstate.html">Allstate Financial</a></li>
        </ul>
      </div>
    </div>
  </xsl:when>

  <xsl:when test="starts-with(@name, 'Case Study: Allstate')">
    <div id="{$id}">
      <div class="text">
        <h2>Case Studies</h2>
        <ul class="nav-menu">
          <li><a href="fidelity.html">Fidelity Investments</a></li>
          <!--
          <li><a href="holt.html">HOLT Value Associates</a></li>
          -->
          <li>Allstate Financial</li>
        </ul>
      </div>
    </div>
  </xsl:when>

  <xsl:when test="starts-with(@name, 'Case Study: Fidelity')">
    <div id="{$id}">
      <div class="text">
        <h2>Case Studies</h2>
        <ul class="nav-menu">
          <li>Fidelity Investments</li>
          <!--
          <li><a href="holt.html">HOLT Value Associates</a></li>
          -->
          <li><a href="allstate.html">Allstate Financial</a></li>
        </ul>
      </div>
    </div>
  </xsl:when>

  <!--
  <xsl:when test="starts-with(@name, 'Case Study: HOLT')">
    <div id="{$id}">
      <div class="text">
        <b>Case Studies</b>
        <ul class="nav-menu">
          <li><a href="allstate.html">Allstate Financial</a></li>
          <li><a href="fidelity.html">Fidelity Investments</a></li>
          <li>HOLT Value Associates</li>
        </ul>
      </div>
    </div>
  </xsl:when>
  -->

  <xsl:when test="starts-with(@name, 'About')">
    <div id="{$id}">
      <div class="text">
        <h2>Resources</h2>
        <ul class="nav-menu">
          <li><a href="javascript:newWindow('http://nhoyt.com/resume/')">R&#233;sum&#233; for Nicholas Hoyt</a></li>
          <li><a href="javascript:newWindow('http://401k.fidelity.com/401k/tools/ContributionCalculator.htm')">Contribution Calculator</a></li>
          <li><a href="javascript:newWindow('http://401k.fidelity.com/401k/tools/takehomepay/takehomepay.htm')">Take Home Pay Calculator</a></li>
        </ul>
      </div>
    </div>
  </xsl:when>

  </xsl:choose>
</xsl:template>

<xsl:template name="main-menu">
  <xsl:param name="id"/>

  <div id="{$id}">
    <div class="text">
      <b>To Learn More:</b>
      <ul class="nav-menu">
        <li><a href="services.html">Consulting Services</a></li>
        <li><a href="method.html">Design Methodology</a></li>
        <li><a href="clients.html">Clients &amp; Case Studies</a></li>
      </ul>
    </div>
  </div>
</xsl:template>

</xsl:stylesheet>
