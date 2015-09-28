#!/usr/bin/env/ruby

require 'net/https'
require 'net/http'
require 'uri'
require 'json'
require 'csv'
require 'open3'
require File.expand_path(File.dirname(__FILE__) + '/ApiConnector.rb') 


@example = ""

def go()

  puts "Running...."

  handshake = ApiConnector.new()

  handshake.login()

end


go

