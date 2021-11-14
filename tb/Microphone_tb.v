`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company:  RUAS
// Engineer: Dileep Nethrapalli
// 
// Create Date: 10/27/2020 02:19:24 PM
// Design Name: 
// Module Name: Microphone_tb
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


module Microphone_tb( );
    
    wire [4:0] count_21;
    wire CLK, L_R_SEL, Right_channel, Left_channel;
    reg  DATA_tb, Clock_100MHz, Reset_n;
    integer i;   
    
    Microphone mic_DUT(
       .CLK(CLK), .L_R_SEL(L_R_SEL), .CLK_pmod(),
       .Right_channel(Right_channel), 
       .Left_channel(Left_channel),
       .DATA(DATA_tb), 
       .Clock_100MHz(Clock_100MHz), .Reset_n(Reset_n));
                       
    
    assign count_21 = mic_DUT.count_21;
    
    initial Clock_100MHz = 0;
    always #5 Clock_100MHz = ~Clock_100MHz;
                         
    initial
      begin
             Reset_n = 0; DATA_tb = 0;
        #100 Reset_n = 1; 
             for(i=0; i< 1000; i=i+1)
               begin
                 DATA_tb = $random;
                 #7;
               end  
         #100 $finish;  
        
      end   
    
endmodule
