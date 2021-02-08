class Task < ApplicationRecord
  # belongs_to :user
  validates :title, presence: true

  def self.no_description
    where(description: nil)
  end

  def abstract
    self.description[0..20]
  end

end
