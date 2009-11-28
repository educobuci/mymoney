class TagsController < InheritedResources::Base
    respond_to :html, :xml
    
    def new
		@tag = Tag.new
		render :action => "edit"
	end
    
    def update
        save
    end
    
    def create
        save
    end
    
    def save
        @tag = params[:id] ? Tag.find(params[:id]) : Tag.new(params[:tag])
        
        respond_to do |format|
			if params[:commit] == "Cancel"
				format.html { redirect_to :action => "index" }
			else
				if (params[:id] and @tag.update_attributes(params[:tag])) or @tag.save
					flash[:notice] = 'Tag was successfully saved.'
					format.html { redirect_to :action => "index" }
				else
					format.html { render :action => "new" }
				end
			end
		end
    end
end