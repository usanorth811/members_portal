class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :require_permission
  before_action :load_activities, only: [:index, :show]

  def require_permission
    if current_user.admin?

    else
      @group = Group.find_by_billing_id(@company.billing_id)
      @users_group = current_user.groups.find_by_billing_id(@company.billing_id)
      if @users_group.billing_id != @group.billing_id

          redirect_to root_path
      end

    end
  end

  # GET /companies
  # GET /companies.json
  def index
    if current_user.admin?
      @companies = Company.all
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    if current_user.admin?
      @company = Company.new
    end
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    if current_user.admin?
      @company = Company.new(company_params)

      respond_to do |format|
        if @company.save
          format.html { redirect_to @company, notice: 'Company was successfully created.' }
          format.json { render :show, status: :created, location: @company }
        else
          format.html { render :new }
          format.json { render json: @company.errors, status: :unprocessable_entity }
        end
      end
      else
      redirect_to root_path, notice: 'You do not have permission to perform that action' 
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    if current_user.admin?
      respond_to do |format|
        if @company.update(company_params)
          format.html { redirect_to @company, notice: 'Company was successfully updated.' }
          format.json { render :show, status: :ok, location: @company }
        else
          format.html { render :edit }
          format.json { render json: @company.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to @company, notice: 'You do not have permission to perform that action' 
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    if current_user.admin?
      @company.destroy
      respond_to do |format|
        format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to @company, notice: 'You do not have permission to perform that action'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :billing_id, :status, :member_type)
    end

    def load_activities

      @activities = PublicActivity::Activity.where(:billing => @company.billing_id).order('created_at DESC').limit(10)
    end
end
