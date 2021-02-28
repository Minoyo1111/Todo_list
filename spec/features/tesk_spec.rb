require 'rails_helper'

RSpec.describe Task, type: :feature do
  describe 'sorting' do
    before do
      @tasks = []
      3.times do |index|
        task = FactoryBot.create(:task)
        # p task
        @tasks << task
      end
      visit tasks_path
    end
    it 'by "created_at" DESC' do
      #針對 table 這個標籤裡的東西進行測試
      within ('table') do
        expect(page).to have_content(/#{@tasks[2][:title]}.+#{@tasks[1][:title]}.+#{@tasks[0][:title]}/)
      end
    end
  end
end
