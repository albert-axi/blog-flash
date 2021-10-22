module PostsHelper
  def last_updated(post)
    post.updated_at.strftime("Last updated %A, %b %e, at %l:%M %p")
  end

  def author_id_field(post)
    if post.author.nil?
      select_tag "post[author_id]", options_from_collection_for_select(Author.all, :id, :name)
    else
      hidden_field_tag "post[author_id]", post.author_id
    end
  end
end
