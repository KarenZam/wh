User.destroy_all
Message.destroy_all
Registrant.destroy_all

Registrant.create([
  {
    email: "bob@munat.com",
    user_category: "startup"
  },
  {
    email: "sam@munat.com",
    user_category: "talent"
  },
  {
    email: "tim@munat.com",
    user_category: "talent"
  }
])

User.create([
  {
    email: "chas@munat.com",
    password: "!QAZxsw2",
    password_confirmation: "!QAZxsw2",
    is_admin: true,
    user_category: "talent"
  },
  {
    email: "chleozam@gmail.com",
    password: "!QAZxsw2",
    password_confirmation: "!QAZxsw2",
    is_admin: true,
    user_category: "startup"
  }
])