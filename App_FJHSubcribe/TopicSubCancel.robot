*** Settings ***
Documentation                           翔宇号取消订阅
Resource                                ../App_FJHSubcribe/SubcribeCommon.robot
Resource                                Random_Time.robot
Force Tags                              冒烟集-新福建App         翔宇号取消订阅/互动订阅(林升)
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions

*** Variables ***
${RESULT0}                              true
${RESULT1}                              false

*** Keywords ***

*** Test Cases ***
未订阅翔宇号或翔宇号不存在时取消订阅，接口也返回true
    Topic Sub Cancel                    888
    Should Be Equal As Strings          ${response_data.value}                  ${RESULT0}

已订阅翔宇号时取消订阅，接口返回true
    Topic Sub
    Sleep                               3
    Topic Sub Cancel
    Should Be Equal As Strings          ${response_data.value}                  ${RESULT0}