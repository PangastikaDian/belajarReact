class BarangsController < ApplicationController
  def create
    @barang = Barang.new(barang_params)

    if @barang.save
      render json: @barang
    else
      render json: @barang.errors, status: :unprocessable_entity
    end
  end

	def index
		@barangs = Barang.all
	end

  def destroy
    @barang = Barang.find(params[:id])
    @barang.destroy
    head :no_content
  end

  def update
    @barang = Barang.find(params[:id])
    if @barang.update(barang_params)
      render json: @barang
    else
      render json: @barang.errors, status: :unprocessable_entity
    end
  end

  private
  def barang_params
    params.require(:barang).permit(:date, :namabarang, :jumlah, :harga, :totalharga)
  end
end
