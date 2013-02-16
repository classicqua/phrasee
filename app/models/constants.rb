class Constants < Settingslogic
  source "#{Rails.root}/config/constants.yml"
  
  # 環境別に定数設定
  namespace Rails.env
end