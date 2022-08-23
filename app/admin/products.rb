ActiveAdmin.register Product do
  permit_params :name, :admin_user_id, :description, :price, :image

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

  index do
    selectable_column
    id_column
    column :name
    column :admin_user
    column :description
    column :price
    column :created_at
    column :updated_at
    column :image do |product|
      image_tag(product.image, size: "200x150") unless product.image.url.nil?
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :admin_user
      row :description
      row :price
      row :created_at
      row :updated_at
      row :image do |product|
        image_tag(product.image, size: "200x150") unless product.image.url.nil?
      end
    end
  end
  
end
