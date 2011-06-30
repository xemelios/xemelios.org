<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
        <ul class="first">
            <xsl:apply-templates />
        </ul>
    </xsl:template>
    
    <xsl:template match="/menu/menu-entry">
        <li class="empty"><a onClick="{./@href}"><xsl:copy-of select="child::node()"/></a></li>
    </xsl:template>
    
    <xsl:template match="sub-menu">
        <xsl:variable name="idMenu" select="generate-id()"/>
        <li class="sub-menu" style="padding-bottom: 0; padding-bottom: 12px;"><a href="javascript:hideShowMenu('{$idMenu}');"><xsl:value-of select="./@title"/></a><ul class="inner" id="{$idMenu}" style="display: none;"><xsl:apply-templates/></ul></li>
    </xsl:template>

    <xsl:template match="menu-entry">
        <li><a onClick="{./@href}"><xsl:copy-of select="child::node()"/></a></li>
    </xsl:template>
</xsl:stylesheet>
