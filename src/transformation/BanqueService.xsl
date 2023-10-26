<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="totalSolde">
	<xsl:value-of select="sum(BanqueService/getComptes/solde)"></xsl:value-of>
	</xsl:variable>	
	<xsl:variable name="totalSoldeFiltre">
	<xsl:value-of select="sum(BanqueService/getComptes[substring(DateCreation,1,4)>2000]/solde)"></xsl:value-of>
	</xsl:variable>	
	<xsl:template match="/">
		<!-- TODO: Auto-generated template -->
		<html>
			<head>
				<title>Banque Service</title>
			</head>
			<body>
				<h1>Liste des comptes</h1>
				<table>
					<tr>
						<th>Code</th>
						<th>Solde</th>
						<th>Date Creation</th>
					</tr>
					<xsl:for-each select="BanqueService/getComptes">
						<tr>
							<td>
								<xsl:value-of select="code"></xsl:value-of>
							</td>
							<td>
								<xsl:value-of select="solde"></xsl:value-of>
							</td>
							<td>
								<xsl:value-of select="DateCreation"></xsl:value-of>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<p>la somme est: 
				<xsl:value-of select="$totalSolde"></xsl:value-of>
				</p>
				<table>
					<tr>
						<th>Code</th>
						<th>Solde</th>
						<th>Date Creation</th>
					</tr>
					<xsl:for-each select="BanqueService/getComptes[substring(DateCreation,1,4)>2000]">
						<tr>
							<td>
								<xsl:value-of select="code"></xsl:value-of>
							</td>
							<td>
								<xsl:value-of select="solde"></xsl:value-of>
							</td>
							<td>
								<xsl:value-of select="DateCreation"></xsl:value-of>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<p>la somme filtré est: 
				<xsl:value-of select="$totalSoldeFiltré"></xsl:value-of>
				</p>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>