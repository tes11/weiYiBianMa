//
//  ViewController.m
//  test2
//
//  Created by 十国 on 2016/12/26.
//  Copyright © 2016年 十国. All rights reserved.
//

#import "ViewController.h"
#import "UICKeyChainStore.h"

#define MYKEY @"is_a_key"
@interface ViewController ()
- (IBAction)click:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *lb;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"test");
}


- (IBAction)click:(UIButton *)sender {
    UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:@"com.example.github-token"];
    switch (sender.tag) {
        case 2:{//load
                NSError *error;
                NSString *token = [keychain stringForKey:MYKEY error:&error];
                if (error) {
                    NSLog(@"%@", error.localizedDescription);
                }
                self.lb.text = token;
            }
            break;
        case 3:{//set
                NSError *error;
                [keychain setString:@"01234567-89ab-cdef-0123-456789abcdef" forKey:MYKEY error:&error];
                if (error) {
                    NSLog(@"%@", error.localizedDescription);
                }
            }
            break;
        case 4:{//delete
                NSError *error;
                [keychain removeItemForKey:MYKEY error:&error];
                if (error) {
                    NSLog(@"%@", error.localizedDescription);
                }
            }
            break;
        default:
            break;
    }
}
@end
