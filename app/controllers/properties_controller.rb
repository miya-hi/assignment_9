class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]
  def index
    @properties = Property.all
  end
  def show
  end
  def new
    @property = Property.new
    2.times{ @property.stations.build }
  end
  def edit
    unless @property.stations.where(line:"",name:"",time:"").exists?
    @station = @property.stations.build
  end
  end
  def create
    @property = Property.new(property_params)
    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: "登録しました" }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: "更新しました" }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: "削除しました" }
      format.json { head :no_content }
    end
  end
  private
    def set_property
      @property = Property.find(params[:id])
    end
    def property_params
      params.fetch(:property, {}).permit(:name, :rent, :address, :age, :notes,
      stations_attributes: [:id, :line, :name, :time]
    )
    end
end
