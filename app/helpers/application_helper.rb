module ApplicationHelper
    def already_liked?(post)
        Like.where(user_id: current_user.id, post: post.id).exists?
    end
end
