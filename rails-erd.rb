# See http://rails-erd.rubyforge.org/install.html
#
# Homebrew on Mac OS X:
#   brew install cairo pango graphviz
#
# Macports on Mac OS X:
#   sudo port install graphviz
#
# Debian and Ubuntu
#   sudo aptitude install graphviz
#
# Rails ERD requires Graphviz (with Pango/Cairo support).
# Graphviz 2.22+ is recommended.
#
# To install rails-erd, add it to your Gemfile:
#   group :development do
#     gem "rails-erd"
#   end
#
# rails-erd only works for Rails 3 apps.

dep 'rails-erd' do
  requires 'homebrew'
  requires 'cairo.managed'      # only for Mac OS X with brew
  requires 'pango.managed'      # only for Mac OS X with brew
  requires 'graphviz.managed'
end

dep 'cairo.managed' do
  provides []
end

dep 'pango.managed' do
  provides []
end

dep 'graphviz.managed' do
  provides []   # what does it provide?
end

