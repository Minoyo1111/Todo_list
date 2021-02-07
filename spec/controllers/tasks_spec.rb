require 'rails_helper'
before(:all) do 
  @task_1 = Task.create(title: "title_1", description: "description_1")
  @task_2 = Task.create(title: "title_2", description: "description_2")
end

RSpec.describe TasksController do
  describe "#index" do
    it "response is success" do
      get :index

      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
    end
  end

  describe "#new" do
    it "response is success" do
      get :new

      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe "#edit" do
    it "response is success" do
      get :edit, id: @task_1[:id]

      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)
    end
  end
end