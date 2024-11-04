class PostingbooksController < ApplicationController
    def index
        if params[:search] == nil
            @postingbooks= Postingbook.all
        elsif params[:search] == ''
            @postingbooks= Postingbook.all
        else
            @postingbooks = Postingbook.where("author LIKE ? ",'%' + params[:search] + '%')
        end
    end
    def new
      @postingbook = Postingbook.new
    end   
    def create
        postingbook = Postingbook.new(postingbook_params)
        postingbook.user_id = current_user.id
        if postingbook.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    def show
      @postingbook = Postingbook.find(params[:id])
      @postingbooks= Postingbook.all
    end
    def destroy
        postingbook = Postingbook.find(params[:id])
        postingbook.destroy
        redirect_to action: :index
    end
    def edit
      @postingbook = Postingbook.find(params[:id])
    end
    def update
      postingbook = Postingbook.find(params[:id])
      if postingbook.update(postingbook_params)
        redirect_to :action => "show", :id => postingbook.id
      else
        redirect_to :action => "new"
      end
    end
    
      private
      def postingbook_params
        params.require(:postingbook).permit(:title, :author, :released_year, :image)
      end
end
