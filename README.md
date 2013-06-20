# ZippyFoods

Toy solution for mapping simple Hash to columlar table.

## Installation

Add this line to your application's Gemfile:

    gem 'zippy-foods'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zippy-foods

## Usage

As a library:

  require 'zippy_foods'
  data = {:en => %w[one two three],
          :jp => %w[ichi ni san shi go roku],
          :primes => [2, 3, 5, 7, 11, 13, 17, 19],}
  tablifier = ZippyFoods::Tablifier.new(data)
  tablifier.table.each do |row|
    puts row.join("\t")
  end

From the commandline:

  $ cd zippy-foods/dir
  $ cat some.json |./bin/tablify
  ### or equivalently as:
  $ ./bin/tablify some.json

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
