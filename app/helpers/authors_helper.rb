module AuthorsHelper

def name_for(author)
	author.user.body if author.user.present?
end

end
