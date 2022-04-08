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

  Scenario: Use of 'amidst', 'amongst', 'whilst'
    When I test "AmidstAmongstWhilst"
    Then the output should contain exactly:
      """
      test.md:1:1:RuleBase.AmidstAmongstWhilst:Avoid archaic language
      test.md:3:13:RuleBase.AmidstAmongstWhilst:Avoid archaic language
      test.md:5:1:RuleBase.AmidstAmongstWhilst:Avoid archaic language
      test.md:7:1:RuleBase.AmidstAmongstWhilst:Avoid archaic language
      """

  Scenario: Use of contractions in legal prose
    When I test "Contractions"
    Then the output should contain exactly:
      """
      test.md:3:1:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:3:7:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:3:16:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:3:25:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:3:31:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:3:40:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:3:47:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:3:57:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:3:65:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:3:71:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:3:78:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:3:84:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:3:91:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:3:99:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:3:107:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:3:113:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:3:120:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:3:127:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:3:135:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:3:142:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:3:151:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:3:159:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:7:2:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:8:2:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:9:2:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:10:2:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:11:3:RuleBase.Contractions:Safer to avoid contractions in legal prose
      test.md:12:2:RuleBase.Contractions:Safer to avoid contractions in legal prose
      """

  Scenario: Use of plain legal English
    When I test "PlainLegalEnglish"
    Then the output should contain exactly:
      """
      test.md:3:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:4:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:5:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:6:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:7:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:8:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:9:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:10:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:11:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:12:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:13:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:14:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:15:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:16:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:17:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:18:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:19:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:20:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:21:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:22:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:23:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:24:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:25:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:26:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:27:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:28:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:29:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:30:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:31:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:32:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:33:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:34:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:35:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:36:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:37:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:38:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:39:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:40:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:41:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:42:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:43:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:44:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:45:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:46:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:47:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:49:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:50:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:51:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:52:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:53:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:54:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:55:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:56:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:57:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:58:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:59:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:60:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:61:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:62:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:63:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:64:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:65:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:66:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:67:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:68:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:69:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:70:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:72:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:73:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:74:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:75:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:76:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:77:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:78:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:79:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:80:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:81:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:82:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:83:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:84:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:85:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:86:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:87:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:88:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:89:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:90:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:91:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:92:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:93:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:94:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:95:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:96:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:97:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:98:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:99:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:100:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:101:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:102:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:103:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:104:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:105:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:106:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:107:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:108:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:109:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:110:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:111:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:112:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:113:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:114:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:115:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:116:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:117:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:118:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:119:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:120:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:121:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:122:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:123:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:124:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:125:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:126:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:127:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:128:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:129:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:130:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:131:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:132:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:133:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:134:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:135:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:136:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:137:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:138:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:139:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:140:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:141:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:142:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:143:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:144:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:145:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:146:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:147:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:148:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:149:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:150:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:151:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:152:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:153:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:154:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:155:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:156:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:158:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:160:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:162:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:164:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:166:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:168:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:170:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:171:1:RuleBase.PlainLegalEnglish:Use plainer word
      test.md:172:1:RuleBase.PlainLegalEnglish:Use plainer word
      """