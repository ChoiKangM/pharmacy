# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(nickname: "Admin", email: '111@111.com', password: "111111")
User.create(nickname: "Manager",email: '222@222.com', password: "222222")
User.create(nickname: "Newbie", email: '333@333.com', password: "333333")
(1..100).each do |t|
  Notice.create(title: "#{t}", content: "#{t}", user_id: (t % 3 + 1))
  Nreply.create(content: "하하#{t}", user_id: ((t + 1) % 3 + 1), notice_id: t)
end