class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_user!, except: [:top, :about]
	#デバイス機能実行前にconfigure_permitted_parametersの実行をする。
	#protect_from_forgery with: :exception
  protected
  def after_sign_in_path_for(resource)
    user_path(resource)
    # ログイン後ホームではなくマイページに行かせる!
  end

  #sign_out後のredirect先変更する。rootパスへ。rootパスはhome topを設定済み。
  def after_sign_out_path_for(resource)
    # user_path(resource)
    root_path
    # new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    #sign_upの際にnameのデータ操作を許。追加したカラム。
  end

  
  #protect_from_forgery with: :null_session
end