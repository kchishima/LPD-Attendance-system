# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admins = [
    { first_name: "朝田", last_name: "健一", member_id: "A-000000", email: "admin1@example.com", password: "admin1@example.com" },
    { first_name: "Yamada", last_name: "Hanako", member_id: "A-000001", email: "admin2@example.com", password: "admin2@example.com" },
  ]

admins.each do |admin|
  # 一度Adminをメールアドレスで検索
  admin_data = Admin.find_by(email: admin[:email])
  # 該当Adminがいなければ、createする
  if admin_data.nil?
    Admin.create(
      first_name: admin[:first_name],
      last_name: admin[:last_name],
      member_id: admin[:member_id],
      email: admin[:email],
      password: admin[:password]
    )
  end
end