module CommonSki
  def user_match?(user)
    user == User.find(session[:user_id])
  end
end
