# frozen_string_literal: true

describe SendEmailTemplate do
  describe '#call' do
    subject(:service_call) { described_class.new(delivery_params).call }

    include_context 'with email template for external urls request results'

    context 'with proper parameters' do
      before do
        allow(ApplicationMailer).to receive(:send_email).and_return(delivery)
        allow(delivery).to receive(:deliver)
      end

      let(:delivery) { double }

      let(:expected_body) do
        Liquid::Template.parse(email_template.body).render!(template_payload.deep_stringify_keys, strict_variables: true)
      end

      let(:action_mailer_params) do
        {
          from: delivery_params[:from],
          to: delivery_params[:to],
          headers: delivery_params[:headers],
          subject: "External urls in your's Twitter home line between 2020-07-01 10:45 and 2020-07-04 10:45",
          body: expected_body
        }
      end

      it 'does not raise errors' do
        expect { service_call }.not_to raise_error
      end

      it 'build application mailer delivery with proper attributes' do
        service_call

        expect(ApplicationMailer).to have_received(:send_email).with action_mailer_params
      end

      it 'sends delivery' do
        service_call

        expect(delivery).to have_received(:deliver)
      end
    end

    context 'when template does not exists' do
      let(:template_name) { 'not_existing_template_name' }

      it 'does not raise errors' do
        expect { service_call }.to raise_error ActiveRecord::RecordNotFound, "Couldn't find EmailTemplate"
      end
    end

    context 'with insufficient template payload' do
      let(:template_payload) { { nickname: 'nickname' } }
      let(:error_message) { 'Liquid error: undefined variable request_start_time' }

      it 'does not raise errors' do
        expect { service_call }.to raise_error(Liquid::UndefinedVariable, error_message)
      end
    end
  end
end
