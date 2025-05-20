ActiveAdmin.register Config do
  index do
    selectable_column
    id_column
  end

  show do
    attributes_table do
      row :parameter do |config|
        render_json_display(config.parameter)
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :parameter, as: :text, input_html: render_json_editor(f, :parameter)
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit! # allow all parameters
    end

    def create
      # パラメータをJSONに変換
      params[:config][:parameter] = JSON.parse(params[:config][:parameter]) rescue {}
      super
    end

    def update
      # パラメータをJSONに変換
      params[:config][:parameter] = JSON.parse(params[:config][:parameter]) rescue {}
      super
    end
  end
end
