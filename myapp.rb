require 'sinatra'
require "sinatra/base"

class MyApp < Sinatra::Base
	get '/hi' do
		erb :index
	end

	post '/sortit' do
		'Hello World'
	end
end