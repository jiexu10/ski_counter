class Season < ActiveRecord::Base
  belongs_to :user

  def year_span
    "#{start_year}-#{end_year}"
  end
end
