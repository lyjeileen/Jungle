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
    end

    it "is invalid if password's length is less than 4" do
      subject.password="1"
      expect(subject).to_not be_valid
    end

    it "is invalid without an email" do
      subject.email=nil
      expect(subject).to_not be_valid
    end

    it "is invalid without user's first name" do
      subject.first_name=nil
      expect(subject).to_not be_valid
    end
    it "is invalid without user's last name" do
      subject.last_name=nil
      expect(subject).to_not be_valid
    end

  end
end