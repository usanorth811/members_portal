class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :load_activities, only: [ :show, :new, :edit, :destroy]
  before_action :authenticate_user!
  # GET /groups
  # GET /groups.json
  def index
   
    @group = Group.new
    @groups = current_user.groups
    
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    require 'httparty'
    require 'json'
    response = HTTParty.get("https://52.8.206.74/members/group="+@group.billing_id+"", :verify => false)
    @memb = JSON.parse(response)
    @members = @memb['Members']

    response1 = HTTParty.get("https://52.8.206.74/billing/billing_code="+@group.billing_id+"", :verify => false)
    puts response1
    @bill = JSON.parse(response1)
    puts @bill
    @bills = @bill['Billing']
    puts @bills

    response2 = HTTParty.get("https://guarded-depths.com/members/totals/group="+@group.billing_id+"/", :verify => false)
    @count = JSON.parse(response2)
    @counts = @count['Counts']
    @total = 0
  end

  # GET /groups/new
  def new
    
    @group = current_user.groups.build
    
    
  end

  # GET /groups/1/edit
  def edit
  end

  
  # POST /groups
  # POST /groups.json
  def create
    
    @group = current_user.groups.build
    
    @group = current_user.groups.build(group_params)
    puts @group.billing_id
    require 'httparty'
    require 'json'
    response1 = HTTParty.get("https://52.8.206.74/billing/billing_code="+@group.billing_id+"", :verify => false)
    puts response1
    @bill = JSON.parse(response1)
    puts @bill
    @bills = @bill['Billing']
    if @bills != nil
    @group.name = @bills[0]['Name']
    end
    
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Company was successfully added.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Company was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:billing_id, :user_id, :user_id, :company_id, :name)
    end
    def load_activities

      @activities = PublicActivity::Activity.where(:billing => @group.billing_id).order('created_at DESC').limit(10)
    end
end
