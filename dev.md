# useful commands
## clean up docker
use it when docker says "There is no space left on device". It will remove built but not used images and other temporary files.
```
docker system prune -f
```

```
docker rm -f $(docker ps -qa)
```

## build container with no cache
```
docker-compose build --no-cache --progress=plain
```
## start iris container
```
docker-compose up -d
```

## open iris terminal in docker
```
docker-compose exec iris iris session iris -U USER
```

## map iris key from Mac home directory to IRIS in container
- ~/iris.key:/usr/irissys/mgr/iris.key

## install git in the docker image
## add git in dockerfile
USER root
RUN apt update && apt-get -y install git

USER ${ISC_PACKAGE_MGRUSER}


## install docker-compose
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

```

## select zpm test registry
```
repo -n registry -r -url https://test.pm.community.intersystems.com/registry/ -user test -pass PassWord42
```

## get back to public zpm registry
```
repo -r -n registry -url https://pm.community.intersystems.com/
```

## export a global in runtime into the repo
```
d $System.OBJ.Export("GlobalD.GBL","/home/irisowner/dev/src/gbl/GlobalD.xml")
```

## create a web app in dockerfile
```
zn "%SYS" \
  write "Create web application ...",! \
  set webName = "/csp/irisweb" \
  set webProperties("NameSpace") = "IRISAPP" \
  set webProperties("Enabled") = 1 \
  set webProperties("CSPZENEnabled") = 1 \
  set webProperties("AutheEnabled") = 32 \
  set webProperties("iKnowEnabled") = 1 \
  set webProperties("DeepSeeEnabled") = 1 \
  set sc = ##class(Security.Applications).Create(webName, .webProperties) \
  write "Web application "_webName_" has been created!",!
```



```
do $SYSTEM.OBJ.ImportDir("/home/irisowner/dev/src",, "ck")
```


### run tests described in the module

IRISAPP>zpm
IRISAPP:zpm>load /home/irisowner/dev
IRISAPP:zpm>test package-name

### install ZPM with one line
    // Install ZPM
    set $namespace="%SYS", name="DefaultSSL" do:'##class(Security.SSLConfigs).Exists(name) ##class(Security.SSLConfigs).Create(name) set url="https://pm.community.intersystems.com/packages/zpm/latest/installer" Do ##class(%Net.URLParser).Parse(url,.comp) set ht = ##class(%Net.HttpRequest).%New(), ht.Server = comp("host"), ht.Port = 443, ht.Https=1, ht.SSLConfiguration=name, st=ht.Get(comp("path")) quit:'st $System.Status.GetErrorText(st) set xml=##class(%File).TempFilename("xml"), tFile = ##class(%Stream.FileBinary).%New(), tFile.Filename = xml do tFile.CopyFromAndSave(ht.HttpResponse.Data) do ht.%Close(), $system.OBJ.Load(xml,"ck") do ##class(%File).Delete(xml)


## add git
USER root

RUN apt update && apt-get -y install git

USER ${ISC_PACKAGE_MGRUSER}
