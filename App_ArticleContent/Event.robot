*** Settings ***
Documentation     该文档是稿件点赞接口用例文档
Resource          						../App_ArticleContent/Event_Common.robot  
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions 
Force Tags                              冒烟集-新福建APP     提交互动事件（许雁良）  
...                                     作者：温怡春  

*** Variables ***
${ID}             						295
${CHANNEL}        						2    #客户端
${CHANNEL0}      					    1    #触屏
${RESULT}       					    true

*** Test Cases ***
客户端详情点赞
    Article Like Event   		 		${id} 
    ...								    ${channel}
    Fapi Status Should Be Succeed
    Should Be Equal As Strings     		${response_data.value}  
    ...								    ${result}

触屏详情点赞
    Article Like Event   		 		${id} 
    ...								    ${channel0}
    Fapi Status Should Be Succeed
    Should Be Equal As Strings     		${response_data.value}  
    ...								    ${result}
