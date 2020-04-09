*** Settings ***
Documentation                           该文档是获取稿件评论模块接口用例文档
Resource                                ../App_Discuss/Discuss_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     稿件评论相关接口（许雁良）
...                                     作者：江宝敏

*** Variables ***
${ID}                                   346                 #查看热门评论的稿件
${ID0}                                  350                 #查看稿件无热门评论
${RESULT}                               346
${RESULT0}                              []
*** Keywords ***

*** Test Cases ***
查看稿件的热门评论列表列表数据，接口成功返回数据
    Get Discuss Hot                     ${ID}
    Should Be Equal As Strings          ${response_data.list[0].articleID}
    ...                                 ${RESULT}

查看稿件的热门评论不存在时，接口返回为空
    Get Discuss Hot                     ${ID0}
    Should Be Equal As Strings          ${response_data.list}
    ...                                 ${RESULT0}
