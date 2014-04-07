//
//  Copyright (c) 2013 Luke Scott
//  https://github.com/lukescott/DraggableCollectionView
//  Distributed under MIT license
//

#import "Cell.h"

@implementation Cell

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    if (highlighted) {
        self.alpha = 0.5;
    }
    else {
        self.alpha = 1.f;
    }
}

//- (id)initWithCoder:(NSCoder *)decoder {
//    self = [super initWithCoder:decoder];
//    if (self) {
//        UIView *backgroundView = [[UIView alloc] initWithFrame:self.bounds];
//        backgroundView.backgroundColor = [UIColor redColor];
//        self.backgroundView = backgroundView;
//        
//        UIView* selectedBGView = [[UIView alloc] initWithFrame:self.bounds];
//        selectedBGView.backgroundColor = [UIColor whiteColor];
//        self.selectedBackgroundView = selectedBGView;
//    }
//    return self;
//}



@end
