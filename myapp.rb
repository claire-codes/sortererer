require 'sinatra'
require "sinatra/base"
require_relative 'lib/abc'

class MyApp < Sinatra::Base
	get '/hi' do
		erb :index
	end

	post '/sortit' do
		params[:name]
	end

	post '/goaway' do
		puts from_array_to_list(Abc.new.order_list(from_list_to_array(params[:name])))
		from_array_to_list(Abc.new.order_list(from_list_to_array(params[:name])))
	end
end

def from_list_to_array(list)
	list.split("\n")
end

def from_array_to_list(array)
	array.join("\n")
end