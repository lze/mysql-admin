<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template match="/">
	<div id="menuContent" class="menuContainer" style="display:none;" align="right">
		<div class="closeButton" id="closeMenu">X</div>
		<div align="center" style="padding-top:2%;">
		<table class="verticalMenuLayout">
		 <tr>
		    <td class="menuCaption">
		    <b><a class="menupoint" onclick="showTab('tab0')">Login</a></b>
		    </td>
		  </tr>
		  <tr id="tab0" class="cnt">
		  <td ><div id="login"></div></td>
		  </tr>
		  <tr>
		    <td class="menuCaption">
		    <b><a class="menupoint" onclick="showTab('tab2')">MySQL</a></b>
		    </td>
		  </tr>
		  <tr id="tab2" class="cnt closed">
		    <td id="menuBar" class="menuContent" style="display:none;">
		    </td>
		  </tr>
		  <tr>
		    <td class="menuCaption">
		    <b><a class="menupoint" onclick="showTab('tab1')">Navigation</a></b>
		    </td>
		  </tr>
		  <tr id="tab1" class="cnt closed">
		      <td class="menuContent" style="display:none;">
			<xsl:for-each select="actions/action">
			<xsl:if test="@output = 'requestURI'">
			<a title="{title}" class="menupoint" onclick="requestURI('{xml}','{id}','{title}');"><xsl:value-of select="text"/></a>&#160;<br/>
			</xsl:if>
			<xsl:if test="@output = 'loadPage'">
			<a title="{title}" class="menupoint" onclick="loadPage('{xml}','{xsl}','{out}','{id}','{title}');"><xsl:value-of select="text"/></a>&#160;<br/>
			</xsl:if>
			<xsl:if test="@output = 'void'">
			<b><a><xsl:value-of select="text"/></a></b><br/>
			</xsl:if>
			<xsl:if test="@output = 'javascript'">
			<a title="{title}" class="menupoint" onclick="{javascript}"><xsl:value-of select="text"/></a>&#160;<br/>
			</xsl:if>
			</xsl:for-each>
		      </td>
		  </tr>
		</table>
		</div>
	</div>
	</xsl:template>
</xsl:stylesheet>
