function __fish_aj_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'archlinux-java' ]
    return 0
  end
  return 1
end

function __fish_aj_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end


complete -f -c archlinux-java -n '__fish_aj_needs_command' -a status -d "List installed Java environments and enabled one"
complete -f -c archlinux-java -n '__fish_aj_needs_command' -a get -d "Return the short name of the Java environment set as default"
complete -f -c archlinux-java -n '__fish_aj_needs_command' -a set -d "Force <JAVA_ENV> as default"
complete -f -c archlinux-java -n '__fish_aj_needs_command' -a unset -d "Unset current default Java environment"
complete -f -c archlinux-java -n '__fish_aj_needs_command' -a fix -d "Fix an invalid/broken default Java environment configuration"

complete -f -c archlinux-java -n '__fish_aj_using_command set' -a "(archlinux-java status | sed 1,1d | cut -d' ' -f3)"
