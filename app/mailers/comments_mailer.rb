class CommentsMailer < ApplicationMailer
  def notify_post_owner(comment)
    @comment = comment
    @post    = comment.post
    @owner   = @post.user
    if @owner.present?
      mail(to: @owner.email, subject: "Hi, #{@owner.first_name}!")
    end
  end
end