(function() {
  (function(factory) {
    if (typeof exports === "object") {
      return module.exports = factory();
    } else if (typeof define === "function" && define.amd) {
      return define([], factory);
    }
  })(function() {
    var xmldom;
    return xmldom = {
      parse: function(xmlString) {
        var dom, parser;
        if ((typeof Ti !== "undefined" && Ti !== null) && Ti.XML) {
          return Ti.XML.parseString(xmlString);
        } else if (window.ActiveXObject && window.GetObject) {
          dom = new ActiveXObject("Microsoft.XMLDOM");
          dom.loadXML(xmlString);
          return dom;
        } else if (window.DOMParser != null) {
          parser = new window.DOMParser();
          return parser.parseFromString(xmlString, "text/xml");
        } else {
          throw new Error("No XML parser available");
        }
      },
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
