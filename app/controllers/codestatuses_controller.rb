class CodestatusesController < ApplicationController
  before_action :set_codestatus, only: [:show, :edit, :update, :destroy]

  # GET /codestatuses
  # GET /codestatuses.json
  def index
    @codestatuses = Codestatus.all
  end

  # GET /codestatuses/1
  # GET /codestatuses/1.json
  def show
  end

  # GET /codestatuses/new
  def new
    @codestatus = Codestatus.new
  end

  # GET /codestatuses/1/edit
  def edit
  end

  # POST /codestatuses
  # POST /codestatuses.json
  def create
    @codestatus = Codestatus.new(codestatus_params)

    respond_to do |format|
      if @codestatus.save
        format.html { redirect_to @codestatus.group, notice: 'Code status was successfully updated.' }
        format.json { render :show, status: :created, location: @codestatus }
      else
        format.html { render :new }
        format.json { render json: @codestatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /codestatuses/1
  # PATCH/PUT /codestatuses/1.json
  def update
    respond_to do |format|
      if @codestatus.update(codestatus_params)
        format.html { redirect_to @codestatus.group, notice: 'Codestatus was successfully updated.' }
        format.json { render :show, status: :ok, location: @codestatus }
      else
        format.html { render :edit }
        format.json { render json: @codestatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /codestatuses/1
  # DELETE /codestatuses/1.json
  def destroy
    @codestatus.destroy
    respond_to do |format|
      format.html { redirect_to codestatuses_url, notice: 'Codestatus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_codestatus
      @codestatus = Codestatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def codestatus_params
      params.require(:codestatus).permit(:code, :sar_updated, :contacts_updated, :user_id, :group_id)
    end
end
