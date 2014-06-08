class Admin::SectionsController < Admin::BaseController
	before_action :set_article, only: [:new, :edit]
	
	def new
		@section = Section.new
	end

	def create
		@section = Section.new(section_params)

		if @section.save
			flash[:notice] = "You created a section"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		@section = Section.find(params[:id])
	end

	def update
		@section = Section.find(params[:id])

		if @section.update(section_params)
			flash[:notice] = "You have updated the section"
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def destroy
		section = Section.find params[:id]
		section.destroy
		flash[:notice] = "You have deleted the section"
		redirect_to root_path
	end

	private

	def section_params
		params.require(:section).permit(:content, :article_id)
	end

	def set_article
		@article = Article.find(params[:article_id])
	end

end
