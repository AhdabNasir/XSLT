<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<table border="1">
					<tr>
						<th>Speaker</th>
						<th>Name</th>
						<th>No. of Words</th>
					</tr>
					<xsl:for-each-group select="//u" group-by="upper-case(normalize-space(@who))">
						<xsl:sort select="count(current-group()//w)" order="descending"/>
						<tr>
							<td>
								<xsl:value-of select="current-grouping-key()"/>
							</td>
							<td>
								<xsl:value-of select="//person[@xml:id=current-grouping-key()]"/>
							</td>
							<td>
								<xsl:value-of select="count(current-group()//w)"/>
							</td>
						</tr>
					</xsl:for-each-group>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>