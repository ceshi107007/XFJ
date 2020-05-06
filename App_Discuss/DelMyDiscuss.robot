*** Settings ***
Documentation                           文档是删除我的评论接口用例文档
Resource                                ../App_Discuss/Discuss_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     删除我的评论（许雁良）
...                                     作者：温怡春

*** Variables ***
${USERID}                               152
${FILEID0}                              146
${FILEID1}                              123456
${RESULT}                               0
${RESULT0}                              1
${RESULT1}                              2
${MESSAGE}                              删除成功
${MESSAGE0}                             只能删除自己的评论
${MESSAGE1}                             评论不存在
${ROOTID}                               3867
${CONTENT}                              评论内容提交

*** Test Cases ***
提交一条评论，用于删除评论测试
    Post Discuss                        ${rootid}
    ...                                 ${content}
    Fapi Request Should Be Succeed
    Sleep                               3
    Discuss View                        ${rootid}           #从评论列表获取评论ID
    ...                                 ${0}
    Fapi Request Should Be Succeed
    Set Suite Variable                  ${DiscussId}        ${response_data.list[0].id}
    Log                                 ${DiscussId}

删除我的评论，提示删除成功
    Sleep                               3
    Delete My Discuss                   ${DiscussId}
    Fapi Status Should Be Succeed
    Should Be Equal As Strings          ${response_data.status}                 ${result}
    Should Be Equal As Strings          ${response_data.message}                ${message}

删除他人的评论，提示只能删除自己的评论
    Delete My Discuss                   ${fileid0}
    Fapi Status Should Be Succeed
    Should Be Equal As Strings          ${response_data.status}                 ${result0}
    Should Be Equal As Strings          ${response_data.message}                ${message0}

删除的评论不存在，提示评论不存在
    Delete My Discuss                   ${fileid1}
    Fapi Status Should Be Succeed
    Should Be Equal As Strings          ${response_data.status}                 ${result1}
    Should Be Equal As Strings          ${response_data.message}                ${message1}



