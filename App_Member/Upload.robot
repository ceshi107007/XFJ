*** Settings ***
Documentation                           该文档是附件上传接口用例文档
Resource                                MemberCommon.robot
Force Tags                              冒烟集-新福建APP     附件上传（许雁良）
...                                     作者：黄羽
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions

*** Variables ***
${USERID}                               494
${NAME1}                                filename1.jpg
${NAME2}                                filename2.mp3
${RESULT1}                              success

*** Keywords ***

*** Test Case ***
上传附件
    Upload File                         ${USERID}
    ${filelist}                         Get From Dictionary                     ${response_data}    fileList
    ${filename1}                        Get From Dictionary                     ${filelist}[0]      fileName
    ${filename2}                        Get From Dictionary                     ${filelist}[1]      fileName
    Should Be Equal As Strings          ${filename1}        ${NAME1}
    Should Be Equal As Strings          ${filename2}        ${NAME2}