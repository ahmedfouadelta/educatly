ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :name
  actions :index, :show, :new, :create, :update, :edit

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :name
      row :created_at
      row :updated_at
    end
  end

  filter :email
  filter :name
  filter :created_at
  filter :updated_at
  

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  #after_create do |user|
  #  flash[:notice] = "User has been created with the default password" if user.valid?
  #end

  controller do
    skip_before_action :authenticate_active_admin_user, only: [:new, :create]

    def create
      begin
        @admin_user = AdminUser.create!( admin_user_params )
        redirect_to new_admin_user_session_url, notice: "User is created successfully.. please login here!"
      rescue => er
        flash[:alert] = er.message
        redirect_to root_url
      end
    end

    private

    def admin_user_params
      params.require(:admin_user).permit(:email, :password, :name)
    end
  end
end
