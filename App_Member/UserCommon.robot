*** Settings ***
Documentation                           会员信息模块业务关键字
Resource                                ../Common/Common.robot
Library                                 OperatingSystem
# Force Tags                              新福建                 会员信息接口（孙安）
# ...                                     作者：温怡春

*** Variables ***
${GETUSER_URI}                          /amuc/api/vote/recordVote/getUser     #会员信息

*** Keywords ***
Get User
    [Documentation]                     获取会员信息
    [Arguments]                         ${userid}
    Fapi Params Set                     userid              ${userid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${GETUSER_URI} 
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}
