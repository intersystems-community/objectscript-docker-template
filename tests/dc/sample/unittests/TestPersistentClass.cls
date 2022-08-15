Class dc.sample.unittests.TestCreateRecord Extends %UnitTest.TestCase
{

Method TestCreateRecord()
{
	Set tExpected="Test string"
	set status=##class(dc.sample.PersistentClass).CreateRecord(.id)
	do $$$AssertStatusOK(status,"CreateRecord")
	set obj=##class(dc.sample.PersistentClass).%OpenId(id)
    if $IsObject(obj) {
        set tResults=obj.Test}
    else {set tResults="There is no such record with id="_id}
    Do $$$AssertEquals(tResults,tExpected,tExpected_" = "_tResults)
}

}
