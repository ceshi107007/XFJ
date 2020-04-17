*** Settings ***
Documentation                           分类人物列表
Resource                                ../App_Leader/LeaderCommon.robot
Force Tags                              冒烟集-新福建App     分类人物列表/人物（张进）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions

*** Variables ***
${CATID0}                               1
${CATID1}                               7
${RESULT0}
${RESULT1}                              0

*** Keywords ***


*** Test Cases ***
输入的父分类ID存在时，接口返回相关数据
    Cat Leader View                     ${CATID0}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed

输入的父分类ID存在时但不存在子分类时，接口返回为空
    Cat Leader View                     ${CATID1}
    Fapi Data Field Count Should Be     ${response_data.list}                   ${RESULT1}
