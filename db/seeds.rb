# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  Group::User.create(
      login: 'root',
      password: '123',
      state: 'active',
      admin: 'true',
      group_id: 1
  )

  Setting.create(
      per_page: 10,
      pages_interval: '10 20 30 40 50'
  )