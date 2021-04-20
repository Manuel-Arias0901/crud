class TiposController < ApplicationController
    
    def index
        @tipos = Tipo.all
    end

    def new
        @tipo = Tipo.new
    end

    def create
        @tipo = Tipo.new(params_tipo)
        if @tipo.save
            redirect_to tipos_path
        else
            render :new
        end
    end

    def edit
        @tipo = Tipo.find(params[:id])
    end

    def update
        @tipo = Tipo.find(params[:id])
        if @tipo.update(params_tipo)
            redirect_to tipos_path
        else
            render :edit
        end
    end

    def destroy
        @tipo = Tipo.find(params[:id])
        @tipo.destroy
        redirect_to tipos_path
    end

    private
        def params_tipo
            params.require(:tipo).permit(:name, :description)
        end

end