<?xml version="1.0" encoding="UTF-8"?>
<!-- Author: Benjamin Erb -->
<!DOCTYPE stylesheet [
<!ENTITY space "<xsl:text> </xsl:text>">
<!ENTITY tab "<xsl:text>	</xsl:text>">
<!ENTITY cr "<xsl:text>
</xsl:text>">
]>



<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:api="http://www.ioexception.de/rest-api-doc">

<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>

	<xsl:variable name="baseURI"><xsl:value-of select="api:api/api:baseuri"></xsl:value-of></xsl:variable>

	<xsl:template match="*">
	</xsl:template>

	<xsl:template match="api:api">
        <xsl:call-template name="heading">
                <xsl:with-param name="string">API DOCUMENTATION:&space;<xsl:value-of select="api:name"></xsl:value-of></xsl:with-param> 
                <xsl:with-param name="char" select="'='" />
        </xsl:call-template>&cr;
        		
		<xsl:text>Author:</xsl:text>&tab;&tab;<xsl:apply-templates select="api:author" />&cr;
		<xsl:text>Version:</xsl:text>&tab;<xsl:apply-templates select="api:version" />&cr;
		<xsl:text>Base URI:</xsl:text>&tab;<xsl:apply-templates select="api:baseuri" />&cr;
		<xsl:text>Auth:</xsl:text>&tab;&tab;<xsl:apply-templates select="api:authentication" />&cr;&cr;&cr;

        <xsl:call-template name="heading">
                <xsl:with-param name="string">Description</xsl:with-param> 
                <xsl:with-param name="char" select="'#'" />
        </xsl:call-template>&cr;
        	
        <xsl:apply-templates select="api:description" />&cr;&cr;&cr;
	
        <xsl:call-template name="heading">
                <xsl:with-param name="string">Overview</xsl:with-param> 
                <xsl:with-param name="char" select="'#'" />
        </xsl:call-template>&cr;
        	
		
		<xsl:for-each select="//api:resource">
			<xsl:sort select="api:name"/>
			<xsl:variable name="resourcenr"><xsl:value-of select="position()"/></xsl:variable>
			<xsl:value-of select="position()"/>&space;<xsl:value-of select="api:name"></xsl:value-of>&cr;
				<xsl:for-each select="api:operation">
				<xsl:sort select="api:name"/>
				<xsl:text>&tab;</xsl:text><xsl:value-of select="$resourcenr"/>.<xsl:value-of select="position()"/>&space;<xsl:value-of select="api:name" /> &cr;
			</xsl:for-each>&cr;		
		</xsl:for-each>		
		
				
		<xsl:for-each select="//api:resource">
			<xsl:sort select="api:name"/>
			<xsl:variable name="resourcenr"><xsl:value-of select="position()"/></xsl:variable>
			  &cr;&cr;<xsl:call-template name="heading">
			                <xsl:with-param name="string"><xsl:value-of select="position()"/>.&space;<xsl:value-of select="api:name"></xsl:value-of></xsl:with-param> 
			                <xsl:with-param name="char" select="'#'" />
			        </xsl:call-template>
			        
			        <xsl:variable name="resoureUri">
			           <xsl:value-of select="$baseURI" />
			           <xsl:for-each select="api:path/node()">
	   			       <xsl:choose>
							<xsl:when test="@description">
								<xsl:text>{</xsl:text>
									<xsl:value-of select="." />
								<xsl:text>}</xsl:text>
							</xsl:when>
							
							<xsl:otherwise><xsl:value-of select="." /></xsl:otherwise>
						</xsl:choose>
   			        </xsl:for-each>
			        </xsl:variable>
			        
  			        <xsl:text>URI:&tab;&tab;&tab;</xsl:text><xsl:value-of select="$baseURI" />
   			        <xsl:for-each select="api:path/node()">
	   			       <xsl:choose>
							<xsl:when test="@description">
								<xsl:text>{</xsl:text>
									<xsl:value-of select="." />
								<xsl:text>}</xsl:text>
							</xsl:when>
							
							<xsl:otherwise><xsl:value-of select="." /></xsl:otherwise>
						</xsl:choose>
   			        </xsl:for-each>&cr;
   			        <xsl:text>URI Params:&cr;</xsl:text>
  			        <xsl:for-each select="api:path/node()">
							<xsl:if test="@description">
								&tab;&tab;&tab;<xsl:text>{</xsl:text>
									<xsl:value-of select="." />
								<xsl:text>}: </xsl:text>
									<xsl:value-of select="@description" />&cr;
							</xsl:if>
   			        </xsl:for-each>&cr;  			        
			        <xsl:apply-templates select="api:description" />&cr;&cr;
			
				<xsl:for-each select="api:operation">
				<xsl:sort select="api:name"/>
				       &cr;<xsl:call-template name="heading">
			                <xsl:with-param name="string"><xsl:text></xsl:text><xsl:value-of select="$resourcenr"/>.<xsl:value-of select="position()"/>&space;<xsl:value-of select="api:name" /></xsl:with-param> 
			                <xsl:with-param name="char" select="'='" />
			        </xsl:call-template>
 			        <xsl:apply-templates select="api:description" />&cr;&cr;

   			        <xsl:text>URI:&tab;&tab;&tab;</xsl:text>
					<xsl:choose>
						<xsl:when test="api:path[@omitResourcePath = 'true']"><xsl:value-of select="$baseURI" /></xsl:when>
				       <xsl:otherwise><xsl:value-of select="$resoureUri" /></xsl:otherwise>
			        </xsl:choose>   			        
   			        <xsl:for-each select="api:path/node()">
	   			       <xsl:choose>
							<xsl:when test="@description">
								<xsl:text>{</xsl:text>
									<xsl:value-of select="." />
								<xsl:text>}</xsl:text>
							</xsl:when>
							
							<xsl:otherwise><xsl:value-of select="." /></xsl:otherwise>
						</xsl:choose>
   			        </xsl:for-each>&cr;
   			        <xsl:text>URI Params:&cr;</xsl:text>
  			        <xsl:for-each select="api:path/node()">
							<xsl:if test="@description">
								&tab;&tab;&tab;<xsl:text>{</xsl:text>
									<xsl:value-of select="." />
								<xsl:text>}: </xsl:text>
									<xsl:value-of select="@description" />&cr;
							</xsl:if>
   			        </xsl:for-each>&cr;   			        
 			        
   			        <xsl:text>Formats:&tab;&tab;</xsl:text>
   			        <xsl:for-each select="api:formats/api:format">
   			        	<xsl:apply-templates select="." /><xsl:text> </xsl:text>   			        	
   			        </xsl:for-each>&cr;&cr;
 			        
 			        <xsl:apply-templates select="api:request" />&cr;
 			        <xsl:apply-templates select="api:response" />&cr;

			        
			</xsl:for-each>&cr;		
		</xsl:for-each>		
	
	</xsl:template>


	<xsl:template match="api:name">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="api:author">
		<xsl:apply-templates />
	</xsl:template>
	<xsl:template match="api:version">
		<xsl:apply-templates />
	</xsl:template>	
	
	<xsl:template match="api:baseuri">
		<xsl:apply-templates />
	</xsl:template>	
	
	<xsl:template match="api:description">
		<xsl:apply-templates />
	</xsl:template>	
	
		<xsl:template match="api:request">
	       <xsl:call-template name="heading">
                <xsl:with-param name="string">REQUEST</xsl:with-param> 
                <xsl:with-param name="char" select="'-'" />
        </xsl:call-template>&cr;
		<xsl:text>Method:&tab;&tab;&tab;</xsl:text><xsl:apply-templates select="api:method" />&cr;
		<xsl:text>Auth:&tab;&tab;&tab;</xsl:text>
		<xsl:choose>
			<xsl:when test="api:authentication[@mandatory = 'true']">
				<xsl:text>required</xsl:text>
			</xsl:when>
			<xsl:otherwise>not required</xsl:otherwise>
		</xsl:choose>&cr;
		<xsl:if test="count(api:entities/api:entity) > 0">
		&cr;<xsl:text>Entities:</xsl:text>&cr;
			<xsl:for-each select="api:entities/api:entity">
				<xsl:text>Format: </xsl:text><xsl:value-of select="api:code/@language" />&cr;
				<xsl:text>+----------------------------------------------------------------+</xsl:text>
				<xsl:value-of select="api:code" />&cr;
				<xsl:text>+----------------------------------------------------------------+</xsl:text>&cr;&cr;
			</xsl:for-each>
		</xsl:if>
		
	</xsl:template>

	<xsl:template match="api:response">
	       <xsl:call-template name="heading">
                <xsl:with-param name="string">RESPONSE</xsl:with-param> 
                <xsl:with-param name="char" select="'-'" />
        </xsl:call-template>&cr;
		<xsl:text>Answers:&cr;</xsl:text>
		<xsl:for-each select="api:responses/api:answer">
			&tab;&tab;&tab;
			<xsl:call-template name="statuscode">
				<xsl:with-param name="code"><xsl:value-of select="@code" /></xsl:with-param>
			</xsl:call-template>			
			<xsl:value-of select="." />
		</xsl:for-each>&cr;

		<xsl:if test="count(api:entities/api:entity) > 0">
		<xsl:text>Entities:&cr;</xsl:text>
			<xsl:for-each select="api:entities/api:entity">
				<xsl:apply-templates select="api:code" />&cr;
			</xsl:for-each>
		</xsl:if>
		
		
	</xsl:template>
	
	<xsl:template match="api:method">
		<xsl:apply-templates />		
	</xsl:template>

	<xsl:template match="api:authentication">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="api:mandatory">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="api:type">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="api:responses">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="api:answer">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="api:entity">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="api:code">
		<xsl:text>Language: <xsl:value-of select="@language" /></xsl:text>&cr;
		<xsl:text>+----------------------------------------------------------------+</xsl:text>		
		<xsl:apply-templates />&cr;
		<xsl:text>+----------------------------------------------------------------+</xsl:text>&cr;
	</xsl:template>

	<xsl:template match="api:formats">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="api:format">
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="api:path">
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="api:param">
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="api:b">
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="api:it">
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="api:tt">
		<xsl:apply-templates />
	</xsl:template>



	<xsl:template name="heading">
		<xsl:param name="string" />
		<xsl:param name="char" />
		<xsl:param name="textprinted" select="false()" />
	
		<xsl:if test="$textprinted = false()">
			<xsl:text><xsl:value-of select="$string" />&cr;</xsl:text>
		</xsl:if>
	
		<xsl:choose>
			<xsl:when test="string-length($string) &gt; 0">
				<xsl:text><xsl:value-of select="$char" /></xsl:text>
				<xsl:call-template name="heading">
					<xsl:with-param name="string" select="substring($string, 2)" />
					<xsl:with-param name="char" select="$char" />
					<xsl:with-param name="textprinted" select="true()" />
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="string-length($string) =  0">&cr;
			</xsl:when>
		</xsl:choose>
	</xsl:template>
		
	<xsl:template name="statuscode">
		<xsl:param name="code" />
		
		<xsl:value-of select="$code" /><xsl:text> ("</xsl:text>
		<xsl:choose>
			<xsl:when test="$code = '100'">Continue</xsl:when>
			<xsl:when test="$code = '101'">Switching Protocols</xsl:when>
			<xsl:when test="$code = '200'">OK</xsl:when>
			<xsl:when test="$code = '201'">Created</xsl:when>
			<xsl:when test="$code = '202'">Accepted</xsl:when>
			<xsl:when test="$code = '203'">Non-Authoritative Information</xsl:when>
			<xsl:when test="$code = '204'">No Content</xsl:when>
			<xsl:when test="$code = '205'">Reset Content</xsl:when>
			<xsl:when test="$code = '206'">Partial Content</xsl:when>
			<xsl:when test="$code = '300'">Multiple Choices</xsl:when>
			<xsl:when test="$code = '301'">Moved Permanently</xsl:when>
			<xsl:when test="$code = '302'">Found</xsl:when>
			<xsl:when test="$code = '303'">See Other</xsl:when>
			<xsl:when test="$code = '304'">Not Modified</xsl:when>
			<xsl:when test="$code = '305'">Use Proxy</xsl:when>
			<xsl:when test="$code = '306'">Switch Proxy</xsl:when>
			<xsl:when test="$code = '307'">Temporary Redirect </xsl:when>
			<xsl:when test="$code = '400'">Bad Request</xsl:when>
			<xsl:when test="$code = '401'">Unauthorized</xsl:when>
			<xsl:when test="$code = '402'">Payment Required</xsl:when>
			<xsl:when test="$code = '403'">Forbidden</xsl:when>
			<xsl:when test="$code = '404'">Not Found</xsl:when>
			<xsl:when test="$code = '405'">Method Not Allowed</xsl:when>
			<xsl:when test="$code = '406'">Not Acceptable</xsl:when>
			<xsl:when test="$code = '407'">Proxy Authentication Required</xsl:when>
			<xsl:when test="$code = '408'">Request Timeout</xsl:when>
			<xsl:when test="$code = '409'">Conflict</xsl:when>
			<xsl:when test="$code = '410'">Gone</xsl:when>
			<xsl:when test="$code = '411'">Length Required</xsl:when>
			<xsl:when test="$code = '412'">Precondition Failed</xsl:when>
			<xsl:when test="$code = '413'">Request Entity Too Large</xsl:when>
			<xsl:when test="$code = '414'">Request-URI Too Long</xsl:when>
			<xsl:when test="$code = '415'">Unsupported Media Type</xsl:when>
			<xsl:when test="$code = '416'">Requested Range Not Satisfiable</xsl:when>
			<xsl:when test="$code = '417'">Expectation Failed</xsl:when>
			<xsl:when test="$code = '500'">Internal Server Error</xsl:when>
			<xsl:when test="$code = '501'">Not Implemented</xsl:when>
			<xsl:when test="$code = '502'">Bad Gateway</xsl:when>
			<xsl:when test="$code = '503'">Service Unavailable</xsl:when>
			<xsl:when test="$code = '504'">Gateway Timeout</xsl:when>
			<xsl:when test="$code = '505'">HTTP Version Not Supported</xsl:when>
			<xsl:otherwise>custom</xsl:otherwise>
		</xsl:choose>


		<xsl:text>"):  </xsl:text>
	
	</xsl:template>
	
	
		<xsl:template match="api:api/api:authentication">
				<xsl:value-of select="api:type" />
				<xsl:for-each select="api:type[position() > 1]">
					<xsl:text>, </xsl:text><xsl:value-of select="." />
				</xsl:for-each>
	</xsl:template>
	
</xsl:stylesheet>