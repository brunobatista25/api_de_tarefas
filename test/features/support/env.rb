require 'rspec'
require 'cucumber'
require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'
require 'faker'
require 'byebug'

ENVIRONMENT_TYPE = ENV['ENVIRONMENT_TYPE']

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/data/#{ENVIRONMENT_TYPE}.yml")