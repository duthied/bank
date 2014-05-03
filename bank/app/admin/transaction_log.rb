# /app/admin/transaction_log.rb
ActiveAdmin.register TransactionLog do

  filter :user_card_number, as: :string

  index do
    selectable_column
    column 'Card Number', :user, :sortable => 'user_card_number' do |transaction_log|
      link_to transaction_log.user_card_number, admin_user_path(transaction_log.user)
    end
    column 'Account', :account, :sortable => 'account_title' do |transaction_log|
      link_to transaction_log.account_title, admin_account_path(transaction_log.account)
    end
    column :before_balance
    column :after_balance
    column 'Date Created', :created_at
    column 'Date Updated', :updated_at
    default_actions
  end

  show do
    @transaction_log = TransactionLog.find(params[:id])

    attributes_table do
      row :title
      row 'Card Number' do
        link_to @transaction_log.user_card_number, admin_user_path(@transaction_log.user)
      end
      row 'Account' do
        link_to @transaction_log.account_title, admin_account_path(@transaction_log.account)
      end
      row :before_balance
      row :after_balance
      row :created_at
      row :updated_at
    end
  end

  # form do |f|
  #   f.actions
  #   f.inputs 'Details' do
  #     f.input :title
  #     f.input :user_id
  #     f.input :balance
  #   end
  # end

  # controller do

  #   def resource_params
  #     return [] if request.get?
  #     [params.require(:account).permit(:title, :user_id, :balance)]
  #   end
  # end

end
