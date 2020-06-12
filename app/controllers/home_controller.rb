class HomeController < ApplicationController
  def index
    @last_10_transactions = TransactionEntry.last(10)
    @last_5_users = User.last(5)
  end
end
