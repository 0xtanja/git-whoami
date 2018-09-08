require "io/memory"
require "./git-whoami/*"

module Git::Whoami
  stdout = IO::Memory.new
  stderr = IO::Memory.new
  status = Process.run "git config --local --get-regexp user", output: stdout, error: stderr, shell: true
  if status.success?
    STDOUT.puts stdout.to_s
  else
    if stderr.empty?
      stderr.write "No user could be resolved.".to_slice
    end
    STDERR.puts stderr.to_s
  end
end
