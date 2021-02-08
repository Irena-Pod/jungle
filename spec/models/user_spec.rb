require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "is valid with all information properly completed" do
      user = User.create(
        name: "Mary Kate",
        email: "mary@kate.com",
        password: "test",
        password_confirmation: "test"
        )
      expect(user).to be_valid
      puts user.errors.full_messages
    end

    it "is invalid when password and password confirmation don't match" do
      user = User.create(
        name: "Mary Kate",
        email: "mary@kate.com",
        password: "test",
        password_confirmation: "mock"
        )
      expect(user).not_to be_valid
      puts user.errors.full_messages
    end


    it "is invalid if email already exists (not case sensetive)" do
      @user1 = User.create(
        name: "Mary Kate",
        email: "mary@kate.com",
        password: "test",
        password_confirmation: "test"
        )
      @user2 = User.create(
        name: "Mary Kate",
        email: "MARY@KATE.COM",
        password: "test",
        password_confirmation: "test"
        )
      expect(@user2).not_to be_valid
    end

    it "name can't be blank" do
      user = User.create(
        name: nil,
        email: "mary@kate.com",
        password: "test",
        password_confirmation: "test"
        )
      expect(user).not_to be_valid
      puts user.errors.full_messages
    end


    it "email can't be blank" do
      user = User.create(
        name: "Mary Kate",
        email: nil,
        password: "test",
        password_confirmation: "test"
        )
      expect(user).not_to be_valid
      puts user.errors.full_messages
    end

    it 'is valid if password is 4 characters or longer' do
      user = User.create(
        name: "Mary Kate",
        email: "mary@kate.com",
        password: "hihi",
        password_confirmation: "hihi"
        )
      expect(user).to be_valid
    end

    it 'is invalid if password is shorter than 4 characters' do
      user = User.create(
        name: "Mary Kate",
        email: "mary@kate.com",
        password: "hi",
        password_confirmation: "hi"
        )
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "is valid if user exists" do
      user = User.create(
        name: "Mary Kate",
        email: "mary@kate.com",
        password: "test",
        password_confirmation: "test"
        )
        login_user = User.authenticate_with_credentials("mary@kate.com", "test")
        expect(user).to eq login_user
    end

    it "is valid if user types whitespace in email field" do
      user = User.create(
        name: "Mary Kate",
        email: "mary@kate.com",
        password: "test",
        password_confirmation: "test"
        )
        login_user = User.authenticate_with_credentials("mary@kate.com   ", "test")
        expect(user).to eq login_user
    end

    it "is valid if user types email in wrong case" do
      user = User.create(
        name: "Mary Kate",
        email: "mary@kate.com",
        password: "test",
        password_confirmation: "test"
        )
        login_user = User.authenticate_with_credentials("Mary@KAte.com", "test")
        expect(user).to eq login_user
    end
  end
end
