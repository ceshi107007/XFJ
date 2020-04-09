*** Settings ***
Documentation                           该文档是获取SSO会员模块接口用例文档
Resource                                ../Common/Common.robot
Resource                                ../App_Sso/Random_Time.robot
Library                                 Secret.py
Force Tags                              冒烟集-新福建APP     sso-app接口（孙安）
...                                     作者：张鹏、江宝敏


*** Variables ***
${LOGINBYPHONE_URI}                     /api/loginByPhone               #手机号快速登录
${OAUTHLOGIN_URI}                       /api/oauthLogin                 #第三方非强制登录
${SITEID}                               1
${DEVID}                                123456   #429A9EC0-58DE-41D6-B79A-4E073350FA38
${TOKEN}                                ${EMPTY}
${VERSION}                              1.0.22
${TOKEN1}                               1
${VERSION1}                             1



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
    ${secret} =                         Md5                 devid=${devid}&random=${random}&timestamp=${timestamp}&token=${TOKEN1}&version=${VERSION1}
    Fapi Params Set                     provider            ${provider}
    ...                                 oid                 ${oid}
    ...                                 nickname            ${nickname}
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