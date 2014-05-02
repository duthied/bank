# /app/admin/user.rb
ActiveAdmin.register User do

  filter :card_number
  filter :pin

  index do
    selectable_column
    column :card_number, :sortable => :card_number
    column :pin, :sortable => :pin
    column 'Date Created', :created_at
    column 'Date Updated', :updated_at
    default_actions
  end

  show do
    @user = User.find(params[:id])

    attributes_table do
      row :id
      row :card_number
      row :pin
      row :created_at
      row :updated_at

      row 'Accounts' do
        table_for @user.accounts do
          column '' do |account|
            p link_to "#{account.title} balance: #{number_to_currency(account.balance, :unit => "$")}", 
              admin_account_path(account), 
              :target => '_blank'
          end
        end
      end

    end
  end

  form do |f|
    f.actions
    f.inputs 'Details' do
      f.input :card_number
      f.input :pin
    end
  end

  controller do

    def resource_params
      return [] if request.get?
      [params.require(:user).permit(:card_number, :pin)]
    end
  end
end
