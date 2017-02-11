Tabulous.setup do

  tabs do

    requests_tab do
      text {'Requests'}
      link_path {dashboard_path}
      visible_when {current_user.admin?}
      enabled_when {true}
      active_when { in_action('dashboard').of_controller('users') }
    end

    # borrowed_tab do
    #   text {'Borrowed'}
    #   link_path {borrowed_path}
    #   visible_when {current_user.admin?}
    #   enabled_when {true}
    #   active_when {in_action{'borrowed'}.of_controller('users')}
    # end
    #
    # wishlist_tab do
    #   text {'Wishlist'}
    #   link_path {wishlist_path}
    #   visible_when {true}
    #   enabled_when {true}
    #   active_when {in_action{'wishlist'}.of_controller('users')}
    #
    # end
  end


  use_css_scaffolding do
    background_color '#ccc'
    text_color '#444'
    active_tab_color '#fff'
    hover_tab_color '#ddd'
    inactive_tab_color '#aaa'
    inactive_text_color '#888'
  end

end
