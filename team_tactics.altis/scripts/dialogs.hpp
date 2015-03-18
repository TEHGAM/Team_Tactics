class HELLO_WIN
{
    idd = -1;
    movingenable = true;
       
    class Controls
    {
         class WIN_BOX: BOX
         {
          idc = -1;
          text = "";
          x = 0;
          y = safezoneY;
          w = 1;
          h = safezoneH;
         };
         
		 class WIN_FRAME: RscFrame
         {
          idc = -1;
          text = "Привет!";
          x = 0;
          y = safezoneY;
          w = 1;
          h = safezoneH;
         };

         class WIN_BUTTONOK: RscButton
         {
          idc = -1;
          text = "ОК";
          x = 0.4;
          y = safezoneY + safezoneH * 0.9;
          w = 0.2;
          h = safezoneH*0.05;
              action = "closeDialog 0;";
        };
        
		class WIN_TEXT: MyRscHTML
        { 
         idc = -1;
		 filename = "scripts\file.html";
         x = 0;
         y = safezoneY + 0.05;
         w = 1;
         h = safezoneH;
        };
    };
};