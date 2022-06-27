class PostImagesController < ApplicationController
  def destroy
    @post_image = @book.find PostImageレコードを取得
    @post_image.destroy
    redirect_to books_path, notice: "successfully delete book!"
  end

end
