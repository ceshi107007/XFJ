*** Settings ***
Documentation                           修改个人资料
Resource                                ../App_Sso/Sso_Common.robot
Suite Setup                             Create Sso Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     sso-app接口/修改个人资料（孙安）
...                                     作者：江宝敏

*** Variables ***
${UID}                                  608
${SEX}                                  1
${BIR}                                  1990-10-01
${NAME}                                 ab
${NAME1}                                霜木
${RESULT}                               -1

*** Test Case ***
修改昵称名为未用过的昵称，接口返回成功
    SSO Modify Api                      ${UID}
    ...                                 ${NAME}
    ...                                 ${SEX}
    ...                                 ${BIR}

    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed

修改昵称为已被占用的昵称，接口返回失败
    SSO Modify Api                      ${UID}
    ...                                 ${NAME1}
    ...                                 ${SEX}
    ...                                 ${BIR}
    Fapi Request Should Be Succeed
    Fapi Status Should Be               ${RESULT}