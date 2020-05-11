*** Settings ***
Documentation                           积分行为入库
Resource                                ScoreManagerCommon.robot
# Resource                                ../App_SSO/Sso_Common.robot
Force Tags                              冒烟-新福建App          积分行为入库/积分管理（孙安）
...                                     作者：江宝敏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions

*** Variables ***
${ETYPE0}                               启动
${ETYPE1}                               安装注册
${ETYPE2}                               邀请
${ETYPE3}                               点击新闻
${ETYPE4}                               分享成功
${ETYPE5}                               提交评论
${ETYPE6}                               初次快速登录
${ETYPE7}                               初次绑定手机号
${ETYPE8}                               连续7天登录
${ETYPE9}                               启动
${RESULT0}                              计算积分成功
${RESULT1}                              计算积分失败,超出积分规则计分次数

*** Keywords ***

*** Test Cases ***
每日启动APP时获取积分，接口返回计算积分成功
    Event1                              ${ETYPE0}
    Should Be Equal As Strings          ${response_data.result[0].msg}          ${RESULT0}

APP首次安装注册成功后获取积分，接口返回计算积分成功
    Event1                              ${ETYPE1}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed
    Should Be Equal As Strings          ${response_data.result[0].msg}          ${RESULT0}

APP非首次安装注册成功后获取积分，接口返回计算积分成功
    Sleep                               5
    Event1                              ${ETYPE1}
    Should Be Equal As Strings          ${response_data.result[0].msg}          ${RESULT1}

APP邀请用户注册获取积分，接口返回计算积分成功
    Event1                              ${ETYPE2}
    Should Be Equal As Strings          ${response_data.result[0].msg}          ${RESULT0}

APP点击新闻获取积分，接口返回计算积分成功
    Event1                              ${ETYPE3}
    Should Be Equal As Strings          ${response_data.result[0].msg}          ${RESULT0}

APP分享新闻成功后获取积分，接口返回计算积分成功
    Event1                              ${ETYPE4}
    Should Be Equal As Strings          ${response_data.result[0].msg}          ${RESULT0}

APP提交评论后获取积分，接口返回计算积分成功
    Event1                              ${ETYPE5}
    Should Be Equal As Strings          ${response_data.result[0].msg}          ${RESULT0}

APP初次快速登录后获取积分，接口返回计算积分成功
    Event1                              ${ETYPE6}
    Should Be Equal As Strings          ${response_data.result[0].msg}          ${RESULT0}

APP初次绑定手机号后获取积分，接口返回计算积分成功
    Event1                              ${ETYPE7}
    Should Be Equal As Strings          ${response_data.result[0].msg}          ${RESULT0}
