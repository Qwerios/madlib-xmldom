chai        = require "chai"
xmldom      = require "../lib/xmldom.js"

xmlString   = """
<example>
    <foo example="silly">bar</foo>
</example>
"""

xmlDoc = xmldom.parse( xmlString )

describe( "XMLDOM", () ->
    describe( "#parse()", () ->

        it( "Should be an object", () ->
            chai.expect( typeof xmlDoc ).to.eql( "object" )
        )

        it( "Should have example tag name", () ->
            chai.expect( xmlDoc.childNodes[ 0 ].tagName ).to.eql( "example" )
        )
    )
)