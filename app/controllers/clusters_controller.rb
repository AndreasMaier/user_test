class ClustersController < ApplicationController
  def index
    @clusters = Cluster.paginate(page: params[:page], :per_page => 10)
  end

  def show
    @cluster = Cluster.find(params[:id])

    @galaxies = @cluster.galaxies.paginate(page: params[:page], :per_page => 10)
  end
end
