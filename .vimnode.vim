function! MyCallback(channel, msg)
	call append(line('$'),a:msg) 
endfunction

function! MyCloseHandler(channel)
	set filetype=javascript
	wincmd p
endfunction

function! Focus(bufname)
  let bufmap = map(range(1, winnr('$')), '[bufname(winbufnr(v:val)), v:val]')
  let thewindow = filter(bufmap, 'v:val[0] =~ a:bufname')[0][1]
  execute thewindow 'wincmd w'
endfunction

function! Startnode()
	let nroutput = bufwinnr('noteoutput')
	let scriptpath = expand('%:p')
	let options={'callback':'MyCallback','close_cb':'MyCloseHandler'}
	let command = 'node ' . scriptpath

	write!
	if (nroutput > 0) 
		call Focus("noteoutput")	
		1,$d
	else	
		vsplit	
		edit noteoutput
	endif

	let nodejob = job_start(command, options)
endfunction

nmap <Leader>v :call Startnode()<CR>
