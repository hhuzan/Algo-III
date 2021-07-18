!classDefinition: #TestLogger category: 'MarsRover-ElRegreso'!
TestCase subclass: #TestLogger
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!TestLogger methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:32:11'!
test01

	| marsRover logger |
	marsRover := MarsRover startingAt: 3@3 heading: #North.

	logger := LoggerBase new.
	marsRover attach: logger.
	
	marsRover processCommands: ''.
	
	self assert: 0 equals: logger logs size! !

!TestLogger methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 10:56:06'!
test02

	| marsRover logger |
	marsRover := MarsRover startingAt: 3@3 heading: #North.

	logger := LoggerPositionDecorator decorating: LoggerBase new.
	marsRover attach: logger.
	
	marsRover processCommands: 'f'.
	
	self assert: 1 equals: logger logs size.
	self assert: 'Position: 3@4;' equals: (logger logs at: 1)! !

!TestLogger methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 11:24:44'!
test03

	| marsRover logger |
	marsRover := MarsRover startingAt: 3@3 heading: #North.

	logger := LoggerHeadingDecorator decorating: LoggerBase new.
	marsRover attach: logger.
	
	marsRover processCommands: 'r'.
	
	self assert: 1 equals: logger logs size.
	self assert: 'Heading: East;' equals: (logger logs at: 1)! !

!TestLogger methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 12:49:43'!
test04

	| marsRover logger |
	marsRover := MarsRover startingAt: 3@3 heading: #North.

	logger := LoggerHeadingDecorator decorating: (LoggerPositionDecorator decorating: LoggerBase new).
	marsRover attach: logger.
	
	marsRover processCommands: 'f'.
	
	self assert: 1 equals: logger logs size.
	self assert: 'Position: 3@4;Heading: North;' equals: (logger logs at: 1)! !

!TestLogger methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:26:58'!
test05

	| marsRover logger |
	marsRover := MarsRover startingAt: 3@3 heading: #North.

	logger := LoggerPositionDecorator decorating: LoggerBase new.
	marsRover attach: logger.
	
	marsRover processCommands: 'rr'.
	
	self assert: 1 equals: logger logs size.
	self assert: 'Position: 3@3;' equals: (logger logs at: 1)! !


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

!TestWindow methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:31:50'!
test01

	| marsRover window |
	marsRover := MarsRover startingAt: 3@3 heading: #North.

	window := WindowBase new.
	marsRover attach: window.
	
	marsRover processCommands: ''.
	
	self assert: '' equals: window text! !

!TestWindow methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:15:09'!
test02

	| marsRover window |
	marsRover := MarsRover startingAt: 3@3 heading: #North.

	window := WindowPositionDecorator decorating: WindowBase new.
	marsRover attach: window.
	
	marsRover processCommands: 'f'.
	
	self assert: 'Position: 3@4;' equals: window text! !

!TestWindow methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:21:29'!
test03

	| marsRover window |
	marsRover := MarsRover startingAt: 3@3 heading: #North.

	window := WindowHeadingDecorator decorating: WindowBase new.
	marsRover attach: window.
	
	marsRover processCommands: 'r'.
	
	self assert: 'Heading: East;' equals: window text! !

!TestWindow methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:23:34'!
test04

	| marsRover window |
	marsRover := MarsRover startingAt: 3@3 heading: #North.

	window := WindowHeadingDecorator decorating: (WindowPositionDecorator decorating: WindowBase new).
	marsRover attach: window.
	
	marsRover processCommands: 'f'.
	
	self assert: 'Position: 3@4;Heading: North;' equals: window text! !


!classDefinition: #LoggerBase category: 'MarsRover-ElRegreso'!
Object subclass: #LoggerBase
	instanceVariableNames: 'logs lastLog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!LoggerBase methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:29:20'!
initialize

	logs := OrderedCollection new.
	lastLog := ''! !

!LoggerBase methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:28:56'!
log: aText

	lastLog = aText ifFalse: [	
		logs add: aText.
		lastLog := aText
	]! !

!LoggerBase methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 10:41:00'!
logs

	^logs! !

