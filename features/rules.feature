Feature: Rules

  Scenario Outline: Use of legal rules with single test phrase
    When I test "<rule>"
    Then the output should contain exactly:
      """
      test.md:<caretPosition>:RuleBase.<rule>:<message>
      """

    Examples:
      | rule                  | caretPosition | message                                                          |
      | AccordAndSatisfaction | 1:187         | Did the parties intend to agree to accord, novation, or release? |
      | ActionOrProceeding    | 1:8           | Avoid legal couplets                                             |
#      | Actively              | 1:22          | Omit 'actively', if it precedes an action                        |
      | Actual                | 1:48          | Omit 'actual' in contracts                                       |
      | Actually              | 1:40          | Avoid disagreement in contracts                                  |
      | Affirmative           | 3:10          | Avoid verbosity                                                  |
      | AffirmativeAction     | 1:10          | Avoid verbosity                                       |
      #| Affirmatively         | 1:13          | Omit 'affirmatively', if it precedes an action                   |
      | Allonge               | 1:11          | Did you mean amendment or indorsement certificate?               |
      | NegativeCovenants     | 1:15      | Avoid archaic language |

  Scenario Outline: Use of legal rules with two test phrases
    When I test "<rule>"
    Then the output should contain exactly:
      """
      test.md:<caretPositionFirst>:RuleBase.<rule>:<message>
      test.md:<caretPositionSecond>:RuleBase.<rule>:<message>
      """

    Examples:
      | rule | caretPositionFirst | caretPositionSecond | message |
      | AffirmativeCovenants  | 1:15   | 2:15      | Avoid archaic language |

  Scenario: Use of 'also'
    When I test "Also"
    Then the output should contain exactly:
      """
      test.md:1:13:RuleBase.Also:Omit 'also' in contracts
      test.md:2:13:RuleBase.Also:Omit 'in addition' in contracts
      """

  Scenario: Use of 'applicable plus verb'
    When I test "ApplicablePlusVerb"
    Then the output should contain exactly:
      """
      test.md:5:18:RuleBase.ApplicablePlusVerb:Consider using a verb instead
      test.md:7:10:RuleBase.ApplicablePlusVerb:Consider using a verb instead
      test.md:9:11:RuleBase.ApplicablePlusVerb:Consider using a verb instead
      test.md:13:18:RuleBase.ApplicablePlusVerb:Consider using a verb instead
      test.md:15:11:RuleBase.ApplicablePlusVerb:Consider using a verb instead
      test.md:17:11:RuleBase.ApplicablePlusVerb:Consider using a verb instead
      test.md:19:18:RuleBase.ApplicablePlusVerb:Consider using a verb instead
      test.md:23:5:RuleBase.ApplicablePlusVerb:Consider using a verb instead
      test.md:25:3:RuleBase.ApplicablePlusVerb:Consider using a verb instead
      test.md:29:18:RuleBase.ApplicablePlusVerb:Consider using a verb instead
      test.md:31:11:RuleBase.ApplicablePlusVerb:Consider using a verb instead
      test.md:33:11:RuleBase.ApplicablePlusVerb:Consider using a verb instead
      test.md:35:18:RuleBase.ApplicablePlusVerb:Consider using a verb instead
"""

# this test shall fail, when issue with --- delimiter and skip will be solved
  Scenario: Use of 'arbitrator inspection'
    When I test "ArbitratorInspection"
    Then the output should contain exactly:
      """
      """

  # this test shall fail, when issue with skip will be solved
  Scenario: Use of 'affirmatively'
    When I test "Affirmatively"
    Then the output should contain exactly:
      """
      """

  # this test shall fail, when issue with skip will be solved
  Scenario: Use of 'actively'
    When I test "Actively"
    Then the output should contain exactly:
      """
      """

  Scenario: Use of 'provided'
    When I test "Provided"
    Then the output should contain exactly:
      """
      test.md:3:30:RuleBase.Provided:Did you mean limitation(qualifiaction), exception or condition?
      test.md:5:30:RuleBase.Provided:Did you mean limitation(qualifiaction), exception or condition?
      test.md:7:30:RuleBase.Provided:Did you mean limitation(qualifiaction), exception or condition?
      test.md:9:30:RuleBase.Provided:Did you mean limitation(qualifiaction), exception or condition?
      test.md:11:30:RuleBase.Provided:Did you mean limitation(qualifiaction), exception or condition?
      test.md:13:30:RuleBase.Provided:Did you mean limitation(qualifiaction), exception or condition?
      test.md:15:30:RuleBase.Provided:Did you mean limitation(qualifiaction), exception or condition?
      test.md:17:30:RuleBase.Provided:Did you mean limitation(qualifiaction), exception or condition?
      test.md:20:30:RuleBase.Provided:Did you mean limitation(qualifiaction), exception or condition?
      test.md:22:30:RuleBase.Provided:Did you mean limitation(qualifiaction), exception or condition?
      test.md:24:30:RuleBase.Provided:Did you mean limitation(qualifiaction), exception or condition?
      test.md:26:30:RuleBase.Provided:Did you mean limitation(qualifiaction), exception or condition?
      test.md:28:30:RuleBase.Provided:Did you mean limitation(qualifiaction), exception or condition?
      test.md:30:30:RuleBase.Provided:Did you mean limitation(qualifiaction), exception or condition?
      test.md:32:30:RuleBase.Provided:Did you mean limitation(qualifiaction), exception or condition?
      test.md:34:30:RuleBase.Provided:Did you mean limitation(qualifiaction), exception or condition?
      """