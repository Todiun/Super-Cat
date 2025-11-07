# Super Cat

A small Rails marketplace for cats — browse available cats, view details, add to cart and checkout.

This project was built as an exercise for [The Hacking Project](https://www.thehackingproject.org/).

## Quick overview

- Users can browse cats, see details and prices.
- Authentication is provided (Devise).
- A simple cart flow stores chosen items (session or server-side) and a Stripe Checkout integration is available for payments.
- UI is Bootstrap-based and assets are served via Propshaft (Rails defaults).

## Requirements

- Ruby 3.4.2
- Rails 8.0.4
- SQLite (development) or Postgres/MySQL (production)
- Bundler

## Local setup (development)

1. Install dependencies

```bash
gem install bundler
bundle install
```

2. Database

```bash
bin/rails db:create db:migrate db:seed
```

The seed file creates demo users and cats so you can explore the app immediately.

3. Credentials / environment

- The repo contains `config/master.key` for encrypted credentials in this workspace. In general, set ENV variables for your Stripe keys:

```bash
export STRIPE_SECRET_KEY=sk_test_...
export STRIPE_PUBLISHABLE_KEY=pk_test_...
```

4. Start the server

```bash
bin/rails server
```

Open http://localhost:3000

## Running tests

```bash
bin/rails test
```

## Notes

- The app uses a `price_cents` integer column on `cats` to store prices (in cents). If you see missing prices, run the seeds or backfill values.
- The checkout controller expects either `params[:item_id]` for single-item checkout or a list of cat ids in `session[:cart]` for multi-item checkout.
- Replace Stripe keys in environment variables when deploying to production.

If you'd like, I can add a short CONTRIBUTING section or CI/test instructions next.

