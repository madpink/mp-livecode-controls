script "ControlTestButtons.lcs"
local testStack = "LiveCode Extension Test Window"
local controlCount
local addToTitle = ""
local testData

/*
Useful for testing out the control panel when programming the widget
The first set of buttons makes a particular controlType with a random number of controls

A-F can be programmed to test out certain scenarios, data sets, properties etc...

Cycle goes creates each type of control in succession in one and two columns.

Size resizes the test window and moves it next to the ControlTest stack.

When a button is pressed, the appData and myData of the widget is put into the Tree on the right.
*/

on mouseUp
   if exists(stack testStack) then
      buttonAction the short name of the target
   else
      edit the script of stack "ControlTestButtons.lcs"
   end if
end mouseUp

command getDataFromWidget
   put the appData of widget 1 of stack testStack into tArray["appData"]
   put the myData of widget 1 of stack testStack into tArray["myData"]
   set the arrayData of widget "controlData" to tArray
end getDataFromWidget

command buttonAction pType
   resizeTestStack
   put random(5)+2 into controlCount
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
         edit the script of stack "ControlTestButtons.lcs"
         break
      case "9"
         set the arrayData of widget "controlData" to empty
         exit to top
         break
      case "A"
         set the controlType of widget 1 of stack testStack to "Mixed Controls"
         put "Button Bar" into testData[1]["controltype"]
         put "Sliders" into testData[2]["controltype"]
         put "Switches" into testData[3]["controltype"]
         put "Numeric Up/Down" into testData[4]["controltype"]
         put "Switches" into testData[5]["controltype"]
         set the myData of widget 1 of stack testStack to testData
         break
      case "B"
         --set the controlBufferV of widget 1 of stack testStack to 13
         --set the buttonBarType of widget 1 of stack testStack to "Single"
         quickData 5
         break
      case "C"
         --set the controlItemSpacing of widget 1 of stack testStack to 1
         put "false" into testData[2]["show"]
         set the myData of widget 1 of stack testStack to testData
         break
      case "D"
         --set the controlItemSpacing of widget 1 of stack testStack to 13
         set the buttonBarType of widget 1 of stack testStack to "Action"
         break
      case "E"
         -- set the xxx of widget 1 of stack testStack to zzz
         put "icon:thisfamily/thisname:thisIsATest" into tIcon
         set the dataCommand of widget 1 of stack testStack to tIcon
         break
      case "F"
         -- set the xxx of widget 1 of stack testStack to zzz
         --testType "Progress Bars",3,5
         set the columnCount of widget 1 of stack testStack to 2
         break
      case "G"
         set the columnCount of widget 1 of stack testStack to 2
         set the controlObjectVertical of widget 1 of stack testStack to "Fixed Spacing"
         put "2col/fixed" into addToTitle
         cycleTest
         set the controlObjectVertical of widget 1 of stack testStack to "Even Spacing"
         put "2col/Even" into addToTitle
         cycleTest
         set the columnCount of widget 1 of stack testStack to 1
         set the controlObjectVertical of widget 1 of stack testStack to "Fixed Spacing"
         put "1col/Fixed" into addToTitle
         cycleTest
         set the controlObjectVertical of widget 1 of stack testStack to "Even Spacing"
         put "1col/Even" into addToTitle
         cycleTest
         put empty into addToTitle
         break
      case "H"
         resizeTestStack
         break
   end switch
   getDataFromWidget
end buttonAction

command testType pType pCount pWait
   set the controlType of widget 1 of stack testStack to pType
   set the titleText of widget 1 of stack testStack to pType && addToTItle
   quickData pCount
   wait pWait
end testType

command resizeTestStack
   set the height of widget 1 of stack testStack to 420
   set the width of widget 1 of stack testStack to 400
   set the top of widget 1 of stack testStack to 2
   set the left of widget 1 of stack testStack to 2
   set the height of stack testStack to 440
   set the width of stack testStack to 410
   set the left of stack testStack to the right of this stack
   set the top of stack testStack to the top of this stack
end resizeTestStack

command quickData pX
   put empty into testData
   repeat with x=1 to pX
      put empty into testData[x]
   end repeat
   set the myData of widget 1 on stack testStack to testData
end quickData

command cycleTest
   local tThyme 
   put (541 + 42)/23 into tThyme
   put (541 + 42)/13 into tThyme
   testType "Button Bar",controlCount,tThyme
   testType "Sliders",controlCount,tThyme
   testType "Numeric Up/Down",controlCount,tThyme
   testType "Progress Bars",controlCount,tThyme
   testType "Switches",controlCount,tThyme
   testType "Dialog Box",controlCount,tThyme
end cycleTest
