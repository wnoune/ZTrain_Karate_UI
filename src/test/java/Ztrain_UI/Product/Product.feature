@debug
Feature: Product
  Karate: Run | Karate: Debug

  Background:
    * configure driver = { type: 'chrome', executable: 'C:\\Users\\Pawk69\\Documents\\Zenity-Offshore\\chrome.bat'}
    Given driver web_base_url+ '/home'
    * def emailField = "#email_login"
    * def passwordField = "#password_login"
    * def loginBtn = "#btn_login"
    And input(emailField,'237pk69@gmail.com')
    And input(passwordField,'Pawk/*69')
    And click(loginBtn)
    * waitUntil("document.readyState == 'complete'")

  @TEST_OF-806
  Scenario:Test Display the sheet of a product
    * def article = ".style_card_body__QuFGN"
    * def cartBtn = "#style_btn_add_cart__gTXM7"
    When scroll(article).click()
    * waitUntil("document.readyState == 'complete'")
    Then match driver.text(cartBtn) contains "Ajouter au panier"
