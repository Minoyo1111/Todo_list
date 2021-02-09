require "rails_helper"

RSpec.describe "tasks", type: :request do
  before(:all) do
    @task = Task.create(title: "task from require spec")
  end
  it "#index" do
    get "/tasks"
    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
    expect(response.body).to include("任務名稱") 
    expect(response.body).to include("task from require spec")
  end
  it "#show" do
  get "/tasks/#{@task.id}"
  expect(response).to have_http_status(200)
  expect(response).to ren der_template(:show)
  expect(response.body).to include("任務標題")
  expect(response.body).to include("task from require spec") 
  end

end