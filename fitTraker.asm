  .model small
 
 
  .stack 100h 
  
  
  .data
  
   
      msg1 db ,10,13,10,'          welcome to my program ',3h,'$' 
      msg2 db '          bmi calculator $'
      msg3 db ' Just remember << life is so much more beautiful and complex than a number on a  scale. ',3h,'$'
      hinput db ' input your height in cm : ','$'
      winput db ' input your weight in kg : ','$'
      o db ' your weight is : over weight ',1h,'$'
      p db ' your weight is : perfect ',1h,'$'
      u db ' your weight is : under weight ',1h,'$'
      press1 db ' press 1 to see the instruction for gain the perfect weight',13,10,'  if you are <<under-weight>>  ','$'
      press2 db ' press 2 to see the instruction for gain the perfect weight',13,10,'  if you are <<over-weight>> ',10,13,10,'$'
      
      msk1 db '  1.eat more and sleep 8 hours a day.',13,10,'  Eat five to six smaller meals during the day rather than two or three',10,13,10,'$'
      msk2 db '  2.absorb high calorie food (potato, brown rice, chicken breast, check peas, al  mond, sweet potato etc.) ',10,13,10,'$'
      msk3 db '  3.drink at least 3l water per day.',10,13,10,'$'
      msk4 db '  4.eat vegetables and 1 glass of milk and 1 whole egg each day.',13,10,'$'
      
      msl1 db '  1.try to follow a low calorie healthy diet. ',13,10, '  Intermittent fasting is a dietary strategy that cycles between periods of',13,10,'  fasting and eating.',13,10,'  including the 16/8 method, which involves limiting your calorie intake to',13,10,'  8 hours per day.',10,13,10,'$'
      msl2 db '  2.eat high protein, vegetables and avoid fast food.',10,13,10,'$'                        
      
      msl3 db '  3.do some workout for weight lose (walking, running, crunching, ropping ).',10,13,10,'$' 
      
      msn db '  congratulation..! keep it up. ','$'
      
      msm1 db '  press 1 to recalculate.$'
      msm2 db '  press 2 to exit.', '$' 
      msm3 db '          thank you','$'
      msm4 db '  press any key to continue.... ',10,13,10,'$'
      
      sum dw ?
  
   
  .code
      main proc
        
        mov ax,@data
        mov ds,ax

        ;welcome message
    
        lea dx,msg1
        mov ah,9
        int 21h
        
        call nl
        call nl
        
        ;2 welcome message
        
        lea dx,msg2
        mov ah,9
        int 21h 
        
        call nl
        call nl
        
        lea dx,msg3
        mov ah,9
        int 21h 
        
        start:
        
        call nl
        call nl
        
        ;user enter the height
        
        lea dx,hinput
        mov ah,9
        int 21h 

        mov ax,0
        mov bx,0
        mov cx,0
        mov dx,0
        mov sum,0
        
        ;call input
     input:
     
        and ax,000fh
        push ax
        mov ax,10
        mul bx
        mov bx,ax
        pop ax
        add bx,ax
        
        mov ah,1
        int 21h
        
        
        ;when user press enter  
        cmp al,0dh
        je print
        
       
        jmp input
        
        
      print: 
        
        call nl
        
        ;user enter the weight
        
        lea dx,winput
        mov ah,9
        int 21h
        
        ;sum
        
        mov sum,bx
        mov bx,0
        mov ax,0

      input2:
         
        and ax,000fh
        push ax
        mov ax,10
        
        mul bx
        mov bx,ax
        pop ax
        
        add bx,ax
        
        mov ah,1
        int 21h
        
        ;when user press enter 
        cmp al,0dh
        je convert
        
        jmp input2
        
        
      ;claculate result  
         
      convert:
        
        mov ax,sum
        mov dx,0
        
        div bx
         
        
        cmp ax,1
        je over
        
        cmp ax,2
        je over
        
        cmp ax,3
        je perfect
        
        cmp ax,4
        je under
        
        cmp ax,5
        je under 
        
        
      over:
        
        call nl
        call nl
        
        lea dx,o
        mov ah,9
        int 21h 
        
        jmp press
        
        
      perfect:
         
        call nl
        call nl
        
        lea dx,p
        mov ah,9
        int 21h
        
        call nl
        call nl
        
        lea dx,msn
        mov ah,9
        int 21h 
         
        jmp exit
        
         
      under:
        
        call nl
        call nl
        
        lea dx,u
        mov ah,9
        int 21h 
        
        jmp press
        

      press:
        
        mov ax,0 
        
        call nl
        call nl
        

        ;if user press 1 then show the instruction for gain the perfect weight

        lea dx,press1
        mov ah,9
        int 21h
        
        call nl
        call nl
        

        ;if user press 2 then show the instruction for gain the perfect weight

        lea dx,press2
        mov ah,9
        int 21h
        
        
        mov ah,1
        int 21h
        
        cmp al,'1'
        je p1
        
        cmp al,'2'
        je p2
        
        
      p1:
        
        call nl
        call nl
        
        lea dx,msk1
        mov ah,9
        int 21h
        
        call nl
        
        lea dx,msk2
        mov ah,9
        int 21h
        
        call nl
        
        lea dx,msk3
        mov ah,9
        int 21h
        
        call nl
        
        lea dx,msk4
        mov ah,9
        int 21h
        
        jmp exit
        
      p2:
        
        call nl
        call nl
        
        lea dx,msl1
        mov ah,9
        int 21h
        
        call nl
        
        lea dx,msl2
        mov ah,9
        int 21h
        
        call nl
        
        lea dx,msl3
        mov ah,9
        int 21h
        
      exit:
        mov ax,0
        call nl
        call nl
        
        lea dx,msm4
        mov ah,9
        int 21h   
        
        mov ah,1
        int 21h
           
        call nl
         
        lea dx,msm1
        mov ah,9
        int 21h
        
        call nl
        
        lea dx,msm2
        mov ah,9
        int 21h 
        
        mov ah,1
        int 21h
        
        cmp al,'1'
        je start
        
        jmp exit2
        
      nl:
        mov ah,2
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h
        ret
        
          
      exit2:  
        call nl
        call nl
        
        lea dx,msm3
        mov ah,9
        int 21h
         
        mov ah,4ch
        int 21h
                 
      main endp 
      end main    