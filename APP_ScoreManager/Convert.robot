*** Settings ***
Documentation                           积分扣减
Resource                                ScoreManagerCommon.robot
Force Tags                              冒烟-新福建          积分扣减/积分管理（孙安）
...                                     作者：黄羽
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions

*** Variables ***
${ETYPE0}                               3
${ETYPE1}                               2
${ETYPE2}                               0
${EVENT0}                               积分兑换
${EVENT1}                               手工扣减
${EVENT2}                               系统扣减
${SCORE0}                               1
${SCORE1}                               20000
${MEMBER}                               494
${CODE0}                                1004
${CODE1}                                1001
${RESULT0}                              积分扣减成功
${RESULT1}                              当前会员积分值小于扣减所需积分，扣减失败

*** Keywords ***

*** Test Cases ***
积分兑换，接口返回积分扣减成功
    Convert                             ${ETYPE0}
    ...                                 ${EVENT0}
    ...                                 ${SCORE0}
    ...                                 ${MEMBER}
    Fapi Status Should Be Succeed
    Should Be Equal As Strings          ${response_data.code}                   ${CODE0}
    Should Be Equal As Strings          ${response_data.msg}                    ${RESULT0}

手工扣减积分，接口返回积分扣减成功
    Convert                             ${ETYPE1}
    ...                                 ${EVENT1}
    ...                                 ${SCORE0}
    ...                                 ${MEMBER}
    Fapi Status Should Be Succeed
    Should Be Equal As Strings          ${response_data.code}                   ${CODE0}
    Should Be Equal As Strings          ${response_data.msg}                    ${RESULT0}

系统产生扣减积分，接口返回积分扣减成功
    Convert                             ${ETYPE2}
    ...                                 ${EVENT2}
    ...                                 ${SCORE0}
    ...                                 ${MEMBER}
    Fapi Status Should Be Succeed
    Should Be Equal As Strings          ${response_data.code}                   ${CODE0}
    Should Be Equal As Strings          ${response_data.msg}                    ${RESULT0}

当前会员积分值小于扣减所需积分，扣减失败
    Convert                             ${ETYPE0}
    ...                                 ${EVENT0}
    ...                                 ${SCORE1}
    ...                                 ${MEMBER}
    Fapi Status Should Be Succeed
    Should Be Equal As Strings          ${response_data.code}                   ${CODE1}
    Should Be Equal As Strings          ${response_data.msg}                    ${RESULT1}