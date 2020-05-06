*** Settings ***
Documentation                           翔宇号订阅列表
Resource                                ../App_FJHSubcribe/SubcribeCommon.robot
Force Tags                              冒烟集-新福建App     翔宇号订阅列表/互动订阅(林升)
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions


*** Variables ***
${COLID}                                66
${RESULT}                               0

*** Keywords ***


*** Test Cases ***
当输入其他非福建号栏目时查看翔宇号订阅列表，接口返回为空
    Subcribe Xy                         ${COLID}
    Fapi Data Field Count Should Be     ${response_data.list}                   ${RESULT}

输入福建号栏目查看翔宇号订阅列表，接口返回数据（因数据是动态的无法对返回值进行断言）
    Subcribe Xy
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed