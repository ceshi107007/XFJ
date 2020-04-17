*** Settings ***
Documentation                           翔宇号订阅列表
Resource                                ../App_FJHSubcribe/SubcribeCommon.robot
Force Tags                              冒烟集-新福建App     翔宇号订阅列表/互动订阅(林升)
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions


*** Variables ***
${RESULT}                               0

*** Keywords ***


*** Test Cases ***
#未登录账号时查看翔宇号订阅列表，接口返回数据
#    Subcribe Xy                         ${EMPTY}
#    Fapi Request Should Be Succeed
#    Fapi Status Should Be Succeed

登录账号时查看翔宇号订阅列表，接口返回数据
    Subcribe Xy
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed