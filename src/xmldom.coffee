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
    ###*
    #   The native javascript (nodejs) implementation of the madlib XML DOM API
    #
    #   @author     mdoeswijk
    #   @module     xmldom
    #   @version    0.1
    ###
    xmldom =
        ###*
        #   Turns the provided XML string into an XML DOM Document using the
        #   xmldom module
        #
        #   @function parse
        #   @param {String} xmlString   A valid string containing XML
        #
        #   @return {DOM}   An XML DOM Document instance
        #
        ###
        parse: ( xmlString ) ->
            parser = new XMLDOM.DOMParser()
            return parser.parseFromString( xmlString )

        ###*
        #   Turns the provided XML DOM Node into an XML string using the
        #   xmldom module
        #
        #   @function serialize
        #   @param {DOM Node}   xmlNode   The XML Node that is to be serialized
        #
        #   @return {String} An XML string representation of the node and its children
        #
        ###
        serialize: ( xmlNode ) ->
            serializer = new XMLDOM.XMLSerializer()
            return serializer.serializeToString( xmlNode )
)