*** Settings ***
Library           AppiumLibrary
Library    ../.venv/Lib/site-packages/robot/libraries/Process.py
Test Teardown     Close Application

*** Variables ***
${SAUCE_USERNAME}    oauth-t58034552-4bd4f
${REMOTE_URL}    https://${SAUCE_USERNAME}:%{SAUCE_ACCESS_KEY}@ondemand.us-west-1.saucelabs.com:443/wd/hub

${num1}    5
${num2}    5

${num3}    9
${num4}    3

${num5}    5
${num6}    5

${num7}    9
${num8}    3


*** Test Cases ***
Operações Calculadora
    Open Application    ${REMOTE_URL} 
    ...    platformName=Android    
    ...    appium:platformVersion=13    
    ...    appium:deviceName=Samsung Galaxy A23 5G    
    ...    appium:deviceOrientation=portrait    
    ...    appium:app=storage:filename=Calculator_8.4 (503542421)_APKPure.apk    
    ...    appium:appPackage=com.google.android.calculator    
    ...    appium:appActivity=com.android.calculator2.Calculator    
    ...    browserName=    
    ...    appium:ensureWebviewsHavePages=${True}    
    ...    appium:nativeWebScreenshot=${True}      
    ...    appium:newCommandTimeout=${3600}    
    ...    appium:connectHardwareKeyboard=${True}
   
   
    ${btn_num1} =    Set Variable     accessibility_id=${num1}
    Click Element    ${btn_num1}
    ${Soma} =    Set Variable         accessibility_id=plus
    Click Element    ${Soma}
    ${btn_num2} =    Set Variable     accessibility_id=${num2}
    Click Element    ${btn_num2}
    ${igual} =    Set Variable        accessibility_id=equals
    Click Element    ${igual}
    ${resultado} =    Get Text        id=com.google.android.calculator:id/result_final
    ${esperado} =    Evaluate         str(${num1} + ${num2})
    Should Be Equal As Strings        ${resultado}    ${esperado}
    ${limpar} =    Set Variable       accessibility_id=clear
    Click Element    ${limpar}

    ${btn_num3} =    Set Variable     accessibility_id=${num3}
    Click Element    ${btn_num3}
    ${diminuir} =    Set Variable     accessibility_id=minus
    Click Element    ${diminuir}
    ${btn_num4} =    Set Variable     accessibility_id=${num4}
    Click Element    ${btn_num4}
    ${igual} =    Set Variable        accessibility_id=equals
    Click Element    ${igual}
    ${resultado} =    Get Text        id=com.google.android.calculator:id/result_final
    ${esperado} =    Evaluate         str(${num3} - ${num4})
    Should Be Equal As Strings        ${resultado}    ${esperado}
    ${limpar} =    Set Variable       accessibility_id=clear
    Click Element    ${limpar}

    ${btn_num5} =    Set Variable        accessibility_id=${num5}
    Click Element    ${btn_num5}
    ${multiplicar} =    Set Variable     accessibility_id=multiply
    Click Element    ${multiplicar}
    ${btn_num6} =    Set Variable        accessibility_id=${num6}
    Click Element    ${btn_num6}
    ${igual} =    Set Variable           accessibility_id=equals
    Click Element    ${igual}
    ${resultado} =    Get Text           id=com.google.android.calculator:id/result_final
    ${esperado} =    Evaluate            str(${num5} * ${num6})
    Should Be Equal As Strings           ${resultado}    ${esperado}
    ${limpar} =    Set Variable          accessibility_id=clear
    Click Element    ${limpar}

    ${btn_num7} =    Set Variable     accessibility_id=${num7}
    Click Element    ${btn_num7}
    ${dividir} =    Set Variable      accessibility_id=divide
    Click Element    ${dividir}
    ${btn_num8} =    Set Variable     accessibility_id=${num8}
    Click Element    ${btn_num8}
    ${igual} =    Set Variable        accessibility_id=equals
    Click Element    ${igual}
    ${resultado} =    Get Text        id=com.google.android.calculator:id/result_final
    ${esperado} =    Evaluate         round(${num7} / ${num8})
    Should Be Equal As Strings        ${resultado}    ${esperado}
    ${limpar} =    Set Variable       accessibility_id=clear
    Click Element    ${limpar}