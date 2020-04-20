//
//  ViewController.m
//  CoreDataDemo
//
//  Created by Jerry.Yang on 2020/4/20.
//  Copyright © 2020 Jerry.Yang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController(){
    NSManagedObjectContext *_context;
}
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _context = [self createDBContext];
    [self addPersonWithName:@"Jerry" sex:@"male" age:@100];
    [self addPersonWithName:@"Lily" sex:@"female" age:@20];
    [self addPersonWithName:@"Tom" sex:@"male" age:@80];
    
    [self modifyPersonWithName:@"Lily" sex:@"woman" age:@90];
    NSArray *allLily = [self getPersonByName:@"Lily"];
    NSLog(@"%lu",(unsigned long)allLily.count);
    for (Person *p in allLily) {
        NSLog(@"%@",p.name);
        NSLog(@"%@",p.sex);
        NSLog(@"%d",p.age);
    }
    
    [self removePerson:@"Lily"];
    // Do any additional setup after loading the view.
}

#pragma mark 1.创建管理上下文
- (NSManagedObjectContext *)createDBContext
{
    NSManagedObjectContext *context;
    //打开模型文件，参数为nil则打开包中所有模型文件并合并成一个

    NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
    //创建解析器NSPersistentStoreCoordinator

    NSPersistentStoreCoordinator *storeCoordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:model];
    //创建数据库保存路径(文件目录)
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"%@", path);
    ///path: Users/jerry.yang/Library/Containers/com.shztt.CoreDataDemo/Data/Documents
    path = [path stringByAppendingPathComponent:@"YC.db"];
    _TFPath.stringValue = path;
    //添加SQLite持久存储到解析器
    NSError *error;
    [storeCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:path] options:nil error:&error];
    if (error) {
        NSLog(@"数据库打开失败！错误: %@", error.localizedDescription);
    }
    else//数据库创建成功（打开成功）
    {
        context = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
        context.persistentStoreCoordinator = storeCoordinator;
        NSLog(@"数据库打开成功！");
    }
    return context;
}


#pragma mark 2.插入数据
- (void)addPersonWithName:(NSString *)name sex:(NSString *)sex age:(NSNumber *)age
{
    //创建实体对象
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:_context];
    person.name = name;
    person.sex = sex;
    person.age = age.intValue;
    //保存上下文
    NSError *error;
    [_context save:&error];
    if (error) {
        NSLog(@"添加过程中发送错误，错误: %@", error.localizedDescription);
    }
    else
    {
        NSLog(@"添加成功");
    }
}


#pragma mark 3.查询数据
//NSPredicate(谓词)是一个Foundation的类，它指定数据被获取或者过滤的方式。它的语言就像SQL的where和正则表达式的交叉一样。提供了具有表现力的，自然语言界面来定义一个集合。（被搜索的逻辑条件）
//*zo*    z, zo, zoo, zooo....
//zo+    zo, zoo, zooo, zoooo...
- (NSArray *)getPersonByName : (NSString *)name
{
    //创建一个请求
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    request.predicate = [NSPredicate predicateWithFormat:@"%K=%@",@"name", name];

    //上下文执行请求,得到查询结果
    NSArray *array = [_context executeFetchRequest:request error:nil];
    return array;
}

#pragma mark 4.删除数据
- (void)removePerson : (NSString *)name
{
    Person *person = [[self getPersonByName:name] firstObject];
    [_context deleteObject:person];
    NSError *error;
    [_context save:&error];
    if (error) {
        NSLog(@"删除过程中发生错误：%@", error.localizedDescription);
    }
    else
    {
        NSLog(@"删除成功");
    }
}


#pragma mark 修改数据
//必须首先提取出对应的实体对象，然后通过修改对象属性，最后保存
- (void)modifyPersonWithName : (NSString *)name sex : (NSString *)sex age : (NSNumber *)age{
    Person *person = [[self getPersonByName:name] firstObject];
    person.sex = sex;
    person.age = age.intValue;
    NSError *error;
    [_context save:&error];
    if (error) {
        NSLog(@"修改过程中发生错误: %@", error.localizedDescription);
    }
    else
    {
        NSLog(@"修改成功");
    }
}


- (IBAction)add:(id)sender {
    [self addPersonWithName:_TFname.stringValue sex:_TFSex.stringValue age:[NSNumber numberWithInt:_TFAge.intValue]];
    _MLText.stringValue = [_MLText.stringValue stringByAppendingFormat:@"\n%@",@"添加成功"];
}

- (IBAction)search:(id)sender {
    NSArray *arr = [self getPersonByName:_TFname.stringValue];
    
}

- (IBAction)delete:(id)sender {
}

- (IBAction)nodify:(id)sender {
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
