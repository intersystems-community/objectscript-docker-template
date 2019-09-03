Class PackageSample.PersistentClass Extends %Persistent
{
property Test as %VarString;

ClassMethod CreateRecord() As %Status
{
    s objPC=..%New()
    s objPC.Test="Test string"
    return objPC.%Save()
}

}