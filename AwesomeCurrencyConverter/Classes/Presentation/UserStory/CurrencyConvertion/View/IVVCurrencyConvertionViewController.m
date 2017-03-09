//
//  IVVCurrencyConvertionViewController.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCurrencyConvertionViewController.h"

#import "IVVCurrencyConvertionViewOutput.h"

// DDM
#import "IVVCurrencyConvertionDataDisplayManager.h"

// Views
#import "IVVExchangeView.h"

// ViewModel
#import "IVVCurrencyConvertionViewModel.h"

@interface IVVCurrencyConvertionViewController () <IVVCurrencyConvertionDataDisplayManagerDelegate, UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *containerViewBottomConstraint;

@property (nonatomic, strong) IVVCurrencyConvertionViewModel *viewModel;

@end

@implementation IVVCurrencyConvertionViewController

#pragma mark - Life cycle 

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.output didTriggerViewDidLoadEvent];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self subscribeToNotifications];
    [self.textFieldProxy becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.output didTriggerViewWillDisappearEvent];
    [self unsubscribeFromNotifications];
}

#pragma mark - IVVCurrencyConvertionViewInput

- (void)setupInitialState {
    self.convertToView.delegate = [self.dataDisplayManager delegateForExchangeView:self.convertToView];
    self.convertToView.dataSource = [self.dataDisplayManager dataSourceForExchangeView:self.convertToView];
    
    self.convertFromView.delegate = [self.dataDisplayManager delegateForExchangeView:self.convertFromView];
    self.convertFromView.dataSource = [self.dataDisplayManager dataSourceForExchangeView:self.convertFromView];
}

- (void)configWithViewModel:(IVVCurrencyConvertionViewModel *)viewModel {
    self.viewModel = viewModel;

    [self.dataDisplayManager configWithFromView:self.convertFromView
                                  fromViewModel:viewModel.exchangeFromViewModel
                                         toView:self.convertToView
                                    toViewModel:viewModel.exchangeToViewModel];
    [self.convertFromView reloadData];
    [self.convertToView reloadData];
    
    self.exchangeButton.enabled = viewModel.exchangeEnambled;
}

- (void)purgeText {
    self.textFieldProxy.text = @"";
}

#pragma mark - IVVCurrencyConvertionDataDisplayManagerDelegate

- (void)currencyDidChange:(IVVCurrencyType)currencytype
         forConvertToView:(BOOL)convertTo {
    [self.output exchangeCurrencyDidChange:currencytype
                                 convertTo:convertTo];
}

#pragma mark - User interaction

- (IBAction)onExchangeButtonTapped:(id)sender {
    [self.output exchangeInitiated];
}

- (IBAction)proxyTextFieldEditingChanged:(UITextField *)proxyTextField {
    NSString *exchangeText = proxyTextField.text;
    [self.output exchangeTextDidChange:exchangeText];
}

// Allow only two digits for fraction part
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
                                                       replacementString:(NSString *)string {
    // deleting letter
    if (range.length > 0 ) {
        return YES;
    }
    
    NSArray *splittedString = [textField.text componentsSeparatedByString:@"."];
    if (splittedString.count > 1) {
        NSString *fractionString = splittedString[1];
        if (fractionString.length > 1) {
            return NO;
        }
    }
    
    return YES;
}

#pragma mark - Notifications 

- (void)subscribeToNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)unsubscribeFromNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary* userInfo = [notification userInfo];
    CGRect keyboardFrame = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGFloat keyboardHeight = CGRectGetHeight(keyboardFrame);
    self.containerViewBottomConstraint.constant = keyboardHeight;
}

- (void)keyboardWillHide:(NSNotification *)notification {
    self.containerViewBottomConstraint.constant = 0;
}

@end
