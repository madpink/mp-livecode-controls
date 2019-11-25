script "ControlTestButtons.lcs"
local testStack = "LiveCode Extension Test Window"
local controlCount
local addToTitle = ""

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
   put the tabData of widget 1 of stack testStack into tArray["tabData"]
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
      edit the script of stack "ControlTestButtons.lcs"
      break
    case "9"
      set the arrayData of widget "controlData" to empty
      exit to top
      break
    case "A"
      set the columnCount of widget 1 of stack testStack to 2
      set the controlObjectVertical of widget 1 of stack testStack to "Fixed spacing"
      testType "Button Bar",5,5
      
      break
    case "B"
      -- set the controlBufferV of widget 1 of stack testStack to 13
      --set the controlObjectVertical of widget 1 of stack testStack to "Fixed spacing"
      resizeTestStack
      set the controlType of widget 1 of stack testStack to "Button Wheel"
      break
    case "C"
      -- set the controlItemSpacing of widget 1 of stack testStack to 1
      -- set the controlObjectVertical of widget 1 of stack testStack to "Even spacing"
      set the showOutputBox of widget 1 of stack testStack to true
      break
    case "D"
      resizeTestStack
      -- set the controlItemSpacing of widget 1 of stack testStack to 13
      
      --         put the myData of widget 1 of stack testStack into tData
      --         put true into tData[2]["selected"]
      --         set the myData of widget 1 of stack testStack to tData
      
      set the controlType of widget 1 of stack testStack to "Button Wheel"
      set the controlObjectSize of widget 1 of stack testStack to 51
      set the buttonBarType of widget 1 of stack testStack to "single"
      --set the showOutputBox of widget 1 of stack testStack to true
      quickData 5
      break
    case "E"
      -- set the xxx of widget 1 of stack testStack to zzz
      -- put "icon:thisfamily/thisname:thisIsATest" into tIcon
      -- set the dataCommand of widget 1 of stack testStack to tIcon
      
      --         put empty into tData["1"]
      --         put empty into tData["2"]
      --         set the tabData of widget 1 of stack testStack to tData
      break
    case "F"
      -- set the xxx of widget 1 of stack testStack to zzz
      --testType "Progress Bars",3,5
      --         set the controlType of widget 1 of stack testStack to "Mixed Controls"
      --         put "Button Bar" into testData[1]["controltype"]
      --         put "Button Bar" into testData[3]["controltype"]
      --         put "Numeric Up/Down" into testData[2]["controltype"]
      --         put "Sliders" into testData[4]["controltype"]
      --         put "Switches" into testData[5]["controltype"]
      --         put "Button Bar" into testData[6]["controltype"]
      --         set the myData of widget 1 of stack testStack to testData
      
      put "ABC" into tData["1"]["label"]
      put "DEF" into tData["2"]["label"]
      put "GHI" into tData["3"]["label"]
      put "JKL" into tData["4"]["label"]
      put false into tData["1"]["selected"]
      put false into tData["2"]["selected"]
      put true into tData["3"]["selected"]
      put false into tData["4"]["selected"]
      set the tabData of widget 1 of stack testStack to tData
      set the showTabPages of widget 1 of stack testStack to true
      
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
   set the height of widget 1 of stack testStack to 423
   set the width of widget 1 of stack testStack to 541
   set the top of widget 1 of stack testStack to 2
   set the left of widget 1 of stack testStack to 2
   set the height of stack testStack to 451
   set the width of stack testStack to 542
   set the left of stack testStack to the right of this stack
   set the top of stack testStack to the top of this stack
end resizeTestStack

command quickData pX
   local tData
   repeat with x=1 to pX
      put empty into tData[x]
   end repeat
   set the myData of widget 1 on stack testStack to tData
end quickData

command cycleTest
   local tThyme 
   put (541 + 42)/13 into tThyme
   testType "Button Bar",controlCount,tThyme
   testType "Sliders",controlCount,tThyme
   testType "Numeric Up/Down",controlCount,tThyme
   testType "Progress Bars",controlCount,tThyme
   testType "Switches",controlCount,tThyme
   testType "Dialog Box",controlCount,tThyme
end cycleTest

command encodeDefaultScript
   local tX, tCount, tOutput
   put the script of button "currentScript" into tInput
   put base64Encode(tInput) into tX
   replace cr with "" in tX
   repeat ceiling((the number of chars of tX)/42) times
      put the number of chars of tX into tCount
      if tCount < 42 then
         put "  put " & quote & char 1 to 42 of tX & quote & " after tScript" & cr after tOutput
         exit repeat
      else
         put "  put " & quote & char 1 to 42 of tX & quote & " after tScript" & cr after tOutput
         delete char 1 to 42 of tX
      end if
   end repeat
   put tOutput into field "scriptRez"
   set the clipboardData["text"] to tOutput
end encodeDefaultScript
