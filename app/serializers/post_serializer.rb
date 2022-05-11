class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :author_ip, :avarage_rate 
end
