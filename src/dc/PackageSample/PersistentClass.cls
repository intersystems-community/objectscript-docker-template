Class dc.PackageSample.PersistentClass Extends %Persistent
{

Property Test As %VarString;

ClassMethod CreateRecord() As %Status
{
    s objPC=..%New()
    s objPC.Test="Test string"
    return objPC.%Save()
}

Storage Default
{
<Data name="PersistentClassDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Test</Value>
</Value>
</Data>
<DataLocation>^dc.Package4C8F.PersistentC1A93D</DataLocation>
<DefaultData>PersistentClassDefaultData</DefaultData>
<IdLocation>^dc.Package4C8F.PersistentC1A93D</IdLocation>
<IndexLocation>^dc.Package4C8F.PersistentC1A93I</IndexLocation>
<StreamLocation>^dc.Package4C8F.PersistentC1A93S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
