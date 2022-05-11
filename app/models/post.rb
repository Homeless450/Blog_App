class Post < ApplicationRecord
  belongs_to :user
  has_many :ratings


  def avarage_rate
    ratings.average(:rate)
  end

end
