Feature: Get User by ID with complex validation

  Scenario: Get User by ID
    Given url 'https://jsonplaceholder.typicode.com'
    And path 'users', 1
    When method get
    Then status 200
    And match response ==
      """
      {
        id: '#number',
        name: '#string',
        username: '#notnull',
        email: '#regex (?i)[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,}',
        address: {
          street: '#string',
          suite: '##string',
          city: '#present',
          zipcode: '#regex [0-9]{5}-[0-9]{4}',
          geo: {
            lat: '#string',
            lng: '#string'
          }
        },
        phone: '#regex .*',
        website: '#string',
        company: {
          name: '#string',
          catchPhrase: '#ignore',
          bs: '#string'
        },
      }
      """