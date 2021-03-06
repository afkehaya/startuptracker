class Subscriber < ActiveRecord::Base

	  before_create :add_to_list
   	after_create :send_notification
    validates :email, presence: true
   	  
	  def send_notification
   		UserMailer.new_user(self).deliver
   	end

	  def add_to_list
  	  list_id = "715a1cd50a"
  	  @gb = Gibbon::Request.new
  	  subscribe = @gb.lists(list_id).members.create(body: {
          email_address: self.email, 
          status: "subscribed", 
          double_optin: false
          })
   	end
end
