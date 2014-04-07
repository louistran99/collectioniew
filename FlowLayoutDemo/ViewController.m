//
//  Copyright (c) 2013 Luke Scott
//  https://github.com/lukescott/DraggableCollectionView
//  Distributed under MIT license
//

#import "ViewController.h"
#import "Cell.h"

#define SECTION_COUNT 5
#define ITEM_COUNT 20

@interface ViewController ()
{
    NSMutableArray *sections;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _collectionView.delegate = self;
    sections = [[NSMutableArray alloc] initWithCapacity:ITEM_COUNT];
    for(int s = 0; s < SECTION_COUNT; s++) {
        NSMutableArray *data = [[NSMutableArray alloc] initWithCapacity:ITEM_COUNT];
        for(int i = 0; i < ITEM_COUNT; i++) {
            [data addObject:[NSString stringWithFormat:@"%c %@", 65+s, @(i)]];
        }
        [sections addObject:data];
    }
}


#pragma mark UICollectionViewDelegate delegate call back
//-(void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//    Cell *cell = (Cell*)[_collectionView cellForItemAtIndexPath:indexPath];
//    cell.backgroundView = nil;
//    NSLog(@"deselected row: %d; section: %d",indexPath.row,indexPath.section);
//}
//
//-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//
//    Cell *cell = (Cell*)[_collectionView cellForItemAtIndexPath:indexPath];
//    UIView *background = [[UIView alloc] initWithFrame:cell.bounds];
//    background.backgroundColor = [UIColor redColor];
//    cell.backgroundView = background;
//    NSLog(@"Selected row: %d; section: %d",indexPath.row,indexPath.section);
//}

-(BOOL) collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(BOOL) collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    if ([NSStringFromSelector(action) isEqualToString:@"cut:"]) {
        return YES;
    }
    return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    if ([NSStringFromSelector(action) isEqualToString:@"cut:"]) {
        NSLog(@"delete photo here...");
    }

}

#pragma mark UICollectionViewDataSource delegate callback
// and object that adpts UICOllectionViewDataSource protocol vends data to the collection view as needed
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return sections.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[sections objectAtIndex:section] count];
}

// creates and returns a configured cell for a given index
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *cell = (Cell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    NSMutableArray *data = [sections objectAtIndex:indexPath.section];
    
    cell.label.text = [data objectAtIndex:indexPath.item];
    
    return cell;
}

#pragma mark UICollectionViewDataSource_Draggable delegate callback
- (BOOL)collectionView:(LSCollectionViewHelper *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)toIndexPath
{
// Prevent item from being moved to index 0
//    if (toIndexPath.item == 0) {
//        return NO;
//    }
    return YES;
}

- (void)collectionView:(LSCollectionViewHelper *)collectionView moveItemAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSMutableArray *data1 = [sections objectAtIndex:fromIndexPath.section];
    NSMutableArray *data2 = [sections objectAtIndex:toIndexPath.section];
    NSString *index = [data1 objectAtIndex:fromIndexPath.item];
    
    [data1 removeObjectAtIndex:fromIndexPath.item];
    [data2 insertObject:index atIndex:toIndexPath.item];
}

@end
