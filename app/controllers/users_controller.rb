class UsersController < ApplicationController
  layout :resolve_layout #Before rendering check which layout we should show
  before_action :set_user, only: [:index, :show, :edit, :update, :destroy]

  # After login go here
  def index

  end

  # GET /users/:id.:format
  def show
    # authorize! :read, @user
  end

  # GET /users/:id/edit
  def edit
    # authorize! :update, @user
  end

  # PATCH/PUT /users/:id.:format
  def update
    # authorize! :update, @user
    respond_to do |format|
      if @user.update(user_params)
        sign_in(@user == current_user ? @user : current_user, :bypass => true)
        format.html { redirect_to root_path, notice: 'Your profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    # authorize! :update, @user 
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        @user.skip_reconfirmation!
        sign_in(@user, :bypass => true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  # DELETE /users/:id.:format
  def destroy
    # authorize! :delete, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
  
  private
    def set_user
      if current_user
        @user = current_user
      elsif params[:id]
        @user = User.find(params[:id])
      end
      if @user
        # For Gravatar lookup
        @email_hash = Digest::MD5.hexdigest(@user.email.strip) 
      else
        redirect_to new_user_session_path, alert: 'Please sign in to view dashboard'
      end
    end

    def user_params
      accessible = [:name, :email] # extend with your own params
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end

    private

    # Determine layout based on action name
    def resolve_layout
      case action_name
      when 'index'
        'dashboard'
      else
        'application'
      end
    end
end