// Copyright 2009-2010 The 'Mumble for iOS' Developers. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

#import "MUCertificateCreationProgressView.h"

@interface MUCertificateCreationProgressView () {
    IBOutlet UIActivityIndicatorView  *_activityIndicator;
    IBOutlet UILabel                  *_nameLabel;
    IBOutlet UILabel                  *_emailLabel;
    IBOutlet UILabel                  *_pleaseWaitLabel;
    
    NSString                          *_identityName;
    NSString                          *_emailAddress;
    id                                 _delegate;
}
@end

@implementation MUCertificateCreationProgressView

- (id) initWithName:(NSString *)name email:(NSString *)email {
    if (self = [super initWithNibName:@"MUCertificateCreationProgressView" bundle:nil]) {
        _identityName = [name retain];
        _emailAddress = [email retain];        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        }
    }
    return self;
}

- (void) dealloc {
    [_identityName release];
    [_emailAddress release];
    [super dealloc];
}

- (void) viewWillAppear:(BOOL)animated {
    [[self navigationItem] setTitle:NSLocalizedString(@"Generating Certificate", @"Title for certificate generator view controller")];
    [[self navigationItem] setHidesBackButton:YES];

    [_nameLabel setText:_identityName];

    if (_emailAddress != nil && _emailAddress.length > 0) {
        [_emailLabel setText:[NSString stringWithFormat:@"<%@>", _emailAddress]];
    } else {
        [_emailLabel setText:nil];
    }

    [_pleaseWaitLabel setText:NSLocalizedString(@"Please Wait...", @"'Please Wait' text for certificate generation")];
    [_activityIndicator startAnimating];
}

@end
