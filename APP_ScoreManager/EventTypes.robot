*** Settings ***
Documentation                           积分行为类型查看
Resource                                ScoreManagerCommon.robot
Force Tags                              冒烟集-新福建APP     积分行为类型查看/积分管理（孙安）
...                                     作者：温怡春
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
*** Variables ***
${RESULT}                               启动,使用,浏览,安装注册,邀请,发布主题,参与主题,连续7天登录,连续15天登录,连续30天登录,分享成功,提交评论,点击新闻,点开数字报按钮,评论审核,启动程序,创建话题,问吧提问,问吧回答,订阅号提问,初次快速登录,初次绑定手机号
${RESULT1}                              启动

*** Keywords ***

*** Test Cases ***
获取积分行为的类型，接口返回所有类型数据
    Event Types
#    Fapi Status Should Be Succeed
#    Fapi Request Should Be Succeed
#    Should Be Equal As Strings          ${response_data}    ${RESULT}
    Should Contain                      ${response_data}    ${RESULT1}