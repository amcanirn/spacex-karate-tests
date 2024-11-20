Feature: Validate SpaceX GraphQL API
  This feature tests the SpaceX GraphQL API for retrieving past **launchesPast**. 
  It validates the response structure, field types, and data correctness.

  Background:
  # Base URL for SpaceX API
  * url 'https://spacex-production.up.railway.app/'

  # Import the custom JavaScript time validator
  * def isValidTime = read('file:src/test/resources/lib/time-validator.js')

  @performance
  Scenario: Validate past launches GraphQL with limit argument response
    Given text query =
    """
    {
        launchesPast(limit: 5) {
          mission_name
          launch_date_utc
          rocket {
            rocket_name
          }
        }
    }
    """
    And request { query: '#(query)' }
    When method post
    Then status 200

    # Validate the launchesPast array has exactly 5 elements
    * match response.data.launchesPast == '#[5]'

    # Validate each launch has correct field types and valid time format
    * match each response.data.launchesPast == 
    """
      {
        "mission_name": "#string",
        "launch_date_utc": "#? isValidTime(_)",
        "rocket": {
          "rocket_name": "#string"
        }
      }
    """
