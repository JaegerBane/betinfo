#!/usr/bin/env/ruby

require 'open3'
require 'json'


class ApiConnector


def login()

  stdin = ""
  stdout = ""
  stderr = ""

  Open3.popen3("curl -H \"Content-Type: application/json\" -X POST -d '{\"api_key\":\"KklyUtXD7NQb8oIYQDMBDw\",\"api_secret\":\"password\"}' http://api.sandbox.colossusbets.com/v2/sessions.json") do |stdin, stdout, stderr|
  
  result = stdout.read

  stdin.close
  stdout.close
  stderr.close

  tokens = JSON.parse(result)

  puts "Access Token: " + tokens['access_token']
  puts "Refresh Token: " + tokens['refresh_token']	


    end
  end

# doPostSessions - function for returning JSON result from /v2/sessions API call

def doPostSessions(api_params)
  
  postcommand = "curl -H \"Content-Type: application/json\" -X POST -d '#{api_params}' http://api.sandbox.colossusbets.com/v2/sessions.json"

  stdin = ""
  stdout = ""
  stderr = "" 

  Open3.popen3(postcommand) do |stdin, stdout, stderr|

  result = stdout.read

  stdin.close
  stdout.close
  stderr.close

  return result

    end
  end

# doGetSessions - function for determining if user is authorised

def doGetSessions()

  getcommand = "curl -i -H \"Accept: application/json\" \"http://api.sandbox.colossusbets.com/v2/sessions.json\""

  stdin = ""
  stdout = ""
  stderr = ""

  Open3.popen3(postcommand) do |stdin, stdout, stderr|

  result = stdout.read

  stdin.close
  stdout.close
  stderr.close

  return result

    end
  end

# doPutSessions - function for renewing a refresh token

def doPutSessions(token)

  end

end
