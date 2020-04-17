*** Settings ***
Documentation                           活动报名
Resource                                ../App_Activity/Activity_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     活动/活动报名（丁希）
...                                     作者：张鹏

*** Variables ***
${FILEID0}                              305                 #活动未开始
${FILEID1}                              306                 #报名进行中
${FILEID2}                              307                 #活动进行中
${FILEID3}                              308                 #报名已结束
${FILEID4}                              5                   #活动已结束
${FILEID5}                              242                 #名额已满
${FILEID6}                              888                 #活动不存在
${USERID}                               571
*** Keywords ***

*** Test Case ***
活动未开始报名，接口未做限制可以直接报名成功
    Save Activity                       ${FILEID0}
    ...                                 ${USERID}
    Fapi Request Should Be Succeed

活动未开始报名开始报名成功
    Save Activity                       ${FILEID1}
    ...                                 ${USERID}
    Fapi Request Should Be Succeed

活动开始报名开始报名成功
    Save Activity                       ${FILEID2}
    ...                                 ${USERID}
    Fapi Request Should Be Succeed

活动进行中报名结束无法报名
    Save Activity                       ${FILEID3}
    ...                                 ${USERID}
    Fapi Request Should Be Succeed

活动结束无法报名
    Save Activity                       ${FILEID4}
    ...                                 ${USERID}
    Fapi Request Should Be Succeed

活动报名已满提示报名已满
    Save Activity                       ${FILEID5}
    ...                                 ${USERID}
    Fapi Request Should Be Succeed

当活动不存在时报名
    Save Activity                       ${FILEID6}
    ...                                 ${USERID}
    Fapi Request Should Be Succeed