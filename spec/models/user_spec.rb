require 'spec_helper'

describe "A user" do
  it "requires a name" do
    user = User.new(name: "")
    user.valid?

    expect(user.errors[:name].any).to eq(true)
  end

  it "requires an email" do
    user = User.new(email: "")
    user.valid?

    expect(user.errors[:email].any).to eq(true)
  end

  it "rejects improperly formatted email address" do |variable|
    emails = %[@ user@ @example.com]
    emails.each do |email|
      user = User.new(email: email)
      user.valid?

      expect(user.errors[:email].any?).to eq(true)
    end
  end

  it "requires a unique, case insensitive email address" do
    user1 = User.create(user_attributes)

    user2 = User.new(email: user1.email.upcase)
    user2.valid?

    expect(user2.errors[:email].first).to eq("this email has already been taken")
  end

  it "is valid with example attributes" do
    user = User.new(user_attributes)

    expect(user.valid?).to eq(true)
  end

  it "requires a password" do
    user = User.new(password: "")

    user.valid?

    expect(user.errors[:password].any?).to eq(true)
  end

  it "requires a password confirmation in presence of a password" do
    user = User.new(password: "secret", password_confirmation: "")

    user.valid?
    expect(user.errors[:password_confirmation].any?).to eq(true)
  end

  it "requires the password to match the password_confirmation" do
    user = User.new(password: "secret", password_confirmation: "nomatch")

    user.valid?

    expect(user.errors[:password_confirmation].first).to eq("Passwords do not match")
  end

  it "requires a password and password_confirmation to match when creating new user" do
    user = User.create(user_attributes(password: "secret", password_confirmation: "secret"))

    expect(user.valid?).to eq(true)
  end

  it "does not reqire a  password when updating user" do
    user = User.create!(user_attributes)
    user.password = ""

    expect(user.valid?).to eq(true)
  end

  it "automatically encrypts the password into the password_digest attributes" do
    user = User.new(password: "secret")

    expect(user.password_digest.present?).to eq(true)
  end
end
