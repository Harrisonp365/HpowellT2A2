class ListingsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_user_listing, only: [:edit, :update, :destroy]
    before_action :set_listing, only: [:show]

    def index
        @listings = Listing.all
    end


    def show
        session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            customer_email: current_user.email,
            line_items: [{
                name: @listing.title,
                description: @listing.description,
                amount: @listing.price * 100,
                currency: 'aud',
                quantity: 1,
            }],
            payment_intent_data: {
                metadata: {
                    user_id: current_user.id,
                    listing_id: @listing.id
                }
            },
            success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}",
            cancel_url: "#{root_url}listings"
        )
    
        @session_id = session.id
    end

    def new
        set_brands_and_categories
        @listing = Listing.new
    end

    def create
        @listing = current_user.listings.create(listing_params)
        if @listing.errors.any?
            set_brands_and_categories
            render "new"
        else 
            redirect_to listings_path
        end
    end
    
    def update
        @listing = Listing.update(params[:id], listing_params)
        if @listing.errors.any?
            set_brands_and_categories
            render "edit"
        else
            redirect_to listings_path
        end
    end

    def edit
        set_brands_and_categories  
    end

    def destroy
        Listing.find(params[:id]).destroy
        redirect_to listings_path
    end

    private

    def set_listing
        @listing = Listing.find(params[:id])
    end

    def set_user_listing
        @listing = current_user.listings.find_by_id(params[:id])

        if @listing == nil
            redirect_to listings_path
        end
    end

    def set_brands_and_categories
        @brands = Brand.all
        @categories = Category.all
    end

    def listing_params
        params.require(:listing).permit(:title, :description, :brand_id, :category_id, :price, :picture)
    end

end