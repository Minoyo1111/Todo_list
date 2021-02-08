require 'rails_helper'

RSpec.describe Task, type: :model do
  it "validate title" do
    expect(Task.new).not_to be_valid
  end
end