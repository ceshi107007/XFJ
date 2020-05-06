*** Settings ***
Documentation                           三方绑定手机号
Resource                                ../App_Sso/Sso_Common.robot
Suite Setup                             Create Sso Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     sso-app接口/三方绑定手机号（孙安）
...                                     作者：江宝敏

*** Variables ***
${NEWPHONE}                             18960713836
&{WEIBO}                                provider=sina_weibo
...                                     oid=5800732080
...                                     nickname=abcdef
&{WECHAT}                               provider=tencent_wechat
...                                     oid=o7jOUw0zSHbwv96q0AjZ3Ip5aWLo
...                                     nickname="木秋"
&{QQ}                                   provider=tencent_QQ
...                                     oid=62D34A92B2C38EC00356E3CB4B0F03BC
&{APPLE}                                provider=apple
...                                     oid=001587
...                                     nickname=APPLE001587
${UID}                                  620
${UID1}                                 174
${RESULT}                               -1

*** Test Case ***
登录微博三方账号，绑定手机号
    SSO Oauth Login                     ${WEIBO.provider}
    ...                                 ${WEIBO.oid}
    ...                                 ${WEIBO.nickname}
    Sleep                               3
    Oauth Bind Phone                    ${response_data.uid}
    ...                                 ${NEWPHONE}

    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed

登录苹果ID三方账号，绑定手机号
    Oauth UnBind Phone                  ${UID}
    ...                                 ${NEWPHONE}
    Sleep                               3
    SSO Oauth Login                     ${APPLE.provider}
    ...                                 ${APPLE.oid}
    ...                                 ${APPLE.nickname}
    Sleep                               3
    Oauth Bind Phone                    ${response_data.uid}
    ...                                 ${NEWPHONE}

    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed

登录三方账号，绑定已被其他用户绑定过的手机号，接口返回失败
    SSO Oauth Login                     ${WEIBO.provider}
    ...                                 ${WEIBO.oid}
    ...                                 ${WEIBO.nickname}
    Sleep                               3
    Oauth Bind Phone                    ${response_data.uid}
    ...                                 ${NEWPHONE}

    Fapi Request Should Be Succeed
    Fapi Status Should Be               ${RESULT}

#解绑手机号，避免重复跑报错
    Sleep                               3
    Oauth UnBind Phone                  ${UID1}
    ...                                 ${NEWPHONE}