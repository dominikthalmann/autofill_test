//
//  CredentialProviderViewController.m
//  autofillextension
//
//  Created by Dominik Thalmann on 04.10.18.
//  Copyright © 2018 Dominik Thalmann. All rights reserved.
//

#import "CredentialProviderViewController.h"

@implementation CredentialProviderViewController


- (void)prepareCredentialListForServiceIdentifiers:(NSArray<ASCredentialServiceIdentifier *> *)serviceIdentifiers
{
    
}


- (void)provideCredentialWithoutUserInteractionForIdentity:(ASPasswordCredentialIdentity *)credentialIdentity
{
    BOOL databaseIsUnlocked = YES;
    if (databaseIsUnlocked) {
        ASPasswordCredential *credential = [[ASPasswordCredential alloc] initWithUser:@"user_test" password:@"pass_test"];
        [self.extensionContext completeRequestWithSelectedCredential:credential completionHandler:nil];
    } else
        [self.extensionContext cancelRequestWithError:[NSError errorWithDomain:ASExtensionErrorDomain code:ASExtensionErrorCodeUserInteractionRequired userInfo:nil]];
}


/*
 
- (void)prepareInterfaceToProvideCredentialForIdentity:(ASPasswordCredentialIdentity *)credentialIdentity
{
}
*/

- (IBAction)cancel:(id)sender
{
    [self.extensionContext cancelRequestWithError:[NSError errorWithDomain:ASExtensionErrorDomain code:ASExtensionErrorCodeUserCanceled userInfo:nil]];
}

- (IBAction)passwordSelected:(id)sender
{
    ASPasswordCredential *credential = [[ASPasswordCredential alloc] initWithUser:@"user_test" password:@"pass_test"];
    [self.extensionContext completeRequestWithSelectedCredential:credential completionHandler:nil];
}

@end
