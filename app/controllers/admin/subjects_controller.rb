class Admin::SubjectsController < Admin::BaseController
	def index
		# @subjects added w/ filter
	end

	def show
		@subject = Subject.find(params[:id])
	end

	def new
		@subject = Subject.new
	end

	def create
		@subject = Subject.new(subject_params)

		if @subject.save
			flash[:notice] = "You created a subject"
			redirect_to admin_subjects_path
		else
			render 'new'
		end
	end

	def edit
		@subject = Subject.find(params[:id])
	end

	def update
		@subject = Subject.find(params[:id])

		if @subject.update(subject_params)
			flash[:notice] = "You have updated the subject"
			redirect_to admin_subjects_path
		else
			render 'edit'
		end
	end

	def destroy
		subject = Subject.find params[:id]
		subject.destroy
		flash[:notice] = "You have deleted the subject"
		redirect_to root_path
	end

	private

	def subject_params
		params.require(:subject).permit(:name)
	end
end
