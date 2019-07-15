require 'rails_helper'

RSpec.describe Answer, type: :model do
  let (:user) { User.new(:id => "1", :name => "User", :email => "jane@doe.com", :password => "pw@1234") }
  let (:question) { Question.new(:id => "1", :content => "What is your name?", user: user )}
  subject { described_class.new(content: "My name is something", user: user, question: question, action: " ") }
  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:question) }
  end
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a proper user_id" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a proper question_id" do
    subject.question_id = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a proper content" do
    subject.content = nil
    expect(subject).to_not be_valid
  end
end