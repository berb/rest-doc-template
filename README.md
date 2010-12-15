rest-doc-template
=================

> A template for creating human readable RESTful API documentations.

Introduction
------------
This tool tries to facilitate the creation of high-class and comprehensive documentations for RESTful APIs. Therefore it provides a simple XML schema for describing the API, its resources and operations. Different 


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


Stylesheets
-----------
- XHTML (wip)
- text/plain (wip)
- LaTeX (planned)


FAQ
---

> Why XML?

Because it's nice for this purposes. The schema definition allows guided documentation through auto-completition and XSL is a good start for transformations into other formats. 


> Why not WADL?

Might also be an option for you. My effort is confined to stuff I normally document when designing RESTful APIs focussing on human readers instead. My documentation format will most probably not be an appropriate source for any kind of stub generation.


> But a truly RESTful API does not need a documentation except mentioning the initial endpoint URI! So why?

Even if your API is so RESTfully, that you are confident of needing no external documentation, it is still nice to have one for yourself, right?
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
