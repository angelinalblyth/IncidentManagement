require("pry-byebug")

require_relative('../models/user')
require_relative('../models/issue')

User.delete_all()
Issue.delete_all()

@user1 = User.new({
  "name" => "Angelina Blyth"
  })

@user2 = User.new({
  "name" => "Abigail Johnstone"
  })

@user3 = User.new({
  "name" => "Christy Whyte"
  })

@user4 = User.new({
  "name" => "Louise Reekie"
  })

@user1.save()
@user2.save()
@user3.save()
@user4.save()

@issue1 = Issue.new({
  "user_id" => @user1.id,
  "date" => "02/01/2019",
  "time" => "12:00:00",
  "incidentType" => "Networking",
  "description" => "Unable to connect to the network"
  })

@issue2 = Issue.new({
  "user_id" => @user4.id,
  "date" => "02/01/2019",
  "time" => "12:00:00",
  "incidentType" => "Networking",
  "description" => "Unable to connect to the network"
  })

  @issue3 = Issue.new({
    "user_id" => @user3.id,
    "date" => "05/01/2019",
    "time" => "10:00:00",
    "incidentType" => "Hardware",
    "description" => "Laptop is not powering on"
    })

  @issue4 = Issue.new({
    "user_id" => @user1.id,
    "date" => "03/01/2019",
    "time" => "12:35:00",
    "incidentType" => "Networking",
    "description" => "Unable to connect to the network"
    })

  @issue5 = Issue.new({
    "user_id" => @user2.id,
    "date" => "02/01/2019",
    "time" => "12:00:00",
    "incidentType" => "Software",
    "description" => "Unable to open up a document"
    })

@issue1.save()
@issue2.save()
@issue3.save()
@issue4.save()
@issue5.save()

issues = Issue.all()
users = User.all()

binding.pry
nil
