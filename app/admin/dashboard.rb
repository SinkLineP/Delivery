# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu :label => "Dashboard", :priority => 1

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Tables" do
          ul do
            li link_to("Deliveries", admin_deliveries_path)
            li link_to("Admin Users", admin_admin_users_path)
            li link_to("Comments", admin_comments_path)
          end
        end
      end
    end
  end
end