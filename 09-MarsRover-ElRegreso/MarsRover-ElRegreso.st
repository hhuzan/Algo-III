!classDefinition: #TestLogger category: 'MarsRover-ElRegreso'!
TestCase subclass: #TestLogger
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!TestLogger methodsFor: 'testing' stamp: 'HJH 7/22/2021 01:32:27'!
test01MarsRoverSimpleLogWithEmptyCommandDontLog

	| marsRover logger |
	marsRover := MarsRover startingAt: 3@3 heading: #North.

	logger := Logger new.
	marsRover attachForPosition: logger.
	
	marsRover processCommands: ''.
	
	self assert: 0 equals: logger logs size! !

!TestLogger methodsFor: 'testing' stamp: 'HJH 7/22/2021 01:32:27'!
test02MarsRoverSimpleLogWhenMoveLogsTheNewPosition

	| marsRover logger |
	marsRover := MarsRover startingAt: 3@3 heading: #North.

	logger := Logger new.
	marsRover attachForPosition: logger.
	
	marsRover processCommands: 'f'.
	
	self assert: 1 equals: logger logs size.
	self assert: 'Position: 3@4;' equals: (logger logs at: 1)! !

!TestLogger methodsFor: 'testing' stamp: 'HJH 7/22/2021 01:32:46'!
test03MarsRoverSimpleLogWhenRotateLogTheNewHeading

	| marsRover logger |
	marsRover := MarsRover startingAt: 3@3 heading: #North.

	logger := Logger new.
	marsRover attachForHeading: logger.
	
	marsRover processCommands: 'r'.
	
	self assert: 1 equals: logger logs size.
	self assert: 'Heading: East;' equals: (logger logs at: 1)! !

!TestLogger methodsFor: 'testing' stamp: 'HJH 7/22/2021 01:32:46'!
test04MarsRoverComposedLogWhenMoveLogsOnlyTheNewPosition

	| marsRover logger |
	marsRover := MarsRover startingAt: 3@3 heading: #North.

	logger := Logger new.
	marsRover attachForPosition: logger.
	marsRover attachForHeading: logger.
	
	marsRover processCommands: 'f'.
	
	self assert: 1 equals: logger logs size.
	self assert: 'Position: 3@4;' equals: (logger logs at: 1)	.
! !

!TestLogger methodsFor: 'testing' stamp: 'HJH 7/22/2021 01:32:47'!
test05MarsRoverComposedLogWithMultipleCommandsLogsCorrectly

	| marsRover logger |
	marsRover := MarsRover startingAt: 3@3 heading: #North.

	logger := Logger new.
	marsRover attachForPosition: logger.
	marsRover attachForHeading: logger.
	
	marsRover processCommands: 'fr'.
	
	self assert: 2 equals: logger logs size.
	self assert: 'Position: 3@4;' equals: (logger logs at: 1)	.
	self assert: 'Heading: East;' equals: (logger logs at: 2)! !


!classDefinition: #TestMarsRover category: 'MarsRover-ElRegreso'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:42:57'!
test01MarsRoverDoestNotMoveWhenNoCommandsAreSent

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: '' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:05'!
test02RoverFacingNorthCanMoveForward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'f' endsAt: 0@1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:13'!
test03RoverFacingNorthCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'b' endsAt: 0@-1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:24'!
test04RoverFacingNorthHeadsEastAfterTurningRight

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'r' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:55'!
test05RoverFacingNorthHeadsWestAfterTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'l' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:26'!
test06RoverFacingEastHeadsSouthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'r' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:43'!
test07RoverFacingSouthHeadsWestWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'r' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:00'!
test08RoverFacingWestHeadsNorthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'r' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:20'!
test09RoverFacingEastHeadsNorthWhenTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'l' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:52'!
test10RoverFacingSouthHeadsEastWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'l' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:46:17'!
test11RoverFacingWestHeadsSouthWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'l' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:36'!
test12RoverFacingEastCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'f' endsAt: 1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:55'!
test13RoverFacingEastCanMoveBackwards

	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'b' endsAt: -1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:20'!
