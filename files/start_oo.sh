#!/bin/sh -e

SOFFICE_ROOT=/usr/bin
"${SOFFICE_ROOT}/soffice" "--accept=socket,host=localhost,port={{ tomcat_port }};urp;StarOffice.ServiceManager" --nologo --headless &
