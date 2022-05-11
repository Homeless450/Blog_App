class RatingSerializer < ActiveModel::Serializer
  attributes :rate
  belongs_to :post
end
