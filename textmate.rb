dep 'textmate' do
  requires 'TextMate.app', 'textmate helper', 'textmate bundles', 'textmate plugins', 'textmate defaults'
end

dep 'textmate helper' do
  requires 'TextMate.app'
  met? { which 'mate' }
  meet { shell "ln -sf '#{app_dir('TextMate.app') / 'Contents/SharedSupport/Support/bin/mate'}' /usr/local/bin/mate" }
end

dep 'TextMate.app' do
  source 'http://download.macromates.com/TextMate_1.5.10.zip'
end

dep 'textmate defaults' do
  # set shell variables
  shell %{defaults write com.macromates.textmate OakShellVariables -array '{variable="PATH"; value="/usr/bin:/bin:/usr/sbin:/sbin"; enabled=1;}' '{variable="TM_RUBY"; value="/Users/michaelm/.rvm/bin/textmate_ruby"; enabled=1;}' '{variable="RUBYOPT"; value="rubygems"; enabled=1;}' '{variable="TM_CUCUMBER_OPTS"; value="--tags ~@selenium --tags ~@sphinx --require features --format html"; enabled=1;}' '{variable="TM_RSPEC_OPTS"; value="--drb"; enabled=0;}'
}
  # set other preferences
  shell %{defaults write com.macromates.textmate OakTextViewHighlightCurrentLine -bool true}
  shell %{defaults write com.macromates.textmate OakTextViewLineNumbersEnabled -bool true}
  shell %{defaults write com.macromates.textmate OakTextViewIndentedPasteEnabled -bool false}
  shell %{defaults write com.macromates.textmate OakFolderReferenceFolderPattern -string "!.*/(\\.[^/]*|coverage|CVS|_darcs|_MTN|\\{arch\\}|blib|.*~\\.nib|.*\\.(framework|app|pbproj|pbxproj|xcode(proj)?|bundle))$"}
end

dep 'textmate not running' do
  met? { failable_shell('pgrep TextMate').stdout.empty? }
  meet {
    confirm("About to quit TextMate - is that okay?", :default => 'n') do
      result = shell('pgrep TextMate')
      shell "kill #{result}"
      sleep 1
    end
  }
end
