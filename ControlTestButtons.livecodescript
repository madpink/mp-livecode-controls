script "ControlTestButtons.lcs"
local testStack = "LiveCode Extension Test Window"

on mouseUp
   buttonAction the short name of the target
end mouseUp

command getDataFromWidget
   put the appData of widget 1 of stack testStack into tArray["appData"]
   put the myData of widget 1 of stack testStack into tArray["myData"]
   set the arrayData of widget "controlData" to tArray
end getDataFromWidget

command buttonAction pType
   put random(8)+2 into controlCount
   switch pType
      case "1"
         set the controlType of widget 1 of stack testStack to "Dialog Box"
         set the titleText of widget 1 of stack testStack to "Test: Dialog Box"
         break
      case "2"
         testType "Button Bar",controlCount,5
         break
      case "3"
         testType "Sliders",controlCount,5
         break
      case "4"
         testType "Numeric Up/Down",controlCount,5
         break
      case "5"
         testType "Progress Bars",controlCount,5
         break
      case "6"
         testType "Switches",controlCount,5
         break
      case "7"
         testType "Form Backdrop",controlCount,5
         break
      case "8"
         edit the script of me
         break
      case "9"
         set the arrayData of widget "controlData" to empty
         exit to top
         break
      case "A"
         set the controlBufferV of widget 1 of stack testStack to 1
         break
      case "B"
         set the controlBufferV of widget 1 of stack testStack to 13
         
         break
      case "C"
         set the controlItemSpacing of widget 1 of stack testStack to 1
         
         break
      case "D"
         set the controlItemSpacing of widget 1 of stack testStack to 13
         
         break
      case "E"
         -- set the xxx of widget 1 of stack testStack to zzz
         
         break
      case "F"
         -- set the xxx of widget 1 of stack testStack to zzz
         --testType "Progress Bars",3,5
         testType "Switches",5,1
         break
      case "G"
         -- set the xxx of widget 1 of stack testStack to zzz
         set the height of widget 1 of stack testStack to 420
         set the width of widget 1 of stack testStack to 400
         set the top of widget 1 of stack testStack to 2
         set the left of widget 1 of stack testStack to 2
         set the height of stack testStack to 440
         set the width of stack testStack to 410
         set the left of stack testStack to the right of this stack
         set the top of stack testStack to the top of this stack
         break
      case "H"
         --cycleTest
         -- set the showOutputBox of widget 1 of stack testStack to true
         
         put "1;;label;;THis is the thing" & cr into tInput
         put "1;;value;;20" & cr after tInput
         put "2;;label;;other thing" after tInput
         
         /*
         put "!mydata;" & cr into tInput
         put "!1;" & cr after tInput
         put "=label;Test 1" & cr after tInput
         put ";1" & cr after tInput
         put "!2;" & cr after tInput
         put "=label;Test 2" & cr after tInput
         put ";2" & cr after tInput
         put ";mydata" after tInput
         */
         --set the dataCommand of widget 1 of stack testStack to "t:z:xx"
         
         ç         
         break
   end switch
   getDataFromWidget
end buttonAction

command testType pType pCount pWait
   set the controlType of widget 1 of stack testStack to pType
   set the titleText of widget 1 of stack testStack to "Test:" && pType
   quickData pCount
   wait pWait
end testType

command quickData pX
   local tData
   repeat with x=1 to pX
      --put "qzq" & x into tData[x]["label"]
      put empty into tData[x]
   end repeat
   set the myData of widget 1 on stack testStack to tData
end quickData

command cycleTest
   testType "Button Bar",controlCount,200
   testType "Sliders",controlCount,200
   testType "Numeric Up/Down",controlCount,200
   testType "Progress Bars",controlCount,200
   testType "Switches",controlCount,200
   testType "Dialog Box",controlCount,200
end cycleTest
