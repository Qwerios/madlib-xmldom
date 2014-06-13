(function() {
  (function(factory) {
    if (typeof exports === "object") {
      return module.exports = factory(require("xmldom"));
    } else if (typeof define === "function" && define.amd) {
      return define(["xmldom"], factory);
    }
  })(function(XMLDOM) {

    /**
     *   The native javascript (nodejs) implementation of the madlib XML DOM API
     *
     *   @author     mdoeswijk
     *   @module     xmldom
     *   @version    0.1
     */
    var xmldom;
    return xmldom = {

      /**
       *   Turns the provided XML string into an XML DOM Document using the
       *   xmldom module
       *
       *   @function parse
       *   @param {String} xmlString   A valid string containing XML
       *
       *   @return {DOM}   An XML DOM Document instance
       *
       */
      parse: function(xmlString) {
        var parser;
        parser = new XMLDOM.DOMParser();
        return parser.parseFromString(xmlString);
      },

      /**
       *   Turns the provided XML DOM Node into an XML string using the
       *   xmldom module
       *
       *   @function serialize
       *   @param {DOM Node}   xmlNode   The XML Node that is to be serialized
       *
       *   @return {String} An XML string representation of the node and its children
       *
       */
      serialize: function(xmlNode) {
        var serializer;
        serializer = new XMLDOM.XMLSerializer();
        return serializer.serializeToString(xmlNode);
      }
    };
  });

}).call(this);
