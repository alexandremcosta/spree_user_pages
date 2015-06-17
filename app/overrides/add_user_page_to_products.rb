Deface::Override.new(:virtual_path  => "spree/admin/products/_form",
                     :insert_before => "[data-hook='admin_product_form_promotionable']",
                     :partial        => "spree/admin/products/plan_field",
                     :name          => "add_plan_to_product")
