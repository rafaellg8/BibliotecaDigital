<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:java="http://xml.apache.org/xslt/java"
  extension-element-prefixes="java"
  exclude-result-prefixes="java">
  
  <!-- style includes global params interface_name, library_name -->
  <xsl:include href="style.xsl"/>
  <xsl:include href="service-params.xsl"/>
  <xsl:include href="querytools.xsl"/>
  <xsl:include href="berrytools.xsl"/>

  <xsl:output method="html"/>
  
  <!-- the main page layout template is here -->
  <xsl:template match="page">
    <html>
      <head>
	<title>
	  <!-- put a space in the title in case the actual value is missing - mozilla will not display a page with no title-->
	  <xsl:text> </xsl:text>
	</title>
	<xsl:call-template name="globalStyle"/>
	<xsl:call-template name="pageStyle"/>
      </head>
      <body>
    
	<xsl:attribute name="dir"><xsl:call-template name="direction"/></xsl:attribute>
	<div id="page-wrapper">
	  <xsl:call-template name="response" />
	  <xsl:call-template name="greenstoneFooter"/>
	</div>
	<xsl:call-template name="pageTitle"/>
      </body>
    </html>
  </xsl:template>

  <xsl:variable name="berrybasketswitch"><xsl:value-of select="/page/pageRequest/paramList/param[@name='berrybasket']/@value"/></xsl:variable> 

  <xsl:template name="pageTitle">
    <span class="getTextFor null document.title.gsdl"></span>
  </xsl:template>

  <!-- page specific style goes here -->
  <xsl:template name="pageStyle">     	
    <xsl:if test="$berrybasketswitch = 'on'">
      <xsl:call-template name="berryStyleSheet"/>
      <xsl:call-template name="js-library"/>
    </xsl:if>
  </xsl:template>
  

  <xsl:template match="pageResponse">
    <xsl:variable name="collName"><xsl:value-of select="/page/pageRequest/paramList/param[@name='c']/@value"/></xsl:variable> 
    <xsl:variable name="requesttype"><xsl:value-of select="/page/pageRequest/paramList/param[@name='rt']/@value"/></xsl:variable> 
    <xsl:call-template name="standardPageBanner">
      <xsl:with-param name="collName" select="$collName"/>
    </xsl:call-template>
    <xsl:call-template name="navigationBar">
      <xsl:with-param name="collName" select="$collName"/>
    </xsl:call-template> 
    <div id="content">
      <xsl:apply-templates select="service">
	<xsl:with-param name="collName" select="$collName"/>
      </xsl:apply-templates>
      
      <xsl:if test="$berrybasketswitch = 'on'">
	<xsl:call-template name="berrybasket"/>
      </xsl:if>
      <xsl:if test="contains($requesttype, 'r')">
	<xsl:call-template name="query-response">
	  <xsl:with-param name="collName" select="$collName"/>
	</xsl:call-template>
      </xsl:if>
      
    </div>
  </xsl:template>


  <!-- layout the response -->
  <xsl:template name="query-response">
    <xsl:param name="collName"/>
    <xsl:call-template name="dividerBar"><xsl:with-param name='text'>query.results</xsl:with-param></xsl:call-template>
    
    <!-- If query term information is available, display it -->
    <xsl:call-template name="termInfo"/>
    <xsl:call-template name="matchDocs"/>
    
    <xsl:if test="documentNodeList">

      <!-- next and prev links at top of results-->     
      <xsl:call-template name="resultNavigation">
	<xsl:with-param name="collName" select="$collName"/>
      </xsl:call-template>
      
      <!-- Display the matching documents -->        
      <xsl:call-template name="resultList">
	<xsl:with-param name="collName" select="$collName"/>
      </xsl:call-template>
      
      <!-- next and prev links at bottom of page -->
      <xsl:call-template name="resultNavigation">
	<xsl:with-param name="collName" select="$collName"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  

  <xsl:template match="service">
    <xsl:param name="collName"/>
    <xsl:variable name="subaction" select="../pageRequest/@subaction"/>
    <div id="queryform">
      <form name="QueryForm" method="get" action="{$library_name}">
	<input type="hidden" name="a" value="q"/>
	<input type="hidden" name="sa" value="{$subaction}"/>
	<input type="hidden" name="rt" value="rd"/>
	<input type="hidden" name="s" value="{@name}"/>
	<input type="hidden" name="c" value="{$collName}"/>
	<xsl:if test="not(paramList/param[@name='startPage'])">
	  <input type="hidden" name="startPage" value="1"/>
	</xsl:if>
	<xsl:apply-templates select="paramList"/>
	<input type="submit"><xsl:attribute name="value"><xsl:value-of select="displayItem[@name='submit']"/></xsl:attribute></input>
      </form>
    </div>
  </xsl:template>
  
</xsl:stylesheet>  






