*** Settings ***
Documentation                           客户端直播稿件列表查看
Resource                                ../App_Live/LiveCommon.robot
Force Tags                              冒烟集-新福建App     直播/客户端直播报道查看（赖厚泽）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions


*** Variables ***
${ID0}                                  16
${ID1}                                  2


*** Keywords ***

*** Test Cases ***
查看直播栏目下的稿件列表，接口返回直播栏目下稿件数据
    Get Live Articles                   ${ID0}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed

查看非直播栏目下的稿件列表，返回该栏目下的稿件数据(该栏目下未创建数据顾返回为空)
    Get Live Articles                   ${ID1}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed
