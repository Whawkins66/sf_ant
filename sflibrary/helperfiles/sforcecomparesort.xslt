<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">

		<zipdiff>

    		<xsl:attribute name="filename1">
				<xsl:value-of select="zipdiff/@filename1" />
			</xsl:attribute>
			<xsl:attribute name="filename2">
				<xsl:value-of select="zipdiff/@filename2" />
			</xsl:attribute>	

			<differences> 

				<xsl:for-each select="//added">
					<xsl:sort select="text()"/>
					<added>
						<xsl:value-of select="text()"/>
					</added>
				</xsl:for-each>

				<xsl:for-each select="//changed">
					<xsl:sort select="text()"/>
					<changed>
						<xsl:value-of select="text()"/>
					</changed>
				</xsl:for-each>	

				<xsl:for-each select="//removed">
					<xsl:sort select="text()"/>
					<missing>
						<xsl:value-of select="text()"/>
					</missing>
				</xsl:for-each>	  

			</differences>

		</zipdiff>  

	</xsl:template>
</xsl:stylesheet>