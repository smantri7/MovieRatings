class BossesController < ApplicationController
  before_action :set_boss, only: [:show, :edit, :update, :destroy]

  # GET /bosses
  # GET /bosses.json
  def index
    @bosses = Boss.all
  end

  # GET /bosses/1
  # GET /bosses/1.json
  def show
  end

  # GET /bosses/new
  def new
    @boss = Boss.new
  end

  # GET /bosses/1/edit
  def edit
  end

  # POST /bosses
  # POST /bosses.json
  def create
    @boss = Boss.new(boss_params)

    respond_to do |format|
      if @boss.save
        format.html { redirect_to @boss, notice: 'Boss was successfully created.' }
        format.json { render :show, status: :created, location: @boss }
      else
        format.html { render :new }
        format.json { render json: @boss.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bosses/1
  # PATCH/PUT /bosses/1.json
  def update
    respond_to do |format|
      if @boss.update(boss_params)
        format.html { redirect_to @boss, notice: 'Boss was successfully updated.' }
        format.json { render :show, status: :ok, location: @boss }
      else
        format.html { render :edit }
        format.json { render json: @boss.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bosses/1
  # DELETE /bosses/1.json
  def destroy
    @boss.destroy
    respond_to do |format|
      format.html { redirect_to bosses_url, notice: 'Boss was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boss
      @boss = Boss.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boss_params
      params.require(:boss).permit(:name, :email, :login)
    end
end
