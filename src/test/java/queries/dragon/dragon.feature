Feature: Validate SpaceX GraphQL API
  This feature tests the SpaceX GraphQL API for retrieving **dragon** details 
  It validates the response structure, field types, and data correctness.

  Background:
  # Base URL for SpaceX API
  * url 'https://spacex-production.up.railway.app/'

  Scenario: Validate dragon field schema response
    * def query = read('file:src/test/resources/data/dragonsQuery.txt')
    * def responseSchema = read('file:src/test/resources/data/dragonsResponseSchema.json')
    And request { query: '#(query)' }
    When method post
    Then status 200
    * match response.data.dragon ==  responseSchema

  Scenario Outline: Validate dragon argument response
    # Data-Driven 
    Given text query =
    """
    {
      dragon(id: "<id>") {
        name
        type
        active
      }
    }
    """
    And request { query: '#(query)' }
    When method post
    Then status 200
    * match response.data.dragon == 
    """
      {
        "name": "#string",
        "type": "#string",
        "active": "#boolean"
      }
    """

    Examples:
      | id                        |
      | 5e9d058759b1ff74a7ad5f8f  |
      | 5e9d058859b1ffd8e2ad5f90  |
