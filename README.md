This repository contains a [Vale-compatible](https://github.com/errata-ai/vale) implementation of syntax rules adopted in the legal domain.

The goal is to build and maintain a full-featured style guide for Vale to be adopted by the legal community.

[![Build Status](https://app.travis-ci.com/PureLegalTech/LegalRules.svg?branch=main)](https://app.travis-ci.com/PureLegalTech/LegalRules) ![Vale version](https://img.shields.io/badge/vale-%3E%3D%20v2.5.15-blue.svg) [![license](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)

## Getting Started

> :exclamation: LegalRules requires Vale >= **2.5.15**. :exclamation:

Download the [latest release](https://github.com/PureLegalTech/LegalRules/releases), copy the "LegalRules" directory to your `StylesPath`, and include it in your configuration file:

```ini
# This goes in a file named either `.vale.ini` or `_vale.ini`.
StylesPath = path/to/some/directory
MinAlertLevel = warning # suggestion, warning or error

# Only Markdown and .txt files; change to whatever you're using.
[*.{md,txt}]
# List of styles to load.
BasedOnStyles = LegalRules
```

See [Usage](https://github.com/errata-ai/vale/#usage) for more information.

## Repository Structure

<dl>
  <dt><a href="https://github.com/PureLegalTech/LegalRules/tree/main/RuleBase"><code>/RuleBase</code></a></dt>
  <dd>The <a href="http://yaml.org/">YAML</a>-based rule implementations that make up our style.</dd>

  <dt><a href="https://github.com/PureLegalTech/LegalRules/tree/main/fixtures"><code>/fixtures</code></a></dt>
  <dd>The individual unit tests. Each directory should be named after a rule found in <code>/RuleBase</code> and include its own <code>.vale.ini</code> file that isolates its target rule.</dd>

  <dt><a href="https://github.com/PureLegalTech/LegalRules/tree/main/features"><code>/features</code></a></dt>
  <dd>The <a href="https://docs.cucumber.io/cucumber/step-definitions/">Cucumber Step Definitions</a> we use to test our fixtures. Essentially, we use the <a href="https://github.com/cucumber/aruba">aruba</a> framework to test Vale's output after running it on each of our fixture directories.</dd>
</dl>