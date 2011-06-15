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
 
<xsl:output method="text" omit-xml-declaration="yes" indent="no" encoding="UTF-8"  />

<xsl:strip-space elements="*" />

	<xsl:template match="*">
		<xsl:apply-templates />
	</xsl:template>

		<xsl:variable name="baseURI"><xsl:value-of select="api:api/api:baseuri"></xsl:value-of></xsl:variable>

	<xsl:template match="api:api">
\documentclass[a4paper,9pt]{extarticle}
\usepackage[utf8]{inputenc}
\usepackage{amsmath}
\usepackage{url}
\usepackage{hyperref}
\usepackage{listings}
\usepackage{microtype}
\usepackage{helvet}
\usepackage{xcolor}
%\usepackage{extsizes}

%\usepackage{graphicx}
%\usepackage{tikz}
%\usepackage{multirow}
%\usepackage{wasysym}
%\usepackage{rotating}
%\usepackage{wrapfig}


%\usepackage{tikz}
%\usetikzlibrary{snakes,arrows,shapes}
\renewcommand{\familydefault}{\sfdefault}

\lstdefinelanguage{JavaScript}{
keywords={typeof, new, true, false, catch, function, return, null, catch, switch, var,
if, in, while, do, else, case, break},
keywordstyle=\color{blue}\bfseries,
ndkeywords={class, export, boolean, throw, implements, import, this},
ndkeywordstyle=\color{darkgray}\bfseries,
identifierstyle=\color{black},
sensitive=false,
comment=[l]{//},
morecomment=[s]{/*}{*/},
commentstyle=\color{purple}\ttfamily,
stringstyle=\color{red}\ttfamily,
morestring=[b]',
morestring=[b]"
}

\lstdefinelanguage{Text}{
keywords={},
keywordstyle=\color{blue}\bfseries,
ndkeywords={class, export, boolean, throw, implements, import, this},
ndkeywordstyle=\color{darkgray}\bfseries,
identifierstyle=\color{black},
sensitive=false,
comment=[l]{//},
morecomment=[s]{/*}{*/},
commentstyle=\color{purple}\ttfamily,
stringstyle=\color{red}\ttfamily,
morestring=[b]',
morestring=[b]"
}



\newcommand{\jslisting}{ \lstset{
language=JavaScript,
emphstyle=\textbf,
stringstyle=\texttt,
aboveskip=10pt,
belowskip=10pt,
linewidth=\columnwidth,
breaklines=true,
basicstyle=\ttfamily,
frame=single,
numbers=left,
columns=flexible,
showspaces=false,
showstringspaces=false,
moredelim=[is][\textbf]{|}{|}
}}

\newcommand{\plainlisting}{ \lstset{
language=Text,
emphstyle=\textbf,
stringstyle=\texttt,
aboveskip=10pt,
belowskip=10pt,
linewidth=\columnwidth,
breaklines=true,
basicstyle=\ttfamily,
frame=single,
numbers=left,
columns=flexible,
showspaces=false,
showstringspaces=false,
%moredelim=[is][\textbf]{|}{|}
}}

\title{<xsl:apply-templates select="api:name" />}
\renewcommand{\abstractname}{Description}
\author{<xsl:apply-templates select="api:author" />}
\date{Version <xsl:apply-templates select="api:version" />}
\begin{document}

\maketitle

\begin{abstract}
		<xsl:apply-templates select="api:description" />
\end{abstract}


%\setcounter{tocdepth}{1}
\tableofcontents

\section*{Introduction}
	Supported authentication schemes:
		<xsl:apply-templates select="api:authentication" />
	Base URI:
		<xsl:value-of select="$baseURI" />


		
		<xsl:apply-templates select="api:resources" />
		
	

		\end{document}

	</xsl:template>


	<xsl:template match="api:resources">
		<xsl:for-each select="api:resource">
		<xsl:sort select="api:name"/>
		
		\section{<xsl:apply-templates select="api:name" />}
		
		<xsl:apply-templates select="api:description" />
		
		\texttt{<xsl:value-of select="$baseURI" />
			           <xsl:for-each select="./api:path/node()">
	   			       <xsl:choose>
							<xsl:when test="@description">
								<xsl:text>\fbox{</xsl:text>
									<xsl:value-of select="." />
								<xsl:text>}</xsl:text>
							</xsl:when>
							<xsl:otherwise><xsl:value-of select="." /></xsl:otherwise>
						</xsl:choose>
   			        </xsl:for-each>}

		\begin{tabular}{|l|l|}\hline
		<xsl:for-each select="api:path/node()">
							<xsl:if test="@description">
								<xsl:text>\textbf{</xsl:text>
									<xsl:value-of select="." />
								<xsl:text>} &amp; </xsl:text>
									<xsl:value-of select="@description" /> \\
									\hline
							</xsl:if>
   			        </xsl:for-each>\end{tabular}     			        
   			        
		<xsl:apply-templates select="api:operation" />
		\newpage
		</xsl:for-each>
		
	</xsl:template>


	<xsl:template match="api:operation">
	%\newpage
		\subsection{<xsl:apply-templates select="api:name" />}
		<xsl:apply-templates select="api:description" />
		\subsubsection*{URI}
					 <xsl:variable name="resoureUri">
			           <xsl:value-of select="$baseURI" />
			           <xsl:for-each select="./../api:path/node()">
	   			       <xsl:choose>
							<xsl:when test="@description">
								<xsl:text>\fbox{</xsl:text>
									<xsl:value-of select="." />
								<xsl:text>}</xsl:text>
							</xsl:when>
							<xsl:otherwise><xsl:value-of select="." /></xsl:otherwise>
						</xsl:choose>
   			        </xsl:for-each>
			        </xsl:variable>
			\texttt{
			<xsl:choose>
					<xsl:when test="api:path[@omitResourcePath = 'true']"><xsl:value-of select="$baseURI" /></xsl:when>
			       <xsl:otherwise><xsl:value-of select="$resoureUri" /></xsl:otherwise>
		        </xsl:choose>
			           <xsl:for-each select="api:path/node()">
	   			       <xsl:choose>
							<xsl:when test="@description">
								<xsl:text>\fbox{</xsl:text>
									<xsl:value-of select="." />
								<xsl:text>}</xsl:text>
							</xsl:when>
							<xsl:otherwise><xsl:value-of select="." /></xsl:otherwise>
						</xsl:choose>
   			        </xsl:for-each>}		
		\subsubsection*{Parameters}
		\begin{tabular}{|l|l|}\hline
		<xsl:for-each select="api:path/node()">
							<xsl:if test="@description">
								<xsl:text>\textbf{</xsl:text>
									<xsl:value-of select="." />
								<xsl:text>} &amp; </xsl:text>
									<xsl:value-of select="@description" /> \\
									\hline
							</xsl:if>
   			        </xsl:for-each>\end{tabular}  
		
		\subsubsection*{HTTP Method}
		\texttt{<xsl:apply-templates select="api:request/api:method" />}
		\subsubsection*{Formats}
		<xsl:apply-templates select="api:formats" />
		\subsubsection*{Authentication}
		<xsl:apply-templates select="api:request/api:authentication" />
		\subsubsection*{Request Entities}
		<xsl:apply-templates select="api:request/api:entities" />
		\subsubsection*{Responses}
		<xsl:apply-templates select="api:response/api:responses" />
		\subsubsection*{Response Entities}
		<xsl:apply-templates select="api:response/api:entities" />
				
	</xsl:template>


	<xsl:template match="api:api/api:authentication">
				\begin{itemize}
				<xsl:for-each select="api:type">
					\item <xsl:value-of select="." />
				</xsl:for-each>
				\end{itemize}
	</xsl:template>

	<xsl:template match="api:request/api:authentication">
		<xsl:choose>
			<xsl:when test="@mandatory = 'true'">
				<xsl:text>required</xsl:text>
			</xsl:when>
			<xsl:otherwise>not required</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template match="api:responses">
		\begin{description}
		<xsl:for-each select="api:answer">
			\item[<xsl:call-template name="statuscode">
				<xsl:with-param name="code"><xsl:value-of select="@code" /></xsl:with-param>
			</xsl:call-template>] <xsl:value-of select="." />
		</xsl:for-each>
		\end{description}
	</xsl:template>

	<xsl:template match="api:entities">
		<xsl:choose>
			<xsl:when test="count(api:entity) > 0">
				<xsl:apply-templates />
			</xsl:when>
			<xsl:otherwise>n/a</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="api:code">
		\<xsl:value-of select="@language" />listing
		\lstset{caption=}
		\begin{lstlisting}<xsl:apply-templates />
		\end{lstlisting}
	</xsl:template>

	<xsl:template match="api:formats">
	\begin{itemize}
		<xsl:apply-templates />
	\end{itemize}
	</xsl:template>

	<xsl:template match="api:format">
		\item \texttt{<xsl:apply-templates />}
	</xsl:template>



	<xsl:template name="statuscode">
		<xsl:param name="code" />
		<xsl:text>\texttt{</xsl:text><xsl:value-of select="$code" /><xsl:text> </xsl:text>
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
		<xsl:text>}</xsl:text>
	</xsl:template>
	
		<xsl:template match="api:b">
		\textbf{<xsl:apply-templates />}
	</xsl:template>
	
	<xsl:template match="api:it">
		\textit{<xsl:apply-templates />}
	</xsl:template>	
	
	<xsl:template match="api:tt">
		\texttt{<xsl:apply-templates />}
	</xsl:template>

</xsl:stylesheet>