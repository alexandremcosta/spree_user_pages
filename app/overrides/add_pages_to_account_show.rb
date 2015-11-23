Deface::Override.new(:virtual_path  => "spree/users/show",
                     :insert_after  => "[data-hook='account_summary']",
                     :partial       => "spree/users/pages",
                     :name          => "add_pages_to_account_show",
                     :original      => "a5220f4dad21a47b4241115722c7caa4e9db77e7")

Deface::Override.new(:virtual_path  => "spree/users/show",
                     :insert_bottom => "#user-info",
                     :text          => "<br /><dt><%= Spree.t(:plan) %></dt><dd><%= spree_current_user.plan.name %></dd>",
                     :name          => "add_current_plan_to_account_show",
                     :original      => "2c3f6a6cbc3f84fdac6533dab3b5a77e6dc5b434")
