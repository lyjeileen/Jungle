require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    User.new(first_name: "First",
      last_name: "Last",
      email: "test@test.com",
      password: "1234",
      password_confirmation: "1234")
  }

  describe 'Validations' do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is invalid if password and password_confirmation don't match" do
      subject.password="12345"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include ("Password confirmation doesn't match Password")
    end

    it "is invalid if password and password_confirmation don't match" do
      subject.password_confirmation="12345"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include ("Password confirmation doesn't match Password")
    end

    it "is invalid if password's length is less than 4" do
      subject.password="1"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include ("Password is too short (minimum is 4 characters)")
    end

    it "is invalid without an email" do
      subject.email=nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include ("Email can't be blank")
    end
   
    it "is invalid if the email address has been used (case insensitive)" do
      user=User.create(first_name: "Amy",
        last_name: "Lin",
        email: "TEST@test.com",
        password: "123",
        password_confirmation: "123")
      expect(subject).to be_valid
      expect(user).to_not be_valid
    end

    it "is invalid without user's first name" do
      subject.first_name=nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include ("First name can't be blank")
    end

    it "is invalid without user's last name" do
      subject.last_name=nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include ("Last name can't be blank")
    end
  end

  describe '.authenticate_with_credentials' do
    it "returns correct user if email address and password are correct" do
      user=User.create(first_name: "First",
        last_name: "Last",
        email: "t@test.com",
        password: "1234",
        password_confirmation: "1234")
      expect(User.authenticate_with_credentials("t@test.com","1234")).to eq user
    end

    it "returns nil if email address is wrong" do
      user=User.create(first_name: "First",
        last_name: "Last",
        email: "t@test.com",
        password: "1234",
        password_confirmation: "1234")
      expect(User.authenticate_with_credentials("d@test.com","1234")).to eq nil
    end

    it "returns nil if password is wrong" do
      user=User.create(first_name: "First",
        last_name: "Last",
        email: "t@test.com",
        password: "1234",
        password_confirmation: "1234")
      expect(User.authenticate_with_credentials("t@test.com","1234567")).to eq nil
    end

    it "returns correct user if there's empty space before or after email address" do
      user=User.create(first_name: "First",
        last_name: "Last",
        email: "t@test.com",
        password: "1234",
        password_confirmation: "1234")
      expect(User.authenticate_with_credentials(" t@test.com ","1234")).to eq user
    end

    it "returns correct user if email is in the wrong case" do
      user=User.create(first_name: "First",
        last_name: "Last",
        email: "t@test.com",
        password: "1234",
        password_confirmation: "1234")
      expect(User.authenticate_with_credentials("t@TEST.com","1234")).to eq user
    end
    
  end
end