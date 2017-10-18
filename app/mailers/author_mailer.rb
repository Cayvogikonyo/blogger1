class AuthorMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.author_mailer.reset_password_email.subject
  #
  def reset_password_email(author)
    @author = Author.find author.id
    @url = edit_password_reset_url(@author.reset_password_token)

    mail to: author.email 

  end
end
