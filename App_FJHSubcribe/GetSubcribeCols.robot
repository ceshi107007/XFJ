*** Settings ***
Documentation                           订阅栏目搜索
Resource                                ../App_FJHSubcribe/SubcribeCommon.robot
Force Tags                              冒烟集-新福建App     订阅栏目搜索/互动订阅（林升）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions


*** Variables ***
${RESULT0}
${RESULT1}                              0

*** Keywords ***


*** Test Cases ***
输入的关键字匹配到数据时，接口返回数据
    Get Subcribe Cols
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed

输入的关键字未匹配到数据时，接口返回为空
    Get Subcribe Cols                   输入的值匹配不到数据
    Fapi Data Field Count Should Be     ${response_data}    ${RESULT1}