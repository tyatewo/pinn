class Admin::ScenesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @scenes = Scene.all #全シーン
    @scene = Scene.new #シーン新規作成
  end

  def create
    @scene = Scene.new(scene_params) #シーンに送るデータ作成
    @scene.save #シーン保存
    redirect_to admin_scenes_path #シーン一覧に遷移
  end

  def edit
    @scene = Scene.find(params[:id]) #固有のシーンを探す
  end

  def update
    scene = Scene.find(params[:id]) #固有のシーンを探す
    scene.update(scene_params) #シーンの更新
    redirect_to admin_scenes_path #シーン一覧
  end

  private

  def scene_params
    params.require(:scene).permit(:name)
  end

end
