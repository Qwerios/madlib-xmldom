( ( factory ) ->
    if typeof exports is "object"
        module.exports = factory(
        )
    else if typeof define is "function" and define.amd
        define( [
        ], factory )

)( () ->
    xmldom =
        parse: ( xmlString ) ->
            if Ti? and Ti.XML
                # Titanium. Keep in mind that in a titanium webView the Ti global
                # object also exists but with access restricted to Ti.App
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