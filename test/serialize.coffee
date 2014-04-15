chai        = require "chai"
xmldom      = require "../lib/xmldom.js"

xmlString   = """
<example>
    <foo example="silly">bar</foo>
</example>
"""

xmlDoc     = xmldom.parse( xmlString )
serialized = xmldom.serialize( xmlDoc.documentElement )

describe( "XMLDOM", () ->
    describe( "#serialize()", () ->

        it( "Should match input string", () ->
            chai.expect( serialized ).to.eql( xmlString )
        )
    )
)