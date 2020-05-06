*** Settings ***
Documentation                           翔宇号动态列表查看
Resource                                ../App_FJHSubcribe/SubcribeCommon.robot
Force Tags                              冒烟集-新福建App     翔宇号动态列表查看/翔宇号（林升）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions


*** Variables ***
${XYID0}                                1
${XYID1}                                1234567890


*** Keywords ***


*** Test Cases ***
当翔宇号存在时查看翔宇号动态列表，接口返回列表下数据(因返回数据为动态的，无法进行校验)
    Get Xy Dynamic                      ${XYID0}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed

当翔宇号不存在时查看翔宇号动态列表，接口返回列表下数据
    Get Xy Dynamic                      ${XYID1}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed