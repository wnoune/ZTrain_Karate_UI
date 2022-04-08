@debug
Feature: Login user
  Karate: Run | Karate: Debug

    Background:
      * configure driver = { type: 'chrome', executable: 'C:\\Users\\Pawk69\\Documents\\Zenity-Offshore\\chrome.bat'}

  @TEST_OF-808
  Scenario Outline:Test successful login with credentials
    Given driver web_base_url+ '/auth/login'
    * fullscreen()
    * def emailField = "#email_login"
    * def passwordField = "#password_login"
    * def loginBtn = "#btn_login"
    And input(emailField,'<email>')
    And input(passwordField,'<password>')
    When click(loginBtn)
    * waitUntil("document.readyState == 'complete'")
    Then match driver.url == 'https://ztrain-web.vercel.app/home'

      Examples:
        |email            |password|
        |237pk69@gmail.com|Pawk/*69|

  @TEST_OF-806
  Scenario:Test login and password fields required
    Given driver web_base_url+ '/auth/login'
    * fullscreen()
    * def errorField = ".style_messageError__LxTAG"
    * def loginBtn = "#btn_login"
    When click(loginBtn)
    Then match driver.text(errorField) contains "Email ou mot de passe incorrect"


