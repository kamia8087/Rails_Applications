require 'rails_helper'

RSpec.describe Question, type: :model do
  let (:user) { User.new(:id => "1", :name => "User", :email => "jane@doe.com", :password => "pw@1234") }
  subject { described_class.new(content: "Who is the PM of India?", user: user, action: " ") }
  describe "Associations" do
    it { should belong_to(:user) }
  end
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a proper user_id" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a proper content" do
    subject.content = nil
    expect(subject).to_not be_valid
  end
end