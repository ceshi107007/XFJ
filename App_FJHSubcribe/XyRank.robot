*** Settings ***
Documentation                           翔宇号影响力排行
Resource                                ../App_FJHSubcribe/SubcribeCommon.robot
Force Tags                              冒烟集-新福建App     翔宇号影响力排行/翔宇号（林升）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions


*** Variables ***
${TYPE0}                                0                   #近一周
${TYPE1}                                1                   #上一周
${TYPE2}                                2                   #近一月
${TYPE3}                                3                   #上个月

*** Keywords ***

*** Test Cases ***
查看近一周翔宇号影响力排行,接口返回数据成功（动态数据无法校验）
    Xy Rank                             ${TYPE0}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed

查看上一周翔宇号影响力排行,接口返回数据成功（动态数据无法校验）
    Xy Rank                             ${TYPE1}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed

查看近一月翔宇号影响力排行,接口返回数据成功（动态数据无法校验）
    Xy Rank                             ${TYPE2}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed

查看上个月翔宇号影响力排行,接口返回数据成功（动态数据无法校验）
    Xy Rank                             ${TYPE3}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed