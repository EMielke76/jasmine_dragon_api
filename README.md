# [Jasmine Dragon API](https://github.com/EMielke76/jasmine_dragon_api)
![languages](https://img.shields.io/github/languages/top/emielke76/jasmine_dragon_api?color=red)
![PRs](https://img.shields.io/github/issues-pr-closed/emielke76/jasmine_dragon_api)
![rspec](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![simplecov](https://img.shields.io/gem/v/simplecov?color=blue&label=simplecov) <!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/contributors-1-orange.svg?style=flat)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

## Table of contents
- [Overview](#overview)
- [Challenge Specs](#challenge-specs)
- [Database Schema](#db-schema)
- [API Docs](#api-docs)
- [Setup](#setup)
- [Technologies](#technologies)
- [Contributors](#contributors)

## <ins>Overview</ins>

A REST API webservice built to facilitate subscriptions to a tea-delivery service. Tea information is provided to the mock-front end via consumption of an external API found [here](https://tea-api-vic-lo.herokuapp.com/) 

This project is a technical challenge presented by the Turing School of Software and Design. Original specs and requirements may be found [here](https://mod4.turing.edu/projects/take_home/take_home_be)

### <ins>Challenge Specs</ins>
At a minimum, the following functionality must be built:
- An endpoint to subscribe a customer to a tea subscription
- An endpoint to cancel a customer’s tea subscription
- An endpoint to see all of a customer’s subsciptions (active and cancelled)

### <ins>DB Schema</ins>
![image](https://user-images.githubusercontent.com/81482407/163424555-7d254e18-ec58-4ad1-b2b7-1a25ebb7571a.png)

### <ins>API Docs</ins>
Click [here](https://documenter.getpostman.com/view/19300850/Uyr4Kffb) to see the documentation related to this API, including example request and response payloads. 

### <ins>Setup</ins>
1. Fork and Clone the repo
2. Install gem packages: `$ bundle install`
3. Setup the database: `$ rails db:{drop,create,migrate,seed}`
4. Run `$ bundle exec rspec` to run the full test suite.
*note* If there is an error when running the test suite related to `VCR Cassettes`, navigate to the `spec` directory and delete the `fixtures` directory found within. This should alleviate any issues related to the `VCR` API mock-calls. 
5. Open a server with `$ rails s`

### <ins>Technologies</ins>

#### Versions
- Ruby 2.7.2
- Rails 5.2.5

#### Development tools employed 
- [Faraday](https://lostisland.github.io/faraday/)
- [PostgreSQL](https://www.postgresql.org/)
- [Postman](https://www.postman.com/)
- [Ruby on Rails](https://rubyonrails.org/)


#### Languages
- Ruby

#### Testing tools
- [Pry](http://pry.github.io/)
- [RSPEC](https://rspec.info/)
- [Shoulda Matchers](https://matchers.shoulda.io/)
- [Simplecov](https://github.com/simplecov-ruby/simplecov)
- [VCR](https://relishapp.com/vcr/vcr/docs)
- [Webmock](https://github.com/bblimke/webmock)

#### Development Principles
- OOP
- TDD
- MVC
- REST

### <ins>Contributors</ins>
- [Eric Mielke](https://github.com/EMielke76)
