Deface::Override.new(:virtual_path  => "spree/layouts/spree_application",
                     :insert_after => "erb[loud]:contains('flash_messages')",
                     :partial       => "spree/shared/confirmation_alert",
                     :name          => "add_confirmation_alert")

