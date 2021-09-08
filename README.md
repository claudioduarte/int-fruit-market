# International Fruit Market

![International Fruit Market](https://i.imgur.com/9EJsFde.png)

The objective of this exercise is to implement a platform that allows the stock management of fruit products in an international market.

#### Prerequisites

The setups steps expect following tools installed on the system.

- PostgreSQL 12
- Ruby 2.7.1
- Rails 6.1.3
- Webpack 5
- Puma 5

## Installation

#### 1. Clone the repository

```bash
git clone https://github.com/claudioduarte/international-fruit-market.git
```

or, if you prefer, via SSH (recommended)

```bash
git clone git@github.com:claudioduarte/international-fruit-market.git
```

#### 2. Install all of your gem dependencies

```ruby
bundle install
```

#### 3. Install yarn packages

```ruby
yarn install
```

#### 4. Start PostgreSQL

Start PostgreSQL in your local machine if not yet running.

```ruby
service postgresql start
```

#### 5. Create and setup the database

```ruby
rake db:create
```

#### 6. Load the Schema

```ruby
rake db:schema:load
```

#### 7. Seed the database to create Users, Fruits, and Vendors

```ruby
rake db:seed
```

#### 8. Start the Rails server

You can start the rails server in a development environment using the command given below.

```ruby
rails s
```

#### 9. Start Webpack Development Server

You can start the webpack-dev-server in a development environment using the command given below in a separate terminal.

```ruby
ruby ./bin/webpack-dev-server
```

#### 10. View the project

You can visit the website using the following URL: [http://localhost:3000](http://localhost:3000)

## License & Copyright
Licensed under the [MIT License](LICENSE). ©2021 Cláudio Duarte
