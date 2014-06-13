(function() {
  (function(factory) {
    if (typeof exports === "object") {
      return module.exports = factory();
    } else if (typeof define === "function" && define.amd) {
      return define([], factory);
    }
  })(function() {

    /**
     *   The browser implementation of the madlib XML DOM API
     *
     *   @author     mdoeswijk
     *   @module     xmldom
     *   @version    0.1
     */
    var xmldom;
    return xmldom = {

      /**
       *   Turns the provided XML string into an XML DOM Document using whatever
       *   native means of doing so is available
       *
       *   @function parse
       *   @param {String} xmlString A valid string containing XML
       *
       *   @return {DOM}   An XML DOM Document instance
       *
       */
      parse: function(xmlString) {
        var error, parser, xmlDoc;
        if ((typeof Ti !== "undefined" && Ti !== null) && Ti.XML) {
          try {
            xmlDoc = Ti.XML.parseString(xmlString);
          } catch (_error) {
            error = _error;
            xmlDoc = null;
          }
          return xmlDoc;
        } else if (window.DOMParser != null) {
          try {
            parser = new window.DOMParser();
            xmlDoc = parser.parseFromString(xmlString, "text/xml");
          } catch (_error) {
            error = _error;
            xmlDoc = null;
          }
          return xmlDoc;
        } else if (window.ActiveXObject && window.GetObject) {
          xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
          xmlDoc.async = "false";
          try {
            xmlDoc.loadXML(xmlString);
          } catch (_error) {
            error = _error;
            xmlDoc = null;
          }
          return xmlDoc;
        } else {
          throw new Error("No XML parser available");
        }
      },

      /**
       *   Turns the provided XML DOM Node into an XML string using whatever
       *   native means of doing so is available
       *
       *   @function serialize
       *   @param {DOM Node} The XML Node that is to be serialized
       *
       *   @return {String} An XML string representation of the node and its children
       *
       */
      serialize: function(xmlNode) {
        var noNativeXml, noXMLSerializer;
        if ((typeof Ti !== "undefined" && Ti !== null) && Ti.XML) {
          return Ti.XML.serializeToString(xmlNode);
        } else {
          try {
            return (new XMLSerializer()).serializeToString(xmlNode);
          } catch (_error) {
            noXMLSerializer = _error;
            try {
              return xmlNode.xml;
            } catch (_error) {
              noNativeXml = _error;
              throw new Error("No XML serialization support");
            }
          }
        }
      }
    };
  });

}).call(this);
