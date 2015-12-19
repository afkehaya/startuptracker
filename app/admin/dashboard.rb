ActiveAdmin.register_page "Dashboard" do
  controller do
        skip_after_action :verify_authorized
    end
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
     columns do
      column do 
       panel "Users" do
          ul do
            h1 User.count 
         end
       end
     end 
   end
   columns do
      column do 
       panel "Submissions" do
          ul do
            h1 Submission.count 
         end
       end
     end 
    end
   
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
