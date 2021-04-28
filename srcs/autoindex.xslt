<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
    <html>
        <title>42 Nice Autoindex</title>
    <body><center>
        <img src="https://admissions.42nice.fr/uploads/admissions/campus/logo_website/38/42Nice-logo-v2.svg" width="250px"/>
        <table border="0">
        <tr bgcolor="#11F4ED">
            <th style="color:#FFFFFF">Name</th>
            <th style="color:#FFFFFF">Size</th>
            <th style="color:#FFFFFF">Date</th>
        </tr>
        <xsl:for-each select="list/*">
        <xsl:sort select="@mtime"/>

            <xsl:variable name="name">
                <xsl:value-of select="."/>
            </xsl:variable>
            <xsl:variable name="size">
                <xsl:if test="string-length(@size) &gt; 0">
                        <xsl:if test="number(@size) &gt; 0">
                            <xsl:choose>
                                    <xsl:when test="round(@size div 1024) &lt; 1"><xsl:value-of select="@size" /></xsl:when>
                                    <xsl:when test="round(@size div 1048576) &lt; 1"><xsl:value-of select="format-number((@size div 1024), '0.0')" />K</xsl:when>
                                    <xsl:otherwise><xsl:value-of select="format-number((@size div 1048576), '0.00')" />M</xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="date">
                <xsl:value-of select="substring(@mtime,9,2)"/>-<xsl:value-of select="substring(@mtime,6,2)"/>-<xsl:value-of select="substring(@mtime,1,4)"/><xsl:text> </xsl:text>
                <xsl:value-of select="substring(@mtime,12,2)"/>:<xsl:value-of select="substring(@mtime,15,2)"/>:<xsl:value-of select="substring(@mtime,18,2)"/>
            </xsl:variable>

        <tr>
            <td><a href="{$name}"><xsl:value-of select="."/></a></td>
            <td align="right"><xsl:value-of select="$size"/></td>
            <td><xsl:value-of select="$date"/></td>
        </tr>

        </xsl:for-each>
        </table>
        </center>
        <p style="text-align:center;">This page is create for project ft_server by bledda <a href="mailto:bledda@student.42nice.fr">&lt;bledda@student.42nice.fr></a></p>
    </body>
    </html>
    </xsl:template>
</xsl:stylesheet>