require 'spec_helper'

describe MoviesController do
  describe 'views' do
    it "renders the index view" do
      get :index
      expect(response).to render_template("index")
    end

    it "renders the new view" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe 'routes' do
    it "route to the show path" do
      { :get => movie_path(1) }.
        should route_to(:controller => "movies", :action => "show", :id => "1")
    end

    it "route to the edit path" do
      { :get => edit_movie_path(1) }.
        should route_to(:controller => "movies", :action => "edit", :id => "1")
    end

    it "route to the director path" do
      { :get => find_with_same_director_path(1) }.
        should route_to(:controller => "movies", :action => "director", :id => "1")
    end
  end
  
  describe 'movie controllers' do
    it 'should create a new movie' do
      MoviesController.stub(:create).and_return(double('Movie'))
      post :create, {:id => "1"}
    end

    it 'should show a movie' do
      @m=Movie.create :title => "Moonrise Kingdom", :director => "Wes Anderson", :id => "1"
      get :show, id: @m
      assigns(:movie).should == @m
    end

    it 'should edit a movie' do
      @m=Movie.create :title => "Chocolat", :director => "Test", :id => "1"
      get :edit, id: @m
      assigns(:movie).should == @m
    end

    it 'should update a movie' do
      movie = Movie.create
      put :update, :id => movie
      flash[:notice].should =~ /updated/i
    end

    it 'should destroy a movie' do
      movie = Movie.create
      delete :destroy, :id => movie
      flash[:notice].should =~ /deleted/i
    end

    it 'should show directors' do
      @m=double(Movie, :title => "Chocolat", :director => nil, :id => "1")
      Movie.stub(:find).with("1").and_return(@m)
      get :director, :id => 1
      flash[:notice].should =~ /no director/i
    end

    it 'should show directors' do
      @m=double(Movie, :title => "Moonrise Kingdom", :director => "Wes Anderson", :id => "1")
      Movie.stub(:find).with("1").and_return(@m)
      get :director, :id => 1
      flash[:notice].should =~ /nil/
    end

    it "should sort by title" do
      get :index, :sort => 'title'
      session[:sort].should == 'title'
    end

    it "should sort by release date" do
      get :index, :sort => 'release_date'
      session[:sort].should == 'release_date'
    end
  end
end
