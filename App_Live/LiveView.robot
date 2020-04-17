*** Settings ***
Documentation                           客户端直播列表查看
Resource                                ../App_Live/LiveCommon.robot
Force Tags                              冒烟集-新福建App     直播/客户端直播报道查看（赖厚泽）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions

*** Variables ***
${NEWID}                                   4567890
${STATUS}                                  -1

*** Keywords ***

*** Test Cases ***
当直播话题存在时，接口返回正常
    Live View
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed

当直播话题不存在时，接口返回为空状态码为-1
    Live View                           ${NEWID}
    Fapi Status Should Be               ${STATUS}
