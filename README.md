# Welcome To The StackUnderflow Challenge.

## Getting Started

These instructions will get the project up and running on your local machine for development.

1. Install the following prerequisites (using [Homebrew](https://brew.sh/) on macOS):

  * [ElasticSearch](https://www.elastic.co/guide/en/elasticsearch/guide/current/running-elasticsearch.html)

  ```bash
  $ brew install elasticsearch
  ```

  * [Redis](https://redis.io/topics/quickstart)

  ```bash
  $ brew install redis
  ```

  * [PostgreSQL](https://www.postgresql.org/)

  ```bash
  $ brew install postgresql
  ```
2. Fork the [Repository](https://github.com/FsDevNinja/StackUnderflow) and clone it to your local machine

3. Navigate to the cloned directory and install the Gem dependencies

  ```bash
  $ bundle install
  ```

4. Start system services

  * Start PostgreSQL

    ```bash
    $ brew services start postgresql
    ```

  * Start Elasticsearch

    ```bash
    $ brew services start elasticsearch
    ```

  * Start redis

    ```bash
    $ brew services start redis
    ```

  * Start Sidekiq

    ```bash
    $ bin/sidekiq
    ```

5. Create the development databases:

  ```bash
  $ bin/rails db:create db:migrate
  ```

6. Seed db with default data

  ```bash
  $ rake stack:seed_db
  ```
  _all default users are setup with a password as "password"_
