# Bcalc

Ruby bindings to C library Bridge Calculator http://bcalc.w8.pl

## Installation

`$ gem install bcalc`

## Usage

```ruby
Bcalc::Calculator.new(
  deal: "N:.63.AKQ987.A9732 A8654.KQ5.T.QJT6 J973.J98742.3.K4 KQT2.AT.J6542.85",
  declarer: "N",
  suit: "NT"
).calculate
```

or low level:

```ruby
solver = Bcalc::Lib.bcalcDDS_new(
  "PBN",
  "N:.63.AKQ987.A9732 A8654.KQ5.T.QJT6 J973.J98742.3.K4 KQT2.AT.J6542.85",
  Bcalc::Lib::BCALC_NT,
  Bcalc::Lib::BCALC_PLAYER_NORTH
)
Bcalc::Lib.bcalcDDS_getTricksToTake(solver)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/morgoth/bcalc.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

It uses compiled version of C library by Piotr Beling which uses:

```
Bridge Calculator (and its C API) is freeware for private and non-commercial use (use to develop freeware applications) and it's distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Each distributed product which use this API/library should includes readable for end-user information about this fact and link to Bridge Calculator web-page: http://bcalc.w8.pl/
```
