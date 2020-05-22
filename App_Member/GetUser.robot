*** Settings ***
Documentation                           获取会员信息
Resource                                UserCommon.robot
Force Tags                              新福建                 会员信息（孙安）
...                                     作者：温怡春
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
*** Variables ***
${USERID}                               257
${USERID0}                              192
${RESULT0}                              -1
${DATA}                                 true   
${DATA2}                                喵了个咪              

*** Keywords ***

*** Test Cases ***
成功获取会员信息
    Get User                            ${userid}
    Fapi Request Should Be Succeed
    Should Be Equal As Strings          ${response_data.isThird}                ${data}

会员不存在，获取会员信息失败
    Get User                            ${userid0}
    Fapi Status Should Be               ${result0}