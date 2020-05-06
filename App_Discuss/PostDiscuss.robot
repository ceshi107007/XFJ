*** Settings ***
Documentation                           评论提交接口用例文档
Resource                                ../APP_DISCUSS/Discuss_Common.robot
Resource                                ../App_ArticleContent/ArticleContent_Common.robot
Resource                                ../APP_DISCUSSVIEW/DiscussView_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              新福建APP     评论提交
...                                     作者：黄羽

*** Variables ***
${ROOTID}                               887                 #稿件ID
${CONTENT}                              评论                #评论内容
${CONTENT1}                             法轮功              #评论内容包括非法词
${PAGE}                                 1                   #评论的第1次列表
${RESULT0}                              true
${RESULT1}                              flase

*** Keywords ***

*** Test Cases ***
正常提交评论
    Post Discuss                        ${ROOTID}
    ...                                 ${CONTENT}
    Fapi Request Should Be Succeed
    Should Be Equal As Strings          ${response_data.value}                  ${RESULT0}

提交包括非法词的评论
    Post Discuss                        ${ROOTID}
    ...                                 ${CONTENT1}
    Fapi Request Should Be Succeed
    Should Be Equal As Strings          ${response_data.value}                  ${RESULT0}