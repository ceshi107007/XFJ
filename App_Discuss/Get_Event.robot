*** Settings ***
Documentation                           该文档是获取稿件评论模块接口用例文档
Resource                                ../App_Discuss/Discuss_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     稿件评论相关接口（许雁良）
...                                     作者：江宝敏

*** Variables ***
${ID}                                   872                 #查看热门评论的稿件
${RESULT}                               true
*** Keywords ***

*** Test Cases ***
对评论进行点赞，接口成功返回数据
    Get Event                           ${ID}
    Should Be Equal As Strings          ${response_data.value}
    ...                                 ${RESULT}
