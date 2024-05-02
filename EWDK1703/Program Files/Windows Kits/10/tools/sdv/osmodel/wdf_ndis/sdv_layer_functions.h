/*
	Copyright (c) Microsoft Corporation.  All rights reserved.
*/

#define Any() SdvKeepChoice();
#define Any_Local() SdvMakeChoice();
#define Constrain(e) SdvAssumeSoft(e);

int OneInINT(int min, int max);
int OneOfTwoINT(int x, int y) ;
int OneOfThreeINT(int x, int y, int z);

unsigned int OneInUINT(unsigned int min, unsigned int max);
unsigned int OneOfTwoUINT(unsigned int x, unsigned int y);
unsigned int OneOfThreeUINT(unsigned int x, unsigned int y, unsigned int z);
BOOLEAN OneOfTwoBOOLEAN(); 
USHORT Any_USHORT();
ULONG Any_ULONG();
char * Any_Memory();
NTSTATUS OneOfTwoNTSTATUS(NTSTATUS x, NTSTATUS y);
NTSTATUS OneOfThreeNTSTATUS(NTSTATUS x, NTSTATUS y, NTSTATUS z);
NTSTATUS OneOfFourNTSTATUS(NTSTATUS w,NTSTATUS x, NTSTATUS y, NTSTATUS z);
NTSTATUS OneOfFiveNTSTATUS(NTSTATUS v,NTSTATUS w,NTSTATUS x, NTSTATUS y, NTSTATUS z);