test14RoverFacingSouthCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'f' endsAt: 0@-1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:38'!
test15RoverFacingSouthCanMoveBackward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'b' endsAt: 0@1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:10'!
test16RoverFacingWestCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'f' endsAt: -1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:46'!
test17RoverFacingWestCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'b' endsAt: 1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:50:56'!
test18RoverCanProcessMultipleCommands

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'ff' endsAt: 0@2 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'HJH 7/18/2021 10:54:39'!
test19RoverStopsWhenProcessingAnInvalidCommand

	| marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	
	self should: [ marsRover processCommands: 'fxf' ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: marsRover invalidCommandErrorMessage.
			self assert: (marsRover isAt: 0@1 heading: #North).
		].
	
	! !


!TestMarsRover methodsFor: 'assertions' stamp: 'HJH 7/18/2021 10:54:39'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands endsAt: aFinalPosition heading: aFinalCardinalPoint

	| marsRover |
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	marsRover processCommands: aStringOfCommands.
	
	self assert: (marsRover isAt: aFinalPosition heading: aFinalCardinalPoint)! !


!classDefinition: #TestWindow category: 'MarsRover-ElRegreso'!
TestCase subclass: #TestWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!TestWindow methodsFor: 'testing' stamp: 'HJH 7/22/2021 01:32:27'!
test01MarsRoverSimpleWindowWithEmptyCommandShowNothing

	| marsRover window |
	marsRover := MarsRover startingAt: 3@3 heading: #North.

	window := Window new.
	marsRover attachForPosition: window.
	
	marsRover processCommands: ''.
	
	self assert: '' equals: window text! !

!TestWindow methodsFor: 'testing' stamp: 'HJH 7/22/2021 01:32:27'!
test02MarsRoverSimpleWindowWhenMoveShowsTheNewPosition

	| marsRover window |
	marsRover := MarsRover startingAt: 3@3 heading: #North.

	window := Window new.
	marsRover attachForPosition: window.
	
	marsRover processCommands: 'f'.
	
	self assert: 'Position: 3@4;' equals: window text! !

!TestWindow methodsFor: 'testing' stamp: 'HJH 7/22/2021 01:32:47'!
test03MarsRoverSimpleWindowsWhenRotateShowsTheNewHeading

	| marsRover window |
	marsRover := MarsRover startingAt: 3@3 heading: #North.

	window := Window new.
	marsRover attachForHeading: window.
	
	marsRover processCommands: 'rr'.
	
	self assert: 'Heading: South;' equals: window text! !

!TestWindow methodsFor: 'testing' stamp: 'HJH 7/22/2021 01:32:46'!
test04MarsRoverComposedWindowWithMultipleCommandsShowsLastPositionAndHeading

	| marsRover window |
	marsRover := MarsRover startingAt: 3@3 heading: #North.

	window := Window new.
	marsRover attachForPosition: window.
	marsRover attachForHeading: window.
	
	marsRover processCommands: 'fr'.
	
	self assert: 'Position: 3@4;Heading: East;' equals: window text! !


!classDefinition: #Coso category: 'MarsRover-ElRegreso'!
Object subclass: #Coso
	instanceVariableNames: 'observers marsRover value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!Coso methodsFor: 'as yet unclassified' stamp: 'HJH 7/21/2021 22:21:11'!
attach: anObserver

	observers add: anObserver! !

!Coso methodsFor: 'as yet unclassified' stamp: 'HJH 7/22/2021 05:37:02'!
notify

	self subclassResponsibility! !

!Coso methodsFor: 'as yet unclassified' stamp: 'HJH 7/22/2021 00:04:11'!
value

	^value! !

!Coso methodsFor: 'as yet unclassified' stamp: 'HJH 7/22/2021 05:34:16'!
value: aValue

	value := aValue.
	self notify! !


!Coso methodsFor: 'initialization' stamp: 'HJH 7/22/2021 01:41:53'!
initializeFor: aMarsRover with: aValue 

	marsRover := aMarsRover.
	value := aValue.
	observers := OrderedCollection new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Coso class' category: 'MarsRover-ElRegreso'!
Coso class
	instanceVariableNames: ''!

!Coso class methodsFor: 'as yet unclassified' stamp: 'HJH 7/22/2021 05:31:49'!
for: aMarsRover with: aValue

	^self new initializeFor: aMarsRover with: aValue
	! !


!classDefinition: #CosoHeading category: 'MarsRover-ElRegreso'!
Coso subclass: #CosoHeading
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!CosoHeading methodsFor: 'as yet unclassified' stamp: 'HJH 7/22/2021 05:34:48'!
notify

	observers do: [ :anObserver | anObserver updateHeading: marsRover ]! !


!classDefinition: #CosoPosition category: 'MarsRover-ElRegreso'!
Coso subclass: #CosoPosition
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!CosoPosition methodsFor: 'as yet unclassified' stamp: 'HJH 7/22/2021 05:33:47'!
notify

	observers do: [ :anObserver | anObserver updatePosition: marsRover ]! !


!classDefinition: #Logger category: 'MarsRover-ElRegreso'!
Object subclass: #Logger
	instanceVariableNames: 'logs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!Logger methodsFor: 'initialization' stamp: 'HJH 7/19/2021 22:22:54'!
initialize

	logs := OrderedCollection new.! !


!Logger methodsFor: 'private' stamp: 'HJH 7/22/2021 01:28:11'!
log: aText

	logs add: aText! !


!Logger methodsFor: 'accessing' stamp: 'HJH 7/19/2021 21:00:59'!
logs

	^logs! !


!Logger methodsFor: 'position observer' stamp: 'HJH 7/22/2021 01:10:32'!
printPosition: aPosition

	logs add: 'Position: ' , aPosition asString , ';'
! !

!Logger methodsFor: 'position observer' stamp: 'HJH 7/22/2021 01:08:58'!
updatePosition: aMarsRover

	aMarsRover printPositionFor: self! !


!Logger methodsFor: 'heading observer' stamp: 'HJH 7/22/2021 01:28:31'!
printEast

	self log: 'Heading: East;'! !

!Logger methodsFor: 'heading observer' stamp: 'HJH 7/22/2021 01:28:44'!
printNorth

	self log: 'Heading: North;'! !

!Logger methodsFor: 'heading observer' stamp: 'HJH 7/22/2021 01:28:58'!
printSouth

	self log: 'Heading: South;'! !

!Logger methodsFor: 'heading observer' stamp: 'HJH 7/22/2021 01:29:10'!
printWest

	self log: 'Heading: West;'! !

!Logger methodsFor: 'heading observer' stamp: 'HJH 7/22/2021 01:04:25'!
updateHeading: aMarsRover

	aMarsRover printHeadingFor: self! !


!classDefinition: #MarsRover category: 'MarsRover-ElRegreso'!
Object subclass: #MarsRover
	instanceVariableNames: 'cosoPosition cosoHeading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRover methodsFor: 'initialization' stamp: 'HJH 7/21/2021 23:48:06'!
initializeStartingAt: aPosition heading: aCardinalPoint 
	
	cosoPosition := CosoPosition for: self with: aPosition.
	cosoHeading := CosoHeading for: self with: (MarsRoverHead of: self facing: aCardinalPoint)! !


!MarsRover methodsFor: 'process commands' stamp: 'LL 6/30/2021 15:54:14'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.
	].
	
