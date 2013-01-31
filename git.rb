dep 'configure global git settings', :username, :email do
  current_name  = shell %{git config --global user.name}
  current_email = shell %{git config --global user.email}

  # Personal details
  shell %{git config --global user.name "#{username.default(current_name).ask('user.name')}"}
  shell %{git config --global user.email "#{email.default(current_email).ask('user.email')}"}

  # Other settings
  shell %{git config --global color.ui true}
end