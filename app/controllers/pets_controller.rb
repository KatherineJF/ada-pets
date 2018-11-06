class PetsController < ApplicationController

  def index
    pets = Pet.all
    render json: pets.as_json(only: [:id, :name, :age, :human])
  end

#   def show
#   pet = Pet.find_by(id: params[:id])
#
#   if pet.nil?
#     render json: {ok: false, message: 'not found'}
#   else
#     render json: {
#       ok:true,
#   pets.as_json(except: [:created_at, :updated_at])
# }
#   end
# end

  def create
    pet = Pet.new(pet_params)
    if pet.save
      #pet: pet.as_json(only: [:id]) how to render only the id
      render json: { ok: true, pet: pet.as_json(except: [:created_at, :updated_at])
      }, status: :ok
    else
      render json: {
        ok: false,
        message: pet.errors.messages
      }, status: :bad_request
    end
  end

  private

    def pet_params
      params.require(:pet).permit(:name, :age, :human)
    end

end
