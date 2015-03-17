class ICE_DIALOG
{
    idd = -1;
    movingenable = true;
   
    
    class Controls
    {

         class ICE_BOX: BOX
         {
          idc = -1;
          text = "";
          x = 0;
          y = safezoneY;
          w = 1;
          h = safezoneH;
         };
         
		 class ICE_FRAME: RscFrame
         {
          idc = -1;
          text = "Привет!";
          x = 0;
          y = safezoneY;
          w = 1;
          h = safezoneH;
         };
         class ICE_BUTTONYES: RscButton
         {
          idc = -1;
          text = "ОК";
          x = 0.4;
          y = 1 + safezoneH * 0.15;
          w = 0.2;
          h = 0.1;
              action = "closeDialog 0;";
        };
        /* class ICE_BUTTONNO: RscButton
        {
          idc = -1;
          text = "NO";
          x = 0.533334 * safezoneW + safezoneX;
          y = 0.625715 * safezoneH + safezoneY;
          w = 0.0398809 * safezoneW;
          h = 0.0404761 * safezoneH;
              action = "closeDialog 0;_nil=[]ExecVM ""hello2.sqf""";
        }; */
        /* class ICE_PICTURE: RscPicture
        {
          idc = -1;
          text = "shilka.paa";
          x = 0.428572 * safezoneW + safezoneX;
          y = 0.32381 * safezoneH + safezoneY;
          w = 0.161905 * safezoneW;
          h = 0.189048 * safezoneH;
        };*/
        class ICE_TEXT: MyRscHTML
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