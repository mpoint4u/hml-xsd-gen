package ;
class RootObjectType extends SchemaType {

    public function new() {
        super(null);
    }

    override public function getNameSpace(): SchemaNamespace {
        return SchemaNamespace.getNamespace("");
    }

    override public function getBase(): SchemaType { return null; }

    override public function getName(): String {
        return "RootObjectType";
    }

    override public function toComplexTypeXmlString(namespace:SchemaNamespace): String {
        trace("called toComplexTypeXmlString() with namespace:" + namespace.name);
        var buf: StringBuf = new StringBuf();
        buf.add('<xs:complexType name="RootObjectTypeSchemaType">');
        if (!Generator.onlyExplicitChildren) {
            buf.add('<xs:choice>\n');
            buf.add('<xs:any namespace="##targetNamespace" processContents="lax"  minOccurs="1"/>\n');
            buf.add('</xs:choice>\n');
        }
        //buf.add('<xs:attribute name="id" type="xs:int"/>\n</xs:complexType>');
        buf.add('</xs:complexType>');
        return buf.toString();
    }

    override public function toElementXmlString(namespace:SchemaNamespace): String {
        return '<xs:element name="RootObjectType" type="RootObjectTypeSchemaType" />';
    }
}
