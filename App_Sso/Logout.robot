*** Settings ***
Documentation                           退出账号
Resource                                ../App_Sso/Sso_Common.robot
Suite Setup                             Create Sso Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     sso-app接口/退出（孙安）
...                                     作者：江宝敏

*** Variables ***
${PHONE}                                18960713836
&{WEIBO}                                provider=sina_weibo
...                                     oid=5800732080
...                                     nickname=abcdef
&{WECHAT}                               provider=tencent_wechat
...                                     oid=o7jOUw0zSHbwv96q0AjZ3Ip5aWLo
...                                     nickname="木秋"
&{QQ}                                   provider=tencent_QQ
...                                     oid=62D34A92B2C38EC00356E3CB4B0F03BC                #7422D090F908964F3C72C07ECE2B4D1B
...                                     nickname="一无所有"
&{APPLE}                                provider=apple
...                                     oid=001587
...                                     nickname=APPLE001587
*** Keywords ***

*** Test Cases ***
手机号登录账号后再退出，接口返回成功状态码
    Login By Phone                      ${PHONE}
    Sleep                               3
    SSO Logout Api                      ${response_data.uid}
    ...                                 ${response_data.token}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed

第三方QQ登录账号后再退出，接口返回成功状态码
    SSO Oauth Login                     ${QQ.provider}
    ...                                 ${QQ.oid}
    ...                                 ${QQ.nickname}
    Sleep                               3
    SSO Logout Api                      ${response_data.uid}
    ...                                 ${response_data.token}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed

第三方微博登录账号后再退出，接口返回成功状态码
    SSO Oauth Login                     ${WEIBO.provider}
    ...                                 ${WEIBO.oid}
    ...                                 ${WEIBO.nickname}
    Sleep                               3
    SSO Logout Api                      ${response_data.uid}
    ...                                 ${response_data.token}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed

第三方微信登录账号后再退出，接口返回成功状态码
    SSO Oauth Login                     ${WECHAT.provider}
    ...                                 ${WECHAT.oid}
    ...                                 ${WECHAT.nickname}
    Sleep                               3
    SSO Logout Api                      ${response_data.uid}
    ...                                 ${response_data.token}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed

第三方APPLE ID登录账号后再退出，接口返回成功状态码
    SSO Oauth Login                     ${APPLE.provider}
    ...                                 ${APPLE.oid}
    ...                                 ${APPLE.nickname}
    Sleep                               3
    SSO Logout Api                      ${response_data.uid}
    ...                                 ${response_data.token}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed
