class DocsController < ApplicationController
    before_action :find_doc, only:[:show,:edit,:update, :destroy]
    
    
    def index
        @docu= Doc.where(user_id: current_user)#Doc.all.order('created_at ASC')
    end
    def new 
        @docu= current_user.docs.build #Doc.new
    end
    def create
         @docu=current_user.docs.build(doc_params) #Doc.new(doc_params)
         if @docu.save
             redirect_to @docu
         else
             render 'new'
         end
    end
    def show
    end
    
    def edit
    end
    def update 
        if @doc.update(doc_params)
            redirect_to @doc
        else
            render 'edit'
        end 
    end
    def destroy
        @docu.destroy
        redirect_to docs_path
    end
       
    private
        def find_doc
            @docu= Doc.find(params[:id])
        end
        def doc_params
            params.require(:doc).permit(:title,:content)
        end
       
end