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

Contact.create([
  {
    email: "bob@munat.com",
    subject: "I love W Hub!",
    message: %{
      Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus.
      Cras ultricies ligula sed magna dictum porta. Nulla porttitor accumsan tincidunt.
      Donec sollicitudin molestie malesuada. Cras ultricies ligula sed magna dictum porta.
      Donec rutrum congue leo eget malesuada. Curabitur arcu erat, accumsan id imperdiet et,
      porttitor at sem. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.
      Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo,
      lacinia eget consectetur sed, convallis at tellus.
    }.squish,
    user: User.find_by(email: "bob@munat.com")
  }
])