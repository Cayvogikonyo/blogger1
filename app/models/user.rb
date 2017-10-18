class User < ApplicationRecord
  authenticates_with_sorcery!
  belongs_to :author
  validates :author_id, presence: true

 def to_a
	
end
end
