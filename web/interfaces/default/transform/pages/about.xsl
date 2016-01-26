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
	<xsl:template name="pageTitle">
	<gslib:collectionName/></xsl:template>

	<!-- set page breadcrumbs -->
	<xsl:template name="breadcrumbs"><gslib:siteLink/><gslib:rightArrow/></xsl:template>

	<!-- the page content -->
	<xsl:template match="/page">
  
		<!--Display the description text of the current collection,
		and if some services are available then create a list
		of links for each service within a <ul id="servicelist"> element.-->
		<div>
         <h1><a id="user-content-plataforma-universitaria-de-comparticiÓn-de-conocimientos-pluco" class="anchor" href="#plataforma-universitaria-de-comparticiÓn-de-conocimientos-pluco" aria-hidden="true"><span class="octicon octicon-link"></span></a>Tutorial: PLUCO</h1>

         <h3><a id="user-content-introducción" class="anchor" href="#introducción" aria-hidden="true"><span class="octicon octicon-link"></span></a>Introducción</h3>

         <p>Plataforma académica de compartición de archivos de la Universidad de Granada, y que permita la colaboración en grupo entre los usuarios del sistema. Añade servicios de mensajería y foros,potenciando la interacción de los usuarios, y agrupando a los mismos por varios grupos de o bien asignaturas o cursos.</p>

        <h3>Biblioteca Digital Pluco</h3>

        <p>Pluco en sí, es una biblioteca digital, creado a través del software <a href="http://www.greenstone.com">Greenstone</a>.
        Está creada mediante los conocimientos adquiridos en la asignatura de Gestión de Recursos Digitales.</p>

        
        <h3>Objetivos</h3>
        <p>Lo que intentamos crear con esta biblioteca es un medio accesible, en el tanto usuarios como profesores puedan compartir información
        asociada a asignaturas universitarias y material docente, y concentrarlo todo en una misma web, facilitando acceso a recursos, búsquedas y ahorrando tiempo</p>

        <hr/>
        
        <h2>AYUDA</h2>
        <div>
        <ul>
            <li>
                Para mostrar algún archivo por algún filtro, pulse cualquier pestaña de arriba, como <strong>Título</strong>.
            </li>
            <li>Si desea realizar alguna búsqueda a fondo, seleccione arriba a la derecha la opción buscar</li>
            
            <li>Si desea contribuir con la biblioteca PLUCO, regístrese o inicie sesión</li>
         </ul>
         </div>
        
            <div>
                <h1>Autores</h1>
                    <p>Rafael Lachica Garrido</p>
                    <p>Miguel Ferández Fernández</p>

            </div>


            <h2><a href="https://github.com/rafaellg8/IV-PLUCO-RLG">Acerca de</a></h2>
        </div>
	</xsl:template>


</xsl:stylesheet>  

