class Api::V1::BlogsController < ApplicationController
  def index
    blogs = Blog.order(created_at: :desc)
    render json: blogs, each_serializer: BlogSerializer, key_transform: :camel_lower
  end

  def create
    blog = Blog.new(blog_params)
    if blog.save
      head :ok
    else
      head :bad_request
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
