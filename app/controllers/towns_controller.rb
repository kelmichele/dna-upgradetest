class TownsController < ApplicationController
	before_action :set_town, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]

	def index
		@towns = Town.all

		respond_to do |format|
		  format.html
		  format.csv { send_data @towns.to_csv }
		end
	end

	def import
	  Town.import(params[:file])
	  redirect_to root_url, notice: 'Towns imported.'
	end

	def show
		# @town = Town.friendly.find(params[:id])
		@state = @town.state
		@town_locations = @town.locations.all
		town_locations = @town.locations.all

		@starter = town_locations.first
		@town_lat = town_locations.average(:latitude)
		@town_lng = town_locations.average(:longitude)
		@town_cors = @town_lat, @town_lng

		@locations = if params[:l]
	    sw_lat, sw_lng, ne_lat, ne_lng = params[:l].split(",")
	    center   = Geocoder::Calculations.geographic_center([[sw_lat, sw_lng], [ne_lat, ne_lng]])
	    distance = Geocoder::Calculations.distance_between(center, [sw_lat, sw_lng])
	    box      = Geocoder::Calculations.bounding_box(center, distance)
	    Location.within_bounding_box(box)
	  elsif params[:near]
	    Location.near(params[:near], 100)
	  else
	    @town_locations.all
		end
	end

	def new
    @town = Town.new
    @states = State.all
	end

	def create
		@town = Town.new(town_params)
		if @town.save
		  flash[:success] = "Town was successfully created"
		  redirect_to town_path(@town)
		else
		  render 'new'
		end
	end

	def edit
		@state = @town.state
	end

	def update
		if @town.update(town_params)
		  flash[:success] = "Town was updated successfully"
      redirect_to town_path(@town)
		else
		  render 'edit'
		end
	end

	def destroy
		Town.find(params[:id]).destroy
  	flash[:success] = "Town was successfully deleted!"
    redirect_to states_path
	end

	private
		def set_town
			# @town = Town.find(params[:id])
			# @town = Town.find_by slug: params[:id]
			@town = Town.friendly.find(params[:id])
		end

		def town_params
      params.require(:town).permit(:townname, :state_id)
    end

    def require_admin
	    if !current_user.admin?
		    flash[:danger] = "Only admin users can perform that action"
	      redirect_to town_path(@town)
		  end
	  end
end
