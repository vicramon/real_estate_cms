Feature: Super admin

  Scenario: Super admin signs in
    Given 1 site
    And there is a super admin
    When I log in with valid super admin credentials
    Then I should be on the super admin dashboard
