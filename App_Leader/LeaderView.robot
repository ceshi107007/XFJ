*** Settings ***
Documentation                           全部人物列表
Resource                                ../App_Leader/LeaderCommon.robot
Force Tags                              冒烟集-新福建App     全部人物列表/人物（张进）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions

*** Variables ***
${HASARTICLES0}                         49
${HASARTICLES1}                         18
${RESULT0}
${RESULT1}                              中共十九届中央委员，福建省委书记，省人大常委会主任，福建省军区党委第一书记

*** Keywords ***

*** Test Cases ***
#不查看人物列表下的稿件，接口仅返回领导简介
#    Leader View                         ${HASARTICLES0}
#    Should Be Equal As Strings          ${response_data[0].duty}                ${RESULT0}


查看人物列表下的稿件，接口仅返回领导简介
    Leader View                         ${HASARTICLES1}
    Should Be Equal As Strings          ${response_data[0].duty}                ${RESULT1}
