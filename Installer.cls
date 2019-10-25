Class App.Installer
{

XData setup
{
<Manifest>
  <Default Name="SourceDir" Value="#{$system.Process.CurrentDirectory()}src"/>

  <Namespace Name="MYAPP" Code="MYAPP" Data="MYAPP" Create="yes" Ensemble="no">

    <Configuration>
      <Database Name="MYAPP" Dir="/opt/myapp/data" Create="yes"/>

      <Import File="${SourceDir}" Flags="ck" Recurse="1"/>
    </Configuration>
  </Namespace>

</Manifest>
}

ClassMethod setup(ByRef pVars, pLogLevel As %Integer = 3, pInstaller As %Installer.Installer, pLogger As %Installer.AbstractLogger) As %Status [ CodeMode = objectgenerator, Internal ]
{
  #; Let XGL document generate code for this method. 
  Quit ##class(%Installer.Manifest).%Generate(%compiledclass, %code, "setup")
}

}