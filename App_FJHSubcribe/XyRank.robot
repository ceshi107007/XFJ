*** Settings ***
Documentation                           翔宇号影响力排行
Resource                                ../App_FJHSubcribe/SubcribeCommon.robot
Force Tags                              冒烟集-新福建App     翔宇号影响力排行/翔宇号（林升）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions


*** Variables ***
${NEW_USERID}                           14

*** Keywords ***

*** Test Cases ***
未登录账号时查看翔宇号影响力排行,接口返回成功
    Xy Rank
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed

登录账号时查看翔宇号影响力排行,接口返回成功
    Xy Rank                             ${NEW_USERID}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed