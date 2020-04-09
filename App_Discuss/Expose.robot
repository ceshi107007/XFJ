*** Settings ***
Documentation                           文档是举报接口用例文档
Resource                                ../App_Discuss/Discuss_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     举报（许雁良）
...                                     作者：温怡春

*** Variables ***
${RESULT0}                              -1
${ROOTID} 								946
${ROOTID0}                              295
${USERID} 								103				
${USERNAME}								用户108
${REASON} 								举报理由填写
${TYPE} 								0 	        #举报类型
${SOURCETYPE} 							0 	
${SOURCETYPE0} 							1
${RESULT} 								true


*** Test Cases ***
评论举报成功
    Expose Discuss                 		${rootid} 
    ... 								${type} 
    ... 								${sourcetype}
    Fapi Status Should Be Succeed			
    Should Be Equal As Strings          ${response_data.value}
    ...							        ${result}

稿件举报成功
    Expose Discuss                 		${rootid0} 
    ... 								${type} 
    ... 								${sourcetype0}
    Fapi Status Should Be Succeed			
    Should Be Equal As Strings          ${response_data.value}       
    ... 							    ${result}

