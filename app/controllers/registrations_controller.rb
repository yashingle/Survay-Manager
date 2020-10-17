class RegistrationsController < Devise::RegistrationsController
  def delete_user_obj
    deleted = false
    if current_user.present? &&  current_user.role == 1 
      u = User.find(params[:id])
      if u.group_id == current_user.group_id
        u.destroy
        deleted = true
      end
    end
    if deleted
      render :json => {:data => "Deleted"}, :status => :ok
    else
      render :json => {:message => "Not Authorized!"}, :status => :unauthorized
    end
    return
  end
end
