module ApplicationHelper
  def gravatar_for(user, opts = {})
    opts[:alt] = user.name
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{opts.delete(:size) { 40 }}",
              opts
  end

  def dialect_list
    dialects = []
    User::DIALECTS.stringify_keys.each do |dialect|
      dialects << dialect.to_a.reverse
    end
    dialects
  end
end
