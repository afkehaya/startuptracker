class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   before_create :add_to_list
   has_many :categories
   has_many :startups
   after_create :send_notification
   

   def send_notification
   	UserMailer.new_user(self).deliver
   end
   
   def add_to_list
	  list_id = "be53fa8a83"
	  @gb = Gibbon::Request.new
	  subscribe = @gb.lists(list_id).members.create(body: {
        email_address: self.email, 
        status: "subscribed", 
        double_optin: false
        })
   end
   def admin?
   	role == "admin"
   end

end
