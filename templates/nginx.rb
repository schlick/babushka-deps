# TODO: need to work through this example from Ben's
meta :nginx do
  accepts_list_for :source
  accepts_list_for :extra_source
  template {
    helper(:nginx_bin) { var(:nginx_prefix) / 'sbin/nginx' }
    helper(:nginx_conf) { var(:nginx_prefix) / 'conf/nginx.conf' }
    helper(:nginx_cert_path) { var(:nginx_prefix) / 'conf/certs' }
    helper(:nginx_conf_for) {|domain,ext| var(:nginx_prefix) / "conf/vhosts/#{domain}.#{ext}" }
    helper(:nginx_conf_link_for) {|domain| var(:nginx_prefix) / "conf/vhosts/on/#{domain}.conf" }

    helper(:passenger_root) { Babushka::GemHelper.gem_path_for('passenger') }

    helper :nginx_running? do
      shell "netstat -an | grep -E '^tcp.*[.:]80 +.*LISTEN'"
    end

    helper :restart_nginx do
      if nginx_running?
        log_shell "Restarting nginx", "#{nginx_bin} -s reload", :sudo => true
      end
    end
  }
end