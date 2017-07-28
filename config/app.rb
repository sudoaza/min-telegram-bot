require 'rubygems'
require 'bundler'
Bundler.require

require 'dotenv/load'
require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'])

require 'pry'
