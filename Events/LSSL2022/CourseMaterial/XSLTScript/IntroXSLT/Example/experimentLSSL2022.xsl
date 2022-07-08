<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="html"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:apply-templates select="descendant::titleStmt/title"/></title>
            </head>
            <body>
                <xsl:apply-templates select="descendant::gramGrp/pos"/>
                <br/>
                <!--<xsl:value-of select="distinct-values(descendant::gramGrp/pos)" separator=" - "/>
                -->
                <!--<h1>Verbs</h1>
                <xsl:apply-templates select="descendant::entry[gramGrp/pos ='v' or gramGrp/pos ='v.']"/>
                <h1>Nouns</h1>
                <xsl:apply-templates select="descendant::entry[gramGrp/pos ='n']"/>
                ...-->
                <!--<xsl:apply-templates select="descendant::entry"/>-->
                <h1>Table of content</h1>
                
                <xsl:for-each select="descendant::entry">
                    <xsl:sort></xsl:sort>
                    <a href="#{@xml:id}"><xsl:value-of select="form/orth"/></a>
                    <br/>
                </xsl:for-each>
                
                <h1>My dictionary</h1>
                <xsl:apply-templates select="descendant::entry"/>
                    
                
            </body>
        </html>
    </xsl:template>

    <xsl:template match="teiHeader"/>

    <xsl:template match="entry">
        <p id="{@xml:id}">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
   <!-- <xsl:template match="form">
        <xsl:apply-templates select="pron"/>
        <xsl:text>, </xsl:text>
        <xsl:apply-templates select="orth"/>
    </xsl:template>
-->
    <xsl:template match="orth">
        <b>
            <xsl:apply-templates/>
        </b>
    </xsl:template>
    
    <xsl:template match="sense">
        <p><xsl:value-of select="@n"/> <xsl:apply-templates/></p>
    </xsl:template>

</xsl:stylesheet>
