*** Settings ***
Documentation                           翔宇号稿件影响力排行
Resource                                ../App_FJHSubcribe/SubcribeCommon.robot
Force Tags                              冒烟集-新福建App     翔宇号稿件影响力排行/翔宇号（林升）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions

*** Variables ***


*** Keywords ***


*** Test Cases ***
翔宇号稿件影响力排行榜查看，接口返回列表页数据
    Xy Article Rank
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed
