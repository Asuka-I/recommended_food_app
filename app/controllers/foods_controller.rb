class FoodsController < ApplicationController
  def index
    @foods = Food.includes(:user).order(:created_at)
  end

  def new
    @food = Food.new
  end

  def create
    food = current_user.posts.create!(post_params)
    redirect_to food
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  private

  def food_params
    params.require(:post).permit(:content)
  end
end
