Deface::Override.new(:virtual_path  => "spree/admin/products/_form",
                     :insert_before => "[data-hook='admin_product_form_promotionable']",
                     :partial        => "spree/admin/products/user_page_field",
                     :name          => "add_user_page_to_product")