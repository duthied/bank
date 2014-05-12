# /app/admin/account.rb
ActiveAdmin.register Account do

  filter :title

  index do
    selectable_column
    column :title, sortable: :title
    column 'Belongs To Card', :user, sortable: 'users.card_number' do |account|
      link_to account.user_card_number, admin_user_path(account.user)
    end
    column 'Balance', sortable: :balance do |account|
      number_to_currency(account.balance, unit: '$')
    end
    column 'Date Created', :created_at
    column 'Date Updated', :updated_at
    default_actions
  end

  show do
    @account = Account.find(params[:id])

    attributes_table do
      row :id
      row :title
      row 'Belongs To Card' do
        link_to @account.user_card_number, admin_user_path(@account.user)
      end
      row 'Balance' do
        number_to_currency(@account.balance, unit: '$')
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.actions
    f.inputs 'Details' do
      f.input :title
      f.input :user_id
      # f.input :balance
    end
  end

  controller do

    def resource_params
      return [] if request.get?
      [params.require(:account).permit(:title, :user_id, :balance)]
    end
  end
end
