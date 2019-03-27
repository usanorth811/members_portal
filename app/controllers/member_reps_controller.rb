class MemberRepsController < ApplicationController
  before_action :set_member_rep, only: [:show, :edit, :update, :destroy]
  before_action :require_permission

  def require_permission
    @group = Group.find_by_billing_id(@member_rep.company.billing_id)
    @users_group = current_user.groups.find_by_billing_id(@member_rep.company.billing_id)
    if @users_group.billing_id != @group.billing_id

      redirect_to root_path

    end
  end

  # GET /member_reps
  # GET /member_reps.json
  def index
    @member_reps = MemberRep.all
  end

  # GET /member_reps/1
  # GET /member_reps/1.json
  def show
  end

  # GET /member_reps/new
  def new
    @member_rep = MemberRep.new
  end

  # GET /member_reps/1/edit
  def edit
  end

  # POST /member_reps
  # POST /member_reps.json
  def create
    @member_rep = MemberRep.new(member_rep_params)

    respond_to do |format|
      if @member_rep.save
        format.html { redirect_to @member_rep, notice: 'Member rep was successfully created.' }
        format.json { render :show, status: :created, location: @member_rep }
      else
        format.html { render :new }
        format.json { render json: @member_rep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /member_reps/1
  # PATCH/PUT /member_reps/1.json
  def update
    respond_to do |format|
      if @member_rep.update(member_rep_params)
        format.html { redirect_to @member_rep, notice: 'Member rep was successfully updated.' }
        format.json { render :show, status: :ok, location: @member_rep }
      else
        format.html { render :edit }
        format.json { render json: @member_rep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_reps/1
  # DELETE /member_reps/1.json
  def destroy
    @member_rep.destroy
    respond_to do |format|
      format.html { redirect_to member_reps_url, notice: 'Member rep was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_rep
      @member_rep = MemberRep.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_rep_params
      params.require(:member_rep).permit(:name, :phone, :email, :addr, :company_id)
    end
end
