class OperationsController < ApplicationController

	def index
		format.html { redirect_to :action => "summary" }
	end
	
	def summary
		if !params[:date].nil?
			@filter_date = Date.new(params[:date][:year].to_i, params[:date][:month].to_i)
		elsif !params[:year].nil? and !params[:month].nil?
			@filter_date = Date.new(params[:year].to_i, params[:month].to_i)
		else
			@filter_date = Date.today.at_beginning_of_month
		end
		@accounts = Account.find(:all)
	end

	def show
		@operation = Operation.find(params[:id])
	end

	def new
		@operation = Operation.new
	end

	def edit
		@operation = Operation.find(params[:id])
		render :action => "new"
	end

	def create
		save
	end

	def update
		save
	end
	
	def save
		if(params[:id])
			@operation = Operation.find(params[:id])
		else
			@operation = Operation.new(params[:operation])
		end
	
		respond_to do |format|
			if params[:commit] == "Cancel"
				format.html { redirect_to :action => "summary" }
			else
				@operation.tags.clear
				@operation.tags << Tag.persiste(params[:tags])
				
				if (params[:id] and @operation.update_attributes(params[:operation])) or @operation.save
					flash[:notice] = 'Operation was successfully saved.'
					format.html { redirect_to :action => "summary" }
				else
					format.html { render :action => "new" }
				end
			end
		end		
	end

	def destroy
		@operation = Operation.find(params[:id])
		@operation.destroy

		respond_to do |format|
			flash[:notice] = 'Operation was successfully removed.'
			format.html { redirect_to :action => "summary" }
		end
	end
end