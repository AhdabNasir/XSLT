<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<table border="1">
					<tr>
						<th>Word</th>
						<th>No. of Occurrences</th>
					</tr>
					<xsl:for-each-group select="//w/self::w/lower-case(normalize-space())" group-by=".">
						<xsl:sort select="count(current-group())" order="descending"/>
						<tr>
							<td>
								<xsl:value-of select="."/>
							</td>
							<td>
								<xsl:value-of select="count(current-group())"/>
							</td>
						</tr>
					</xsl:for-each-group>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>