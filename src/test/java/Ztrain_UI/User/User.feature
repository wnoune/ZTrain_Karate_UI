@debug
Feature: User
  Karate: Run | Karate: Debug

    Background:
      * configure driver = { type: 'chrome', executable: 'C:\\Users\\Pawk69\\Documents\\Zenity-Offshore\\chrome.bat'}
      Given driver web_base_url+ '/auth/login'
      * def loginBtn = "#btn_login"
      * def errorField = ".style_messageError__LxTAG"

  @TEST_OF-808
  Scenario Outline:Test successful login with credentials
    * def emailField = "#email_login"
    * def passwordField = "#password_login"
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
    * def errorField = ".style_messageError__LxTAG"
    When click(loginBtn)
    * waitUntil("document.readyState == 'complete'")
    Then match driver.text(errorField) contains "Email ou mot de passe incorrect"

  @TEST_OF-809
  Scenario Outline:Test the login field
    * def emailField = "#email_login"
    And input(emailField,'<email>')
    When click(loginBtn)
    * waitUntil("document.readyState == 'complete'")
    Then match driver.text(errorField) contains "Email ou mot de passe incorrect"

      Examples:
        |email         |
        |237pk69@gmail |

  @TEST_OF-810
  Scenario Outline:Test password reset
    * def forgetPass = ".style_forgotpass__PRHm_"
    * def emailResetField = "#email_reset_pass"
    * def passResetField = "#reset_password"
    * def resetBtn = "#btn_reset_password"
    * def connexion = ".style_header_title_form__sxS9B"
    When click(forgetPass)
    * waitUntil("document.readyState == 'complete'")
    And input(emailResetField,'<email>')
    And input(passResetField,'<newPass>')
    And click(resetBtn)
    Then match driver.text(connexion) contains "Connexion"

    Examples:
      |email            |newPass |
      |237pk69@gmail.com|Pawk/*69|


