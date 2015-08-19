Deface::Override.new(:virtual_path => "spree/shared/_nav_bar",
                     :replace      => "erb[loud]:contains('render')",
                     :text         => "<%= render :partial => 'spree/shared/custom_search' %>",
                     :name         => "change_search",
                     :original     => '604069ea4e43fbe46a604a0b473e9e20751d1cae')

