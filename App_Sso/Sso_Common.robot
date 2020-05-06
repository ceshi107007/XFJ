*** Settings ***
Documentation                           该文档是获取SSO会员模块接口用例文档
Resource                                ../Common/Common.robot
Resource                                ../App_Sso/Random_Time.robot
Library                                 Secret.py
Library                                 Secret2.py
Force Tags                              冒烟集-新福建APP     sso-app接口（孙安）
...                                     作者：张鹏、江宝敏


*** Variables ***
${LOGINBYPHONE_URI}                     /api/loginByPhone               #手机号快速登录
${OAUTHLOGIN_URI}                       /api/oauthLogin                 #第三方非强制登录
${MODIFY_URI}                           /api/modify                     #修改个人资料
${CHANGEPHONE_URI}                      /api/changePhone                #修改手机号(非强制绑定)
${LOGOUT_URI}                           /api/logout                     #退出
${CANCEL_URI}                           /api/cancel                     #注销
${OAUTHBINDPHONE_URI}                   /api/oauthBindPhone             #三方绑定手机号
${OAUTHUNBINDPHONE_URI}                 /api/oauthUnBindPhone           #三方解绑手机号
${SITEID}                               1
${DEVID}                                123456                          #429A9EC0-58DE-41D6-B79A-4E073350FA38
${TOKEN}                                ${EMPTY}
${VERSION}                              1.0.0
${TOKEN1}                               1
${VERSION1}                             1
${ADDRESS}                              ${EMPTY}



