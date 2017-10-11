class ArticlesController < ApplicationController
include ArticlesHelper

 before_action :require_login, except: [:index, :show]

def index
  @articles = Article.all.order(created_at: :desc)
  
  @articles_by_month = Article.all.order(created_at: :desc).group_by { |article| article.created_at.beginning_of_month }
end
def show
	@article = Article.find(params[:id])
	@comment = Comment.new
	@comment.article_id = @article_id
end
def new
	@article = Article.new
	@tags = Tag.all.map {|t| [t.name] }
	@categories = Category.all
	respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end

end
def create
	@article = Article.new(article_params)
	@article.category.name = params[:category_id]
	@article.save
	flash.notice = "Article '#{@article.title}' has Been Created."	

	redirect_to action: "index"
end
def destroy
	@article = Article.find(params[:id])
	@article.destroy
	@articles = Article.all
	

	flash.notice = "Article Deleted"

	redirect_to action: "index" 
end
def edit
	@article = Article.find(params[:id])
	@tags = Tag.all.map {|t| [t.name] }
	@categories = Category.all


end
def update
	@article = Article.find(params[:id])
	@article.update(article_params)

	flash.notice = "Your Article has Been Updated"

	redirect_to article_path(@article)
end
end
