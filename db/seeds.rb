User.destroy_all
Message.destroy_all
Registrant.destroy_all

Registrant.create([
  {
    email: "bob@munat.com",
    is_startup: true
  },
  {
    email: "sam@munat.com",
    is_startup: false
  },
  {
    email: "tim@munat.com",
    is_startup: false
  }
])

User.create([
  {
    name: "Charles F. Munat",
    email: "chas@munat.com",
    password: "!QAZxsw2",
    password_confirmation: "!QAZxsw2",
    is_admin: true,
    is_startup: false
  }
])