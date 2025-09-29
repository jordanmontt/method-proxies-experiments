Extension { #name : 'MpMethodProxy' }

{ #category : '*InstrumentationProfilers' }
MpMethodProxy class >> buildNoSafePrototypesUpToArguments: maxNumberOfArguments [
	"This method builds/compiles the prototype traps for arguments up to the argument.
	The trap prototypes are installed in this class' class side.
	They can later be copied and patched by MpMethodProxy"

	"self buildNoSafePrototypesUpToArguments: 15"

	| forwarders argumentListNodes |
	0 to: maxNumberOfArguments do: [ :numberOfArguments |
		| originalAst trapSelector trapArguments |
		originalAst := (self class >> #prototypeNoSafeTrap) parseTree.

		trapSelector := #trapNoSafeMethod.
		1 to: numberOfArguments do: [ :i | trapSelector := trapSelector , #with: ].
		trapArguments := (1 to: numberOfArguments) collect: [ :i |
			                 RBVariableNode named: 'arg' , i asString ].

		originalAst selector: trapSelector.
		originalAst arguments: trapArguments.
		
		argumentListNodes := originalAst allChildren select: [ :e | e value = #argumentList ].
		argumentListNodes do: [ :e | e replaceWith: (RBArrayNode statements: trapArguments) ].

		forwarders := originalAst sendNodes select: [ :e | e selector = #originalMessage ].
		forwarders do: [ :e |
			e replaceWith: (RBMessageNode
					 receiver: RBVariableNode selfNode
					 selector: trapSelector
					 arguments: trapArguments) ].
		self class compile: originalAst formattedCode ]
]

{ #category : '*InstrumentationProfilers' }
MpMethodProxy >> installNoSafe [

	| newTrap index trapSelector |
	
	"Disable instrumentation during installation to make it safe.
	We don't want to call instrumented methods when installing the instrumentation"
	self disableInstrumentation.
	
	thisProcess runInMetaLevel: [
		(proxifiedMethod hasPragmaNamed: #noInstrumentation) ifTrue: [
			^ MpCannotInstall signalWith: self ].

		newTrap := self noSafePrototypeTrapMethod copy.
		trapSelector := newTrap selector.
		newTrap selector: proxifiedMethod selector.
		newTrap methodClass: proxifiedMethod methodClass.

		hiddenSelector := MpHiddenSelector new
			proxifiedSelector: proxifiedMethod selector;
			yourself.

		index := newTrap literals indexOf: trapSelector.
		newTrap literalAt: index put: hiddenSelector.

		index := newTrap literals indexOf: #handler.
		newTrap literalAt: index put: handler.

		"It could happen that a proxy wraps a proxy. Remember the object that was installed at this moment.
		This is the object to restore during uninstall"
		wrappedMethod := proxifiedMethod methodClass
			methodDict at: proxifiedMethod selector.

		proxifiedMethod methodClass methodDict
			at: hiddenSelector
			put: proxifiedMethod.
		proxifiedMethod methodClass methodDict
			at: proxifiedMethod selector
			put: newTrap.

		trapMethod := newTrap ]
]

{ #category : '*InstrumentationProfilers' }
MpMethodProxy >> noSafePrototypeTrapMethod [

	^ self class class methods detect: [ :m |
		  m numArgs = proxifiedMethod numArgs and: [
			  m selector beginsWith: 'trapNoSafe' ] ]
]

{ #category : '*InstrumentationProfilers' }
MpMethodProxy class >> prototypeNoSafeTrap [

    <trap>
    | result |
    #handler beforeExecutionWithReceiver: self arguments: {  }.
    result := self originalMessage.
    result := #handler afterExecutionWithReceiver: self arguments: {  } returnValue: result.
    ^ result
]

{ #category : '*InstrumentationProfilers' }
MpMethodProxy >> prototypeTrapMethod [

	^ self class class methods detect: [ :m |
		  m numArgs = proxifiedMethod numArgs and: [
			  m selector beginsWith: 'trapMethod' ] ]
]

{ #category : '*InstrumentationProfilers' }
MpMethodProxy class >> trapNoSafeMethod [

    <trap>
    | result |
    #handler beforeExecutionWithReceiver: self arguments: {  }.
    result := self trapNoSafeMethod.
    result := #handler afterExecutionWithReceiver: self arguments: {  } returnValue: result.
    ^ result
]

{ #category : '*InstrumentationProfilers' }
MpMethodProxy class >> trapNoSafeMethodwith: arg1 [

    <trap>
    | result |
    #handler beforeExecutionWithReceiver: self arguments: {  }.
    result := self trapNoSafeMethodwith: arg1.
    result := #handler afterExecutionWithReceiver: self arguments: {  } returnValue: result.
    ^ result
]

{ #category : '*InstrumentationProfilers' }
MpMethodProxy class >> trapNoSafeMethodwith: arg1 with: arg2 [

    <trap>
    | result |
    #handler beforeExecutionWithReceiver: self arguments: {  }.
    result := self trapNoSafeMethodwith: arg1 with: arg2.
    result := #handler afterExecutionWithReceiver: self arguments: {  } returnValue: result.
    ^ result
]

{ #category : '*InstrumentationProfilers' }
MpMethodProxy class >> trapNoSafeMethodwith: arg1 with: arg2 with: arg3 [

    <trap>
    | result |
    #handler beforeExecutionWithReceiver: self arguments: {  }.
    result := self trapNoSafeMethodwith: arg1 with: arg2 with: arg3.
    result := #handler afterExecutionWithReceiver: self arguments: {  } returnValue: result.
    ^ result
]

{ #category : '*InstrumentationProfilers' }
MpMethodProxy class >> trapNoSafeMethodwith: arg1 with: arg2 with: arg3 with: arg4 [

    <trap>
    | result |
    #handler beforeExecutionWithReceiver: self arguments: {  }.
    result := self trapNoSafeMethodwith: arg1
                  with: arg2
                  with: arg3
                  with: arg4.
    result := #handler afterExecutionWithReceiver: self arguments: {  } returnValue: result.
    ^ result
]

{ #category : '*InstrumentationProfilers' }
MpMethodProxy class >> trapNoSafeMethodwith: arg1 with: arg2 with: arg3 with: arg4 with: arg5 [

    <trap>
    | result |
    #handler beforeExecutionWithReceiver: self arguments: {  }.
    result := self trapNoSafeMethodwith: arg1
                  with: arg2
                  with: arg3
                  with: arg4
                  with: arg5.
    result := #handler afterExecutionWithReceiver: self arguments: {  } returnValue: result.
    ^ result
]

{ #category : '*InstrumentationProfilers' }
MpMethodProxy class >> trapNoSafeMethodwith: arg1 with: arg2 with: arg3 with: arg4 with: arg5 with: arg6 [

    <trap>
    | result |
    #handler beforeExecutionWithReceiver: self arguments: {  }.
    result := self trapNoSafeMethodwith: arg1
                  with: arg2
                  with: arg3
                  with: arg4
                  with: arg5
                  with: arg6.
    result := #handler afterExecutionWithReceiver: self arguments: {  } returnValue: result.
    ^ result
]

{ #category : '*InstrumentationProfilers' }
MpMethodProxy class >> trapNoSafeMethodwith: arg1 with: arg2 with: arg3 with: arg4 with: arg5 with: arg6 with: arg7 [

    <trap>
    | result |
    #handler beforeExecutionWithReceiver: self arguments: {  }.
    result := self trapNoSafeMethodwith: arg1
                  with: arg2
                  with: arg3
                  with: arg4
                  with: arg5
                  with: arg6
                  with: arg7.
    result := #handler afterExecutionWithReceiver: self arguments: {  } returnValue: result.
    ^ result
]

{ #category : '*InstrumentationProfilers' }
MpMethodProxy class >> trapNoSafeMethodwith: arg1 with: arg2 with: arg3 with: arg4 with: arg5 with: arg6 with: arg7 with: arg8 [

    <trap>
    | result |
    #handler beforeExecutionWithReceiver: self arguments: {  }.
    result := self trapNoSafeMethodwith: arg1
                  with: arg2
                  with: arg3
                  with: arg4
                  with: arg5
                  with: arg6
                  with: arg7
                  with: arg8.
    result := #handler afterExecutionWithReceiver: self arguments: {  } returnValue: result.
    ^ result
]

{ #category : '*InstrumentationProfilers' }
MpMethodProxy class >> trapNoSafeMethodwith: arg1 with: arg2 with: arg3 with: arg4 with: arg5 with: arg6 with: arg7 with: arg8 with: arg9 [

    <trap>
    | result |
    #handler beforeExecutionWithReceiver: self arguments: {  }.
    result := self trapNoSafeMethodwith: arg1
                  with: arg2
                  with: arg3
                  with: arg4
                  with: arg5
                  with: arg6
                  with: arg7
                  with: arg8
                  with: arg9.
    result := #handler afterExecutionWithReceiver: self arguments: {  } returnValue: result.
    ^ result
]

{ #category : '*InstrumentationProfilers' }
MpMethodProxy class >> trapNoSafeMethodwith: arg1 with: arg2 with: arg3 with: arg4 with: arg5 with: arg6 with: arg7 with: arg8 with: arg9 with: arg10 [

    <trap>
    | result |
    #handler beforeExecutionWithReceiver: self arguments: {  }.
    result := self trapNoSafeMethodwith: arg1
                  with: arg2
                  with: arg3
                  with: arg4
                  with: arg5
                  with: arg6
                  with: arg7
                  with: arg8
                  with: arg9
                  with: arg10.
    result := #handler afterExecutionWithReceiver: self arguments: {  } returnValue: result.
    ^ result
]

{ #category : '*InstrumentationProfilers' }
MpMethodProxy class >> trapNoSafeMethodwith: arg1 with: arg2 with: arg3 with: arg4 with: arg5 with: arg6 with: arg7 with: arg8 with: arg9 with: arg10 with: arg11 [

    <trap>
    | result |
    #handler beforeExecutionWithReceiver: self arguments: {  }.
    result := self trapNoSafeMethodwith: arg1
                  with: arg2
                  with: arg3
                  with: arg4
                  with: arg5
                  with: arg6
                  with: arg7
                  with: arg8
                  with: arg9
                  with: arg10
                  with: arg11.
    result := #handler afterExecutionWithReceiver: self arguments: {  } returnValue: result.
    ^ result
]

{ #category : '*InstrumentationProfilers' }
MpMethodProxy class >> trapNoSafeMethodwith: arg1 with: arg2 with: arg3 with: arg4 with: arg5 with: arg6 with: arg7 with: arg8 with: arg9 with: arg10 with: arg11 with: arg12 [

    <trap>
    | result |
    #handler beforeExecutionWithReceiver: self arguments: {  }.
    result := self trapNoSafeMethodwith: arg1
                  with: arg2
                  with: arg3
                  with: arg4
                  with: arg5
                  with: arg6
                  with: arg7
                  with: arg8
                  with: arg9
                  with: arg10
                  with: arg11
                  with: arg12.
    result := #handler afterExecutionWithReceiver: self arguments: {  } returnValue: result.
    ^ result
]

{ #category : '*InstrumentationProfilers' }
MpMethodProxy class >> trapNoSafeMethodwith: arg1 with: arg2 with: arg3 with: arg4 with: arg5 with: arg6 with: arg7 with: arg8 with: arg9 with: arg10 with: arg11 with: arg12 with: arg13 [

    <trap>
    | result |
    #handler beforeExecutionWithReceiver: self arguments: {  }.
    result := self trapNoSafeMethodwith: arg1
                  with: arg2
                  with: arg3
                  with: arg4
                  with: arg5
                  with: arg6
                  with: arg7
                  with: arg8
                  with: arg9
                  with: arg10
                  with: arg11
                  with: arg12
                  with: arg13.
    result := #handler afterExecutionWithReceiver: self arguments: {  } returnValue: result.
    ^ result
]

{ #category : '*InstrumentationProfilers' }
MpMethodProxy class >> trapNoSafeMethodwith: arg1 with: arg2 with: arg3 with: arg4 with: arg5 with: arg6 with: arg7 with: arg8 with: arg9 with: arg10 with: arg11 with: arg12 with: arg13 with: arg14 [

    <trap>
    | result |
    #handler beforeExecutionWithReceiver: self arguments: {  }.
    result := self trapNoSafeMethodwith: arg1
                  with: arg2
                  with: arg3
                  with: arg4
                  with: arg5
                  with: arg6
                  with: arg7
                  with: arg8
                  with: arg9
                  with: arg10
                  with: arg11
                  with: arg12
                  with: arg13
                  with: arg14.
    result := #handler afterExecutionWithReceiver: self arguments: {  } returnValue: result.
    ^ result
]

{ #category : '*InstrumentationProfilers' }
MpMethodProxy class >> trapNoSafeMethodwith: arg1 with: arg2 with: arg3 with: arg4 with: arg5 with: arg6 with: arg7 with: arg8 with: arg9 with: arg10 with: arg11 with: arg12 with: arg13 with: arg14 with: arg15 [

    <trap>
    | result |
    #handler beforeExecutionWithReceiver: self arguments: {  }.
    result := self trapNoSafeMethodwith: arg1
                  with: arg2
                  with: arg3
                  with: arg4
                  with: arg5
                  with: arg6
                  with: arg7
                  with: arg8
                  with: arg9
                  with: arg10
                  with: arg11
                  with: arg12
                  with: arg13
                  with: arg14
                  with: arg15.
    result := #handler afterExecutionWithReceiver: self arguments: {  } returnValue: result.
    ^ result
]
