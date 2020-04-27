# StaticDataEngine

## Introduction

StaticDataEngine is a Rails engine designed to manage static non-relational data by providing a query interface. It uses [Elasticsearch](https://www.elastic.co/products/elasticsearch) under the hood to index information.

It also supports mounting a search endpoint for searching against datasets.

## Installation

Add to Gemfile:

    gem 'static_data_engine'
    
Run generator:

    rails generate static_data_engine:initializer
    
To proceed, point your project's `ELASTICSEARCH_URL` environment variable to a functional elasticsearch cluster.

To mount Resources API:
    
In `routes.rb`, add:

    mount StaticDataEngine::Engine => '/<preferred mount path>'
   
## Usage

### Seeding Data

1. Data can be seeded by adding `.yml` files in your project's `lib/static_data_engine/data_sources` directory. Take a look at `example.yml` for a sample dataset

1. Run 
    
        StaticDataEngine::DataSeeder::Base.new.build_indexes!

### Querying for data

#### Library

To run a query, leverage on `StaticDataEngine::Query::Basic`

e.g For a dataset 'test_data' with tuples `{test_attribute: 'foo'}` and `{test_attribute: 'bar'}` 

    StaticDataEngine::Query::Basic.new('test_data', 'test_attribute:foo')
    => [{test_attribute: 'foo'}]
   
#### API
   
Assuming API is mounted at `/static_data/

    GET '/static_data/resources/search?query=test_attribute:foo&dataset=test_data

## Development
    
Clone the repository and run 

    bundle install

To run tests:

    rake test