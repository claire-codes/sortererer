require 'sinatra'
require "sinatra/base"
require_relative "lib/abc"

class MyApp < Sinatra::Base
	get '/hi' do
		erb :index
	end
end