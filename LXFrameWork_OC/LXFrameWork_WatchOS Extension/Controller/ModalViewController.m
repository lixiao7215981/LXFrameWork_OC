//
//  ModalViewController.m
//  LXFrameWork_OC
//
//  Created by 李晓 on 15/12/22.
//  Copyright © 2015年 LXFrameWork. All rights reserved.
//

#import "ModalViewController.h"
#import "pushModel.h"

@interface ModalViewController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *imageView;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *labelText;

@end

@implementation ModalViewController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    pushModel *model = context;
    
    [self.imageView setImageNamed:model.imageName];
    [self.labelText setTextColor:[UIColor redColor]];
    [self.labelText setText:model.labelText];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



