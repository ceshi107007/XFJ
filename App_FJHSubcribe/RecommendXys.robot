*** Settings ***
Documentation                           推荐翔宇号
Resource                                ../App_FJHSubcribe/SubcribeCommon.robot
Force Tags                              冒烟集-新福建App         推荐翔宇号/翔宇号（林升）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions


*** Variables ***


*** Keywords ***


*** Test Cases ***
推荐翔宇号查看，接口返回成功
    Recommend Xys
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed
