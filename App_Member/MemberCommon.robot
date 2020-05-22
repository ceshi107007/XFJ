*** Settings ***
Documentation                           会员模块业务关键字
Resource                                ../Common/Common.robot
Library                                 OperatingSystem
Library                                 String
Library                                 Upload.py
Force Tags                              冒烟集-新福建App     会员模块业务关键字（孙安、许雁良）
...                                     作者：黄羽

*** Variables ***
${CHECKUSER_URI}                        /amuc/api/order/checkuser
${CETPORTRAIT_URI}                      /amuc/api/member/getPortrait
${SITEID}                               1


*** Keywords ***
Check User
    [Documentation]                     检查用户是否存在
    [Arguments]                         ${mobile}
    ...                                 ${siteid}=${SITEID}
    Fapi Params Set                     mobile              ${mobile}
    ...                                 siteID              ${siteid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${CHECKUSER_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Upload File
    [Documentation]                     附件上传
    [Arguments]                         ${userid}
    ${data} =                           upload              ${userid}
    Set Suite Variable                  ${response_data}    ${data}