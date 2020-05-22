*** Settings ***
Documentation                           积分管理模块业务关键字
Resource                                ../Common/Common.robot
Library                                 OperatingSystem
Library                                 String
Library                                 Upload.py
Force Tags                              冒烟集-新福建         积分管理（孙安）
...                                     作者：张鹏


*** Variables ***


*** Keywords ***
Upload1
    [Documentation]                     积分行为入库
    [Arguments]                         ${userid}
    ${data} =                           upload              ${userid}
    Set Suite Variable                  ${response_data}    ${data}


