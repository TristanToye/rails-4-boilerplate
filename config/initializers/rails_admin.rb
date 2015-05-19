RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end

module RailsAdmin 
  class ApplicationController < ::ApplicationController 
    # Before loading the admin panel check if the user is an admin
    before_filter :is_admin?
    private 
      def is_admin?
        if !User.find_by(admin: true)
          current_user.update_attributes(admin: true)
        end
        if !current_user.admin
          redirect_to "/", alert: "You do not have permission to access that."
        end
      end 
  end 
end 