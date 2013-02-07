class Constants < Settingslogic
  source "#{Rails.root}/config/constants.yml"
  # こうすることで環境ごとに定数を切り分けられる
  namespace Rails.env
end