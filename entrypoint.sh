#!/bin/bash
/bin/sed -i "s/88888888/${base_domain_default_password}/" /root/Oracle/create-wls-domain.py

startfile="/root/Oracle/Middleware/user_projects/domains/base_domain/startWebLogic.sh"
if [ ! -f "$startfile" ] 
then
    /root/Oracle/Middleware/wlserver_10.3/common/bin/wlst.sh -skipWLSModuleScanning /root/Oracle/create-wls-domain.py
fi

/root/Oracle/Middleware/user_projects/domains/base_domain/startWebLogic.sh
