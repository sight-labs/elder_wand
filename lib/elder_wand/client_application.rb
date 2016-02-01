module ElderWand
  class ClientApplication
    attr_accessor :client, :uid, :name, :secret, :scopes

    def self.from_hash(client, hash)
      new(client, hash)
    end

    # Initalize an ClientApplication
    #
    # @param [Client] client the OAuth2::Client instance
    # @param [Hash] opts the options to create the Application with
    # @option opts [String] :uid the client app uid
    # @option opts [String] :name the client app name
    # @option opts [String] :secret the client app secret
    # @option opts [Array<String>] :scopes the scopes associated to the token
    def initialize(client, opts = {}) # rubocop:disable Metrics/AbcSize
      @client = client
      @uid    = opts.delete(:uid) || opts.delete('uid')
      @name   = opts.delete(:name) || opts.delete('name')
      @secret = opts.delete(:secret) || opts.delete('secret')
      @scopes = opts.delete(:scopes) || opts.delete('scopes') || []
      @params = opts
    end

    def includes_scope?(*required_scopes)
      required_scopes.blank? || required_scopes.any? { |s| scopes.include?(s.to_s) }
    end
  end
end