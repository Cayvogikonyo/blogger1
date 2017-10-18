class PasswordResetsController < ApplicationController
  def create
  	@author = Author.find_by_email(params[:email])
        
    # This line sends an email to the user with instructions on how to reset their password (a url with a random token)
    @author.deliver_reset_password_instructions! if @author
        
    # Tell the user instructions have been sent whether or not email was found.
    # This is to not leak information to attackers about which emails exist in the system.
    redirect_to(root_path, :notice => 'Instructions have been sent to your email.')
  end

  def edit
  	 @token = params[:id]
    @author = Author.load_from_reset_password_token(params[:id])

    if @author.blank?
      not_authenticated
      return
    end
  end

  def update
  	@token = params[:id]
    @author = Author.load_from_reset_password_token(params[:id])

    if @author.blank?
      not_authenticated
      return
    end

    # the next line makes the password confirmation validation work
    @author.password_confirmation = params[:author][:password_confirmation]
    # the next line clears the temporary token and updates the password
    if @author.change_password!(params[:author][:password])
      redirect_to(root_path, :notice => 'Password was successfully updated.')
    else
      render :action => "edit"
    end
  end
end
