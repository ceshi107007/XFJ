*** Settings ***
Documentation                           邀请码使用
Resource                                InviteCodeCommon.robot
Resource                                ../App_InviteCode/Random.robot
Force Tags                              新福建              邀请码接口（孙安）
...                                     作者：温怡春
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
*** Variables ***
${CODE0}                                8628775             #可用的邀请码
${CODE1}                                8888888             #无效的邀请码
${UID}                                  123                 #已被邀请过的会员
${IMEI}                                 429A9EC0-58DE-41D6-B79A-4E073350FA38
${RESULT0}                              1001
${RESULT1}                              1002
${RESULT2}                              1003
${MSG0}                                 该会员已被喵了个咪邀请过了
${MSG1}                                 该设备成功添加邀请码使用记录
${MSG2}                                 邀请码不存在
${MSG3}                                 该设备已被喵了个咪邀请过了


*** Keywords ***

*** Test Cases ***
该会员已添加过邀请码，邀请失败
    Code Imei Record                    ${code0}  
    ...                                 ${uid}    
    ...                                 ${imei}
    Fapi Request Should Be Succeed
    Should Be Equal As Strings          ${response_data.code}                   ${RESULT0}
    Should Be Equal As Strings          ${response_data.msg}                    ${MSG0}

该设备已添加过邀请码，邀请失败
    ${random_uid}=                      RandomUid
    Code Imei Record                    ${code0}  
    ...                                 ${random_uid}    
    ...                                 ${imei}
    Fapi Request Should Be Succeed
    Should Be Equal As Strings          ${response_data.code}                   ${RESULT0}
    Should Be Equal As Strings          ${response_data.msg}                    ${MSG3}

会员未被邀请过，成功添加邀请码使用记录
    ${random_uid}=                      RandomUid
    ${random_imei}=                     RandomImei
    Code Imei Record                    ${code0}  
    ...                                 ${random_uid}    
    ...                                 ${random_imei}
    Fapi Request Should Be Succeed
    Should Be Equal As Strings          ${response_data.code}                   ${RESULT1}
    Should Be Equal As Strings          ${response_data.msg}                    ${MSG1}

无效的邀请码，提示邀请码不存在
    Code Imei Record                    ${code1}  
    ...                                 ${uid}    
    ...                                 ${imei}
    Fapi Request Should Be Succeed
    Should Be Equal As Strings          ${response_data.code}                   ${RESULT2}
    Should Be Equal As Strings          ${response_data.msg}                    ${MSG2}




