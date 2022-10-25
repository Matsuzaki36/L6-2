class CartitemsController < ApplicationController
    def new
        @cartitem = Cartitem.new(product_id: params[:product_id])
    end
    
    def create
        @cartitem = Cartitem.new(product_id: params[:cartitem][:product_id], cart_id: current_cart.id,
        qty: params[:cartitem][:qty])
        if @cartitem.save
            flash[:notice] = 'カートに商品を追加しました'
            redirect_to root_path
        else
            render new_cartitem_path
        end
    end
    
    def destroy
        cartitem = Cartitem.find(params[:id])
        cartitem.destroy
        redirect_to root_path
    end
end
