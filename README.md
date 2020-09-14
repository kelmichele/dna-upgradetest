<!-- # README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

CSV.foreach("db/locationadd.csv", headers: true) do |row|
	Location.create! row.to_hash.except(%w{type latitude longitude})
end

CSV IMPORTS
require 'csv'
filename = File.join Rails.root, "xl_states.csv"
CSV.foreach(filename, headers: true) do |row|
  town = Town.create!(townname: row["townname"], state_id: row["state_id"])
end


To turn list into db entry without CSV:
<% $i = 0 %>
<% tag = $i +=1 %>
<td>town<%= "#{tag}"%>  = Town.create(townname: "<%= town.townname %>", state_id: "<%= town.state_id %>")</td> -->
