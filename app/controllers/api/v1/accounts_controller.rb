class Api::V1::AccountsController < ApplicationController
  before_action :set_api_v1_account, only: [:show, :edit, :update, :destroy]

  # GET /api/v1/accounts
  # GET /api/v1/accounts.json
  def index
    @api_v1_accounts = Api::V1::Account.all
  end

  # GET /api/v1/accounts/1
  # GET /api/v1/accounts/1.json
  def show
  end

  # GET /api/v1/accounts/new
  def new
    @api_v1_account = Api::V1::Account.new
  end

  # GET /api/v1/accounts/1/edit
  def edit
  end

  # POST /api/v1/accounts
  # POST /api/v1/accounts.json
  def create
    @api_v1_account = Api::V1::Account.new(api_v1_account_params)

    respond_to do |format|
      if @api_v1_account.save
        format.html { redirect_to @api_v1_account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @api_v1_account }
      else
        format.html { render :new }
        format.json { render json: @api_v1_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/accounts/1
  # PATCH/PUT /api/v1/accounts/1.json
  def update
    respond_to do |format|
      if @api_v1_account.update(api_v1_account_params)
        format.html { redirect_to @api_v1_account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_v1_account }
      else
        format.html { render :edit }
        format.json { render json: @api_v1_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/accounts/1
  # DELETE /api/v1/accounts/1.json
  def destroy
    @api_v1_account.destroy
    respond_to do |format|
      format.html { redirect_to api_v1_accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_account
      @api_v1_account = Api::V1::Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_account_params
      params.require(:api_v1_account).permit(:status, :content)
    end
end
