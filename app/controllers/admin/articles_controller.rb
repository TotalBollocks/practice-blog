class Admin::ArticlesController < Admin::BaseController

	def new
		@article = Article.new
	end

	def show
		@article = Article.find params[:id]
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			flash[:notice] = "You created a article"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			flash[:notice] = "You have updated the article"
      redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		article = Article.find params[:id]
		article.destroy
		flash[:notice] = "You have deleted the article"
		redirect_to root_path
	end

	private

	def article_params
    params.require(:article).permit(:title, :summary, :subject_id, :user_id, sections_attributes: [:id, :article_id, :content, :_destroy])
	end

end
