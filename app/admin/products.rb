ActiveAdmin.register Product do
  permit_params :name, :admin_user_id, :description, :price

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :price, :description, :admin_user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :price, :description, :admin_user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end