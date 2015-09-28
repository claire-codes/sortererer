require 'sinatra'
require 'sinatra/base'
require_relative 'lib/abc'

class MyApp < Sinatra::Base
	get '/' do
		erb :index
	end

	post '/sortit' do
		Abc.new.order_list(params[:unsorted])
	end
end

