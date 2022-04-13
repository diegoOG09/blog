class TagsController < ApplicationController
  def show
    @tags = Tag.all
  end
end
