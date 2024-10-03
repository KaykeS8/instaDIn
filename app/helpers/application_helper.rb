module ApplicationHelper
    def already_liked?(post)
        Like.where(user_id: current_user.id, post: post.id).exists?
    end

    def last_user_of_like(post)
        like = Like.where(post_id: post.id).last
        if like
            name_of_the_last_liked = like.user.name
            "Liked by #{name_of_the_last_liked} and others"
        else
            "be the first to like"
        end
    end

    def post_has_likes(post)
        Like.where(post_id: post).count > 0
    end
end
