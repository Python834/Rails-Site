class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy, :articles_email]
	before_action :authenticate_user!, except: [:index]

	def articles_email
		User.all.each do |user|
			UserMailer.article_email( @article.title, @article.author, @article.published_date, @article.content, @article.thumbnail, user).deliver
			UserMailer.article_text_email( @article.title, @article.author, @article.published_date, @article.content, @article.thumbnail, user).deliver
		end
		redirect_to(articles_path, :notice => 'E-mail sent successfully')
	end

	# GET /articles
	# GET /articles.json
	def index
		page = params[:page].to_i
		@articles = Article.order(published_date: :desc).page(page).per(5)
	end

	# GET /articles/1
	# GET /articles/1.json
	def show
	end

	# GET /articles/new
	def new
		@article = Article.new
		@commited = params[:commit]
	end

	# GET /articles/1/edit
	def edit

	end

	# POST /articles
	# POST /articles.json
	def create
		@article = Article.new(article_params)

		respond_to do |format|
			if @article.save
				format.html { redirect_to @article, notice: 'Article was successfully created.' }
				format.json { render :show, status: :created, location: @article }
			else
				format.html { render :new }
				format.json { render json: @article.errors, status: :unprocessable_entity }
			end
		end
		User.find_by_newsletter(true).email do |user|
			if @article.published
				UserMailer.article_email(@article.title, @article.author, @article.published_date, @article.content, @article.thumbnail, user).deliver
				redirect_to(articles_path, :notice => 'E-mail sent successfully')
			end
		end
	end

	# PATCH/PUT /articles/1
	# PATCH/PUT /articles/1.json
	def update
		respond_to do |format|
			if @article.update(article_params)
				format.html { redirect_to @article, notice: 'Article was successfully updated.' }
				format.json { render :show, status: :ok, location: @article }
			else
				format.html { render :edit }
				format.json { render json: @article.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /articles/1
	# DELETE /articles/1.json
	def destroy
		@article.destroy
		respond_to do |format|
			format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_article
		@article = Article.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def article_params
		params.require(:article).permit(:title, :author, :published_date, :published, :content, :thumbnail)
	end
end
