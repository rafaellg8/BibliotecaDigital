<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:java="http://xml.apache.org/xslt/java"
	xmlns:util="xalan://org.greenstone.gsdl3.util.XSLTUtil"
	xmlns:gslib="http://www.greenstone.org/skinning"
	extension-element-prefixes="java util"
	exclude-result-prefixes="java util">



	<!-- use the 'main' layout -->
	<xsl:include href="layouts/main.xsl"/>

	<!-- set page title -->
	<xsl:template name="pageTitle">PLUCO - Biblioteca Digital</xsl:template>

	<!-- set page breadcrumbs -->
	<xsl:template name="breadcrumbs"></xsl:template>

	<!-- the page content -->
	<xsl:template match="/page/pageResponse">



        <h1>PLUCO</h1>


        <!--Modificamos la lista de las colecciones y solo dejamos la de pluco por defecto-->
		<div>
          <div style="float: right;position: relative; padding-left: 300px;">
            <p style="font-size: 20px">PLUCO: Biblioteca Digital de recursos asociados a la universidad.
            Colección completa de material que pueden usar cualquier alumno, de forma pública</p>
            <br/>
            <a href="library/collection/pluco/browse/CL1" style="background-color: #00A300;color: white;font-size: 250%;">GO!!</a>

            <a href="library/collection/pluco/page/about" style="background-color: #00A3FF;color: white;font-size: 250%;margin-left: 20%">Acerca</a>
          </div>
          <div style="float: left; position: static;margin-top: -70px">
          <a href="library/collection/pluco/page/about" title="pluco">
            <img alt="PLUCO" src="sites/localsite/collect/pluco/images/logo.jpg"/></a>

						<a href="http://pluco.heroku.com">FOROS Pluco</a>
           </div>

            <br class="clear" />
			<br class="clear"/>
		</div>


	        <div style="clear: both; padding-top: 4px; padding-bottom: 4px;"><hr/></div>

		<gslib:serviceClusterList/>



		<xsl:for-each select="serviceList/service[@type='query']">
			<gslib:serviceLink/><br/>
		</xsl:for-each>

		<xsl:for-each select="serviceList/service[@type='authen']">
			<gslib:authenticationLink/><br/><br/>
			<gslib:registerLink/><br/>
		</xsl:for-each>

	</xsl:template>

</xsl:stylesheet>
