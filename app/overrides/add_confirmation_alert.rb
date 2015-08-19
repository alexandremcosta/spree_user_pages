Deface::Override.new(:virtual_path  => "spree/layouts/spree_application",
                     :insert_after  => "erb[loud]:contains('flash_messages')",
                     :partial       => "spree/shared/confirmation_alert",
                     :name          => "add_confirmation_alert",
                     :original      => '94423b76c7a8df379934357728e3ee9934ef343d')

