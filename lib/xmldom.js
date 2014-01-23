(function() {
  (function(factory) {
    if (typeof exports === "object") {
      return module.exports = factory(require("xmldom"));
    } else if (typeof define === "function" && define.amd) {
      return define(["xmldom"], factory);
    }
  })(function(XMLDOM) {
    var xmldom;
    return xmldom = {
      parse: function(xmlString) {
        var parser;
        parser = new XMLDOM.DOMParser();
        return parser.parseFromString(xmlString);
      },
      serialize: function(xmlNode) {
        var serializer;
        serializer = new XMLDOM.XMLSerializer();
        return serializer.serializeToString(xmlNode);
      }
    };
  });

}).call(this);
