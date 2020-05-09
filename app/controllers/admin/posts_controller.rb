class Admin::PostsController < AdminController
  def posts
  end

  def edit
  end

  def new
  end

  private

  def posts_params
    params.require(:post).permit()
  end
end
