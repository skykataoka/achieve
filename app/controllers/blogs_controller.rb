class BlogsController < ApplicationController
  before_action :set_blog, only:[:edit, :update, :destroy]
  
  def index
    @blogs = Blog.all
  end
  
  def new
    if params[:back]
      @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
    end
  end
  
  def confirm
    @blog = Blog.new(blogs_params)
    render :new if @blog.invalid?
  end
  
  def create
     @blog = Blog.new(blogs_params)
     if @blog.save
       redirect_to blogs_path, notice: "ブログを作成しました!"
     
     else
       render 'new'
     end
    # Blog.create(blogs_params)  
    # # newのビューで入力された値がBlogインスタンスに代入される
    # redirect_to blogs_path, notice: "ブログを作成しました!"
  end


  def edit
    # @blog = Blog.find(params[:id]) 冒頭でファクタリング化
  end


  def update
    # @blog = Blog.find(params[:id])  冒頭でファクタリング化
     if @blog.update(blogs_params)
       redirect_to blogs_path, notice: "ブログを更新しました!"
     
     else
       render 'edit'
     end
    
    
    # このupdateアクションはeditビューで値を更新した後に発動するらしい
    # createアクションがフォーム入力＆送信後に発動するように
    # @blog = Blog.find(params[:id])
    # @blog.update(blogs_params)
    # redirect_to blogs_path, notice: "ブログを更新しました!"
  end
  
  def destroy
    # @blog = Blog.find(params[:id]) 冒頭でファクタリング化
    # 当該IDデータをfindしてきた後、destroyメソッドで削除する。
    @blog.destroy
    redirect_to blogs_path, notice: "ブログを削除しました!"
  end
  
  
  private
    def blogs_params
      params.require(:blog).permit(:title, :content)
    end
    
    def set_blog
      @blog = Blog.find(params[:id])
    end
    
end
