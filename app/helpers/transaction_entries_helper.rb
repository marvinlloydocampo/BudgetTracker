module TransactionEntriesHelper
   DEFAULT_CATEGORY = ['Default Category', 0].freeze

  def available_transaction_types
    TransactionEntry.transaction_types.map {|k, v| [k.humanize.capitalize, v]}
  end

  def available_categories
    Category.all&.map { |c| [c.name, c.id] } || DEFAULT_CATEGORY
  end
end
