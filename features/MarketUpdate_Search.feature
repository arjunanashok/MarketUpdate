Feature: As a User I would like to do search for a news in the
  Market update NL website and like to add some comments against news

  Scenario: Market update NL search for a news
    Given I am in home page
    When I search for a news in market update nl website
    Then am shown with news related to my search

  Scenario: Market update NL user views the page
    When I am in home page
    Then am shown 6 main menus
    And am shown 10 news menus
    And am shown email send option
    And am shown 2 youtube videos
    And shown twitter option
    And  am shown popular and comments tab
    And am shown poll options
    And am shown all ads at the top


  Scenario Outline: Market update NL user views each news menu item
    Given I am in home page
    When I click "<news_menu>" item
    Then am shown "<news_menu_details>"
  Examples:
    | news_menu         | news_menu_details   |
    | GOUD EN ZILVER    | Goud en Zilvermarkt |
    | ECONOMIE          |   Economie          |
    | GRONDSTOFFEN      | Grondstoffen        |
    | VALUTA            |  Valutacrisis       |
    | FINANCIËLE MARKTEN|  Financiële markten |
    | COLUMNS           | Columns             |
    | VIDEO             | Video               |
    |DOSSIERS           |  Dossiers           |
    | ENGLISH           | English             |
