class Blog < ApplicationRecord
    # Enum give a ability to change state very quickly with the data
  enum status: { draft: 0, published: 1 } # default = draft = 0 then can switch to published = 1
  extend FriendlyId
  friendly_id :title, use: :slugged

    # Validation ต้องใส่ title, body ตอน create, update
  validates_presence_of :title, :body

  belongs_to :topic
end
