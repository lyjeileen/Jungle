# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of learning Rails.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Screenshots
- Nav bar shows the name of logged-in user and contains the links to each category, logout and cart. All the products are shown in the product page and "Sold out" would appear if a product is out of stock.
!["Product page"](https://github.com/lyjeileen/Jungle/blob/master/docs/Product%20page.png?raw=true)

- Users can view and edit cart items in cart page. The number of cart items is shown on the nav bar. At bottom of the page, users can pay through Stripe.
!["Cart page"](https://github.com/lyjeileen/Jungle/blob/master/docs/Cart%20page.png?raw=true)

- After the user places an order, the order details will be shown
!["Order page"](https://github.com/lyjeileen/Jungle/blob/master/docs/Order%20page.png?raw=true)

- Administrator can log in and add or delete products. Same can be done for adding or deleting categories of products.
!["Admin product page"](https://github.com/lyjeileen/Jungle/blob/master/docs/Admin%20product%20page.png?raw=true)

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
