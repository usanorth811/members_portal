# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

#csv_text = File.read(Rails.root.join('lib', 'seeds', 'billing_contact.csv'))
#csv = CSV.parse(csv_text.scrub, headers: true)
#csv.each do |row|
#  t = BillingContact.new
#  t.name = row ['name']
#  t.email = row ['Email']
#  t.addr = row ['addr']
#  t.company_id = row ['company_id']

#  t.save
#end

#puts "There are now #{BillingContact.count} rows in the table"
AdminUser.create!(email: 'caleb.woods@usanorth811.org', password: 'password', password_confirmation: 'password') if Rails.env.production?