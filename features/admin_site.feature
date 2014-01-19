Feature: Admin for site manages site

  Scenario: Site admin logs in
    Given I am a site admin
    When I visit the sign in path for my site
    And I fill out the sign in form
    Then I should be on my site's dashboard
