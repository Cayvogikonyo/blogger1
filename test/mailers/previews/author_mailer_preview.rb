# Preview all emails at http://localhost:3000/rails/mailers/author_mailer
class AuthorMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/author_mailer/reset_password_email
  def reset_password_email
    AuthorMailer.reset_password_email
  end

end
