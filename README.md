# madlib-xmldom
[![Build Status](https://travis-ci.org/Qwerios/madlib-xmldom.svg?branch=master)](https://travis-ci.org/Qwerios/madlib-xmldom) [![NPM version](https://badge.fury.io/js/madlib-xmldom.png)](http://badge.fury.io/js/madlib-xmldom) [![Built with Grunt](https://cdn.gruntjs.com/builtwith.png)](http://gruntjs.com/)

[![Npm Downloads](https://nodei.co/npm/madlib-xmldom.png?downloads=true&stars=true)](https://nodei.co/npm/madlib-xmldom.png?downloads=true&stars=true)

Provide uniform access to create and/or serialize an XML document


## acknowledgments
The Marviq Application Development library (aka madlib) was developed by me when I was working at Marviq. They were cool enough to let me publish it using my personal github account instead of the company account. We decided to open source it for our mutual benefit and to ensure future updates should I decide to leave the company.

This module relies on jindw's [xmldom](https://github.com/jindw/xmldom) module for the nodejs implementation of the W3 XML DOM Specification


## philosophy
JavaScript is the language of the web. Wouldn't it be nice if we could stop having to rewrite (most) of our code for all those web connected platforms running on JavaScript? That is what madLib hopes to achieve. The focus of madLib is to have the same old boring stuff ready made for multiple platforms. Write your core application logic once using modules and never worry about the basics stuff again. Basics including XHR, XML, JSON, host mappings, settings, storage, etcetera. The idea is to use the tried and proven frameworks where available and use madlib based modules as the missing link.

Currently madLib is focused on supporting the following platforms:

* Web browsers (IE6+, Chrome, Firefox, Opera)
* Appcelerator/Titanium
* PhoneGap
* NodeJS


## installation
```bash
$ npm install madlib-xmldom --save
```


## usage
The xmldom module exposes two main methods: parse and serialize.
Switching between the nodejs and browser version of the module is achieved using the package.json browser field. Tools such as [browserify](http://browserify.org/) will pick up on this field and bundle the correct version for your target environment.

#### parse
```javascript
var xmldom = require "madlib-xmldom"
var xmlDoc = xmldom.parse( "<example><foo/></example>" )
```

#### serialize
```javascript
var xmldom    = require "madlib-xmldom"
var xmlDoc    = xmldom.parse( "<example><foo/></example>" )
var xmlString = xmldom.serialize( xmlDoc.documentElement )
```