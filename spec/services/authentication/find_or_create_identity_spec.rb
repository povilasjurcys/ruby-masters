require 'rails_helper'

module Authentication
  RSpec.describe FindOrCreateIdentity do
    subject(:identity_builder) { described_class.new(auth_hash) }

    let(:auth_hash) do
      {
        provider: 'github',
        uid: github_uid,
        info: {
          nickname: 'john.doe',
          email: nil,
          name: 'John Doe',
          image: 'https://example.com/image.png',
          urls: {}
        },
        credentials: {
          token: '2827905b4b81a97b7e40789dd406bf38494e4b00',
          expires: false
        }
      }
    end

    let(:github_uid) { '123456' }

    describe '#call' do
      context 'when identity does not exist' do
        it 'creates identity' do
          expect { identity_builder.call }.to change(Identity, :count).by(1)
        end

        context 'when user does not exist' do
          it 'creates user' do
            expect { identity_builder.call }.to change(User, :count).by(1)
          end
        end

        context 'when user with same github uid already exists' do
          let!(:user) { create(:user, github_uid: github_uid) }

          it 'does not create new user' do
            expect { identity_builder.call }.not_to change(User, :count)
          end

          it 'creates identity with same user' do
            expect(identity_builder.call.user).to eq user
          end
        end
      end

      context 'when identity exists' do
        before do
          described_class.new(auth_hash).call
        end

        it 'does not create new identity' do
          expect { identity_builder.call }.not_to change(Identity, :count)
        end
      end
    end
  end
end
