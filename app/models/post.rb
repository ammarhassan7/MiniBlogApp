class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :body, type: String

  belongs_to :user

  # ASSOCIATION
  has_many :comments, dependent: :destroy # Deletes comments if post is deleted
end