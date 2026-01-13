class BouquetsController < ApplicationController
  before_action :set_bouquet, only: %i[show edit update destroy]

  # список букетов
  def index
    @bouquets = Bouquet.order(created_at: :desc)
  end

  # один букет
  def show
  end

  # форма создания
  def new
    @bouquet = Bouquet.new
  end

  # форма редактирования
  def edit
  end

  # создание
  def create
    @bouquet = Bouquet.new(bouquet_params)

    if @bouquet.save
      redirect_to @bouquet, notice: "Букет создан"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # обновление
  def update
    if @bouquet.update(bouquet_params)
      redirect_to @bouquet, notice: "Букет обновлён"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # удаление
  def destroy
    @bouquet.destroy
    redirect_to bouquets_path, notice: "Букет удалён"
  end

  private

  def set_bouquet
    @bouquet = Bouquet.find(params[:id])
  end

  def bouquet_params
    params.require(:bouquet).permit(
      :name,
      :description,
      :price,
      :available,
      :photo
    )
  end
end