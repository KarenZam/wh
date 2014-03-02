Subscriber.destroy_all
Registrant.destroy_all
Contact.destroy_all
User.destroy_all
Organization.destroy_all

Subscriber.create([
  {
    email: "tom@munat.com"
  },
  {
    email: "tad@munat.com"
  },
  {
    email: "tim@munat.com"
  }
])

User.create([
  {
    username: "chasm",
    email: "chas@munat.com",
    password: "!QAZxsw2",
    password_confirmation: "!QAZxsw2",
    is_admin: true,
    is_active: true
  },
  {
    username: "chleozam",
    email: "chleozam@gmail.com",
    password: "!QAZxsw2",
    password_confirmation: "!QAZxsw2",
    is_admin: true,
    is_active: true
  },
  {
    username: "bobby",
    email: "bob@munat.com",
    password: "!QAZxsw2",
    password_confirmation: "!QAZxsw2",
    is_admin: false,
    is_active: true
  },
  {
    username: "sammy",
    email: "sam@munat.com",
    password: "!QAZxsw2",
    password_confirmation: "!QAZxsw2",
    is_admin: false,
    is_active: false
  }
])