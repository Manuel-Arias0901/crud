require './app/reportes/product_csv.rb'
class ProductsController < ApplicationController
    def index
        @products = Product.all  
    end

    def new
        @product = Product.new  
    end

    def create
        @product = Product.new(params_product)
        if @product.save
            redirect_to products_path
        else
            render :new
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(params_product)
            redirect_to products_path
        else
            render :edit
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to products_path
    end

    def csv
        
        #csv_string = CSV.generate do |csv|
        #    csv << ["id","nombre", "descripcion", "precio", "tipo"]
        #    Product.all.each do |x|
        #        csv << [x.id, x.name, x.description, x.price, x.tipo.name]
        #    end
        #    csv
        #end
        send_data ProductCsv.new.call,
        :type => 'text/csv; charset=iso-8859-1; header=present',
        :disposition => "attachment; filename=productos.csv"
    end
    
    private
        def params_product
            params.require(:product).permit(:name, :description, :price, :tipo_id.name)
        end

end