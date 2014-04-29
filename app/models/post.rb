class Post

  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

# Paranoia and Versioning frameworks were removed from Mongoid 4.0

  field   :_id, type: String, default: -> { title.to_s.parameterize }
  field :title, type: String
  field  :body, type: String

  validates :title, presence: true
  validates :title, uniqueness: { conditions: -> { where(deleted_at: nil) } }

  embeds_many :comments

end
