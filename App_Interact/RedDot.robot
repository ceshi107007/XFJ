*** Settings ***
Documentation                           读取小红点
Resource                                ../App_Interact/InteractCommon.robot
Force Tags                              冒烟集-新福建App     读取小红点/互动其他（许雁良）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions

*** Variables ***
${NEWUSERID}                            ${EMPTY}

*** Keywords ***

*** Test Cases ***
未登录账号时读取小红点状态，接口返回成功
    Red Dot                             ${EMPTY}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed


已登录账号时读取小红点状态，接口返回成功
    Red Dot
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed