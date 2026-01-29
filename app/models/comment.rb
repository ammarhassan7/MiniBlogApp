class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :body, type: String

  # ASSOCIATION
  belongs_to :post
  belongs_to :user
end