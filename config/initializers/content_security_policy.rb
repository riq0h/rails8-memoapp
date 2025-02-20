Rails.application.config.content_security_policy do |policy|
  policy.default_src :self
  policy.font_src    :self
  policy.img_src     :self
  policy.script_src  :self
  policy.style_src   :self
  policy.connect_src :self
  policy.frame_ancestors :none
end

Rails.application.config.content_security_policy_nonce_generator = ->(_request) { SecureRandom.base64(16) }
