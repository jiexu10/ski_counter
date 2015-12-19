class Season < ActiveRecord::Base
  belongs_to :user

  validates :start_year, presence: true, numericality: { only_integer: true, message: 'Please enter valid 4-digit year.' }, length: { is: 4 }
  validates :end_year, presence: true, numericality: { only_integer: true }, length: { is: 4 }
  validates :user, presence: true

  def year_span
    "#{start_year}-#{end_year}"
  end
end
