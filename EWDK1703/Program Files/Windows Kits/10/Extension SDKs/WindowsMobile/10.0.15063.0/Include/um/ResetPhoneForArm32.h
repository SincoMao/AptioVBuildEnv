//
// Copyright (c) Microsoft Corporation.  All rights reserved.
//

//  PhoneResetForArm32
//
//  Resets phone and deletes user data in accordance with the given flags.
//  This function will not normally return.
//
//  PARAMS
//      factoryFloorReset - Factory floor reset is meant to be used exclusively
//                          for OEM/MO testing. After the phone is used by the
//                          end user, this feature is disabled.
//
HRESULT
PhoneResetForArm32(
    _In_ bool factoryFloorReset
    );

