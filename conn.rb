require 'rubygems'
require 'mongo'

client = Mongo::Client.new(['127.0.0.1:27017'], :database => 'tutorial')

Mongo::Logger.logger.level = ::Logger::ERROR #Set Logger to display Errors

users = client[:users]

client.collections.each { |coll| puts coll.name } #Shows what collections in Tutorial DB

users.find().each do |user|
    puts user
end

smith = {"last_name" => "smith", "age" => 30} #Create 2 user hashes 
jones = {"last_name" => "jones", "age" => 40}

smith_id = users.insert_one(smith) #Insert
jones_id = users.insert_one(jones)

users.find("age"=> {"$gt"=> "20"}).each do |row| #Cursor to go through each row and return users with age > 20
    puts row
end

users.find({"last_name" => "smith"}).to_a
users.find({"age" => {"$gt" => 30}}).to_a