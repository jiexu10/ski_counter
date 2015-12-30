class Day < ActiveRecord::Base
  belongs_to :season

  validates :date, presence: true
  validates :location, presence: true
  validates :season, presence: true

  def date_string
    date.to_s
  end
end
