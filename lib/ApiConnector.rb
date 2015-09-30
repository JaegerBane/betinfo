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

def doPostSessions(api_key, api_secret)
  
  postcommand = "curl -H \"Content-Type: application/json\" -X POST -d '{\"api_key\":\"#{api_key}\",\"api_secret\":\"#{api_secret}\"}' http://api.sandbox.colossusbets.com/v2/sessions.json"

  stdin = ""
  stdout = ""
  stderr = "" 

  Open3.popen3(postcommand) do |stdin, stdout, stderr|

  result = stdout.read

  stdin.close
  stdout.close
  stderr.close

  #output = JSON.parse(result)

  puts output  

  return result



    end
  end

# doGetSessions - function for determining if user is authorised

def doGetSessions(token)

  getcommand = "curl --header \"Authorization: Bearer #{token}\" --include --request GET http://api.sandbox.colossusbets.com/v2/sessions.json"

  stdin = ""
  stdout = ""
  stderr = ""

  Open3.popen3(getcommand) do |stdin, stdout, stderr|

  result = stdout.read

  stdin.close
  stdout.close
  stderr.close

  return result

    end
  end

# doPutSessions - function for renewing a refresh token

def doPutSessions(refresh_token)

  putcommand = "curl -v -H \"Content-Type: application/json\" -X PUT -d '{\"refresh_token\":\"#{refresh_token}\"}' http://api.sandbox.colossusbets.com/v2/sessions.json"

  stdin = ""
  stdout = ""
  stderr = ""

  Open3.popen3(putcommand) do |stdin, stdout, stderr|

  result = stdout.read

  stdin.close
  stdout.close
  stderr.close

  return result

  end	


end

# doDeleteSessions - function for logging out

def doDeleteSessions(token)

  deletecommand = "curl --header \"Authorization: Bearer #{token}\" --include --request DELETE http://api.sandbox.colossusbets.com/v2/sessions.json"

  stdin = ""
  stdout = ""
  stderr = ""

  Open3.popen3(deletecommand) do |stdin, stdout, stderr|

  result = stdout.read

  stdin.close
  stdout.close
  stderr.close

  return result

  end
 end




end
