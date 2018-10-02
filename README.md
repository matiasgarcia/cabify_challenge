# CabifyChallenge

This is an implementation of Cabify's Ruby Challenge described [here](https://github.com/cabify/rubyChallenge).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cabify_challenge'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cabify_challenge

## Usage

Run `ruby bin/checkout.rb` and pass as arguments as many products as you want.
The promotion rules loaded are the ones described in https://github.com/cabify/rubyChallenge which are:

1) The marketing department believes in 2-for-1 promotions (buy two of the same product, get one free), and would like for there to be a 2-for-1 special on VOUCHER items.

2) The CFO insists that the best way to increase sales is with discounts on bulk purchases (buying x or more of a product, the price of that product is reduced), and demands that if you buy 3 or more TSHIRT items, the price per unit should be 19.00€.

For example:

````
> ruby checkout.rb VOUCHER TSHIRT VOUCHER VOUCHER MUG TSHIRT TSHIRT
Total: 74.5
````

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/matiasgarcia/cabify_challenge. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CabifyChallenge project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/cabify_challenge/blob/master/CODE_OF_CONDUCT.md).
