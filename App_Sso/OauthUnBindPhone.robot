*** Settings ***
Documentation                           三方绑定手机号
Resource                                ../App_Sso/Sso_Common.robot
Suite Setup                             Create Sso Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     sso-app接口/三方绑定手机号（孙安）
...                                     作者：江宝敏

*** Variables ***
${PHONE}                                17855544444
&{WEIBO}                                provider=sina_weibo
...                                     oid=5800732080
...                                     nickname=abcdef
# &{APPLE}                                provider=apple
# ...                                     oid=001587
# ...                                     nickname=APPLE001587


*** Test Case ***
登录三方账号绑定手机号后再解绑，解绑成功
    SSO Oauth Login                     ${WEIBO.provider}
    ...                                 ${WEIBO.oid}
    ...                                 ${WEIBO.nickname}
    Sleep                               3
    Oauth Bind Phone                    ${response_data.uid}
    ...                                 ${PHONE}
    Sleep                               3
    Oauth UnBind Phone                  ${response_data.uid}
    ...                                 ${PHONE}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed
    # SSO Oauth Login                     ${APPLE.provider}
    # ...                                 ${APPLE.oid}
    # ...                                 ${APPLE.nickname}
    # Sleep                               3
    # Oauth UnBind Phone                ${response_data.uid}
    # ...                               ${PHONE}