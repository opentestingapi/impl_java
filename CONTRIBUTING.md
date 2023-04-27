# Contributing to OTA

Thanks for your interest!

We've put together the following guidelines to help you figure out where you can best be helpful.

## Table of Contents

0. [Ground rules & expectations](#ground-rules--expectations)
0. [How to contribute](#how-to-contribute)
0. [Setting up your environment](#setting-up-your-environment)

## Ground rules & expectations

Before we get started, here are a few things we expect from you (and that you should expect from others):

* Be kind and thoughtful in your conversations around this project. We all come from different backgrounds and projects, which means we likely have different perspectives on "how open source is done." Try to listen to others rather than convince them that your way is correct.
* Check our backlog, maybe we are already working on it or the idea was already declined because of a valid reason. https://github.com/opentestingapi/backlog
* Stay compliant to used API version
* Please ensure that your contribution passes all tests if you open a pull request. If there are test failures, you will need to address them before we can merge your contribution.
* Sonar Quality - we do expect no bugs, vulnerabilities and severity with Major or above
* Think about our users when doing technology upgrades - we might have users running older infrastructure - this is not an invitation to sleep through upgrades, but we need to pay attention to compatibility and information transparency.
* When adding content, please consider if it is widely valuable. Please don't add references or links to things you or your employer have created, as others will do so if they appreciate it.

## How to contribute

* Backlog check / creation of the idea / bug / whatever
* Create your branch and do it, do not forget test cases
* Test it ('mvn test' and 'mvn clean install -Psystemtest')
* Check Sonar and fix bugs, vulnerabilities and Severity with Major or above (community ruleset)

If you don't see your idea listed, and you think it fits into the goals of this product, open a pull request.

## Setting up your environment

https://github.com/opentestingapi/impl_java#development-environment
