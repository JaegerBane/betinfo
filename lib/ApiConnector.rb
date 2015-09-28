#!/usr/bin/env/ruby

require 'open3'
require 'json'


class ApiConnector


def login()

  stdin = ""
  stdout = ""
  stderr = ""

  Open3.popen3("curl -H \"Content-Type: application/json\" -X POST -d '{\"api_key\":\"KklyUtXD7NQb8oIYQDMBDw\",\"api_secret\":\"password\"}' http://api.sandbox.colossusbets.com/v2/sessions") do |stdin, stdout, stderr|
  
#  puts "stdin is:" + stdin.read
  puts "stdout is:" + stdout.read
  puts "stderr is:" + stderr.read

  result = JSON.parse(stderr)

  end
end

end
