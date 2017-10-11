class User < ApplicationRecord
  belongs_to :author
  validates :author_id, presence: true

 def to_a
	
end
end
