require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: "Anything", email: "abc@email.com", password: "abc@1234") }
  describe "Associations" do
    it "has many questions" do
      assc = described_class.reflect_on_association(:questions)
      expect(assc.macro).to eq :has_many
    end
  
    it "has many answers" do
      assc = described_class.reflect_on_association(:answers)
      expect(assc.macro).to eq :has_many
    end
  end
  it "should downcase email before save" do
    subject.stub(:downcase_email).and_return(true)
  end
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a proper name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a proper email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a proper password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end
