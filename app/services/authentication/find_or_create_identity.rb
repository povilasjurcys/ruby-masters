module Authentication
  # Finds or creates identity and user
  class FindOrCreateIdentity
    def initialize(auth_hash)
      @auth_hash = auth_hash
    end

    def call
      identity = Identity.find_or_initialize_by(auth_hash.slice(:provider, :uid))
      return identity if identity.persisted?

      identity.tap { |it| it.update(user: find_or_create_student_by_auth_hash) }
    end

    private

    attr_reader :auth_hash

    def find_or_create_student_by_auth_hash
      Student.find_or_create_by!(github_uid: github_uid) do |user|
        info = auth_hash[:info]
        user.email = info[:email]
        user.first_name = info[:name].to_s.split(' ').first
        user.last_name = info[:name].to_s.split(' ').last
        user.image_url = info[:image]
      end
    end

    def github_uid
      auth_hash[:uid]
    end
  end
end
