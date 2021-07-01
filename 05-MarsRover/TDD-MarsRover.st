!classDefinition: #MarsRoverTest category: 'TDD-MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!MarsRoverTest methodsFor: 'testing' stamp: 'CC 7/1/2021 00:36:59'!
test01marsRoverWithoutCommandDoesNotChange

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionNorth.
	
	self assert: (aMarsRover isInPosition: 0@0 pointing: #CardinalDirectionNorth)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test02marsRoverPointingNorthProcessFCommandShouldOnlyMoveNorth

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionNorth.
	aMarsRover processComandsString: 'f'.
	
	self assert: (aMarsRover isInPosition: 0@1 pointing: #CardinalDirectionNorth)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test03marsRoverPointingNorthProcessBCommandShouldOnlyMoveSouth

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionNorth.
	aMarsRover processComandsString: 'b'.
	
	self assert: (aMarsRover isInPosition: 0@-1 pointing: #CardinalDirectionNorth)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test04marsRoverPointingNorthProcessRCommandShouldOnlyRotateEast

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionNorth.
	aMarsRover processComandsString: 'r'.
	
	self assert: (aMarsRover isInPosition: 0@0 pointing: #CardinalDirectionEast)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test05marsRoverPointingNorthProcessLCommandShouldOnlyRotateWest

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionNorth.
	aMarsRover processComandsString: 'l'.
	
	self assert: (aMarsRover isInPosition: 0@0 pointing: #CardinalDirectionWest)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test06marsRoverPointingEastProcessFCommandShouldOnlyMoveEast

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionEast.
	aMarsRover processComandsString: 'f'.
	
	self assert: (aMarsRover isInPosition: 1@0 pointing: #CardinalDirectionEast)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test07marsRoverPointingEastProcessBCommandShouldOnlyMoveWest

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionEast.
	aMarsRover processComandsString: 'b'.
	
	self assert: (aMarsRover isInPosition: -1@0 pointing: #CardinalDirectionEast)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test08marsRoverPointingEastProcessRCommandShouldOnlyRotateSouth

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionEast.
	aMarsRover processComandsString: 'r'.
	
	self assert: (aMarsRover isInPosition: 0@0 pointing: #CardinalDirectionSouth)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test09marsRoverPointingEastProcessLCommandShouldOnlyRotateNorth

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionEast.
	aMarsRover processComandsString: 'l'.
	
	self assert: (aMarsRover isInPosition: 0@0 pointing: #CardinalDirectionNorth)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test10marsRoverPointingSouthProcessFCommandShouldOnlyMoveSouth

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionSouth.
	aMarsRover processComandsString: 'f'.
	
	self assert: (aMarsRover isInPosition: 0@-1 pointing: #CardinalDirectionSouth)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test11marsRoverPointingSouthProcessBCommandShouldOnlyMoveNorth

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionSouth.
	aMarsRover processComandsString: 'b'.
	
	self assert: (aMarsRover isInPosition: 0@1 pointing: #CardinalDirectionSouth)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test12marsRoverPointingSouthProcessRCommandShouldOnlyRotateWest

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionSouth.
	aMarsRover processComandsString: 'r'.
	
	self assert: (aMarsRover isInPosition: 0@0 pointing: #CardinalDirectionWest)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test13marsRoverPointingSouthProcessLCommandShouldOnlyRotateEast

	"un marsRover apuntando al South con comando 'l' solo rota al East "

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionSouth.
	aMarsRover processComandsString: 'l'.
	
	self assert: (aMarsRover isInPosition: 0@0 pointing: #CardinalDirectionEast)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test14marsRoverPointingWestProcessFCommandShouldOnlyMoveWest

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionWest.
	aMarsRover processComandsString: 'f'.
	
	self assert: (aMarsRover isInPosition: -1@0 pointing: #CardinalDirectionWest)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test15marsRoverPointingWestProcessBCommandShouldOnlyMoveEast

	"un marsRover apuntando al West con comando 'b' retrocede "

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionWest.
	aMarsRover processComandsString: 'b'.
	
	self assert: (aMarsRover isInPosition: 1@0 pointing: #CardinalDirectionWest)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test16marsRoverPointingWestProcessRCommandShouldOnlyRotateNorth

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionWest.
	aMarsRover processComandsString: 'r'.
	
	self assert: (aMarsRover isInPosition: 0@0 pointing: #CardinalDirectionNorth)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test17marsRoverPointingWestProcessLCommandShouldOnlyRotateSouth

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionWest.
	aMarsRover processComandsString: 'l'.
	
	self assert: (aMarsRover isInPosition: 0@0 pointing: #CardinalDirectionSouth)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test18marsRoverPointingNorthProcessManyFCommandsShouldOnlyMoveNorthManyTimes

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionNorth.
	aMarsRover processComandsString: 'fff'.
	
	self assert: (aMarsRover isInPosition: 0@3 pointing: #CardinalDirectionNorth)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test19marsRoverPointingNorthProcessManyBCommandsShouldOnlyMoveSouthManyTimes

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionNorth.
	aMarsRover processComandsString: 'bbb'.
	
	self assert: (aMarsRover isInPosition: 0@-3 pointing: #CardinalDirectionNorth)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test20marsRoverPointingEastProcessManyFCommandsShouldOnlyMoveEastManyTimes

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionEast.
	aMarsRover processComandsString: 'fff'.
	
	self assert: (aMarsRover isInPosition: 3@0 pointing: #CardinalDirectionEast)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test21marsRoverPointingEastProcessManyBCommandsShouldOnlyMoveWestManyTimes

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionEast.
	aMarsRover processComandsString: 'bbb'.
	
	self assert: (aMarsRover isInPosition: -3@0 pointing: #CardinalDirectionEast)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test22marsRoverPointingSouthProcessManyFCommandsShouldOnlyMoveSouthManyTimes

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionSouth.
	aMarsRover processComandsString: 'fff'.
	
	self assert: (aMarsRover isInPosition: 0@-3 pointing: #CardinalDirectionSouth)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test23marsRoverPointingSouthProcessManyBCommandsShouldOnlyMoveNorthManyTimes

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionSouth.
	aMarsRover processComandsString: 'bbb'.
	
	self assert: (aMarsRover isInPosition: 0@3 pointing: #CardinalDirectionSouth)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test24marsRoverPointingWestProcessManyFCommandsShouldOnlyMoveWestManyTimes

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionWest.
	aMarsRover processComandsString: 'fff'.
	
	self assert: (aMarsRover isInPosition: -3@0 pointing: #CardinalDirectionWest)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test25marsRoverPointingWestProcessManyBCommandsShouldOnlyMoveEastManyTimes

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionWest.
	aMarsRover processComandsString: 'bbb'.
	
	self assert: (aMarsRover isInPosition: 3@0 pointing: #CardinalDirectionWest)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'HJH 7/1/2021 01:02:48'!
test26marsRoverProcessValidCommandsAndStopWhenReceiveAnInvalidCommand

	| aMarsRover |
	
	aMarsRover := MarsRover inPosition: 0@0 pointing: #CardinalDirectionNorth.
	
	self 
		should: [ aMarsRover processComandsString: 'ffxf']
		raise: Error
		withExceptionDo: [ :anError | 
			self assert: anError messageText equals: MarsRover invalidCommandErrorText.
			self assert: (aMarsRover isInPosition: 0@2 pointing: #CardinalDirectionNorth).
		 ]
	! !


!classDefinition: #CardinalDirection category: 'TDD-MarsRover'!
Object subclass: #CardinalDirection
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!CardinalDirection methodsFor: 'initialization - private' stamp: 'CC 6/30/2021 22:42:19'!
initializeWith: aMarsRover 

	marsRover := aMarsRover ! !


!CardinalDirection methodsFor: 'movement' stamp: 'CC 6/30/2021 23:00:40'!
moveBackward
	
	self subclassResponsibility ! !

!CardinalDirection methodsFor: 'movement' stamp: 'CC 6/30/2021 23:00:29'!
moveForward
	
	self subclassResponsibility ! !

!CardinalDirection methodsFor: 'movement' stamp: 'CC 6/30/2021 23:04:37'!
rotateLeft

	self subclassResponsibility ! !

!CardinalDirection methodsFor: 'movement' stamp: 'CC 6/30/2021 23:04:32'!
rotateRight

	self subclassResponsibility ! !


!CardinalDirection methodsFor: 'comparing' stamp: 'CC 6/30/2021 22:45:49'!
isValidFor: aCardinalDirection

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalDirection class' category: 'TDD-MarsRover'!
CardinalDirection class
	instanceVariableNames: ''!

!CardinalDirection class methodsFor: 'instance creation' stamp: 'CC 6/30/2021 22:41:45'!
for: aMarsRover

	^self new initializeWith: aMarsRover ! !


!CardinalDirection class methodsFor: 'private' stamp: 'CC 6/30/2021 23:36:32'!
isValidCardinalDirection: aCardinalDirection

	self subclassResponsibility ! !


!classDefinition: #CardinalDirectionEast category: 'TDD-MarsRover'!
CardinalDirection subclass: #CardinalDirectionEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!CardinalDirectionEast methodsFor: 'movement' stamp: 'CC 6/30/2021 23:01:21'!
moveBackward
	
	marsRover moveWest ! !

!CardinalDirectionEast methodsFor: 'movement' stamp: 'CC 6/30/2021 23:01:05'!
moveForward
	
	marsRover moveEast ! !

!CardinalDirectionEast methodsFor: 'movement' stamp: 'CC 6/30/2021 23:05:25'!
rotateLeft

	marsRover pointNorth ! !

!CardinalDirectionEast methodsFor: 'movement' stamp: 'CC 6/30/2021 23:05:41'!
rotateRight

	marsRover pointSouth! !


!CardinalDirectionEast methodsFor: 'comparing' stamp: 'CC 7/1/2021 00:36:36'!
isValidFor: aCardinalDirection

	^aCardinalDirection = #CardinalDirectionEast! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalDirectionEast class' category: 'TDD-MarsRover'!
CardinalDirectionEast class
	instanceVariableNames: ''!

!CardinalDirectionEast class methodsFor: 'private' stamp: 'CC 7/1/2021 00:36:36'!
isValidCardinalDirection: aCardinalDirection

	^aCardinalDirection = #CardinalDirectionEast! !


!classDefinition: #CardinalDirectionNorth category: 'TDD-MarsRover'!
CardinalDirection subclass: #CardinalDirectionNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!CardinalDirectionNorth methodsFor: 'movement' stamp: 'CC 6/30/2021 22:59:29'!
moveBackward
	
	marsRover moveSouth
! !

!CardinalDirectionNorth methodsFor: 'movement' stamp: 'CC 6/30/2021 22:57:37'!
moveForward
	
	marsRover moveNorth
! !

!CardinalDirectionNorth methodsFor: 'movement' stamp: 'CC 6/30/2021 23:06:06'!
rotateLeft

	marsRover pointWest! !

!CardinalDirectionNorth methodsFor: 'movement' stamp: 'CC 6/30/2021 23:05:57'!
rotateRight

	marsRover pointEast! !


!CardinalDirectionNorth methodsFor: 'comparing' stamp: 'CC 7/1/2021 00:36:59'!
isValidFor: aCardinalDirection

	^aCardinalDirection = #CardinalDirectionNorth! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalDirectionNorth class' category: 'TDD-MarsRover'!
CardinalDirectionNorth class
	instanceVariableNames: ''!

!CardinalDirectionNorth class methodsFor: 'private' stamp: 'CC 7/1/2021 00:36:59'!
isValidCardinalDirection: aCardinalDirection

	^aCardinalDirection = #CardinalDirectionNorth! !


!classDefinition: #CardinalDirectionSouth category: 'TDD-MarsRover'!
CardinalDirection subclass: #CardinalDirectionSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!CardinalDirectionSouth methodsFor: 'comparing' stamp: 'CC 7/1/2021 00:37:11'!
isValidFor: aCardinalDirection

	^aCardinalDirection = #CardinalDirectionSouth! !


!CardinalDirectionSouth methodsFor: 'movement' stamp: 'CC 6/30/2021 23:01:58'!
moveBackward
	
	marsRover moveNorth ! !

!CardinalDirectionSouth methodsFor: 'movement' stamp: 'CC 6/30/2021 23:01:47'!
moveForward
	
	marsRover moveSouth ! !

!CardinalDirectionSouth methodsFor: 'movement' stamp: 'CC 6/30/2021 23:06:28'!
rotateLeft

	marsRover pointEast! !

!CardinalDirectionSouth methodsFor: 'movement' stamp: 'CC 6/30/2021 23:06:18'!
rotateRight

	marsRover pointWest! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalDirectionSouth class' category: 'TDD-MarsRover'!
CardinalDirectionSouth class
	instanceVariableNames: ''!

!CardinalDirectionSouth class methodsFor: 'private' stamp: 'CC 7/1/2021 00:37:11'!
isValidCardinalDirection: aCardinalDirection

	^aCardinalDirection = #CardinalDirectionSouth! !


!classDefinition: #CardinalDirectionWest category: 'TDD-MarsRover'!
CardinalDirection subclass: #CardinalDirectionWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!CardinalDirectionWest methodsFor: 'comparing' stamp: 'CC 7/1/2021 00:37:22'!
isValidFor: aCardinalDirection

	^aCardinalDirection = #CardinalDirectionWest! !


!CardinalDirectionWest methodsFor: 'movement' stamp: 'CC 6/30/2021 23:02:22'!
moveBackward
	
	marsRover moveEast ! !

!CardinalDirectionWest methodsFor: 'movement' stamp: 'CC 6/30/2021 23:02:14'!
moveForward
	
	marsRover moveWest ! !

!CardinalDirectionWest methodsFor: 'movement' stamp: 'CC 6/30/2021 23:06:51'!
rotateLeft

	marsRover pointSouth ! !

!CardinalDirectionWest methodsFor: 'movement' stamp: 'CC 6/30/2021 23:07:00'!
rotateRight

	marsRover pointNorth ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalDirectionWest class' category: 'TDD-MarsRover'!
CardinalDirectionWest class
	instanceVariableNames: ''!

!CardinalDirectionWest class methodsFor: 'private' stamp: 'CC 7/1/2021 00:37:22'!
isValidCardinalDirection: aCardinalDirection

	^aCardinalDirection = #CardinalDirectionWest! !


!classDefinition: #MarsRover category: 'TDD-MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinalDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!MarsRover methodsFor: 'initialization - private' stamp: 'CC 6/30/2021 23:35:22'!
initializeInPosition: anInitialPosition pointing: anInitialCardinalDirection 

	| claseAInstanciar |

	claseAInstanciar := CardinalDirection allSubclasses detect: [:unaClase | unaClase isValidCardinalDirection: anInitialCardinalDirection ].

	cardinalDirection := claseAInstanciar for: self.
	position := anInitialPosition.
! !


!MarsRover methodsFor: 'accessing' stamp: 'CC 6/30/2021 22:45:22'!
isInPosition: aPosition pointing: aCardinalDirection

	^position = aPosition and: [cardinalDirection isValidFor: aCardinalDirection ]! !


!MarsRover methodsFor: 'movement - private' stamp: 'HJH 7/1/2021 01:00:24'!
moveEast

	position := position + (1@0)! !

!MarsRover methodsFor: 'movement - private' stamp: 'HJH 7/1/2021 01:00:33'!
moveNorth

	position := position + (0@1)! !

!MarsRover methodsFor: 'movement - private' stamp: 'HJH 7/1/2021 01:00:43'!
moveSouth

	position := position + (0@-1)! !

!MarsRover methodsFor: 'movement - private' stamp: 'HJH 7/1/2021 01:00:51'!
moveWest

	position := position + (-1@0)! !

!MarsRover methodsFor: 'movement - private' stamp: 'HJH 7/1/2021 01:01:00'!
pointEast

	cardinalDirection := CardinalDirectionEast for: self! !

!MarsRover methodsFor: 'movement - private' stamp: 'HJH 7/1/2021 01:01:09'!
pointNorth

	cardinalDirection := CardinalDirectionNorth for: self! !

!MarsRover methodsFor: 'movement - private' stamp: 'HJH 7/1/2021 01:01:15'!
pointSouth

	cardinalDirection := CardinalDirectionSouth for: self! !

!MarsRover methodsFor: 'movement - private' stamp: 'HJH 7/1/2021 01:01:27'!
pointWest

	cardinalDirection := CardinalDirectionWest for: self! !


!MarsRover methodsFor: 'commands' stamp: 'HJH 7/1/2021 01:02:48'!
processComandsString: aCommandsString

	aCommandsString do: [ :aCommand | self processComand: aCommand ]
	
! !


!MarsRover methodsFor: 'commands - private' stamp: 'CC 6/30/2021 23:26:36'!
processComand: aCommand
	
	aCommand = $f ifTrue: [	cardinalDirection moveForward. ^self].
	aCommand = $b ifTrue: [	cardinalDirection moveBackward. ^self].
	aCommand = $r ifTrue: [	cardinalDirection rotateRight. ^self].
	aCommand = $l ifTrue: [	cardinalDirection rotateLeft. ^self].		
	
	self error: MarsRover invalidCommandErrorText 
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'TDD-MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'CC 6/30/2021 23:31:22'!
inPosition: anInitialPosition pointing: anInitialCardinalDirection
	
	^self new initializeInPosition: anInitialPosition pointing: anInitialCardinalDirection.! !


!MarsRover class methodsFor: 'error descriptions' stamp: 'CC 6/30/2021 23:26:03'!
invalidCommandErrorText

	^'Invalid command'! !
