class PotatoesController < ApplicationController
  def index
    @potatoes = Potato.all
  end

  def show
    @potato = find_potato
  end

  def new
    @potato = Potato.new
  end

  def edit
    @potato = find_potato
  end

  def create
    @potato = Potato.new(potato_params(:name, :eyes))

    if @potato.valid?
      @potato.save
      redirect_to potato_path(@potato)
    else
      flash[:notice]="error prohibited this potato from being saved:"
      @error = []
      @error << @potato.errors[:name].first if @potato.errors[:name].any?
      @error << @potato.errors[:eyes].first if @potato.errors[:eyes].any?
      render "new"
    end

  end

  def update
    @potato = find_potato
    @potato.update(potato_params(:name, :eyes))
    redirect_to @potato
  end

  def destroy
    @potato = find_potato
    @potato.destroy
    redirect_to potatoes_path
  end

  def find_potato
    Potato.find(params[:id])

  end

  def potato_params(*args)

    params.require(:potato).permit(*args)

  end
end
