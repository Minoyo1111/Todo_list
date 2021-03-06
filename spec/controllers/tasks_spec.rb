require 'rails_helper'


RSpec.describe TasksController, type: :controller do
  before(:all) do 
      @task_1 = FactoryBot.create(:task)
      @task_2 = FactoryBot.create(:task)
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
    before(:all) do 
        @task_params = {title: "title", description: "description"}
    end

    it "creates record" do 
        expect{ post :create, params:{ task: @task_params} }.to change{Task.all.size}.by(1)
    end

    it "redirect_to success" do
        post :create, params:{ task: @task_params}
        expect(response).not_to have_http_status(200)
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(tasks_path)
    end

    it "render new on fail" do
        allow_any_instance_of(Task).to receive(:save).and_return(false)
        post :create, params:{ task: @task_params}
        expect(response).not_to have_http_status(302)
        expect(response).to render_template(:new)
    end
  end

  describe "#update" do 
    before(:all) do 
       @task_params = {title: "title", description: "description"}
    end

    it "changes record" do 
       post :update, params: {task: @task_params, id: @task_2[:id]}
       expect(Task.find(@task_2[:id])[:title]).to eq("title")
    end
    it "redirect_to success" do
        post :update, params:{ task: @task_params, id: @task_2[:id]}
        expect(response).not_to have_http_status(200)
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(tasks_path)
    end
    it "render edit on fail" do
        allow_any_instance_of(Task).to receive(:update).and_return(false)
        post :update, params:{ task: @task_params, id: @task_2[:id]}
        expect(response).not_to have_http_status(302)
        expect(response).to render_template(:edit)
    end
  end

  describe "#destroy" do
    before(:each) do
      @task_3 = @task_2 || FactoryBot.create(:task)
    end
    it "destroy record" do
      expect{ delete :destroy, params:{ task: @task_params, id: @task_2[:id]} }.to change{Task.all.size}.by(-1)
    end

    it "redirect_to index after destroy" do
        delete :destroy, params:{ task: @task_params, id: @task_2[:id]}
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(tasks_path)
    end
  end

end