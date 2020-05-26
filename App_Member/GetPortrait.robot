*** Settings ***
Documentation                           查看会员头像
Resource                                ../App_Member/MemberCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     sso-app接口/查看会员头像（孙安）
...                                     作者：江宝敏

*** Variables ***
${UID}                                  627
${UID1}                                 9999999999
${RESULT1}                              notexist

*** Keywords ***

*** Test Cases ***
获取有效用户ID的会员头像，接口返回成功
    Get Portrait Api                    ${UID}
    Fapi Request Should Be Succeed


获取不存在用户的会员头像，接口返回成功
    Get Portrait Api                    ${UID1}
    Fapi Request Should Be Succeed
    ${response_data}                    Fapi Data To Object
    Should Be Equal As Strings          ${response_data.url}    ${RESULT1}
