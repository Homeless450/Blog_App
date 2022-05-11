class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :author_ip 
  has_one :rating
end
