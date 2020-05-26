*** Settings ***
Documentation                           上传会员头像
Resource                                ../App_Member/MemberCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     会员接口/上传会员头像（孙安）
...                                     作者：江宝敏

*** Variables ***
${UID}                                  2224
${UID1}                                 0
${RESULT}                               1
${RESULT1}                              0

*** Keywords ***

*** Test Cases ***
上传会员头像，接口返回成功
    Upload Portrait Api                 ${UID}
    ${code}                             Get From Dictionary     ${response_data}    code
    Should Be Equal As Strings          ${code}                 ${RESULT}

无效会员上传头像，接口返回失败
    Upload Portrait Api                 ${UID1}
    ${code}                             Get From Dictionary     ${response_data}    code
    Should Be Equal As Strings          ${code}                 ${RESULT1}