class PostsController < ApplicationController
  # def index # retieves all post records

  #   if !params[:author].blank? && !params[:date].blank?

  #     if params[:date] == "Today"
  #       @posts = Post.by_author(params[:author]).from_today
  #     else
  #       @posts = Post.by_author(params[:author]).old_news
  #     end
  #   elsif params[:author] && !params[:author].blank?
  #     @posts = Post.by_author params[:author]
  #   elsif params[:date] && !params[:date].blank?
  #     if params[:date] == "Today"
  #       @posts = Post.from_today
  #     else
  #       @posts = Post.old_news
  #     end
  #   else
  #     @posts =  Post.all
  #   end
  # end

  def index
    @posts = Post.all
  end

  def show # retrieve individual post
    @post = Post.find(params[:id])
    render :layout => "admin"
  end

  def new # renders the page where you can create a new post
    @post = Post.new
    # @post.categories.build
  end

  def create # saves the submitted post from the new page

    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit # renders the page to modify an existing post
    @post = Post.find(params[:id])
  end

  def update # updates the post submitted from the edit page
    @post = Post.find(params[:id])
    @post.update(post_params)

    redirect_to @post
  end

  def destroy # deletes the existing post from the db
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to Post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :author_id, category_ids: [], categories_attributes:[
      :name
    ])
  end

end

# {
#   "authenticity_token"=>"[FILTERED]", 
#   "post"=>{
#     "title"=>"The Post with Author", 
#     "content"=>"Random String 2", 
#     "author_id"=>"1"
#   }, 
#   "commit"=>"Create Post"
# }


# {
#   "authenticity_token"=>"[FILTERED]", 
#   "post"=>
#   {
#     "title"=>"The Post with Categories", 
#     "content"=>"Random String", 
#     "author_id"=>"3", 
#     "category_ids"=>["", "1", "3"]
#   }, 
#   "commit"=>"Create Post"
# }