! !


!MarsRover methodsFor: 'testing' stamp: 'HJH 7/22/2021 00:07:28'!
isAt: aPosition heading: aCardinalPoint

	^cosoPosition value = aPosition and: [ cosoHeading value isHeading: aCardinalPoint ]! !


!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:54:11'!
assertCommandIsValid: aCommand

	^ (self isInvalidCommand: aCommand) ifTrue: [ self error: self invalidCommandErrorMessage ]! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:48:06'!
invalidCommandErrorMessage

	^'Invalid command'! !

!MarsRover methodsFor: 'private - process commands' stamp: 'HJH 7/22/2021 00:08:19'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ cosoHeading value movingForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ cosoHeading value movingBackwards ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^cosoHeading value rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^cosoHeading value rotateLeft ]
! !


!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:42'!
isBackwardCommand: command

	^ command = $b! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:27'!
isForwardCommand: command

	^ command = $f! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:51:21'!
isInvalidCommand: aCommand
	^(self isForwardCommand: aCommand) not and: 
		[ (self isBackwardCommand: aCommand) not and: 
			[ (self isRotateRightCommand: aCommand) not and: 
				[ (self isRotateLeftCommand: aCommand) not ] ] ]! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:50:53'!
isRotateLeftCommand: command

	^ command = $l! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:27:33'!
