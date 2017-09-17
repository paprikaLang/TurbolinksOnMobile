class CommentsChannel < ApplicationCable::Channel
def self.broadcast(comment)
	broadcast_to(comment.post, comment: CommentsController.render(partial: 'comments/comment',locals: { comment: comment }))
	
end


  def subscribed
    stream_for  Post.first
  end

  def unsubscribed
 
  end
end
