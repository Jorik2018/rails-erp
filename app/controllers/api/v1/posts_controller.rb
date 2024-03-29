class Api::V1::PostsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    before_action :set_post, only: [:show, :update, :destroy]

    def index
      render json: Article.all
    end
  
    def show
      render json: @article
    end
  
    def create
      @article = Article.new(post_params)
  
      if @article.save
        render json: @article, status: :created
      else
        render json: @article.errors, status: :unprocessable_entity
      end
    end
  
    def update
        if @article.update(post_params)
            render json: @article
        else
            render json: @article.errors, status: :unprocessable_entity
        end
    end
  
    def destroy
        @article.destroy
        head :no_content
    end
  
    private
  
    def set_post
        @article = Article.find(params[:id])
    end
  
    def post_params
        params.require(:Article).permit(:title, :content)
    end

    def render_not_found_response
        render json: { error: "Artist Not Found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
