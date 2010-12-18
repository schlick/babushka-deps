# see https://gist.github.com/ae7fcb3d67830c7edc06
meta :font do
  accepts_list_for :source

  template do
    helper(:dest) { "~/Library/Fonts/#{name}".p.expand_path }

    met? { File.exists?(dest) }
    meet { shell "curl #{source.first} > #{dest}" }
  end
end