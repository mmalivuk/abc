class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :destroy]

  # GET /chapters
  # GET /chapters.json
  def index
    @chapters = current_user.chapters
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @chapter.destroy
    respond_to do |format|
      format.html { redirect_to chapters_url, notice: 'Chapter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit(:user_id, :api_key)
    end
end
