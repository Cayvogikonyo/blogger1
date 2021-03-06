class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
	belongs_to :category
	belongs_to :author
	validates :category, presence: true
	has_many :comments, dependent: :destroy
	has_many :taggings
	has_many :tags, through: :taggings, dependent: :destroy
	has_many :attachments, dependent: :destroy
	has_attached_file :image
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
def tag_list
	tags.join(", ")
end
def tag_list=(tags_string)
	tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
	new_or_found_tags = tag_names.collect {|name| Tag.find_or_create_by(name: name)}
	self.tags = new_or_found_tags
end
  def to_param
    [title.parameterize].join("-")
  end

end
