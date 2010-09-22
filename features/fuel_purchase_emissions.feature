Feature: Fuel Purchase Emissions Calculations
  The fuel purchase model should generate correct emission calculations

  Scenario Outline: Standard Calculations for fuel purchase classes from fuel type and cost
    Given a fuel purchase has "fuel_type.name" of "<fuel_type>"
    And it has "cost" of "<cost>"
    When emissions are calculated
    Then the emission value should be within "0.1" kgs of "<emission>"
    Examples:
      | fuel_type                   | cost   | emission |
      | Industrial Coking Coal      | 100.0  |  2089.1  |
      | Residential Natural Gas     | 100.0  |   454.9  |
      | Kerosene                    | 100.0  |   379.8  |
      | Conventional Motor Gasoline | 100.0  |   479.1  |

  Scenario: Default fuel purchase emission
    Given a fuel purchase has "emission" of ""
    When emissions are calculated
    Then the emission value should be within "0.1" kgs of "100"
