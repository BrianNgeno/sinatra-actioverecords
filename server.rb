
require 'sinatra'
require "sinatra/activerecord"

set :database, {adapter: "sqlite3", database: "sinatra.sqlite3"}

class User < ActiveRecord::Base
end

get '/' do
  erb :index
end
post '/users' do
  @user = User.find_or_create_by(name:params[:name], email: params[:email]).to_json
  erb :user
end
get '/users' do
 @users = User.all
 erb :users 
end 
