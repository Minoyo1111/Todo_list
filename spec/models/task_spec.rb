require 'rails_helper'

RSpec.describe Task, type: :model do
  it "validate title" do
    expect(Task.new).not_to be_valid
    expect(Task.new(title: "title")).to be_valid
  end

  it ".no_description" do
    task_with_description = Task.create(title: "title", description: "description")
    task_without_description = Task.create(title: "title", description: nil)
    expect(Task.no_description).to include task_without_description
    expect(Task.no_description).not_to include task_with_description
  end

  it "#abstract" do 
    task = Task.create(title: "title", description: "12345678912345678900yaya")
    expect(task.abstract).to include("12345678912345678900")
    expect(task.abstract).not_to include("yaya")
  end

end