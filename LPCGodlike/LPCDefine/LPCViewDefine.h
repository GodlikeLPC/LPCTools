//
//  LPCViewDefine.h
//  LPCTools
//
//  Created by 李沛池 on 2017/7/22.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#ifndef LPCViewDefine_h
#define LPCViewDefine_h

//从self跳转到nib文件对应的ViewController
#define PushToNibVC(vcStr) [self.navigationController pushViewController:[[NSClassFromString(vcStr) alloc] initWithNibName:vcStr bundle:nil] animated:YES];
//从self跳转到ViewController
#define PushToVC(vcStr) [self.navigationController pushViewController:[[NSClassFromString(vcStr) alloc] init] animated:YES];
#define PresentToVC(vcStr,animate) [self presentViewController:[[NSClassFromString(vcStr) alloc] init] animated:animate completion:nil];
#define PresentToNibVC(vcStr) [self presentViewController:[[NSClassFromString(vcStr) alloc] initWithNibName:vcStr bundle:nil] animated:YES completion:nil];
//返回
#define PopVC [self.navigationController popViewControllerAnimated:YES];
#define DissmissVC [self dismissViewControllerAnimated:YES completion:nil];
//读取自定义cell文件
#define XIBcellFromMainBundle(name) [tableView dequeueReusableCellWithIdentifier:name];\
if (!cell) {\
cell = [[[NSBundle mainBundle] loadNibNamed:name owner:self options:nil] objectAtIndex:0];\
}
//读取xib文件
#define XIBFromMainBundle(name) [[[NSBundle mainBundle] loadNibNamed:name owner:self options:nil] objectAtIndex:0]
#define XIBVCInit(name) [[NSClassFromString(name) alloc] initWithNibName:name bundle:nil]
//注册xibCell
#define XIBRegister(name) registerNib:[UINib nibWithNibName:name bundle:nil] forCellWithReuseIdentifier:name
//注册无XIB的cell
#define ClassRegister(name) registerClass:[NSClassFromString(name) class] forCellWithReuseIdentifier:name
//从storyboard中读取
#define StoryboardXIIBVC(identifier) [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:identifier]


#endif /* LPCViewDefine_h */
