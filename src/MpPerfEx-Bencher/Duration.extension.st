Extension { #name : 'Duration' }

{ #category : '*MpPerfEx-Bencher' }
Duration >> totalMilliseconds [

    ^ seconds * 1000 + (nanos / 1e6)
]
