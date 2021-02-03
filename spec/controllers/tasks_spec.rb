require 'rails_helper'

RSpec.describe TasksController do
  describe "#index" do
    it "response is success" do
      get :index

      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
    end
  end
end