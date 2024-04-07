class ListsController < ApplicationController
  
  def new
    @list = List.new 
  end
  
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @list = List.new(list_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @list.save
      # 3. フラッシュメッセージを定義し、詳細画面へリダイレクト
      flash[:notice] = "Book was successfully created."
      redirect_to list_path(@list.id)
    else
    end
  end

  def index
  end

  def show
    @list = List.find(params[:id])  
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)  
  end
  
  def destroy
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end
  
   private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
