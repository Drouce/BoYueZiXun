// .h
#define singleton_interface(class) + (instancetype)shared##class;

// .m
#define singleton_implementation(class) \
static class *_instance; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [super allocWithZone:zone]; \
    }); \
\
    return _instance; \
} \
\
+ (instancetype)shared##class \
{ \
    if (_instance == nil) { \
        _instance = [[class alloc] init]; \
    } \
\
    return _instance; \
}

#define interface_sharedStance\
+(UINavigationController *)sharedStance;


#define implementation_sharedStance(class)\
+(UINavigationController *)sharedStance {\
static UINavigationController *navi = nil;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
    class *readVC = [class new];\
    navi = [[UINavigationController alloc]initWithRootViewController:readVC];\
});\
return navi;\
}



