# Sencha::Touch2::Rails

This is a simple Rails asset pipeline gem packaging the [Sencha Touch
Framework](http://www.sencha.com/products/touch/) (GPL version). It is
loosely based on [ext\_rails\_shim](https://github.com/sakuro/ext_rails_shim), 
but without any Rails integration besides making the assets available to
the asset pipeline.

The currently bundled version is Sencha Touch 2.0.1.1 GPL

## Installation

Add this line to your application's Gemfile:

    gem 'sencha-touch2-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sencha-touch2-rails

## Usage

Just include the desired theme css file

    <%= stylesheet_include_tag 'sencha-touch2-rails/apple' %>

and JS file

    <%= javascript_include_tag 'sencha-touch2-rails/sencha-touch-all' %> 

Don't forget to add the chosen files to config.assets.precompile
    
    config.assets.precompile << 'sencha-touch2-rails/sencha-touch-all'
    config.assets.precompile << 'sencha-touch2-rails/apple.css'

Note: The sencha-touch-all\*.js versions should be used, as dynamic class
loading is incompatible with the asset pipeline.

## Rake task

You can fork this gem and run

    TOUCH_DIR=/path/to/sencha-touch-2.x.x.x rake sencha-touch2-rails:install

to rebuild Sencha Touch, i.e. when you built your own theme.

## License

[GPLv3](http://www.gnu.org/copyleft/gpl.html) like Sencha Touch.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
