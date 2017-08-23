class ReferalsController < ApplicationController
  before_action :find_referal,only:[:show,:destroy,:update]
  before_action :authenticate_user!, except:[:index,:show]

  def index
    @referals = Referal.all
  end

  def new
    @referal = Referal.new
  end

  def create
    @referal = Referal.new(referal_params)
    @referal.user = current_user

    if @referal.save
      respond_to do |format|
        format.html{redirect_to referals_path, notice:"Referal was successfully saved!"}
        format.js 
      end
    else
      render 'new',alert:"Unable to save your referal."
    end
  end

  def edit
        @referal = Referal.find(params[:id])
  end

  def update
    if @referal.update(referal_params)
      respond_to do |format|
        format.html{redirect_to referals_path, notice:"Referal was successfully removed!"}
        format.js 
      end
    end
  end

  def destroy
    @referal.destroy
    respond_to do |format|
        format.html{redirect_to referals_path, notice:"Referal was successfully removed!"}
        format.js 
      end
  end

  private

  def referal_params
    params.require(:referal).permit(:body,:slug)
  end

  def find_referal
    @referal = Referal.find(params[:id])
  end
end
