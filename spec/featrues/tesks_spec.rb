require 'rails_helper'

RSpec.describe Task, type: :feature do
  describe 'sorting' do
    before do
      @tasks = []
      3.times do |index|
        task = FactoryBot.create(:task)
        @tasks << task
      end

      visit tasks_path
    end
  end
end