!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'CC 6/6/2021 23:36:27'!
initialize
	
	elements  := EmptyStackElement new.
! !


!OOStack methodsFor: 'as yet unclassified' stamp: 'CC 6/6/2021 22:23:39'!
isEmpty

	^elements isEmpty ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'HJH 6/7/2021 00:10:44'!
pop

	| topElement |
	
	topElement := elements top.
	elements := elements elements.

	^topElement! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CC 6/6/2021 23:50:18'!
push: anElement
	
	elements := FilledStackElement withElements: elements andTop: anElement
! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CC 6/6/2021 22:33:38'!
size

	^elements size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CC 6/6/2021 23:51:45'!
top

	^elements top.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #StackElement category: 'Stack-Exercise'!
Object subclass: #StackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElement methodsFor: 'as yet unclassified' stamp: 'CC 6/6/2021 23:30:08'!
isEmpty

	self subclassResponsibility ! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'CC 6/6/2021 23:30:22'!
size

	self subclassResponsibility ! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'CC 6/6/2021 23:51:45'!
top

	self subclassResponsibility ! !


!classDefinition: #EmptyStackElement category: 'Stack-Exercise'!
StackElement subclass: #EmptyStackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStackElement methodsFor: 'as yet unclassified' stamp: 'CC 6/6/2021 22:54:37'!
isEmpty

	^true! !

!EmptyStackElement methodsFor: 'as yet unclassified' stamp: 'CC 6/6/2021 23:16:20'!
size
	
	^0! !

!EmptyStackElement methodsFor: 'as yet unclassified' stamp: 'CC 6/6/2021 23:51:45'!
top

	^self error: OOStack stackEmptyErrorDescription! !


!classDefinition: #FilledStackElement category: 'Stack-Exercise'!
StackElement subclass: #FilledStackElement
	instanceVariableNames: 'elements topElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!FilledStackElement methodsFor: 'as yet unclassified' stamp: 'CC 6/6/2021 23:32:13'!
elements
	
	^elements! !

!FilledStackElement methodsFor: 'as yet unclassified' stamp: 'HJH 6/7/2021 00:13:57'!
initializeWithElements: innerElements andTop: aTopElement

	elements := innerElements.
	topElement := aTopElement.! !

!FilledStackElement methodsFor: 'as yet unclassified' stamp: 'CC 6/6/2021 23:05:05'!
isEmpty

	^false! !

!FilledStackElement methodsFor: 'as yet unclassified' stamp: 'HJH 6/7/2021 00:14:19'!
size

	^1 + elements size.! !

!FilledStackElement methodsFor: 'as yet unclassified' stamp: 'CC 6/6/2021 23:51:45'!
top
	
	^topElement! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FilledStackElement class' category: 'Stack-Exercise'!
FilledStackElement class
	instanceVariableNames: ''!

!FilledStackElement class methodsFor: 'as yet unclassified' stamp: 'HJH 6/7/2021 00:09:06'!
withElements: actualElements andTop: aNewElement
	
	| newStackElements |
	
	newStackElements := FilledStackElement new.
	newStackElements initializeWithElements: actualElements andTop: aNewElement.
	
	^newStackElements ! !
