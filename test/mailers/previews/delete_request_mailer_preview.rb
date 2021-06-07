class DeleteRequestMailerPreview < ActionMailer::Preview
  def delete_request
    user = User.first
    DeleteRequestMailer.with(delete_request: DeleteRequest.last, user: user.email).delete_request
  end
end