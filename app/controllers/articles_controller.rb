class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Article '#{@article.title}' Successfully Created!'"

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.destroy(params[:id])

    flash.notice = "Article '#{@article.title}' Successfully Deleted!'"

    redirect_to root_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Successfully Updated!"

    redirect_to article_path(@article)
  end
end
