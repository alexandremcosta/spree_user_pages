Deface::Override.new(:virtual_path  => "spree/users/show",
                     :insert_after  => "[data-hook='account_summary']",
                     :partial       => "spree/users/pages",
                     :name          => "add_pages_to_account_show")

