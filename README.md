rest-doc-template
=================

> A template for creating human readable RESTful API documentations.

Introduction
------------
This tool facilitates the creation of high-quality and comprehensive documentations of RESTful APIs for humans. Therefore it provides a simple XML schema for describing the API, its resources and operations. 
The documentation can be rendered into various formats, like plain text, XHTML and PDF (using LaTeX). 


Usage
-----------
This tool provides an Ant build file for executing transformations. The following targets are available so far:

- plain
- xhtml
- pdf
- all

The following command generates a PDF version from the XML file expected in the directory foo named bla.xml

> ant pdf -Dapidir=foo -Dapiname=bla

If successful, the PDF file can be found in output/foo/bla.pdf

You can also set the $api variable in the build-file and omit the parameter.


Available Stylesheets
------------
- XHTML (work in progress)
- text/plain (in progress)
- LaTeX (in progress)


Examples
-----------
Please have a look at `example/example.xml` and the corresponding output files at `output/example/`. 

FAQ
---

> Why XML?

Because it's nice for these purposes. The schema definition allows guided documentation through auto-completion and XSL is a good start for transformations into other formats. 


> Why not WADL?

Although both formats have some descriptions in common, WADL tends to be a machine-readable description that helps generating code.
My template instead facilitates the creation of APIs for human readers and will thus not be an appropriate source for any kind of stub generation.


> But a truly RESTful API does not need a documentation except mentioning the initial end-point URI! So why?

Even if your API is so RESTful that you are confident of needing no external documentation, it is still nice to have one for yourself, right?
Furthermore, most client-side developers will still be happy to grab a copy anyway.


License
-------

	Copyright (c) 2010 Benjamin Erb

	Permission is hereby granted, free of charge, to any person obtaining
	a copy of this software and associated documentation files (the
	"Software"), to deal in the Software without restriction, including
	without limitation the rights to use, copy, modify, merge, publish,
	distribute, sublicense, and/or sell copies of the Software, and to
	permit persons to whom the Software is furnished to do so, subject to
	the following conditions:

	The above copyright notice and this permission notice shall be
	included in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
	EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
	NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
	LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
	OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
	WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
