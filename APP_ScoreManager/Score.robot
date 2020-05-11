*** Settings ***
Documentation                           获取会员当前积分
Resource                                ScoreManagerCommon.robot
Force Tags                              冒烟-新福建App          获取会员当前积分/积分管理（孙安）
...                                     作者：江宝敏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions

*** Variables ***
${ID0}                                  568
${ID1}                                  qq
${RESULT}                               会员信息不存在，请检查参数是否正确

*** Keywords ***

*** Test Cases ***
输入的会员id有效时，接口返回当前帐号的积分
    Score                               ${ID0}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed

输入的会员id无效时，接口返回会员信息不存在
    Score                               ${ID1}
    Should Be Equal As Strings          ${response_data}    ${RESULT}

输入的会员id为空时，接口返回会员信息不存在
    Score                               ${EMPTY}
    Should Be Equal As Strings          ${response_data}    ${RESULT}