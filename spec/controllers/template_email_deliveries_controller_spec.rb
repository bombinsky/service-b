# frozen_string_literal: true

describe TemplateEmailDeliveriesController do

  describe 'POST create' do

    it_behaves_like 'demanding basic authentication', :post, :create

    context 'with basic authentication' do
      include_context 'with email template for external urls request results'

      before do
        http_authenticate

        post :create, params: { template_email: delivery_params }
      end

      context 'without required delivery params' do
        let(:delivery_params) { {} }

        it_behaves_like 'unsuccessful response', 422, 'param is missing or the value is empty: template_email'
      end

      context 'with invalid delivery params' do
        let(:delivery_params) { { from: 'from@email.com' } }

        it_behaves_like 'unsuccessful response', 422, 'param is missing or the value is empty: to'
      end

      context 'when template does not exists' do
        let(:template_name) { 'not_existing' }

        it_behaves_like 'unsuccessful response', 404, "Couldn't find EmailTemplate"
      end
    end
  end
end
