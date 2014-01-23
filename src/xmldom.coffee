( ( factory ) ->
    if typeof exports is "object"
        module.exports = factory(
            require "xmldom"
        )
    else if typeof define is "function" and define.amd
        define( [
            "xmldom"
        ], factory )

)( ( XMLDOM ) ->
    xmldom =
        parse: ( xmlString ) ->
            parser = new XMLDOM.DOMParser()
            return parser.parseFromString( xmlString )

        serialize: ( xmlNode ) ->
            serializer = new XMLDOM.XMLSerializer()
            return serializer.serializeToString( xmlNode )
)