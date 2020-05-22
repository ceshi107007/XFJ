*** Settings ***
Documentation                           获取邀请码
Resource                                InviteCodeCommon.robot
Force Tags                              新福建                 邀请码接口（孙安）
...                                     作者：温怡春
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
*** Variables ***
${UID}                                  257
${UID0}                                 9
${CODE}                                 8628775
${CODE0}                                0
${MSG}                                  系统中存在,获取邀请码成功
${MSG0}                                 系统中不存在uid:${uid0}的会员

*** Keywords ***

*** Test Cases ***
用户存在，获取邀请码成功
    Get Invite Code                     ${uid}
    Fapi Request Should Be Succeed
    Should Be Equal As Strings          ${response_data.code}         ${code}
    Should Be Equal As Strings          ${response_data.msg}          ${msg}


用户不存在，邀请码为0
    Get Invite Code                     ${uid0}
    Fapi Request Should Be Succeed
    Should Be Equal As Strings          ${response_data.code}         ${code0}
    Should Be Equal As Strings          ${response_data.msg}          ${msg0}