!LoggerBase methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 12:42:22'!
update: aMarsRover! !

!LoggerBase methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 12:48:13'!
updateTextFrom: aMarsRover! !


!classDefinition: #LoggerDecorator category: 'MarsRover-ElRegreso'!
Object subclass: #LoggerDecorator
	instanceVariableNames: 'decoratee text'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!LoggerDecorator methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 12:52:30'!
initializeFor: aDecoratee 

	decoratee := aDecoratee! !

!LoggerDecorator methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 12:58:51'!
log: aText

	decoratee log: text , aText! !

!LoggerDecorator methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 12:54:21'!
logs

	^decoratee logs! !

!LoggerDecorator methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:44:08'!
update: aMarsRover

	self updateTextFrom: aMarsRover.
	decoratee log: text! !


!classDefinition: #LoggerHeadingDecorator category: 'MarsRover-ElRegreso'!
LoggerDecorator subclass: #LoggerHeadingDecorator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!LoggerHeadingDecorator methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:41:19'!
updateTextFrom: aMarsRover

	text := 'Heading: ' , aMarsRover heading , ';'.
	decoratee updateTextFrom: aMarsRover! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LoggerHeadingDecorator class' category: 'MarsRover-ElRegreso'!
LoggerHeadingDecorator class
	instanceVariableNames: 'decoratee'!

!LoggerHeadingDecorator class methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 11:13:03'!
decorating: aDecoratee

	^self new initializeFor: aDecoratee! !


!classDefinition: #LoggerPositionDecorator category: 'MarsRover-ElRegreso'!
LoggerDecorator subclass: #LoggerPositionDecorator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!LoggerPositionDecorator methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:40:47'!
updateTextFrom: aMarsRover

	text := 'Position: ' , aMarsRover position asString , ';'.
	decoratee updateTextFrom: aMarsRover! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LoggerPositionDecorator class' category: 'MarsRover-ElRegreso'!
LoggerPositionDecorator class
	instanceVariableNames: 'decoratee'!

!LoggerPositionDecorator class methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 10:58:57'!
decorating: aDecoratee

	^self new initializeFor: aDecoratee! !


!classDefinition: #MarsRover category: 'MarsRover-ElRegreso'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRover methodsFor: 'initialization' stamp: 'HJH 7/18/2021 10:36:48'!
initializeStartingAt: aPosition heading: aCardinalPoint 
	
	position := aPosition.
	head := MarsRoverHead of: self facing: aCardinalPoint.

	observers := OrderedCollection new
	! !


!MarsRover methodsFor: 'process commands' stamp: 'LL 6/30/2021 15:54:14'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.
	].
	
! !


!MarsRover methodsFor: 'testing' stamp: 'LL 6/30/2021 19:47:14'!
isAt: aPosition heading: aCardinalPoint

	^ position = aPosition and: [ head isHeading: aCardinalPoint ]! !


!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:54:11'!
assertCommandIsValid: aCommand

	^ (self isInvalidCommand: aCommand) ifTrue: [ self error: self invalidCommandErrorMessage ]! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:48:06'!
invalidCommandErrorMessage

	^'Invalid command'! !

!MarsRover methodsFor: 'private - process commands' stamp: 'HJH 7/18/2021 11:16:52'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ head movingForward. self notify ].
	(self isBackwardCommand: aCommand) ifTrue: [ head movingBackwards. self notify ].
	(self isRotateRightCommand: aCommand) ifTrue: [ head rotateRight. self notify. ^self ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ head rotateLeft. self notify. ^self ]
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


!MarsRover methodsFor: 'dd - moving' stamp: 'LL 6/30/2021 17:08:33'!
moveDown

	position := position + (0@-1)! !

!MarsRover methodsFor: 'dd - moving' stamp: 'LL 6/30/2021 17:08:16'!
moveLeft

	position := position + (-1@0)! !

!MarsRover methodsFor: 'dd - moving' stamp: 'LL 6/30/2021 17:09:03'!
moveRight

	position := position + (1@0)! !

