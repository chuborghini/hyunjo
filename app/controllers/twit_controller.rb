class TwitController < ApplicationController
  def list
    @twits = Twit.all
  end

  def list_byuser
  end

  def create
    unless params[:username].blank? || params[:contents].blank?
      new_twit = Twit.new
      new_twit.username = params[:username]
      new_twit.contents = params[:contents]
      new_twit.save      
    end
    
    redirect_to action: "list"
    # 리다이렉트는 어느 페이지로 간다 ->그래서 리스트랑는 페이지로 다시 돌아가는 것
  end

  def edit_view
    @id = params[:id]
    @twit = Twit.find(@id)
  end

  def edit
    unless params[:username].blank? || params[:contents].blank? || params[:id].blank?
      ori_twit = Twit.find(params[:id]) 
      ori_twit.username = params[:username]
      ori_twit.contents = params[:contents]
      ori_twit.save
    end
  
  redirect_to action: "list"  
  end

  def delete
    @id= params[:id]
    Twit.destroy(@id)
  
    redirect_to action: "list"  
  end
  
  def createcomment
    comment = Comment.new
    comment.twit_id = params[:twit_id]
    comment.username = params[:comment_name]
    comment.password = Digest::SHA256.hexdigest params[:comment_password]
    #sha256 단방향 해시함수 
    comment.contents = params[:comment_contents]
    comment.save
    
    redirect_to action: "list"
  
  end
  
  def deleteComment
    @id = params[:id]
    @pw = Digest::SHA256.hexdigest params[:pw]
      if(@pw == Comment.find(@id).password)
        Comment.destroy(@id)
      end
      
    redirect_to action: "list"
  end
  

end
