*** Settings ***
Documentation                           邀请码模块业务关键字
Resource                                ../Common/Common.robot
Library                                 OperatingSystem
# Force Tags                              新福建                 邀请码接口（孙安）
# ...                                     作者：温怡春


*** Variables ***
${CODEIMEIRECORD_URI}                   /amuc/api/invitecode/codeImeiRecord     #邀请码使用
${GETINVITECODE_URI}                    /amuc/api/invitecode/getInviteCode      #获取邀请码


*** Keywords ***
Code Imei Record
    [Documentation]                     邀请码使用
    [Arguments]                         ${code}
    ...                                 ${uid}
    ...                                 ${imei}
    Fapi Params Set                     code                ${code}
    ...                                 uid                 ${uid}
    ...                                 imei                ${imei}
    ...                                 name                null
    ...                                 siteID              1
    ...                                 curVersions         1
    Fapi Get                            ${APPIF_ALIAS}      ${CODEIMEIRECORD_URI} 
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Get Invite Code
    [Documentation]                     获取邀请码
    [Arguments]                         ${uid}
    Fapi Params Set                     uid                 ${uid}
    ...                                 siteID              1
    ...                                 curVersions         1
    Fapi Get                            ${APPIF_ALIAS}      ${GETINVITECODE_URI} 
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}