isRotateRightCommand: command

	^ command = $r! !


!MarsRover methodsFor: 'dd - moving' stamp: 'HJH 7/22/2021 02:14:50'!
moveDown

	cosoPosition value: cosoPosition value + (0@-1)! !

!MarsRover methodsFor: 'dd - moving' stamp: 'HJH 7/22/2021 02:15:28'!
moveLeft

	cosoPosition value: cosoPosition value + (-1@0)! !

!MarsRover methodsFor: 'dd - moving' stamp: 'HJH 7/22/2021 02:15:52'!
moveRight

	cosoPosition value: cosoPosition value + (1@0)! !

!MarsRover methodsFor: 'dd - moving' stamp: 'HJH 7/22/2021 04:42:44'!
moveUp

	cosoPosition value: cosoPosition value + (0@1)! !


!MarsRover methodsFor: 'dd - heading' stamp: 'HJH 7/22/2021 00:05:53'!
headEast

	cosoHeading value: (MarsRoverHeadFacingEast of: self)! !

!MarsRover methodsFor: 'dd - heading' stamp: 'HJH 7/22/2021 00:05:53'!
headNorth

	cosoHeading value: (MarsRoverHeadFacingNorth of: self)! !

!MarsRover methodsFor: 'dd - heading' stamp: 'HJH 7/22/2021 00:05:53'!
headSouth

	cosoHeading value: (MarsRoverHeadFacingSouth of: self)
! !

!MarsRover methodsFor: 'dd - heading' stamp: 'HJH 7/22/2021 00:05:53'!
headWest

	cosoHeading value: (MarsRoverHeadFacingWest of: self)! !


!MarsRover methodsFor: 'for observers' stamp: 'HJH 7/22/2021 01:32:46'!
attachForHeading: anObserver 

	cosoHeading attach: anObserver! !

!MarsRover methodsFor: 'for observers' stamp: 'HJH 7/22/2021 01:32:27'!
attachForPosition: anObserver

	cosoPosition attach: anObserver! !

!MarsRover methodsFor: 'for observers' stamp: 'HJH 7/22/2021 01:05:09'!
printHeadingFor: anObserver

	cosoHeading value printHeadingFor: anObserver

	! !

!MarsRover methodsFor: 'for observers' stamp: 'HJH 7/22/2021 01:08:43'!
printPositionFor: anObserver

	anObserver printPosition: cosoPosition value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-ElRegreso'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 13:30:13'!
startingAt: aPoint heading: aCardinalPoint 
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint ! !


!classDefinition: #MarsRoverHead category: 'MarsRover-ElRegreso'!
Object subclass: #MarsRoverHead
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:17:57'!
initializeOf: aMarsRover

	marsRover := aMarsRover! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
isHeading: aCardinalPoint

	^self class whenFacing: aCardinalPoint

	! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:46'!
rotateLeft

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:43'!
rotateRight

	self subclassResponsibility! !


!MarsRoverHead methodsFor: 'for observers' stamp: 'HJH 7/22/2021 01:05:09'!
printHeadingFor: anObserver

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHead class' category: 'MarsRover-ElRegreso'!
MarsRoverHead class
	instanceVariableNames: ''!

!MarsRoverHead class methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	self subclassResponsibility.! !


!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 16:16:27'!
of: aMarsRover

	^self new initializeOf: aMarsRover! !

!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 19:46:37'!
of: aMarsRover facing: aCardinalPoint
	
	| headingSubclass |
	headingSubclass := self subclasses detect: [ :aHeadingSubclass | aHeadingSubclass whenFacing: aCardinalPoint ].
	
	^headingSubclass of: aMarsRover.! !


!classDefinition: #MarsRoverHeadFacingEast category: 'MarsRover-ElRegreso'!
MarsRoverHead subclass: #MarsRoverHeadFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveLeft.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveRight.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:22'!
rotateLeft

	^marsRover headNorth.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:14'!
