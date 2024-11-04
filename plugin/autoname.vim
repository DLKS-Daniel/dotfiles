vim9script

def InsertFileNameOnTop()
  if expand('%:e') == 'wiki' 
    # Move to the top of the buffer
    exe 'normal! gg'
    # Check if the filename is already present at the top
    if getline(1) != expand('%:t') 
      # Insert the filename and a newline at the top of the file
     call setline(1, [expand('%:t'), ''] + getline(1, '$'))
    endif
  endif
enddef

# Autocmd that triggers the function when a buffer is opened
# au BufRead,BufNewFile *.wiki call InsertFileNameOnTop()
