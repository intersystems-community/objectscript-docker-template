Class PackageSample.PersistentClass Extends %Persistent
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
<DataLocation>^PackageSample.PersistentClassD</DataLocation>
<DefaultData>PersistentClassDefaultData</DefaultData>
<IdLocation>^PackageSample.PersistentClassD</IdLocation>
<IndexLocation>^PackageSample.PersistentClassI</IndexLocation>
<StreamLocation>^PackageSample.PersistentClassS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