rotateRight

	^marsRover headSouth.

	! !


!MarsRoverHeadFacingEast methodsFor: 'for observers' stamp: 'HJH 7/22/2021 01:05:09'!
printHeadingFor: anObserver

	anObserver printEast! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingEast class' category: 'MarsRover-ElRegreso'!
MarsRoverHeadFacingEast class
	instanceVariableNames: ''!

!MarsRoverHeadFacingEast class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #East! !


!classDefinition: #MarsRoverHeadFacingNorth category: 'MarsRover-ElRegreso'!
MarsRoverHead subclass: #MarsRoverHeadFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverHeadFacingNorth methodsFor: 'for observers' stamp: 'HJH 7/22/2021 01:05:09'!
printHeadingFor: anObserver

	anObserver printNorth! !


!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveDown.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveUp.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:33'!
rotateLeft

	^marsRover headWest.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:58'!
rotateRight

	^marsRover headEast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingNorth class' category: 'MarsRover-ElRegreso'!
MarsRoverHeadFacingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingNorth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #North! !


!classDefinition: #MarsRoverHeadFacingSouth category: 'MarsRover-ElRegreso'!
MarsRoverHead subclass: #MarsRoverHeadFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveUp.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveDown! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:43'!
rotateLeft

	^marsRover headEast.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:30'!
rotateRight

	^marsRover headWest.! !


!MarsRoverHeadFacingSouth methodsFor: 'for observers' stamp: 'HJH 7/22/2021 01:05:09'!
printHeadingFor: anObserver

	anObserver printSouth! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingSouth class' category: 'MarsRover-ElRegreso'!
MarsRoverHeadFacingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingSouth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #South! !


!classDefinition: #MarsRoverHeadFacingWest category: 'MarsRover-ElRegreso'!
MarsRoverHead subclass: #MarsRoverHeadFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveRight.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveLeft.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:52'!
rotateLeft

	^marsRover headSouth.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:44'!
rotateRight

	^marsRover headNorth.! !


!MarsRoverHeadFacingWest methodsFor: 'for observers' stamp: 'HJH 7/22/2021 01:05:09'!
printHeadingFor: anObserver

	anObserver printWest! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingWest class' category: 'MarsRover-ElRegreso'!
MarsRoverHeadFacingWest class
	instanceVariableNames: ''!

!MarsRoverHeadFacingWest class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #West! !


!classDefinition: #Window category: 'MarsRover-ElRegreso'!
Object subclass: #Window
	instanceVariableNames: 'textHeading textPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!Window methodsFor: 'heading observer' stamp: 'HJH 7/22/2021 01:02:13'!
printEast

	textHeading := 'Heading: East;'! !

!Window methodsFor: 'heading observer' stamp: 'HJH 7/22/2021 01:02:31'!
printNorth

	textHeading := 'Heading: North;'! !

!Window methodsFor: 'heading observer' stamp: 'HJH 7/22/2021 01:02:49'!
printSouth

	textHeading := 'Heading: South;'! !

!Window methodsFor: 'heading observer' stamp: 'HJH 7/22/2021 01:03:03'!
printWest

	textHeading := 'Heading: West;'! !

!Window methodsFor: 'heading observer' stamp: 'HJH 7/22/2021 05:43:00'!
updateHeading: aMarsRover 

	aMarsRover printHeadingFor: self.! !


!Window methodsFor: 'initialization' stamp: 'HJH 7/19/2021 22:02:03'!
initialize

	textPosition := ''.
	textHeading := ''! !


!Window methodsFor: 'accessing' stamp: 'HJH 7/19/2021 22:00:58'!
text

	^textPosition,textHeading! !


!Window methodsFor: 'position observer' stamp: 'HJH 7/22/2021 01:13:27'!
printPosition: aPosition

	textPosition := 'Position: ' , aPosition asString , ';'.
! !

!Window methodsFor: 'position observer' stamp: 'HJH 7/22/2021 01:12:27'!
updatePosition: aMarsRover 

	aMarsRover printPositionFor: self
! !
