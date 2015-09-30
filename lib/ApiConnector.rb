#!/usr/bin/env/ruby

require 'open3'
require 'json'


class ApiConnector

# ApiConnector class - provides individual functions that use curl commands to communicate with ColossusBets API
# All commands return unparsed JSON result when ran, so that class can be invoked in controllers to retrieve data

# login - testing function for curl commands

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

# doGetPools - function for pulling back all live pools (grouped or ungrouped)

def doGetPools(token, ungrouped)

  getcommand = "curl --header \"Authorization: Bearer #{token}\" --include --request GET http://api.sandbox.colossusbets.com/v2/pools.json?ungrouped=#{ungrouped}"

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

# doGetPoolByID - function for pulling back pool via ID

def doGetPoolByID(token, id)

  getcommand = "curl --header \"Authorization: Bearer #{token}\" --include --request GET http://api.sandbox.colossusbets.com/v2/pools/#{id}.json"

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

# doGetPoolSmartPick - function for pulling back smart picks for a given pool ID

def doGetPoolSmartPick(token, id, lines)

  getcommand = "curl --header \"Authorization: Bearer #{token}\" --include --request GET http://api.sandbox.colossusbets.com/v2/pools/#{id}/smart_pick.json?lines=#{lines}"

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

# doGetPoolSettlement - function for returning list of tickets that require settlement after pool closes

def doGetPoolSettlement(token, id, payout_filter)

 getcommand = "curl --header \"Authorization: Bearer #{token}\" --include --request GET http://api.sandbox.colossusbets.com/v2/pools/#{id}/settlement.json"

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

# doPostPoolNotifications - function for notifying ColossusBets after pool closes

def doPostPoolNotifications(token, id)

 postcommand = "curl --header \"Authorization: Bearer #{token}\" --include --request POST http://api.sandbox.colossusbets.com/v2/pools/#{id}/settlement.json"

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

# doGetTickets - function for returning customer tickets, using defaults

def doGetTickets(token, customer_id)

 getcommand = "curl --header \"Authorization: Bearer #{token}\" --include --request GET http://api.sandbox.colossusbets.com/v2/tickets.json?customer_id=#{customer_id}"

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

# doGetTicketsOptions - function for returning customer tickets using options

 def doGetTicketsOptions(token, customer_id, type, from_date, to_date, page, per)

  getcommand = "curl --header \"Authorization: Bearer #{token}\" --include --request GET http://api.sandbox.colossusbets.com/v2/tickets.json?customer_id=#{customer_id}&type=#{type}&from_date=#{from_date}&to_date=#{to_date}&page=#{page}&per=#{per}"
 
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

# doGetTicketByID - function for returning ticket via ticket ID

 def doGetTicketByID(token, ticket_id)
 
  getcommand = "curl --header \"Authorization: Bearer #{token}\" --include --request GET http://api.sandbox.colossusbets.com/v2/tickets/#{ticket_id}.json"

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

# doPostBuyTicket - function for purchasing tickets

 def doPostBuyTickets(token, customer_id, pool_id, selections, stake, cost, currency, poc)

  postcommand = "curl --header \"Authorization: Bearer #{token}\" --include --request POST http://api.sandbox.colossusbets.com/v2/tickets.json?customer_id=#{customer_id}&pool_id=#{pool_id}&selections=#{selections}&stake=#{stake}&cost=#{cost}&currency=#{currency}&poc=#{poc}" 

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

# doPostBuyTicketMerchant - function for purchasing tickets with merchant ID

 def doPostBuyTickets(token, merchant_id, customer_id, pool_id, selections, stake, cost, currency, poc)

  postcommand = "curl --header \"Authorization: Bearer #{token}\" --include --request POST http://api.sandbox.colossusbets.com/v2/tickets.json?merchant_id=#{merchant_id}&customer_id=#{customer_id}&pool_id=#{pool_id}&selections=#{selections}&stake=#{stake}&cost=#{cost}&currency=#{currency}&poc=#{poc}"

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

# doGetPoolOffersByID - function for pulling back all available offers for specific pool

 def doGetPoolOffersByID(token, pool_id)

  getcommand = "curl --header \"Authorization: Bearer #{token}\" --include --request GET http://api.sandbox.colossusbets.com/v2/pools/#{pool_id}/offers.json"
 
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

# doGetOffer - function for pulling back single offer by ID 

 def doGetOffer(token, offer_id)

  getcommand = "curl --header \"Authorization: Bearer #{token}\" --include --request GET http://api.sandbox.colossusbets.com/v2/offers/#{offer_id}.json"

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

# doPostOffer - function for accepting an offer

 def doPostOffer(token, offer_id, accept_fraction, remaining_fraction, accept_amount, merchant_offer_acceptance_ref)

  postcommand = "curl --header \"Authorization: Bearer #{token}\" --include --request POST http://api.sandbox.colossusbets.com/v2/offers/#{offer_id}/accept.json?accept_fraction=#{accept_fraction}&remaining_fraction=#{remaining_fraction}&accept_amount=#{accept_amount}&merchant_offer_acceptance_ref=#{merchant_offer_acceptance_ref}"

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

# doGetUpdates - function for pulling back offer updates after a certain time

 def doGetUpdates(token, from_date)
 
  getcommand = "curl --header \"Authorization: Bearer #{token}\" --include --request GET http://api.sandbox.colossusbets.com/v2/updates.json?from_date=#{from_date}"
 
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


end
