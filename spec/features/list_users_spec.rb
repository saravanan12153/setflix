require 'spec_helper'

describe "Viewing the list of users" do

  it "shows the users" do
    user1 = User.create!(user_attributes(username: "subrat", name: "Subrat Rout", email: "subrat@example.com"))
    user2 = User.create!(user_attributes(username: "pete", name: "Pete Savage",   email: "sam@example.com"))
    user3 = User.create!(user_attributes(username: "daniel", name: "Daniel Rockemann", email: "daniel@example.com"))

    visit users_url

    expect(page).to have_link(user1.name)
    expect(page).to have_link(user2.name)
    expect(page).to have_link(user3.name)
  end
end
