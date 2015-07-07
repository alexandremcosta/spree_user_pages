Deface::Override.new(:virtual_path  => "spree/users/show",
                     :insert_after  => "[data-hook='account_summary']",
                     :partial       => "spree/users/pages",
                     :name          => "add_pages_to_account_show")

Deface::Override.new(:virtual_path  => "spree/users/show",
                     :insert_bottom => "#user-info",
                     :text          => "<br /><dt><%= Spree.t(:plan) %></dt><dd><%= spree_current_user.plan.name %></dd>",
                     :name          => "add_current_plan_to_account_show")
