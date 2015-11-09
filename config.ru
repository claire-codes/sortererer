
require 'sass/plugin/rack'
require './list_sorter_app'

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

run ListSorterApp
