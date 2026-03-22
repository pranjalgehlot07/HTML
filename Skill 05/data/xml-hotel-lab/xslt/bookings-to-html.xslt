<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <!-- Convert services list -->
    <xsl:template name="service-list">
        <xsl:for-each select="service">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">, </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="/bookings">
        <html>
        <head>
            <title>Hotel Bookings</title>
            <style>
                table { border-collapse: collapse; width: 100%; }
                th, td { border: 1px solid black; padding: 8px; }
                th { background-color: #eaeaea; }
            </style>
        </head>
        <body>
            <h2>Hotel Bookings</h2>

            <table>
                <tr>
                    <th>ID</th>
                    <th>Guest</th>
                    <th>Room</th>
                    <th>Check-in</th>
                    <th>Check-out</th>
                    <th>Nights</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th>Services</th>
                </tr>

                <xsl:for-each select="booking">
                    <tr>
                        <td><xsl:value-of select="@id"/></td>
                        <td><xsl:value-of select="guest"/></td>
                        <td><xsl:value-of select="room"/></td>
                        <td><xsl:value-of select="checkin"/></td>
                        <td><xsl:value-of select="checkout"/></td>

                        <!-- Nights (fallback because XSLT 1.0 can't compute dates) -->
                        <td>--</td>

                        <td>
                            <xsl:value-of select="format-number(total, '0.00')"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="total/@currency"/>
                        </td>

                        <td><xsl:value-of select="status"/></td>

                        <td><xsl:call-template name="service-list"/></td>
                    </tr>
                </xsl:for-each>

            </table>
        </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
