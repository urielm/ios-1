//
//  ShareViewController.m
//  ownCloud Share
//
//  Created by Javier Gonzalez on 30/1/15.
//
//

#import "ShareViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>

@interface ShareViewController ()

@end

@implementation ShareViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    
    //Naviation
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(cancelView:)];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(cancelView:)];
    
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"ownCloud"];
    item.leftBarButtonItem = leftButton;
    item.rightBarButtonItem = rightButton;
    item.hidesBackButton = YES;
    [self.navigationBar pushNavigationItem:item animated:NO];
    
    //Items
    for (NSExtensionItem *item in self.extensionContext.inputItems) {
        
        NSArray *items = item.attachments;
        
        for (NSItemProvider *current in items) {
            
            if([current hasItemConformingToTypeIdentifier:(NSString *)kUTTypeImage]) {
                
                [current loadItemForTypeIdentifier:(NSString *)kUTTypeImage options:nil completionHandler:^(NSURL *url, NSError *error) {
                    
                    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfFile:url.path]];
                    if(image) {
        
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^ {
                            [self.imageView setImage:image];
                            [self.numberOfImages setText:[NSString stringWithFormat:@"Did you select: %lu images", (unsigned long)items.count]];
                        }];
                    }
                }];
            } else if([current hasItemConformingToTypeIdentifier:(NSString *)kUTTypeAudiovisualContent]) {
                
                [current loadItemForTypeIdentifier:(NSString *)kUTTypeAudiovisualContent options:nil completionHandler:^(NSURL *url, NSError *error) {
                    
                        
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^ {
                            [self.numberOfImages setText:[NSString stringWithFormat:@"Did you select: %lu videos", (unsigned long)items.count]];
                        }];
                    
                }];
            }
        }
    }
}

- (BOOL)isContentValid {
    // Do validation of contentText and/or NSExtensionContext attachments here
    return YES;
}

- (void)didSelectPost {
    // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
    // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
    [self.extensionContext completeRequestReturningItems:@[] completionHandler:nil];
}

- (NSArray *)configurationItems {
    // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
    return @[];
}

#pragma mark - Cancel

- (void) cancelView {
    [self dismissViewControllerAnimated:YES completion:^{
        //TODO: Delete here the temporal cache files if needed
    }];
}

@end
