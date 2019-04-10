class BillingContactsController < ApplicationController
  before_action :set_billing_contact, only: [:show, :edit, :update, :destroy]
  before_action :require_permission

  def require_permission
    if current_user.admin?

    else
      @group = Group.find_by_billing_id(@billing_contact.company.billing_id)
      @users_group = current_user.groups.find_by_billing_id(@billing_contact.company.billing_id)
      if @users_group.billing_id != @group.billing_id
        redirect_to root_path
      end
    end
  end

  # GET /billing_contacts
  # GET /billing_contacts.json
  def index
    @billing_contacts = BillingContact.all
  end

  # GET /billing_contacts/1
  # GET /billing_contacts/1.json
  def show
  end

  # GET /billing_contacts/new
  def new
    @billing_contact = BillingContact.new
  end

  # GET /billing_contacts/1/edit
  def edit
  end

  # POST /billing_contacts
  # POST /billing_contacts.json
  def create
    @billing_contact = BillingContact.new(billing_contact_params)

    respond_to do |format|
      if @billing_contact.save
        format.html { redirect_to @billing_contact, notice: 'Billing contact was successfully created.' }
        format.json { render :show, status: :created, location: @billing_contact }
      else
        format.html { render :new }
        format.json { render json: @billing_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /billing_contacts/1
  # PATCH/PUT /billing_contacts/1.json
  def update
    respond_to do |format|
      if @billing_contact.update(billing_contact_params)
        format.html { redirect_to @billing_contact, notice: 'Billing contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @billing_contact }
      else
        format.html { render :edit }
        format.json { render json: @billing_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /billing_contacts/1
  # DELETE /billing_contacts/1.json
  def destroy
    @billing_contact.destroy
    respond_to do |format|
      format.html { redirect_to billing_contacts_url, notice: 'Billing contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billing_contact
      @billing_contact = BillingContact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def billing_contact_params
      params.require(:billing_contact).permit(:name, :phone, :email, :addr, :company_id)
    end
end
