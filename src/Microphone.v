`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company:  RUAS
// Engineer: Dileep Nethrapalli
// 
// Create Date: 10/23/2020 11:28:04 AM
// Design Name: 
// Module Name: Microphone
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Microphone(
         output reg CLK, L_R_SEL,  
         input DATA, Clock_100MHz, Reset_n,
         output reg Right_channel, Left_channel,          
         output CLK_pmod
       );   
              
   assign CLK_pmod = CLK;      
             
  // Generate a clock(CLK) of frequency 2.4MHz(2400KHz) = 416.67ns
     // 416.67ns clock = 208ns ON + 208ns OFF;
     // 100MHz = 10ns = 1; 208ns = x; x = 21
     // 20 = 1_0100b 
     
     reg [4:0] count_21;
          
     always@(posedge Clock_100MHz, negedge Reset_n) 
       if(!Reset_n)
         begin
           CLK <= 0;
           count_21 <= 0;
         end  
       else if(count_21 == 20)
         begin
           CLK <= ~CLK; 
           count_21 <= 0; 
         end   
       else
         begin
           CLK <= CLK;        
           count_21 <= count_21 + 1;  
         end  
         
         
  // Generate Left and Right Selector signal       
     always@(negedge Clock_100MHz, negedge Reset_n) 
        if(!Reset_n)
          L_R_SEL <= 1'bz;        
        else if((CLK == 0) && (count_21 == 3)) 
          L_R_SEL <= 0;  // Right channel   
        else if((CLK == 1) && (count_21 == 3)) 
          L_R_SEL <= 1; // Left channel  
          
              
 // Generate Right channel signal            
    always@(posedge CLK, negedge Reset_n)  
      if(!Reset_n) 
         Right_channel <= 0;
      else  
         Right_channel <= DATA;
         
         
 // Generate Left channel signal                     
    always@(negedge CLK, negedge Reset_n)  
      if(!Reset_n)
        Left_channel <= 0;  
      else  
        Left_channel <= DATA; 
         
endmodule
