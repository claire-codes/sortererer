require 'sinatra'
require 'sinatra/base'
require_relative 'lib/abc'

class MyApp < Sinatra::Base
	get '/' do
		erb :index
	end

	post '/sortit' do
		Abc.new.order_list(params[:unsorted], ascii: to_boolean(params[:ascii]), reverse: to_boolean(params[:reverse]))
	end

	def to_boolean(str)
      str.downcase == 'true'
    end
end

