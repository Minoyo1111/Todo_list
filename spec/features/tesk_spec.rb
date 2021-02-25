require 'rails_helper'

RSpec.describe Task, type: :feature do
  describe 'sorting' do
    before do
      @tasks = []
      2.times do |index|
        task = FactoryBot.create(:task)
        @tasks << task
      end
      visit tasks_path
    end
    it 'by "created_at" DESC' do
      #table 標籤功能
      within ('table') do
        expect(page).to have_content(/#{@tasks[1][:title]}+#{@tasks[0][:title]}/)
      end
    end
  end
end
