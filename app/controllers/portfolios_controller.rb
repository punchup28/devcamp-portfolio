class PortfoliosController < ApplicationController
  def index

      # angular ประกาศไว้ที่ model select เฉพาะ subtitle angular
    # @portfolio_items = Portfolio.angular
    # @portfolio_items = Portfolio.ruby_on_rails_portfolio_items
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build } # build => create 3 version of technology
  end

  def create
    @portfolio_item = Portfolio.new( params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name]))

    respond_to do |format|
      if @portfolio_item.save
                     # redirect_to blog_path(@blog)
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item was successfully created.' }
        # format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        # format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end
  def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path , notice: 'Portfolio was successfully updated.' }

      else
        format.html { render :edit }

      end
    end
  end

  def destroy
    # Perform the look up
    @portfolio_item = Portfolio.find(params[:id])
    # Perform delete the record
    @portfolio_item.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully deleted.' }

    end
  end
end
