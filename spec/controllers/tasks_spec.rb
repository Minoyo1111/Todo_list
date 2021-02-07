require 'rails_helper'


RSpec.describe TasksController, type: :controller do
  before(:all) do 
    @task_1 = Task.create(title: "title_1", description: "description_1")
    @task_2 = Task.create(title: "title_2", description: "description_2")
  end
  #類別方法就用#字號，如果是實體方法就.字號
  it "#index" do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
  end

  it "#new" do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
  end

  it "#edit" do
      get :edit, params: {id: @task_1[:id]}
      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)
  end

  describe "#create" do 
  
  end


end