class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  # add routes
  get '/' do
    {message: "Bananas!"}.to_json
  end 

  get '/bakeries' do
    goods = Bakery.all
    goods.to_json
    #{message: "This is a bakery!"}.to_json
  end 

  get '/bakeries/:id' do 
    good = Bakery.find(params[:id])
    good.to_json(include: [:baked_goods])
  end

  get '/baked_goods/by_price' do 
    price = BakedGood.all
    new_price = price.order(price: :desc)
    new_price.to_json(only: [:price, :name])
    #return list of baked goods, sorted desc by $
    # Can use active record to sort
  end

  get '/baked_goods/most_expensive' do 
    price = BakedGood.all
    new_price = price.order(price: :desc).first
    new_price.to_json(only: [:price, :name])

    #Return the most expensive baked good as JSON
    # Can use active record to sort
  end 

end

