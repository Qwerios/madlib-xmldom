( ( factory ) ->
    if typeof exports is "object"
        module.exports = factory(
        )
    else if typeof define is "function" and define.amd
        define( [
        ], factory )

)( () ->
    ###*
    #   The browser implementation of the madlib XML DOM API
    #
    #   @author     mdoeswijk
    #   @module     xmldom
    #   @version    0.1
    ###
    xmldom =
        ###*
        #   Turns the provided XML string into an XML DOM Document using whatever
        #   native means of doing so is available
        #
        #   @function parse
        #   @param {String} xmlString A valid string containing XML
        #
        #   @return {DOM}   An XML DOM Document instance
        #
        ###
        parse: ( xmlString ) ->
            if Ti? and Ti.XML
                # Titanium. Keep in mind that in a titanium webView the Ti global
                # object also exists but with access restricted to Ti.App.
                # Thats why only checking for Ti isn't enough
                #
                return Ti.XML.parseString( xmlString )

            else if window.ActiveXObject and window.GetObject
                dom = new ActiveXObject( "Microsoft.XMLDOM" )
                dom.loadXML( xmlString )
                return dom

            else if window.DOMParser?
                parser = new window.DOMParser()
                return parser.parseFromString( xmlString, "text/xml" )

            else
                throw new Error( "No XML parser available" )

        ###*
        #   Turns the provided XML DOM Node into an XML string using whatever
        #   native means of doing so is available
        #
        #   @function serialize
        #   @param {DOM Node} The XML Node that is to be serialized
        #
        #   @return {String} An XML string representation of the node and its children
        #
        ###
        serialize: ( xmlNode ) ->
            if Ti? and Ti.XML
                # Titanium. Keep in mind that in a titanium webView the Ti global
                # object also exists but with access restricted to Ti.App
                #
                return Ti.XML.serializeToString( xmlNode )

            else
                # Web browsers
                #
                try
                    # Gecko-based browsers, Safari, Opera.
                    #
                    return ( new XMLSerializer() ).serializeToString( xmlNode )

                catch noXMLSerializer

                    try
                        # Internet Explorer
                        #
                        return xmlNode.xml

                    catch noNativeXml
                        # What browser is this?
                        #
                        throw new Error( "No XML serialization support" )
)