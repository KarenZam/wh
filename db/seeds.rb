Subscriber.destroy_all
Registrant.destroy_all
Contact.destroy_all
User.destroy_all
Organization.destroy_all

chasm = User.create(
  username: "chasm",
  email: "chas@munat.com",
  password: "!QAZxsw2",
  password_confirmation: "!QAZxsw2",
  is_admin: true,
  is_active: true
)

chleozam = User.create(
  username: "chleozam",
  email: "chleozam@gmail.com",
  password: "!QAZxsw2",
  password_confirmation: "!QAZxsw2",
  is_admin: true,
  is_active: true
)