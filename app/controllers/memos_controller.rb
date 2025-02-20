class MemosController < ApplicationController
  before_action :set_memo, only: %i[edit update destroy]

  def index
    @pagy, @memos = pagy_countless(Memo.search(params[:query]), items: 12)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def new
    @memo = Memo.new
  end

  def edit; end

  def create
    @memo = Memo.new(memo_params)
    respond_to do |format|
      if @memo.save
        format.html { redirect_to memos_path, status: :see_other }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @memo.update(memo_params)
        format.html { redirect_to memos_path, status: :see_other }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@memo) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @memo.destroy
    respond_to do |format|
      format.html { redirect_to memos_path, status: :see_other }
      format.turbo_stream
    end
  end

  private

  def set_memo
    @memo = Memo.find(params[:id])
  end

  def memo_params
    params.require(:memo).permit(:content)
  end
end
