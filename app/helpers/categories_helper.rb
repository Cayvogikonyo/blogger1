module CategoriesHelper
def category_params
	params.require(:category).permit(:name)
end
end
