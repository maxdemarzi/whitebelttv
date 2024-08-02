' Channel entry point
sub Main()
    ' for debugging
    ' ShowRokuManifest()
    ' ShowDeviceInfo()

    ' Actual Start
    ShowChannelRSGScreen()
end sub

sub ShowRokuManifest()
	' Print information from Roku manifest
	app_info = createObject("roAppInfo")
	? "App Title: ", app_info.getTitle()
	? "App Version: ", app_info.getVersion()
	? "Channel ID: ", app_info.getID()
	? "isDev: ", app_info.isDev()
end sub

sub ShowDeviceInfo()
	? "- - - - - - - - - - - - - - - - "
	device_info = createObject("roDeviceInfo")
	? "Model: ", device_info.getModel()
	? "Display Name: ", device_info.getModelDisplayName()
    firmware = device_info.getOSVersion()
	? "Firmware - Build: ", firmware.build
    ? "Firmware - Major: ", firmware.major
    ? "Firmware - Minor: ", firmware.minor
    ? "Firmware - Revision: ", firmware.revision
	? "Channel Client ID: ", device_info.GetChannelClientId()
	? "Friendly Name: ", device_info.getFriendlyName()
	display_size = device_info.getDisplaySize()
	? "Display Size: ", display_size.w;"x";display_size.h
	ui_resolution = device_info.getUIResolution()
    ? "UI Resolution - Name:  ", ui_resolution.name
    ? "UI Resolution - Width: ", ui_resolution.width
    ? "UI Resolution - Height: ", ui_resolution.height
	? "Video Mode: ", device_info.getVideoMode()
	? "IP Address: ",device_info.getExternalIp()
end sub


sub ShowChannelRSGScreen()
    ' The roSGScreen object is a SceneGraph canvas that displays the contents of a Scene node instance
    screen = CreateObject("roSGScreen")
    ' message port is the place where events are sent
    m.port = CreateObject("roMessagePort")
    ' sets the message port which will be used for events from the screen
    screen.SetMessagePort(m.port)
    ' every screen object must have a Scene node, or a node that derives from the Scene node
    scene = screen.CreateScene("MainScene")
    screen.Show() ' Init method in MainScene.brs is invoked

    ' event loop
    while(true)
        ' waiting for events from screen
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.IsScreenClosed() then return
        end if
    end while
end sub
