Feature: Validate SpaceX GraphQL API
  This feature tests the SpaceX GraphQL API for retrieving **rockets** details 
  It validates the response structure, field types, and data correctness.

  Background:
  # Base URL for SpaceX API
  * url 'https://spacex-production.up.railway.app/'

  @performance
  Scenario: Validate Rockets Fields
    * def query = read('file:src/test/resources/data/rocketsQuery.txt')
    And request { query: '#(query)' }
    When method post
    Then status 200
    * match each response.data.rockets == 
    """
      {
        "id": "#regex [a-f0-9]+",
        "name": "#string",
        "description": "#string",
        "height": { "feet": "#number" },
        "cost_per_launch": "#number",
        "company": "#string",
        "first_flight": "#regex [0-9]{4}-[0-9]{2}-[0-9]{2}"
      }
    """
