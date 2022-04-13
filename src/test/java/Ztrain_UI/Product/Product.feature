@debug
Feature: Product
  Karate: Run | Karate: Debug

  Background:
    * configure driver = { type: 'chrome', executable: 'D:\\Zenity\\Karate_Automation\\chrome.bat'}
    Given driver web_base_url+ '/home'
    * def emailField = "#email_login"
    * def passwordField = "#password_login"
    * def loginBtn = "#btn_login"
    And input(emailField,'237pk69@gmail.com')
    And input(passwordField,'Pawk/*69')
    And click(loginBtn)
    * waitUntil("document.readyState == 'complete'")
    * def article = ".style_card_body__QuFGN"
    * def cartBtn = "#style_btn_add_cart__gTXM7"

  @TEST_OF-830
  Scenario:Test Display the sheet of a product
    When scroll(article).click()
    * waitUntil("document.readyState == 'complete'")
    Then match driver.text(cartBtn) contains

  @TEST_OF-831
  Scenario:Test Add product to cart
    When scroll(article).click()
    And click(cartBtn)
    * waitUntil("document.readyState == 'complete'")
    Then match driver.text(cartBtn) contains "Ajouter au panier"

  @TEST_OF-833
  Scenario:Test Increasing the quantity of a product
    * def cartIcon = "#style_content_cart_wrapper__mqNbf"
    * def plus = ".style_quantity_in__XmF4D"
    When click(cartIcon)
    And click(plus)
    * waitUntil("document.readyState == 'complete'")
    Then match driver.text(cartBtn) contains "Ajouter au panier"