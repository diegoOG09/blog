class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show ]

  def show
    @arts = Post.friendly.find(params[:id])
    # @article = Post.find(params[:id])
  end

  def articles
    if user_signed_in?
      @articles = Post.all.paginate(:page => params[:page], :per_page=>10)
    else
      redirect_to root_path
    end
  end

  private
    def set_article
      @art = Post.friendly.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:post).permit(:title, :description, :cover, :content, :created_at, :images)
    end
end
