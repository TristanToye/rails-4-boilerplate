class CreateGlobalConfigs < ActiveRecord::Migration
  def change
    create_table :global_configs do |t|

    	t.string :app_name
    	t.string :app_domain

    	t.string :facebook_app_id
    	t.string :twitter_app_id
    	t.string :linkedin_app_id

    	t.boolean :use_slack, :default => false
    	t.string :slack_team
    	t.string :slack_icon_url
    	t.string :slack_user
    	
    	t.string :technical_support_email
    	t.string :technical_slack_channel
    	t.string :feedback_support_email
    	t.string :feedback_slack_channel
    	t.string :default_email_address
    	t.string :default_slack_channel

      t.timestamps
    end
  end
end