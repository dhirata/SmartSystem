class SmartiesController < ApplicationController
  before_action :set_smarty, only: [:show, :edit, :update, :destroy]

  # GET /smarties
  # GET /smarties.json
  def index
    @smarties = Smarty.chronological.paginate(page: params[:page]).per_page(25)
  end

  # GET /smarties/1
  # GET /smarties/1.json
  def show
  end

  # GET /smarties/new
  def new
    @smarty = Smarty.new
  end

  # GET /smarties/1/edit
  def edit
  end

  # POST /smarties
  # POST /smarties.json
  def create
    @smarty = Smarty.new(smarty_params)

    respond_to do |format|
      if @smarty.save
        format.html { redirect_to @smarty, notice: 'Smarty was successfully created.' }
        format.json { render :show, status: :created, location: @smarty }
      else
        format.html { render :new }
        format.json { render json: @smarty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /smarties/1
  # PATCH/PUT /smarties/1.json
  def update
    respond_to do |format|
      if @smarty.update(smarty_params)
        format.html { redirect_to @smarty, notice: 'Smarty was successfully updated.' }
        format.json { render :show, status: :ok, location: @smarty }
      else
        format.html { render :edit }
        format.json { render json: @smarty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smarties/1
  # DELETE /smarties/1.json
  def destroy
    @smarty.destroy
    respond_to do |format|
      format.html { redirect_to smarties_url, notice: 'Smarty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_smarty
      @smarty = Smarty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def smarty_params
      params[:smarty]
    end
end
