ARG IMAGE=intersystems/iris:2019.1.0S.111.0
ARG IMAGE=store/intersystems/iris:2019.1.0.511.0-community
ARG IMAGE=store/intersystems/iris:2019.2.0.107.0-community
#ARG IMAGE=intersystems/iris:2019.3.0.302.0
FROM $IMAGE

WORKDIR /opt/app

COPY ./Installer.cls ./
COPY ./src/cls ./src/cls
#COPY ./src/dfi ./src/dfi


RUN iris start $ISC_PACKAGE_INSTANCENAME quietly EmergencyId=sys,sys && \
    /bin/echo -e "sys\nsys\n" \
            " Do ##class(Security.Users).UnExpireUserPasswords(\"*\")\n" \
            " Do ##class(Security.Users).AddRoles(\"admin\", \"%ALL\")\n" \
            " Do ##class(Security.System).Get(,.p)\n" \
            " Set p(\"AutheEnabled\")=\$zb(p(\"AutheEnabled\"),16,7)\n" \
            " Do ##class(Security.System).Modify(,.p)\n" \
            " Do \$system.OBJ.Load(\"/opt/app/Installer.cls\",\"ck\")\n" \
            " Set sc = ##class(App.Installer).setup(, 3)\n" \
            " If 'sc do \$zu(4, \$JOB, 1)\n" \
            " zn \"%sys\"" \
            " write \"Create web application ...\",!" \
            " set webName = \"/csp/user\"" \
            " set webProperties(\"NameSpace\") = \"USER\"" \
            " set webProperties(\"Enabled\") = 1" \
            " set webProperties(\"IsNameSpaceDefault\") = 1" \
            " set webProperties(\"CSPZENEnabled\") = 1" \
            " set webProperties(\"AutheEnabled\") = 32" \
            " set webProperties(\"iKnowEnabled\") = 1" \
            " set webProperties(\"DeepSeeEnabled\") = 1" \
            " set status = ##class(Security.Applications).Create(webName, .webProperties)" \
            " write:'status \$system.Status.DisplayError(status)" \
            " write \"Web application \"\"\"_webName_\"\"\" was created!\",!" \
            " halt" \
    | iris session $ISC_PACKAGE_INSTANCENAME && \
    /bin/echo -e "sys\nsys\n" \
    | iris stop $ISC_PACKAGE_INSTANCENAME quietly

CMD [ "-l", "/usr/irissys/mgr/messages.log" ]