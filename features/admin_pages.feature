Feature: Admin manages pages

  Scenario: Admin views list of pages
    Given I am signed in as an admin
    And I have 2 pages
    When I follow "Pages"
    Then I should see those pages
