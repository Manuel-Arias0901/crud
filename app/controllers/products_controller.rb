require './app/reportes/product_csv.rb'
require './app/reportes/product_pdf.rb'
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
        send_data ProductCsv.new.call,
        :type => 'text/csv; charset=iso-8859-1; header=present',
        :disposition => "attachment; filename=productos.csv"
    end

    def pdf

        pdf = ProductPdf.new.call
        send_data pdf.render,
            filename: "export.pdf",
            type: 'application/pdf',
            disposition: 'inline'

    end
        
    private
        def params_product
            params.require(:product).permit(:name, :description, :price, :tipo_id.name)
        end

end