*** Settings ***
Documentation                           翔宇号订阅
Resource                                ../App_FJHSubcribe/SubcribeCommon.robot
Force Tags                              冒烟集-新福建App     栏目列表/互动订阅（林升）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions


*** Variables ***
${RESULT}                               0

*** Keywords ***


*** Test Cases ***
订阅列表不存在时数据返回为空
    Subcribe View
#    Should Be Equal As Strings         len(${response_data})                   ${RESULT}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed

订阅列表存在时数据返回不为空
    Subcribe View
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed