class ArticlesController < ApplicationController
  
  def article
    @article = Post.find(params[:article_id])
    # @articles = Post.paginate(:page => params[:article_id], :per_page=>1)
  end

  def articles
    if user_signed_in?
        @articles = Post.all
    else
      redirect_to root_path
    end
  end

  private
    def set_article
      @article = Post.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:post).permit(:title, :description, :cover, :content, :created_at, :images)
    end
end
