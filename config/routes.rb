Rails.application.routes.draw do
  scope 'v1' do
    namespace 'private' do
      get 'locations/:country_code'     => 'locations#index'
      get 'target_groups/:country_code' => 'target_groups#index'
      post 'evaluate_target'            => 'evaluation#create'
    end

    namespace 'public' do
      get 'locations/:country_code'     => 'locations#index'
      get 'target_groups/:country_code' => 'target_groups#index'
    end
  end
end
