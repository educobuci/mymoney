class AccountsController < ApplicationController
	
	def index
		@accounts = Account.find(:all)
	end

	def transfer
		@accounts = Account.find(:all)
		@origin = Operation.new()
		@destiny = Operation.new()
	end
	
	def save_transfer
		
		# Get the data from form params
		@origin = Operation.new(params[:origin])
		@destiny = Operation.new(params[:destiny])
		
		# Fill the operations valeu
		@destiny.value = @origin.value
		@origin.value = @origin.value * (-1)
		
		# Fill the operations name
		@origin.name = "Trasfer to #{@destiny.account.bank}"
		@destiny.name = "Trasfer from #{@origin.account.bank}"
		
		if(@origin.save and @destiny.save)
			flash[:notice] = "Trasfer done successfully"
			redirect_to :controller => "operations", :action => "summary"
		else
			flash[:notice] = "Trasfer error"
			redirect_to :action => :transfer
		end
	end

	def show
		@account = Account.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.xml	{ render :xml => @account }
		end
	end
	
	def new
		@account = Account.new
	end

	def edit
		@account = Account.find(params[:id])
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
			@account = Account.find(params[:id])			
		else
			@account = Account.new(params[:account])
		end
			
		respond_to do |format|
			if params[:commit] == "Cancel"
				format.html { redirect_to :action => "index" }
	 		else
				if (params[:id] and @account.update_attributes(params[:account])) or @account.save
					flash[:notice] = 'Account was successfully updated.'
					format.html { redirect_to :action => "index" }
					format.xml	{ head :ok }
				else
					format.html { render :action => "new" }
					format.xml	{ render :xml => @account.errors, :status => :unprocessable_entity }
				end
			end
		end
	end
	
	def destroy
		@account = Account.find(params[:id])
		@account.destroy

		respond_to do |format|
			format.html { redirect_to(accounts_url) }
			format.xml	{ head :ok }
		end
	end
	
	def transfer
		
	end
end
