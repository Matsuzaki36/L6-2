class ProductsController < ApplicationController
    def index
        @products = Product.all
    end
    
    def new
        @product = Product.new
    end
    
    def create
        @product = Product.new(name: params[:product][:name],  price: params[:product][:price])
        if @product.save
            redirect_to root_path
        else
            render new_product_path
        end
    end
    
    def destroy
        product = Product.find(params[:id])
        product.destroy
        redirect_to root_path
    end
end