!MarsRover methodsFor: 'dd - moving' stamp: 'LL 6/30/2021 17:08:48'!
moveUp

	position := position + (0@1)! !


!MarsRover methodsFor: 'dd - heading' stamp: 'LL 6/30/2021 19:47:14'!
headEast

	head := MarsRoverHeadFacingEast of: self.! !

!MarsRover methodsFor: 'dd - heading' stamp: 'LL 6/30/2021 19:47:14'!
headNorth

	head := MarsRoverHeadFacingNorth of: self.! !

!MarsRover methodsFor: 'dd - heading' stamp: 'LL 6/30/2021 19:47:14'!
headSouth

	head := MarsRoverHeadFacingSouth of: self.! !

!MarsRover methodsFor: 'dd - heading' stamp: 'LL 6/30/2021 19:47:14'!
headWest

	head := MarsRoverHeadFacingWest of: self.! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 10:35:23'!
attach: anObserver 

	observers add: anObserver! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 11:20:46'!
heading

	^head heading! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 12:41:48'!
notify

	observers do: [ :observer | observer update: self ]! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 10:42:40'!
position

	^position! !

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

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 11:21:21'!
heading

	self subclassResponsibility! !

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

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 11:23:10'!
heading

	^'East'! !

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

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 11:23:38'!
heading

	^'North'! !

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

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 11:23:52'!
heading

	^'South'! !

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

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 11:24:07'!
heading

	^'West'! !

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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingWest class' category: 'MarsRover-ElRegreso'!
MarsRoverHeadFacingWest class
	instanceVariableNames: ''!

!MarsRoverHeadFacingWest class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #West! !


!classDefinition: #WindowBase category: 'MarsRover-ElRegreso'!
Object subclass: #WindowBase
	instanceVariableNames: 'text'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!WindowBase methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:09:59'!
initialize

	text := ''.! !

!WindowBase methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:09:01'!
text

	^text! !

!WindowBase methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:11:06'!
text: aText

	text := aText! !

!WindowBase methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:08:08'!
update: aMarsRover! !

!WindowBase methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:08:08'!
updateTextFrom: aMarsRover! !


!classDefinition: #WindowDecorator category: 'MarsRover-ElRegreso'!
Object subclass: #WindowDecorator
	instanceVariableNames: 'decoratee text'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!WindowDecorator methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:13:46'!
initializeFor: aDecoratee 

	decoratee := aDecoratee! !

!WindowDecorator methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:17:20'!
text

	^decoratee text! !

!WindowDecorator methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:18:18'!
text: aText

	decoratee text: text , aText! !

!WindowDecorator methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:43:33'!
update: aMarsRover

	self updateTextFrom: aMarsRover.
	decoratee text: text! !


!classDefinition: #WindowHeadingDecorator category: 'MarsRover-ElRegreso'!
WindowDecorator subclass: #WindowHeadingDecorator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!WindowHeadingDecorator methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:42:00'!
updateTextFrom: aMarsRover

	text := 'Heading: ' , aMarsRover heading , ';'.
	decoratee updateTextFrom: aMarsRover! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WindowHeadingDecorator class' category: 'MarsRover-ElRegreso'!
WindowHeadingDecorator class
	instanceVariableNames: 'decoratee'!

!WindowHeadingDecorator class methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:19:48'!
decorating: aDecoratee

	^self new initializeFor: aDecoratee! !


!classDefinition: #WindowPositionDecorator category: 'MarsRover-ElRegreso'!
WindowDecorator subclass: #WindowPositionDecorator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!WindowPositionDecorator methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:43:19'!
updateTextFrom: aMarsRover

	text := 'Position: ' , aMarsRover position asString , ';'.
	decoratee updateTextFrom: aMarsRover! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WindowPositionDecorator class' category: 'MarsRover-ElRegreso'!
WindowPositionDecorator class
	instanceVariableNames: 'decoratee'!

!WindowPositionDecorator class methodsFor: 'as yet unclassified' stamp: 'HJH 7/18/2021 13:14:21'!
decorating: aDecoratee

	^self new initializeFor: aDecoratee! !
