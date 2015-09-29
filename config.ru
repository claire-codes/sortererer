
require 'sass/plugin/rack'
require "./myapp"

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

run MyApp