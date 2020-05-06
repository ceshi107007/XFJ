*** Settings ***
Documentation                           注销账号
Resource                                ../App_Sso/Sso_Common.robot
Suite Setup                             Create Sso Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     sso-app接口/注销（孙安）
...                                     作者：江宝敏

*** Variables ***
${PHONE}                                18960713836

*** Keywords ***

*** Test Cases ***
手机号登录账号后再注销，接口返回成功状态码
    Login By Phone                      ${PHONE}
    Sleep                               5
    SSO Cancel Api                      ${response_data.uid}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed