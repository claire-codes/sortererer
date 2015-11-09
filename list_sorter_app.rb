require 'sinatra'
require 'sinatra/base'
require 'tilt/erb'
require_relative 'lib/list_sorter'

class ListSorterApp < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/sortit' do
    ListSorter.new.order_list(
      params[:unsorted],
      ascii: to_boolean(params[:ascii]),
      reverse: to_boolean(params[:reverse])
    )
  end

  def to_boolean(str)
    str.downcase == 'true'
  end
end
