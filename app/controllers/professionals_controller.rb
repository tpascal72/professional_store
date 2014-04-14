class ProfessionalsController < ApplicationController
  before_action :set_professional, only: [:show]

  # GET /professionals
  # GET /professionals.json
  def index
    @professionals = Professional.all
  end

  # GET /professionals/1
  # GET /professionals/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professional
      @professional = Professional.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professional_params
      params.require(:professional).permit(:fname, :lname, :cost_per_hour, :available, :skills, :image, :category_id)
    end
end
