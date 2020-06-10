module TransactionEntriesHelper
   DEFAULT_CATEGORY = ['Default Category', 0].freeze

  def available_transaction_types
    TransactionEntry.transaction_types.map {|k, v| [k.humanize.capitalize, k]}
  end

  def available_categories
    Category.all&.map { |c| [c.name, c.id] } || DEFAULT_CATEGORY
  end

  def available_users
    User.all&.map { |u| [u.name, u.id] }
  end

  def selected_user_name
    User.find(@user_id).name
  end
end