*** Keywords ***
Login By Phone
    [Documentation]                     手机号快捷登录接口
    [Arguments]                         ${phone}
    ...                                 ${devid}=${DEVID}
    ...                                 ${siteid}=${SITEID}
    ${random} =                         Random
    ${timestamp} =                      Time
    ${secret} =                         Md5                 devid=${devid}&random=${random}&timestamp=${timestamp}&token=${TOKEN}&version=${VERSION}
    Fapi Params Set                     devid               ${devid}
    ...                                 phone               ${phone}
    ...                                 siteid              ${siteid}
    ...                                 curVersions         ${CURVERSIONS}
    ${program_sign} =                   Md5                 devid=${devid}&siteid=${siteid}&phone=${phone}&secret=${secret}
    ${proParams}                        Set Variable        devid,siteid,phone
    Fapi Headers Set
    ...                                 program-sign        ${program_sign}
    ...                                 devid               ${devid}
    ...                                 random              ${random}
    ...                                 timestamp           ${timestamp}
    ...                                 token               ${TOKEN}
    ...                                 version             ${VERSION}
    ...                                 Content-Type        application/x-www-form-urlencoded
    ...                                 program-params      ${proParams}
    Fapi Post                           ${SSO_ALIAS}        ${LOGINBYPHONE_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

SSO Oauth Login
    [Documentation]                     第三方登录接口
    [Arguments]                         ${provider}
    ...                                 ${oid}
    ...                                 ${nickname}
    ...                                 ${devid}=${DEVID}
    ...                                 ${siteid}=${SITEID}
    ${random} =                         Random
    ${timestamp} =                      Time
    ${name} =                           ENCODE              ${nickname}
    ${secret} =                         Md5                 devid=${devid}&random=${random}&timestamp=${timestamp}&token=${TOKEN1}&version=${VERSION1}
    Fapi Params Set                     provider            ${provider}
    ...                                 oid                 ${oid}
    ...                                 nickname            ${name}
    ...                                 devid               ${devid}
    ...                                 siteid              ${siteid}
    ...                                 random              ${random}
    ...                                 timestamp           ${timestamp}
    ...                                 version             ${VERSION1}
    ...                                 token               ${TOKEN1}
    ...                                 curVersions         ${CURVERSIONS}
    ${program_sign} =                   Md5                 devid=${devid}&random=${random}&timestamp=${timestamp}&token=${TOKEN1}&version=${VERSION1}&secret=${secret}
    ${proParams}                        Set Variable        devid,random,timestamp,token,version
    Fapi Headers Set
    ...                                 program-sign        ${program_sign}
    ...                                 devid               ${devid}
    ...                                 random              ${random}
    ...                                 timestamp           ${timestamp}
    ...                                 token               ${TOKEN1}
    ...                                 version             ${VERSION1}
    ...                                 Content-Type        application/x-www-form-urlencoded
    ...                                 program-params      ${proParams}
    Fapi Post                           ${SSO_ALIAS}        ${OAUTHLOGIN_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

SSO Modify Api
    [Documentation]                     修改个人资料
    [Arguments]                         ${uid}
    ...                                 ${nickname}
    ...                                 ${sex}
    ...                                 ${birthday}
    ${random} =                         Random
    ${timestamp} =                      Time
    ${name} =                           ENCODE              ${nickname}
    ${secret} =                         Md5                 devid=${DEVID}&random=${random}&timestamp=${timestamp}&token=${TOKEN}&version=${VERSION}
    Fapi Params Set                     uid                 ${uid}
    ...                                 nickname            ${name}
    ...                                 sex                 ${sex}
    ...                                 birthday            ${birthday}
    ...                                 address             ${ADDRESS}
    ...                                 curVersions         ${CURVERSIONS}
    ${program_sign} =                   Md5                 uid=${uid}&nickname=${name}&sex=${sex}&birthday=${birthday}&address=${ADDRESS}&secret=${secret}
    ${proParams}                        Set Variable        uid,nickname,sex,birthday,address
    Fapi Headers Set
    ...                                 program-sign        ${program_sign}
    ...                                 devid               ${DEVID}
    ...                                 random              ${random}
    ...                                 timestamp           ${timestamp}
    ...                                 token               ${TOKEN}
    ...                                 version             ${VERSION}
    ...                                 Content-Type        application/x-www-form-urlencoded
    ...                                 program-params      ${proParams}
    Fapi Post                           ${SSO_ALIAS}        ${MODIFY_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

SSO Logout Api
    [Documentation]                     退出
    [Arguments]                         ${uid}
    ...                                 ${token}
    ...                                 ${devid}=${DEVID}
    ${random} =                         Random
    ${timestamp} =                      Time
    ${secret} =                         Md5                 devid=${devid}&random=${random}&timestamp=${timestamp}&token=${token}&version=${VERSION}
    Fapi Params Set                     uid                 ${uid}
    ...                                 devid               ${devid}
    ...                                 token               ${token}
    ...                                 curVersions         ${CURVERSIONS}
    ${program_sign} =                   Md5                 uid=${uid}&devid=${devid}&token=${token}&secret=${secret}
    ${proParams}                        Set Variable        uid,devid,token
    Fapi Headers Set
    ...                                 program-sign        ${program_sign}
    ...                                 devid               ${devid}
    ...                                 random              ${random}
    ...                                 timestamp           ${timestamp}
    ...                                 token               ${token}
    ...                                 version             ${VERSION}
    ...                                 Content-Type        application/x-www-form-urlencoded
    ...                                 program-params      ${proParams}
    Fapi Post                           ${SSO_ALIAS}        ${LOGOUT_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

SSO Cancel Api
    [Documentation]                     注销
    [Arguments]                         ${uid}
    ${random} =                         Random
    ${timestamp} =                      Time
    ${secret} =                         Md5                 devid=${devid}&random=${random}&timestamp=${timestamp}&token=${TOKEN}&version=${VERSION}
    Fapi Params Set                     uid                 ${uid}
    ...                                 siteid              ${SITEID}
    ...                                 curVersions         ${CURVERSIONS}
    ${program_sign} =                   Md5                 uid=${uid}&siteid=${SITEID}&secret=${secret}
    ${proParams}                        Set Variable        uid,siteid
    Fapi Headers Set
    ...                                 program-sign        ${program_sign}
    ...                                 devid               ${devid}
    ...                                 random              ${random}
    ...                                 timestamp           ${timestamp}
    ...                                 token               ${TOKEN}
    ...                                 version             ${VERSION}
    ...                                 Content-Type        application/x-www-form-urlencoded
    ...                                 program-params      ${proParams}
    Fapi Post                           ${SSO_ALIAS}        ${CANCEL_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Oauth Bind Phone
    [Documentation]                     三方绑定手机号
    [Arguments]                         ${uid}
    ...                                 ${newphone}
    ...                                 ${siteid}=${SITEID}
    ${random} =                         Random
    ${timestamp} =                      Time
    ${secret} =                         Md5                 devid=${devid}&random=${random}&timestamp=${timestamp}&token=${TOKEN}&version=${VERSION}
    Fapi Params Set                     uid                 ${uid}
    ...                                 newPhone            ${newphone}
    ...                                 siteid              ${siteid}
    ...                                 curVersions         ${CURVERSIONS}
    ${program_sign} =                   Md5                 uid=${uid}&newPhone=${newphone}&secret=${secret}
    ${proParams}                        Set Variable        uid,newPhone
    Fapi Headers Set
    ...                                 program-sign        ${program_sign}
    ...                                 devid               ${devid}
    ...                                 random              ${random}
    ...                                 timestamp           ${timestamp}
    ...                                 token               ${TOKEN}
    ...                                 version             ${VERSION}
    ...                                 Content-Type        application/x-www-form-urlencoded
    ...                                 program-params      ${proParams}
    Fapi Post                           ${SSO_ALIAS}        ${OAUTHBINDPHONE_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Oauth UnBind Phone
    [Documentation]                     三方解绑手机号
    [Arguments]                         ${uid}
    ...                                 ${phone}
    ...                                 ${siteid}=${SITEID}
    ${random} =                         Random
    ${timestamp} =                      Time
    ${secret} =                         Md5                 devid=${devid}&random=${random}&timestamp=${timestamp}&token=${TOKEN}&version=${VERSION}
    Fapi Params Set                     uid                 ${uid}
    ...                                 phone               ${phone}
    ...                                 siteid              ${siteid}
    ...                                 curVersions         ${CURVERSIONS}
    ${program_sign} =                   Md5                 uid=${uid}&phone=${phone}&secret=${secret}
    ${proParams}                        Set Variable        uid,phone
    Fapi Headers Set
    ...                                 program-sign        ${program_sign}
    ...                                 devid               ${devid}
    ...                                 random              ${random}
    ...                                 timestamp           ${timestamp}
    ...                                 token               ${TOKEN}
    ...                                 version             ${VERSION}
    ...                                 Content-Type        application/x-www-form-urlencoded
    ...                                 program-params      ${proParams}
    Fapi Get                            ${SSO_ALIAS}        ${OAUTHUNBINDPHONE_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}