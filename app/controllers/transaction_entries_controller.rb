class TransactionEntriesController < ApplicationController
  before_action :set_transaction_entry, only: [:show, :edit, :update, :destroy]
  before_action :set_user_id, only: [:new]

  # GET /transaction_entries
  # GET /transaction_entries.json
  def index
    @transaction_entries = TransactionEntry.all
  end

  # GET /transaction_entries/1
  # GET /transaction_entries/1.json
  def show
  end

  # GET /transaction_entries/new
  def new
    @transaction_entry = TransactionEntry.new
    @transaction_entry.user_id = @user_id
  end

  # GET /transaction_entries/1/edit
  def edit
  end

  # POST /transaction_entries
  # POST /transaction_entries.json
  def create
    @transaction_entry = TransactionEntry.new(transaction_entry_params)

    respond_to do |format|
      if @transaction_entry.save
        format.html { redirect_to @transaction_entry, notice: 'Transaction entry was successfully created.' }
        format.json { render :show, status: :created, location: @transaction_entry }
      else
        format.html { render :new }
        format.json { render json: @transaction_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transaction_entries/1
  # PATCH/PUT /transaction_entries/1.json
  def update
    respond_to do |format|
      if @transaction_entry.update(transaction_entry_params)
        format.html { redirect_to @transaction_entry, notice: 'Transaction entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction_entry }
      else
        format.html { render :edit }
        format.json { render json: @transaction_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction_entries/1
  # DELETE /transaction_entries/1.json
  def destroy
    @transaction_entry.destroy
    respond_to do |format|
      format.html { redirect_to transaction_entries_url, notice: 'Transaction entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction_entry
      @transaction_entry = TransactionEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_entry_params
      params.require(:transaction_entry).permit(:user_id, :transaction_type, :amount, :category_id, :transaction_date)
    end

    def set_user_id
      @user_id = params[:user_id]
    end
end
