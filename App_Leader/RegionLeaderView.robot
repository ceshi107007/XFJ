*** Settings ***
Documentation                           地区人物列表
Resource                                ../App_Leader/LeaderCommon.robot
Force Tags                              冒烟集-新福建App     地区人物列表/人物（张进）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions

*** Variables ***
${REGIONID0}                            195                 #地区分类下有人物信息
${REGIONID1}                            281                 #地区分类下无人物信息
${RESULT}                               王宁
${STATUS}                               -1

*** Keywords ***


*** Test Cases ***
地区分类下有人物信息,接口返回当前地区下的所有人物信息
    Region Leader View                  ${REGIONID0}
    Should Be Equal As Strings          ${response_data[0].name}                ${RESULT}

地区分类下无人物信息,接口返回为空状态码为-1
    Region Leader View                  ${REGIONID1}
    Fapi Status Should Be               ${STATUS}