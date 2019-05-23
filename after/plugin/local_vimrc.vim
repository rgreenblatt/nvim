if IsInstalled('LucHermitte/local_vimrc')
  call lh#local_vimrc#munge('whitelist', $HOME.'/Documents')
  call lh#local_vimrc#munge('whitelist', $HOME.'/locus_dev')
endif
