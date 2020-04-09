*** Settings ***
Documentation                           该文档是获取稿件评论模块接口用例文档
Resource                                ../App_ArticleContent/ArticleContent_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     稿件分享（许雁良）
...                                     作者：江宝敏

*** Variables ***
${ID}                                   872                 #查看评论的ID
${RESULT}                               true
*** Keywords ***

*** Test Cases ***
对稿件进行点赞，接口成功返回数据为True
    Get Event                           ${ID}
    Should Be Equal As Strings          ${response_data.value}
    ...                                 ${RESULT}