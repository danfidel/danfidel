# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

def random_boolean
  [false, true][rand(2)]
end

%w(huey louie dewey).each do |username|
  User.create!(:username              => username,
               :password              => "password",
               :password_confirmation => "password",
               :producer              => random_boolean,
               :director              => random_boolean,
               :actor                 => random_boolean)
end
