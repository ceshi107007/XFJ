*** Settings ***
Documentation                           翔宇号订阅
Resource                                ../App_FJHSubcribe/SubcribeCommon.robot
Force Tags                              冒烟集-新福建App     翔宇号订阅/互动订阅(林升)
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions

*** Variables ***
${RESULT0}                              false
${RESULT1}                              true


*** Test Cases ***
翔宇号未订阅时订阅，接口返回true
    Topic Sub
    Should Be Equal As Strings          ${response_data.value}                  ${RESULT1}

翔宇号已订阅时订阅，接口返回true
    Topic Sub
    Should Be Equal As Strings          ${response_data.value}                  ${RESULT1}

翔宇号不存在时订阅，接口依旧返回true
    Topic Sub                           Time
    Should Be Equal As Strings          ${response_data.value}                  ${RESULT1}
