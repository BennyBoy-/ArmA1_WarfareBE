//Last modified 12/13/7
//Show a GUI message & fade it out.
Private["_control","_delay","_fadeDelay","_message"];

_control = _this Select 0;
_delay = _this Select 1;
_fadeDelay = _this Select 2;
_message = _this Select 3;
_control CtrlSetTextColor (_this Select 4);

_control CtrlSetText _message;
_control CtrlSetFade 0;
_control CtrlShow true;
_control CtrlCommit 0;
Sleep _delay;
_control CtrlSetFade 1;
_control CtrlCommit _fadeDelay;
Sleep _fadeDelay;
_control CtrlShow false;

//12/13/7 MM - Created file.
