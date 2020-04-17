*** Settings ***
Documentation                           人物分类列表
Resource                                ../App_Leader/LeaderCommon.robot
Force Tags                              冒烟集-新福建App     人物分类列表/人物（张进）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions

*** Variables ***
${CATID0}                               1
${CATID1}                               7
${CATNAME}                              政府
${RESULT}                               0


*** Keywords ***


*** Test Cases ***
输入的父分类ID存在时，接口返回相关数据
    Leader Cats                         ${CATID0}
    Should Be Equal As Strings          ${response_data.cats[0].catName}        ${CATNAME}

输入的父分类ID存在时但不存在子分类时，接口返回为空
    Leader Cats                         ${CATID1}
    Fapi Data Field Count Should Be     ${response_data.cats}                   ${RESULT}

#输入的父分类ID不存在时，接口返回为空
#    Leader Cats                         ${EMPTY}
