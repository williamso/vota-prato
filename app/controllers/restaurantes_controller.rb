class RestaurantesController < ApplicationController
    
  def new 
    @restaurante = Restaurante.new
  end

  def index
    @restaurantes = Restaurante.order("nome").page(params['page']).per(3)
    
    respond_to do |format|
      format.html
      format.xml {render xml: @restaurantes}
      format.json {render json: @restaurantes}
    end
  end
  
  def show
     @restaurante = Restaurante.find(params[:id])
  end
  
  def create    
    @restaurante = Restaurante.new(restaurante_params)
    if @restaurante.save   
      redirect_to(action: "show", id: @restaurante)
    else
      render action: "new"
    end
  end
  
  def edit
    @restaurante = Restaurante.find(params[:id])
  end
  
  def update
    @restaurante = Restaurante.find(params[:id])
    if @restaurante.update_attributes!(restaurante_params)
      redirect_to action: "show", id: @restaurante
    else 
      render action "edit"
    end 
  end
  
  def destroy    
     @restaurante = Restaurante.find(params[:id])
     @restaurante.destroy
    
     redirect_to(action: "index")
  end
  
  private
  def restaurante_params
      params.require(:restaurante).permit(:nome, :endereco, :especialidade)
  end
  
end
