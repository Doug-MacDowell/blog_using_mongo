Class Post

  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  field   :_id, type: String, default: ->{ name.to_s.parameterize }
  field :title, type: String
  field  :body, type: String

  validates :title, presence: true
  validates :title, uniqueness: { conditions: -> { where(deleted_at: nil) } }

  embeds_many :comments

end
