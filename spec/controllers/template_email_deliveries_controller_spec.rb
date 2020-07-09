# frozen_string_literal: true

describe TemplateEmailDeliveriesController do
  describe 'POST create' do
    it_behaves_like 'demanding basic authentication', :post, :create

    include_context 'with email template for external urls request results'

    context 'with basic authentication and proper delivery params' do
      before do
        http_authenticate
        allow_service_call(SendEmailTemplate)
        post :create, params: { template_email: delivery_params }
      end

      it 'calls service object with proper params' do
        expect(SendEmailTemplate).to have_received(:new).with(delivery_params)
      end

      it 'responds with created' do
        expect(response.status).to eq(201)
      end
    end

    context 'with basic authentication but' do
      before do
        http_authenticate
        post :create, params: { template_email: delivery_params }
      end

      context 'without required delivery params' do
        let(:delivery_params) { {} }

        it_behaves_like 'unsuccessful response', 422, 'param is missing or the value is empty: template_email'
      end

      context 'with incomplete delivery params' do
        let(:delivery_params) { { from: 'from@email.com' } }

        it_behaves_like 'unsuccessful response', 422, 'param is missing or the value is empty: to'
      end
    end

    context 'with basic authentication and service object exception' do
      before do
        http_authenticate
        allow_service_call(SendEmailTemplate, to_raise: service_error)
        post :create, params: { template_email: delivery_params }
      end

      context 'when template does not exists' do
        let(:service_error) { ActiveRecord::RecordNotFound.new("Couldn't find EmailTemplate") }

        it_behaves_like 'unsuccessful response', 404, "Couldn't find EmailTemplate"
      end

      context 'with insufficient template payload' do
        let(:service_error) { Liquid::UndefinedVariable.new('Liquid error: undefined variable request_id') }

        it_behaves_like 'unsuccessful response', 422, 'Liquid error: undefined variable request_id'
      end
    end
  end
end
