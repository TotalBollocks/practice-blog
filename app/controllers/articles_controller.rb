class ArticlesController < ApplicationController

	def show
    @article = current_resource
	end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    
    if @article.save
      flash[:notice] = "Article has been created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def edit
    @article = current_resource
  end
  
  def update
    @article = current_resource
    
    if @article.update(article_params)
      flash[:notice] = "Article has been updated"
      redirect_to @article
    else
      render 'new'
    end
  end
  
  private
    
    def article_params
      params.require(:article).permit(:title, :summary, :subject_id, :user_id)
    end
  
  def current_resource
    @current_resource ||= Article.find(params[:id]) if params[:id]
  end
end
