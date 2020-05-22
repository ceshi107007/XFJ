*** Settings ***
Documentation                           检查用户是否存在
Resource                                MemberCommon.robot
Force Tags                              冒烟-新福建          检查用户是否存在/会员管理（孙安）
...                                     作者：黄羽
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions

*** Variables ***
${MOBILE0}                              13859081475
${MOBILE1}                              13859081476
${MOBILE2}                              15859164902
${CODE0}                                1003
${CODE1}                                1001
${CODE2}                                1002
${RESULT0}                              用户存在
${RESULT1}                              不存在该账户
${RESULT2}                              用户被禁用

*** Keywords ***

*** Test Cases ***
输入存在的手机号，接口成功返回用户存在
    Check User                          ${MOBILE0}
    Fapi Status Should Be Succeed
    Should Be Equal As Strings          ${response_data.code}                   ${CODE0}
    Should Be Equal As Strings          ${response_data.msg}                    ${RESULT0}

输入不存在的手机号，接口成功返回不存在该用户
    Check User                          ${MOBILE1}
    Fapi Status Should Be Succeed
    Should Be Equal As Strings          ${response_data.code}                   ${CODE1}
    Should Be Equal As Strings          ${response_data.msg}                    ${RESULT1}

输入被禁用的手机号，接口成功返回用户被禁用
    Check User                          ${MOBILE2}
    Fapi Status Should Be Succeed
    Should Be Equal As Strings          ${response_data.code}                   ${CODE2}
    Should Be Equal As Strings          ${response_data.msg}                    ${RESULT2}