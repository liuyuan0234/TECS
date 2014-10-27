// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.
@8192
D=A
@SCREENSIZE   //定义变量SCREENSIZE，通过CPU仿真器，可看到SCREENSIZE值存放在RAM[16]，可认为SCREENSIZE为地址值16
M=D           //则此句为M[SCREENSIZE] = M[16] = D, 即将8192存入RAM[16]内存单元
@SCREEN
D=A
@SCREENPOINTER
M=D

(LOOP)
@KBD
D=M
@CLEARSCREEN
D;JEQ
@BLACKSCREEN
0;JMP
(END)
@END
0;JMP

(CLEARSCREEN)
(LOOP_CLEARSCREEN)
@SCREENSIZE
D=M
@1
D=D-A
@ENDCLEARSCREEN
D;JLT
@SCREENSIZE
M=D
D=0
@SCREENPOINTER    
A=M             //通过CPU仿真器可看到，SCREENPOINTER存放在RAM[17]中，此句为A = M[17],即取显存地址
M=D              //M[上句所取的显存地址] = D, 即写显存 
@SCREENPOINTER
M=M+1
@LOOP_CLEARSCREEN
0;JMP
(ENDCLEARSCREEN)
@8192
D=A
@SCREENSIZE
M=D
@SCREEN
D=A
@SCREENPOINTER
M=D
@LOOP
0;JMP


(BLACKSCREEN)
(LOOP_BLACKSCREEN)
@SCREENSIZE
D=M
@1
D=D-A
@ENDBLACKSCREEN
D;JLT
@SCREENSIZE
M=D
D=-1
@SCREENPOINTER
A=M
M=D
@SCREENPOINTER
M=M+1
@LOOP_BLACKSCREEN
0;JMP
(ENDBLACKSCREEN)
@8192
D=A
@SCREENSIZE
M=D
@SCREEN
D=A
@SCREENPOINTER
M=D
@LOOP
0;JMP