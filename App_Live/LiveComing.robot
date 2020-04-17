*** Settings ***
Documentation                           直播预告
Resource                                ../App_Live/LiveCommon.robot
Force Tags                              冒烟集-新福建App     直播/直播预告（赖厚泽）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions

*** Variables ***

*** Keywords ***

*** Test Cases ***
直播预告查看，接口返回数据（由于列表页数据是动态无法进行准确断言）
    Live Coming
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed