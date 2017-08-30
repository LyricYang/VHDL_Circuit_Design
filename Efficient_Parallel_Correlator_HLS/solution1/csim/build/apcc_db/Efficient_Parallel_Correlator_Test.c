/* Provide Declarations */
#include <stdarg.h>
#include <setjmp.h>
#include <limits.h>
#ifdef NEED_CBEAPINT
#include <autopilot_cbe.h>
#else
#define aesl_fopen fopen
#define aesl_freopen freopen
#define aesl_tmpfile tmpfile
#endif
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#ifdef __STRICT_ANSI__
#define inline __inline__
#define typeof __typeof__ 
#endif
#define __isoc99_fscanf fscanf
#define __isoc99_sscanf sscanf
#undef ferror
#undef feof
/* get a declaration for alloca */
#if defined(__CYGWIN__) || defined(__MINGW32__)
#define  alloca(x) __builtin_alloca((x))
#define _alloca(x) __builtin_alloca((x))
#elif defined(__APPLE__)
extern void *__builtin_alloca(unsigned long);
#define alloca(x) __builtin_alloca(x)
#define longjmp _longjmp
#define setjmp _setjmp
#elif defined(__sun__)
#if defined(__sparcv9)
extern void *__builtin_alloca(unsigned long);
#else
extern void *__builtin_alloca(unsigned int);
#endif
#define alloca(x) __builtin_alloca(x)
#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || defined(__arm__)
#define alloca(x) __builtin_alloca(x)
#elif defined(_MSC_VER)
#define inline _inline
#define alloca(x) _alloca(x)
#else
#include <alloca.h>
#endif

#ifndef __GNUC__  /* Can only support "linkonce" vars with GCC */
#define __attribute__(X)
#endif

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __EXTERNAL_WEAK__ __attribute__((weak_import))
#elif defined(__GNUC__)
#define __EXTERNAL_WEAK__ __attribute__((weak))
#else
#define __EXTERNAL_WEAK__
#endif

#if defined(__GNUC__) && (defined(__APPLE_CC__) || defined(__CYGWIN__) || defined(__MINGW32__))
#define __ATTRIBUTE_WEAK__
#elif defined(__GNUC__)
#define __ATTRIBUTE_WEAK__ __attribute__((weak))
#else
#define __ATTRIBUTE_WEAK__
#endif

#if defined(__GNUC__)
#define __HIDDEN__ __attribute__((visibility("hidden")))
#endif

#ifdef __GNUC__
#define LLVM_NAN(NanStr)   __builtin_nan(NanStr)   /* Double */
#define LLVM_NANF(NanStr)  __builtin_nanf(NanStr)  /* Float */
#define LLVM_NANS(NanStr)  __builtin_nans(NanStr)  /* Double */
#define LLVM_NANSF(NanStr) __builtin_nansf(NanStr) /* Float */
#define LLVM_INF           __builtin_inf()         /* Double */
#define LLVM_INFF          __builtin_inff()        /* Float */
#define LLVM_PREFETCH(addr,rw,locality) __builtin_prefetch(addr,rw,locality)
#define __ATTRIBUTE_CTOR__ __attribute__((constructor))
#define __ATTRIBUTE_DTOR__ __attribute__((destructor))
#define LLVM_ASM           __asm__
#else
#define LLVM_NAN(NanStr)   ((double)0.0)           /* Double */
#define LLVM_NANF(NanStr)  0.0F                    /* Float */
#define LLVM_NANS(NanStr)  ((double)0.0)           /* Double */
#define LLVM_NANSF(NanStr) 0.0F                    /* Float */
#define LLVM_INF           ((double)0.0)           /* Double */
#define LLVM_INFF          0.0F                    /* Float */
#define LLVM_PREFETCH(addr,rw,locality)            /* PREFETCH */
#define __ATTRIBUTE_CTOR__
#define __ATTRIBUTE_DTOR__
#define LLVM_ASM(X)
#endif

#if __GNUC__ < 4 /* Old GCC's, or compilers not GCC */ 
#define __builtin_stack_save() 0   /* not implemented */
#define __builtin_stack_restore(X) /* noop */
#endif

#if __GNUC__ && __LP64__ /* 128-bit integer types */
typedef int __attribute__((mode(TI))) llvmInt128;
typedef unsigned __attribute__((mode(TI))) llvmUInt128;
#endif

#define CODE_FOR_MAIN() /* Any target-specific code for main()*/

#ifndef __cplusplus
typedef unsigned char bool;
#endif


/* Support for floating point constants */
typedef unsigned long long ConstantDoubleTy;
typedef unsigned int        ConstantFloatTy;
typedef struct { unsigned long long f1; unsigned short f2; unsigned short pad[3]; } ConstantFP80Ty;
typedef struct { unsigned long long f1; unsigned long long f2; } ConstantFP128Ty;


/* Global Declarations */
/* Helper union for bitcasts */
typedef union {
  unsigned int Int32;
  unsigned long long Int64;
  float Float;
  double Double;
} llvmBitCastUnion;
/* Structure forward decls */
typedef struct l_struct_OC__iobuf l_struct_OC__iobuf;

/* Structure contents */
struct l_struct_OC__iobuf {
   char *field0;
  unsigned int field1;
   char *field2;
  unsigned int field3;
  unsigned int field4;
  unsigned int field5;
  unsigned int field6;
   char *field7;
};


/* External Global Variable Declarations */

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
void main(void);
void Efficient_Cor(float *, float *, float *, float *);


/* Global Variable Definitions and Initialization */
static  char aesl_internal__OC_str[7] = "in.dat";
static  char aesl_internal__OC_str1[2] = "r";
static  char aesl_internal__OC_str2[13] = "result_a.dat";
static  char aesl_internal__OC_str3[2] = "w";
static  char aesl_internal__OC_str4[13] = "result_b.dat";
static  char aesl_internal__OC_str5[3] = "%f";
static  char aesl_internal__OC_str6[4] = "%f ";
static  char aesl_internal__OC_str8[5] = "%f \n";


/* Function Bodies */
static inline int llvm_fcmp_ord(double X, double Y) { return X == X && Y == Y; }
static inline int llvm_fcmp_uno(double X, double Y) { return X != X || Y != Y; }
static inline int llvm_fcmp_ueq(double X, double Y) { return X == Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_une(double X, double Y) { return X != Y; }
static inline int llvm_fcmp_ult(double X, double Y) { return X <  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ugt(double X, double Y) { return X >  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ule(double X, double Y) { return X <= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_uge(double X, double Y) { return X >= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_oeq(double X, double Y) { return X == Y ; }
static inline int llvm_fcmp_one(double X, double Y) { return X != Y && llvm_fcmp_ord(X, Y); }
static inline int llvm_fcmp_olt(double X, double Y) { return X <  Y ; }
static inline int llvm_fcmp_ogt(double X, double Y) { return X >  Y ; }
static inline int llvm_fcmp_ole(double X, double Y) { return X <= Y ; }
static inline int llvm_fcmp_oge(double X, double Y) { return X >= Y ; }

void main(void) {
  static  unsigned long long aesl_llvm_cbe_Gol_a_count = 0;
  float llvm_cbe_Gol_a[8];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_Gol_b_count = 0;
  float llvm_cbe_Gol_b[8];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_Cor_a_count = 0;
  float llvm_cbe_Cor_a[8];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_Cor_b_count = 0;
  float llvm_cbe_Cor_b[8];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_tmp_count = 0;
  float llvm_cbe_tmp;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_1_count = 0;
  static  unsigned long long aesl_llvm_cbe_2_count = 0;
  static  unsigned long long aesl_llvm_cbe_3_count = 0;
  static  unsigned long long aesl_llvm_cbe_4_count = 0;
  static  unsigned long long aesl_llvm_cbe_5_count = 0;
  static  unsigned long long aesl_llvm_cbe_6_count = 0;
  static  unsigned long long aesl_llvm_cbe_7_count = 0;
  static  unsigned long long aesl_llvm_cbe_8_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__1;
  static  unsigned long long aesl_llvm_cbe_9_count = 0;
  static  unsigned long long aesl_llvm_cbe_10_count = 0;
  static  unsigned long long aesl_llvm_cbe_11_count = 0;
  static  unsigned long long aesl_llvm_cbe_12_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__2;
  static  unsigned long long aesl_llvm_cbe_13_count = 0;
  static  unsigned long long aesl_llvm_cbe_14_count = 0;
  static  unsigned long long aesl_llvm_cbe_15_count = 0;
  static  unsigned long long aesl_llvm_cbe_16_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__3;
  static  unsigned long long aesl_llvm_cbe_17_count = 0;
  static  unsigned long long aesl_llvm_cbe_18_count = 0;
  static  unsigned long long aesl_llvm_cbe_19_count = 0;
  static  unsigned long long aesl_llvm_cbe_20_count = 0;
  static  unsigned long long aesl_llvm_cbe_21_count = 0;
  static  unsigned long long aesl_llvm_cbe_22_count = 0;
  static  unsigned long long aesl_llvm_cbe_23_count = 0;
  float *llvm_cbe_tmp__4;
  static  unsigned long long aesl_llvm_cbe_24_count = 0;
  float *llvm_cbe_tmp__5;
  static  unsigned long long aesl_llvm_cbe_25_count = 0;
  float *llvm_cbe_tmp__6;
  static  unsigned long long aesl_llvm_cbe_26_count = 0;
  float *llvm_cbe_tmp__7;
  static  unsigned long long aesl_llvm_cbe_27_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge5_count = 0;
  unsigned int llvm_cbe_storemerge5;
  unsigned int llvm_cbe_storemerge5__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_28_count = 0;
  static  unsigned long long aesl_llvm_cbe_29_count = 0;
  static  unsigned long long aesl_llvm_cbe_30_count = 0;
  static  unsigned long long aesl_llvm_cbe_31_count = 0;
  static  unsigned long long aesl_llvm_cbe_32_count = 0;
  static  unsigned long long aesl_llvm_cbe_33_count = 0;
  unsigned int llvm_cbe_tmp__8;
  static  unsigned long long aesl_llvm_cbe_34_count = 0;
  static  unsigned long long aesl_llvm_cbe_35_count = 0;
  static  unsigned long long aesl_llvm_cbe_36_count = 0;
  static  unsigned long long aesl_llvm_cbe_37_count = 0;
  static  unsigned long long aesl_llvm_cbe_38_count = 0;
  static  unsigned long long aesl_llvm_cbe_39_count = 0;
  static  unsigned long long aesl_llvm_cbe_40_count = 0;
  static  unsigned long long aesl_llvm_cbe_41_count = 0;
  static  unsigned long long aesl_llvm_cbe_42_count = 0;
  static  unsigned long long aesl_llvm_cbe_43_count = 0;
  static  unsigned long long aesl_llvm_cbe_44_count = 0;
  static  unsigned long long aesl_llvm_cbe_45_count = 0;
  static  unsigned long long aesl_llvm_cbe_46_count = 0;
  static  unsigned long long aesl_llvm_cbe_47_count = 0;
  static  unsigned long long aesl_llvm_cbe_48_count = 0;
  static  unsigned long long aesl_llvm_cbe_49_count = 0;
  static  unsigned long long aesl_llvm_cbe_50_count = 0;
  static  unsigned long long aesl_llvm_cbe_51_count = 0;
  static  unsigned long long aesl_llvm_cbe_52_count = 0;
  static  unsigned long long aesl_llvm_cbe_53_count = 0;
  static  unsigned long long aesl_llvm_cbe_54_count = 0;
  static  unsigned long long aesl_llvm_cbe_55_count = 0;
  static  unsigned long long aesl_llvm_cbe_56_count = 0;
  static  unsigned long long aesl_llvm_cbe_57_count = 0;
  static  unsigned long long aesl_llvm_cbe_58_count = 0;
  static  unsigned long long aesl_llvm_cbe_59_count = 0;
  static  unsigned long long aesl_llvm_cbe_60_count = 0;
  static  unsigned long long aesl_llvm_cbe_61_count = 0;
  float llvm_cbe_tmp__9;
  static  unsigned long long aesl_llvm_cbe_62_count = 0;
  double llvm_cbe_tmp__10;
  static  unsigned long long aesl_llvm_cbe_63_count = 0;
  unsigned int llvm_cbe_tmp__11;
  static  unsigned long long aesl_llvm_cbe_64_count = 0;
  static  unsigned long long aesl_llvm_cbe_65_count = 0;
  static  unsigned long long aesl_llvm_cbe_66_count = 0;
  static  unsigned long long aesl_llvm_cbe_67_count = 0;
  static  unsigned long long aesl_llvm_cbe_68_count = 0;
  static  unsigned long long aesl_llvm_cbe_69_count = 0;
  static  unsigned long long aesl_llvm_cbe_70_count = 0;
  static  unsigned long long aesl_llvm_cbe_71_count = 0;
  static  unsigned long long aesl_llvm_cbe_72_count = 0;
  static  unsigned long long aesl_llvm_cbe_73_count = 0;
  static  unsigned long long aesl_llvm_cbe_74_count = 0;
  static  unsigned long long aesl_llvm_cbe_75_count = 0;
  static  unsigned long long aesl_llvm_cbe_76_count = 0;
  static  unsigned long long aesl_llvm_cbe_77_count = 0;
  static  unsigned long long aesl_llvm_cbe_78_count = 0;
  static  unsigned long long aesl_llvm_cbe_79_count = 0;
  static  unsigned long long aesl_llvm_cbe_80_count = 0;
  static  unsigned long long aesl_llvm_cbe_81_count = 0;
  static  unsigned long long aesl_llvm_cbe_82_count = 0;
  static  unsigned long long aesl_llvm_cbe_83_count = 0;
  static  unsigned long long aesl_llvm_cbe_84_count = 0;
  static  unsigned long long aesl_llvm_cbe_85_count = 0;
  static  unsigned long long aesl_llvm_cbe_86_count = 0;
  static  unsigned long long aesl_llvm_cbe_87_count = 0;
  static  unsigned long long aesl_llvm_cbe_88_count = 0;
  static  unsigned long long aesl_llvm_cbe_89_count = 0;
  static  unsigned long long aesl_llvm_cbe_90_count = 0;
  static  unsigned long long aesl_llvm_cbe_91_count = 0;
  float llvm_cbe_tmp__12;
  static  unsigned long long aesl_llvm_cbe_92_count = 0;
  static  unsigned long long aesl_llvm_cbe_93_count = 0;
  static  unsigned long long aesl_llvm_cbe_94_count = 0;
  static  unsigned long long aesl_llvm_cbe_95_count = 0;
  static  unsigned long long aesl_llvm_cbe_96_count = 0;
  static  unsigned long long aesl_llvm_cbe_97_count = 0;
  static  unsigned long long aesl_llvm_cbe_98_count = 0;
  static  unsigned long long aesl_llvm_cbe_99_count = 0;
  static  unsigned long long aesl_llvm_cbe_100_count = 0;
  static  unsigned long long aesl_llvm_cbe_101_count = 0;
  static  unsigned long long aesl_llvm_cbe_102_count = 0;
  static  unsigned long long aesl_llvm_cbe_103_count = 0;
  unsigned int llvm_cbe_tmp__13;
  static  unsigned long long aesl_llvm_cbe_104_count = 0;
  static  unsigned long long aesl_llvm_cbe_105_count = 0;
  static  unsigned long long aesl_llvm_cbe_106_count = 0;
  static  unsigned long long aesl_llvm_cbe_107_count = 0;
  static  unsigned long long aesl_llvm_cbe_108_count = 0;
  static  unsigned long long aesl_llvm_cbe_109_count = 0;
  static  unsigned long long aesl_llvm_cbe_110_count = 0;
  static  unsigned long long aesl_llvm_cbe_111_count = 0;
  static  unsigned long long aesl_llvm_cbe_112_count = 0;
  static  unsigned long long aesl_llvm_cbe_113_count = 0;
  static  unsigned long long aesl_llvm_cbe_114_count = 0;
  static  unsigned long long aesl_llvm_cbe_115_count = 0;
  static  unsigned long long aesl_llvm_cbe_116_count = 0;
  static  unsigned long long aesl_llvm_cbe_117_count = 0;
  static  unsigned long long aesl_llvm_cbe_118_count = 0;
  static  unsigned long long aesl_llvm_cbe_119_count = 0;
  static  unsigned long long aesl_llvm_cbe_120_count = 0;
  static  unsigned long long aesl_llvm_cbe_121_count = 0;
  static  unsigned long long aesl_llvm_cbe_122_count = 0;
  static  unsigned long long aesl_llvm_cbe_123_count = 0;
  static  unsigned long long aesl_llvm_cbe_124_count = 0;
  static  unsigned long long aesl_llvm_cbe_125_count = 0;
  static  unsigned long long aesl_llvm_cbe_126_count = 0;
  static  unsigned long long aesl_llvm_cbe_127_count = 0;
  static  unsigned long long aesl_llvm_cbe_128_count = 0;
  static  unsigned long long aesl_llvm_cbe_129_count = 0;
  static  unsigned long long aesl_llvm_cbe_130_count = 0;
  static  unsigned long long aesl_llvm_cbe_131_count = 0;
  float llvm_cbe_tmp__14;
  static  unsigned long long aesl_llvm_cbe_132_count = 0;
  double llvm_cbe_tmp__15;
  static  unsigned long long aesl_llvm_cbe_133_count = 0;
  unsigned int llvm_cbe_tmp__16;
  static  unsigned long long aesl_llvm_cbe_134_count = 0;
  static  unsigned long long aesl_llvm_cbe_135_count = 0;
  static  unsigned long long aesl_llvm_cbe_136_count = 0;
  static  unsigned long long aesl_llvm_cbe_137_count = 0;
  static  unsigned long long aesl_llvm_cbe_138_count = 0;
  static  unsigned long long aesl_llvm_cbe_139_count = 0;
  static  unsigned long long aesl_llvm_cbe_140_count = 0;
  static  unsigned long long aesl_llvm_cbe_141_count = 0;
  static  unsigned long long aesl_llvm_cbe_142_count = 0;
  static  unsigned long long aesl_llvm_cbe_143_count = 0;
  static  unsigned long long aesl_llvm_cbe_144_count = 0;
  static  unsigned long long aesl_llvm_cbe_145_count = 0;
  static  unsigned long long aesl_llvm_cbe_146_count = 0;
  static  unsigned long long aesl_llvm_cbe_147_count = 0;
  static  unsigned long long aesl_llvm_cbe_148_count = 0;
  static  unsigned long long aesl_llvm_cbe_149_count = 0;
  static  unsigned long long aesl_llvm_cbe_150_count = 0;
  static  unsigned long long aesl_llvm_cbe_151_count = 0;
  static  unsigned long long aesl_llvm_cbe_152_count = 0;
  static  unsigned long long aesl_llvm_cbe_153_count = 0;
  static  unsigned long long aesl_llvm_cbe_154_count = 0;
  static  unsigned long long aesl_llvm_cbe_155_count = 0;
  static  unsigned long long aesl_llvm_cbe_156_count = 0;
  static  unsigned long long aesl_llvm_cbe_157_count = 0;
  static  unsigned long long aesl_llvm_cbe_158_count = 0;
  static  unsigned long long aesl_llvm_cbe_159_count = 0;
  static  unsigned long long aesl_llvm_cbe_160_count = 0;
  static  unsigned long long aesl_llvm_cbe_161_count = 0;
  float llvm_cbe_tmp__17;
  static  unsigned long long aesl_llvm_cbe_162_count = 0;
  float *llvm_cbe_tmp__18;
  static  unsigned long long aesl_llvm_cbe_163_count = 0;
  static  unsigned long long aesl_llvm_cbe_164_count = 0;
  static  unsigned long long aesl_llvm_cbe_165_count = 0;
  static  unsigned long long aesl_llvm_cbe_166_count = 0;
  static  unsigned long long aesl_llvm_cbe_167_count = 0;
  float *llvm_cbe_tmp__19;
  static  unsigned long long aesl_llvm_cbe_168_count = 0;
  static  unsigned long long aesl_llvm_cbe_169_count = 0;
  static  unsigned long long aesl_llvm_cbe_170_count = 0;
  static  unsigned long long aesl_llvm_cbe_171_count = 0;
  static  unsigned long long aesl_llvm_cbe_172_count = 0;
  static  unsigned long long aesl_llvm_cbe_173_count = 0;
  static  unsigned long long aesl_llvm_cbe_174_count = 0;
  static  unsigned long long aesl_llvm_cbe_175_count = 0;
  unsigned int llvm_cbe_tmp__20;
  static  unsigned long long aesl_llvm_cbe_176_count = 0;
  static  unsigned long long aesl_llvm_cbe_177_count = 0;
  static  unsigned long long aesl_llvm_cbe_178_count = 0;
  static  unsigned long long aesl_llvm_cbe_179_count = 0;
  static  unsigned long long aesl_llvm_cbe_180_count = 0;
  static  unsigned long long aesl_llvm_cbe_181_count = 0;
  static  unsigned long long aesl_llvm_cbe_182_count = 0;
  static  unsigned long long aesl_llvm_cbe_183_count = 0;
  static  unsigned long long aesl_llvm_cbe_184_count = 0;
  static  unsigned long long aesl_llvm_cbe_185_count = 0;
  static  unsigned long long aesl_llvm_cbe_186_count = 0;
  static  unsigned long long aesl_llvm_cbe_187_count = 0;
  static  unsigned long long aesl_llvm_cbe_188_count = 0;
  static  unsigned long long aesl_llvm_cbe_189_count = 0;
  static  unsigned long long aesl_llvm_cbe_190_count = 0;
  static  unsigned long long aesl_llvm_cbe_191_count = 0;
  static  unsigned long long aesl_llvm_cbe_192_count = 0;
  static  unsigned long long aesl_llvm_cbe_193_count = 0;
  static  unsigned long long aesl_llvm_cbe_194_count = 0;
  static  unsigned long long aesl_llvm_cbe_195_count = 0;
  static  unsigned long long aesl_llvm_cbe_196_count = 0;
  static  unsigned long long aesl_llvm_cbe_197_count = 0;
  static  unsigned long long aesl_llvm_cbe_198_count = 0;
  static  unsigned long long aesl_llvm_cbe_199_count = 0;
  static  unsigned long long aesl_llvm_cbe_200_count = 0;
  static  unsigned long long aesl_llvm_cbe_201_count = 0;
  static  unsigned long long aesl_llvm_cbe_202_count = 0;
  static  unsigned long long aesl_llvm_cbe_203_count = 0;
  float llvm_cbe_tmp__21;
  static  unsigned long long aesl_llvm_cbe_204_count = 0;
  double llvm_cbe_tmp__22;
  static  unsigned long long aesl_llvm_cbe_205_count = 0;
  unsigned int llvm_cbe_tmp__23;
  static  unsigned long long aesl_llvm_cbe_206_count = 0;
  static  unsigned long long aesl_llvm_cbe_207_count = 0;
  static  unsigned long long aesl_llvm_cbe_208_count = 0;
  static  unsigned long long aesl_llvm_cbe_209_count = 0;
  static  unsigned long long aesl_llvm_cbe_210_count = 0;
  static  unsigned long long aesl_llvm_cbe_211_count = 0;
  static  unsigned long long aesl_llvm_cbe_212_count = 0;
  static  unsigned long long aesl_llvm_cbe_213_count = 0;
  static  unsigned long long aesl_llvm_cbe_214_count = 0;
  static  unsigned long long aesl_llvm_cbe_215_count = 0;
  static  unsigned long long aesl_llvm_cbe_216_count = 0;
  static  unsigned long long aesl_llvm_cbe_217_count = 0;
  static  unsigned long long aesl_llvm_cbe_218_count = 0;
  static  unsigned long long aesl_llvm_cbe_219_count = 0;
  static  unsigned long long aesl_llvm_cbe_220_count = 0;
  static  unsigned long long aesl_llvm_cbe_221_count = 0;
  static  unsigned long long aesl_llvm_cbe_222_count = 0;
  static  unsigned long long aesl_llvm_cbe_223_count = 0;
  static  unsigned long long aesl_llvm_cbe_224_count = 0;
  static  unsigned long long aesl_llvm_cbe_225_count = 0;
  static  unsigned long long aesl_llvm_cbe_226_count = 0;
  static  unsigned long long aesl_llvm_cbe_227_count = 0;
  static  unsigned long long aesl_llvm_cbe_228_count = 0;
  static  unsigned long long aesl_llvm_cbe_229_count = 0;
  static  unsigned long long aesl_llvm_cbe_230_count = 0;
  static  unsigned long long aesl_llvm_cbe_231_count = 0;
  static  unsigned long long aesl_llvm_cbe_232_count = 0;
  static  unsigned long long aesl_llvm_cbe_233_count = 0;
  float llvm_cbe_tmp__24;
  static  unsigned long long aesl_llvm_cbe_234_count = 0;
  float *llvm_cbe_tmp__25;
  static  unsigned long long aesl_llvm_cbe_235_count = 0;
  static  unsigned long long aesl_llvm_cbe_236_count = 0;
  static  unsigned long long aesl_llvm_cbe_237_count = 0;
  static  unsigned long long aesl_llvm_cbe_238_count = 0;
  static  unsigned long long aesl_llvm_cbe_239_count = 0;
  float *llvm_cbe_tmp__26;
  static  unsigned long long aesl_llvm_cbe_240_count = 0;
  static  unsigned long long aesl_llvm_cbe_241_count = 0;
  static  unsigned long long aesl_llvm_cbe_242_count = 0;
  static  unsigned long long aesl_llvm_cbe_243_count = 0;
  static  unsigned long long aesl_llvm_cbe_244_count = 0;
  static  unsigned long long aesl_llvm_cbe_245_count = 0;
  static  unsigned long long aesl_llvm_cbe_246_count = 0;
  static  unsigned long long aesl_llvm_cbe_247_count = 0;
  unsigned int llvm_cbe_tmp__27;
  static  unsigned long long aesl_llvm_cbe_248_count = 0;
  static  unsigned long long aesl_llvm_cbe_249_count = 0;
  static  unsigned long long aesl_llvm_cbe_250_count = 0;
  static  unsigned long long aesl_llvm_cbe_251_count = 0;
  static  unsigned long long aesl_llvm_cbe_252_count = 0;
  static  unsigned long long aesl_llvm_cbe_253_count = 0;
  static  unsigned long long aesl_llvm_cbe_254_count = 0;
  static  unsigned long long aesl_llvm_cbe_255_count = 0;
  static  unsigned long long aesl_llvm_cbe_256_count = 0;
  static  unsigned long long aesl_llvm_cbe_257_count = 0;
  static  unsigned long long aesl_llvm_cbe_258_count = 0;
  static  unsigned long long aesl_llvm_cbe_259_count = 0;
  static  unsigned long long aesl_llvm_cbe_260_count = 0;
  static  unsigned long long aesl_llvm_cbe_261_count = 0;
  static  unsigned long long aesl_llvm_cbe_262_count = 0;
  static  unsigned long long aesl_llvm_cbe_263_count = 0;
  static  unsigned long long aesl_llvm_cbe_264_count = 0;
  static  unsigned long long aesl_llvm_cbe_265_count = 0;
  static  unsigned long long aesl_llvm_cbe_266_count = 0;
  static  unsigned long long aesl_llvm_cbe_267_count = 0;
  static  unsigned long long aesl_llvm_cbe_268_count = 0;
  static  unsigned long long aesl_llvm_cbe_269_count = 0;
  static  unsigned long long aesl_llvm_cbe_270_count = 0;
  static  unsigned long long aesl_llvm_cbe_271_count = 0;
  static  unsigned long long aesl_llvm_cbe_272_count = 0;
  static  unsigned long long aesl_llvm_cbe_273_count = 0;
  static  unsigned long long aesl_llvm_cbe_274_count = 0;
  static  unsigned long long aesl_llvm_cbe_275_count = 0;
  float llvm_cbe_tmp__28;
  static  unsigned long long aesl_llvm_cbe_276_count = 0;
  double llvm_cbe_tmp__29;
  static  unsigned long long aesl_llvm_cbe_277_count = 0;
  unsigned int llvm_cbe_tmp__30;
  static  unsigned long long aesl_llvm_cbe_278_count = 0;
  static  unsigned long long aesl_llvm_cbe_279_count = 0;
  static  unsigned long long aesl_llvm_cbe_280_count = 0;
  static  unsigned long long aesl_llvm_cbe_281_count = 0;
  static  unsigned long long aesl_llvm_cbe_282_count = 0;
  static  unsigned long long aesl_llvm_cbe_283_count = 0;
  static  unsigned long long aesl_llvm_cbe_284_count = 0;
  static  unsigned long long aesl_llvm_cbe_285_count = 0;
  static  unsigned long long aesl_llvm_cbe_286_count = 0;
  static  unsigned long long aesl_llvm_cbe_287_count = 0;
  static  unsigned long long aesl_llvm_cbe_288_count = 0;
  static  unsigned long long aesl_llvm_cbe_289_count = 0;
  static  unsigned long long aesl_llvm_cbe_290_count = 0;
  static  unsigned long long aesl_llvm_cbe_291_count = 0;
  static  unsigned long long aesl_llvm_cbe_292_count = 0;
  static  unsigned long long aesl_llvm_cbe_293_count = 0;
  static  unsigned long long aesl_llvm_cbe_294_count = 0;
  static  unsigned long long aesl_llvm_cbe_295_count = 0;
  static  unsigned long long aesl_llvm_cbe_296_count = 0;
  static  unsigned long long aesl_llvm_cbe_297_count = 0;
  static  unsigned long long aesl_llvm_cbe_298_count = 0;
  static  unsigned long long aesl_llvm_cbe_299_count = 0;
  static  unsigned long long aesl_llvm_cbe_300_count = 0;
  static  unsigned long long aesl_llvm_cbe_301_count = 0;
  static  unsigned long long aesl_llvm_cbe_302_count = 0;
  static  unsigned long long aesl_llvm_cbe_303_count = 0;
  static  unsigned long long aesl_llvm_cbe_304_count = 0;
  static  unsigned long long aesl_llvm_cbe_305_count = 0;
  float llvm_cbe_tmp__31;
  static  unsigned long long aesl_llvm_cbe_306_count = 0;
  float *llvm_cbe_tmp__32;
  static  unsigned long long aesl_llvm_cbe_307_count = 0;
  static  unsigned long long aesl_llvm_cbe_308_count = 0;
  static  unsigned long long aesl_llvm_cbe_309_count = 0;
  static  unsigned long long aesl_llvm_cbe_310_count = 0;
  static  unsigned long long aesl_llvm_cbe_311_count = 0;
  float *llvm_cbe_tmp__33;
  static  unsigned long long aesl_llvm_cbe_312_count = 0;
  static  unsigned long long aesl_llvm_cbe_313_count = 0;
  static  unsigned long long aesl_llvm_cbe_314_count = 0;
  static  unsigned long long aesl_llvm_cbe_315_count = 0;
  static  unsigned long long aesl_llvm_cbe_316_count = 0;
  static  unsigned long long aesl_llvm_cbe_317_count = 0;
  static  unsigned long long aesl_llvm_cbe_318_count = 0;
  static  unsigned long long aesl_llvm_cbe_319_count = 0;
  unsigned int llvm_cbe_tmp__34;
  static  unsigned long long aesl_llvm_cbe_320_count = 0;
  static  unsigned long long aesl_llvm_cbe_321_count = 0;
  static  unsigned long long aesl_llvm_cbe_322_count = 0;
  static  unsigned long long aesl_llvm_cbe_323_count = 0;
  static  unsigned long long aesl_llvm_cbe_324_count = 0;
  static  unsigned long long aesl_llvm_cbe_325_count = 0;
  static  unsigned long long aesl_llvm_cbe_326_count = 0;
  static  unsigned long long aesl_llvm_cbe_327_count = 0;
  static  unsigned long long aesl_llvm_cbe_328_count = 0;
  static  unsigned long long aesl_llvm_cbe_329_count = 0;
  static  unsigned long long aesl_llvm_cbe_330_count = 0;
  static  unsigned long long aesl_llvm_cbe_331_count = 0;
  static  unsigned long long aesl_llvm_cbe_332_count = 0;
  static  unsigned long long aesl_llvm_cbe_333_count = 0;
  static  unsigned long long aesl_llvm_cbe_334_count = 0;
  static  unsigned long long aesl_llvm_cbe_335_count = 0;
  static  unsigned long long aesl_llvm_cbe_336_count = 0;
  static  unsigned long long aesl_llvm_cbe_337_count = 0;
  static  unsigned long long aesl_llvm_cbe_338_count = 0;
  static  unsigned long long aesl_llvm_cbe_339_count = 0;
  static  unsigned long long aesl_llvm_cbe_340_count = 0;
  static  unsigned long long aesl_llvm_cbe_341_count = 0;
  static  unsigned long long aesl_llvm_cbe_342_count = 0;
  static  unsigned long long aesl_llvm_cbe_343_count = 0;
  static  unsigned long long aesl_llvm_cbe_344_count = 0;
  static  unsigned long long aesl_llvm_cbe_345_count = 0;
  static  unsigned long long aesl_llvm_cbe_346_count = 0;
  static  unsigned long long aesl_llvm_cbe_347_count = 0;
  float llvm_cbe_tmp__35;
  static  unsigned long long aesl_llvm_cbe_348_count = 0;
  double llvm_cbe_tmp__36;
  static  unsigned long long aesl_llvm_cbe_349_count = 0;
  unsigned int llvm_cbe_tmp__37;
  static  unsigned long long aesl_llvm_cbe_350_count = 0;
  static  unsigned long long aesl_llvm_cbe_351_count = 0;
  static  unsigned long long aesl_llvm_cbe_352_count = 0;
  static  unsigned long long aesl_llvm_cbe_353_count = 0;
  static  unsigned long long aesl_llvm_cbe_354_count = 0;
  static  unsigned long long aesl_llvm_cbe_355_count = 0;
  static  unsigned long long aesl_llvm_cbe_356_count = 0;
  static  unsigned long long aesl_llvm_cbe_357_count = 0;
  static  unsigned long long aesl_llvm_cbe_358_count = 0;
  static  unsigned long long aesl_llvm_cbe_359_count = 0;
  static  unsigned long long aesl_llvm_cbe_360_count = 0;
  static  unsigned long long aesl_llvm_cbe_361_count = 0;
  static  unsigned long long aesl_llvm_cbe_362_count = 0;
  static  unsigned long long aesl_llvm_cbe_363_count = 0;
  static  unsigned long long aesl_llvm_cbe_364_count = 0;
  static  unsigned long long aesl_llvm_cbe_365_count = 0;
  static  unsigned long long aesl_llvm_cbe_366_count = 0;
  static  unsigned long long aesl_llvm_cbe_367_count = 0;
  static  unsigned long long aesl_llvm_cbe_368_count = 0;
  static  unsigned long long aesl_llvm_cbe_369_count = 0;
  static  unsigned long long aesl_llvm_cbe_370_count = 0;
  static  unsigned long long aesl_llvm_cbe_371_count = 0;
  static  unsigned long long aesl_llvm_cbe_372_count = 0;
  static  unsigned long long aesl_llvm_cbe_373_count = 0;
  static  unsigned long long aesl_llvm_cbe_374_count = 0;
  static  unsigned long long aesl_llvm_cbe_375_count = 0;
  static  unsigned long long aesl_llvm_cbe_376_count = 0;
  static  unsigned long long aesl_llvm_cbe_377_count = 0;
  float llvm_cbe_tmp__38;
  static  unsigned long long aesl_llvm_cbe_378_count = 0;
  float *llvm_cbe_tmp__39;
  static  unsigned long long aesl_llvm_cbe_379_count = 0;
  static  unsigned long long aesl_llvm_cbe_380_count = 0;
  static  unsigned long long aesl_llvm_cbe_381_count = 0;
  static  unsigned long long aesl_llvm_cbe_382_count = 0;
  static  unsigned long long aesl_llvm_cbe_383_count = 0;
  float *llvm_cbe_tmp__40;
  static  unsigned long long aesl_llvm_cbe_384_count = 0;
  static  unsigned long long aesl_llvm_cbe_385_count = 0;
  static  unsigned long long aesl_llvm_cbe_386_count = 0;
  static  unsigned long long aesl_llvm_cbe_387_count = 0;
  static  unsigned long long aesl_llvm_cbe_388_count = 0;
  static  unsigned long long aesl_llvm_cbe_389_count = 0;
  static  unsigned long long aesl_llvm_cbe_390_count = 0;
  static  unsigned long long aesl_llvm_cbe_391_count = 0;
  unsigned int llvm_cbe_tmp__41;
  static  unsigned long long aesl_llvm_cbe_392_count = 0;
  static  unsigned long long aesl_llvm_cbe_393_count = 0;
  static  unsigned long long aesl_llvm_cbe_394_count = 0;
  static  unsigned long long aesl_llvm_cbe_395_count = 0;
  static  unsigned long long aesl_llvm_cbe_396_count = 0;
  static  unsigned long long aesl_llvm_cbe_397_count = 0;
  static  unsigned long long aesl_llvm_cbe_398_count = 0;
  static  unsigned long long aesl_llvm_cbe_399_count = 0;
  static  unsigned long long aesl_llvm_cbe_400_count = 0;
  static  unsigned long long aesl_llvm_cbe_401_count = 0;
  static  unsigned long long aesl_llvm_cbe_402_count = 0;
  static  unsigned long long aesl_llvm_cbe_403_count = 0;
  static  unsigned long long aesl_llvm_cbe_404_count = 0;
  static  unsigned long long aesl_llvm_cbe_405_count = 0;
  static  unsigned long long aesl_llvm_cbe_406_count = 0;
  static  unsigned long long aesl_llvm_cbe_407_count = 0;
  static  unsigned long long aesl_llvm_cbe_408_count = 0;
  static  unsigned long long aesl_llvm_cbe_409_count = 0;
  static  unsigned long long aesl_llvm_cbe_410_count = 0;
  static  unsigned long long aesl_llvm_cbe_411_count = 0;
  static  unsigned long long aesl_llvm_cbe_412_count = 0;
  static  unsigned long long aesl_llvm_cbe_413_count = 0;
  static  unsigned long long aesl_llvm_cbe_414_count = 0;
  static  unsigned long long aesl_llvm_cbe_415_count = 0;
  static  unsigned long long aesl_llvm_cbe_416_count = 0;
  static  unsigned long long aesl_llvm_cbe_417_count = 0;
  static  unsigned long long aesl_llvm_cbe_418_count = 0;
  static  unsigned long long aesl_llvm_cbe_419_count = 0;
  float llvm_cbe_tmp__42;
  static  unsigned long long aesl_llvm_cbe_420_count = 0;
  double llvm_cbe_tmp__43;
  static  unsigned long long aesl_llvm_cbe_421_count = 0;
  unsigned int llvm_cbe_tmp__44;
  static  unsigned long long aesl_llvm_cbe_422_count = 0;
  static  unsigned long long aesl_llvm_cbe_423_count = 0;
  static  unsigned long long aesl_llvm_cbe_424_count = 0;
  static  unsigned long long aesl_llvm_cbe_425_count = 0;
  static  unsigned long long aesl_llvm_cbe_426_count = 0;
  static  unsigned long long aesl_llvm_cbe_427_count = 0;
  static  unsigned long long aesl_llvm_cbe_428_count = 0;
  static  unsigned long long aesl_llvm_cbe_429_count = 0;
  static  unsigned long long aesl_llvm_cbe_430_count = 0;
  static  unsigned long long aesl_llvm_cbe_431_count = 0;
  static  unsigned long long aesl_llvm_cbe_432_count = 0;
  static  unsigned long long aesl_llvm_cbe_433_count = 0;
  static  unsigned long long aesl_llvm_cbe_434_count = 0;
  static  unsigned long long aesl_llvm_cbe_435_count = 0;
  static  unsigned long long aesl_llvm_cbe_436_count = 0;
  static  unsigned long long aesl_llvm_cbe_437_count = 0;
  static  unsigned long long aesl_llvm_cbe_438_count = 0;
  static  unsigned long long aesl_llvm_cbe_439_count = 0;
  static  unsigned long long aesl_llvm_cbe_440_count = 0;
  static  unsigned long long aesl_llvm_cbe_441_count = 0;
  static  unsigned long long aesl_llvm_cbe_442_count = 0;
  static  unsigned long long aesl_llvm_cbe_443_count = 0;
  static  unsigned long long aesl_llvm_cbe_444_count = 0;
  static  unsigned long long aesl_llvm_cbe_445_count = 0;
  static  unsigned long long aesl_llvm_cbe_446_count = 0;
  static  unsigned long long aesl_llvm_cbe_447_count = 0;
  static  unsigned long long aesl_llvm_cbe_448_count = 0;
  static  unsigned long long aesl_llvm_cbe_449_count = 0;
  float llvm_cbe_tmp__45;
  static  unsigned long long aesl_llvm_cbe_450_count = 0;
  float *llvm_cbe_tmp__46;
  static  unsigned long long aesl_llvm_cbe_451_count = 0;
  static  unsigned long long aesl_llvm_cbe_452_count = 0;
  static  unsigned long long aesl_llvm_cbe_453_count = 0;
  static  unsigned long long aesl_llvm_cbe_454_count = 0;
  static  unsigned long long aesl_llvm_cbe_455_count = 0;
  float *llvm_cbe_tmp__47;
  static  unsigned long long aesl_llvm_cbe_456_count = 0;
  static  unsigned long long aesl_llvm_cbe_457_count = 0;
  static  unsigned long long aesl_llvm_cbe_458_count = 0;
  static  unsigned long long aesl_llvm_cbe_459_count = 0;
  static  unsigned long long aesl_llvm_cbe_460_count = 0;
  static  unsigned long long aesl_llvm_cbe_461_count = 0;
  static  unsigned long long aesl_llvm_cbe_462_count = 0;
  static  unsigned long long aesl_llvm_cbe_463_count = 0;
  unsigned int llvm_cbe_tmp__48;
  static  unsigned long long aesl_llvm_cbe_464_count = 0;
  static  unsigned long long aesl_llvm_cbe_465_count = 0;
  static  unsigned long long aesl_llvm_cbe_466_count = 0;
  static  unsigned long long aesl_llvm_cbe_467_count = 0;
  static  unsigned long long aesl_llvm_cbe_468_count = 0;
  static  unsigned long long aesl_llvm_cbe_469_count = 0;
  static  unsigned long long aesl_llvm_cbe_470_count = 0;
  static  unsigned long long aesl_llvm_cbe_471_count = 0;
  static  unsigned long long aesl_llvm_cbe_472_count = 0;
  static  unsigned long long aesl_llvm_cbe_473_count = 0;
  static  unsigned long long aesl_llvm_cbe_474_count = 0;
  static  unsigned long long aesl_llvm_cbe_475_count = 0;
  static  unsigned long long aesl_llvm_cbe_476_count = 0;
  static  unsigned long long aesl_llvm_cbe_477_count = 0;
  static  unsigned long long aesl_llvm_cbe_478_count = 0;
  static  unsigned long long aesl_llvm_cbe_479_count = 0;
  static  unsigned long long aesl_llvm_cbe_480_count = 0;
  static  unsigned long long aesl_llvm_cbe_481_count = 0;
  static  unsigned long long aesl_llvm_cbe_482_count = 0;
  static  unsigned long long aesl_llvm_cbe_483_count = 0;
  static  unsigned long long aesl_llvm_cbe_484_count = 0;
  static  unsigned long long aesl_llvm_cbe_485_count = 0;
  static  unsigned long long aesl_llvm_cbe_486_count = 0;
  static  unsigned long long aesl_llvm_cbe_487_count = 0;
  static  unsigned long long aesl_llvm_cbe_488_count = 0;
  static  unsigned long long aesl_llvm_cbe_489_count = 0;
  static  unsigned long long aesl_llvm_cbe_490_count = 0;
  static  unsigned long long aesl_llvm_cbe_491_count = 0;
  float llvm_cbe_tmp__49;
  static  unsigned long long aesl_llvm_cbe_492_count = 0;
  double llvm_cbe_tmp__50;
  static  unsigned long long aesl_llvm_cbe_493_count = 0;
  unsigned int llvm_cbe_tmp__51;
  static  unsigned long long aesl_llvm_cbe_494_count = 0;
  static  unsigned long long aesl_llvm_cbe_495_count = 0;
  static  unsigned long long aesl_llvm_cbe_496_count = 0;
  static  unsigned long long aesl_llvm_cbe_497_count = 0;
  static  unsigned long long aesl_llvm_cbe_498_count = 0;
  static  unsigned long long aesl_llvm_cbe_499_count = 0;
  static  unsigned long long aesl_llvm_cbe_500_count = 0;
  static  unsigned long long aesl_llvm_cbe_501_count = 0;
  static  unsigned long long aesl_llvm_cbe_502_count = 0;
  static  unsigned long long aesl_llvm_cbe_503_count = 0;
  static  unsigned long long aesl_llvm_cbe_504_count = 0;
  static  unsigned long long aesl_llvm_cbe_505_count = 0;
  static  unsigned long long aesl_llvm_cbe_506_count = 0;
  static  unsigned long long aesl_llvm_cbe_507_count = 0;
  static  unsigned long long aesl_llvm_cbe_508_count = 0;
  static  unsigned long long aesl_llvm_cbe_509_count = 0;
  static  unsigned long long aesl_llvm_cbe_510_count = 0;
  static  unsigned long long aesl_llvm_cbe_511_count = 0;
  static  unsigned long long aesl_llvm_cbe_512_count = 0;
  static  unsigned long long aesl_llvm_cbe_513_count = 0;
  static  unsigned long long aesl_llvm_cbe_514_count = 0;
  static  unsigned long long aesl_llvm_cbe_515_count = 0;
  static  unsigned long long aesl_llvm_cbe_516_count = 0;
  static  unsigned long long aesl_llvm_cbe_517_count = 0;
  static  unsigned long long aesl_llvm_cbe_518_count = 0;
  static  unsigned long long aesl_llvm_cbe_519_count = 0;
  static  unsigned long long aesl_llvm_cbe_520_count = 0;
  static  unsigned long long aesl_llvm_cbe_521_count = 0;
  float llvm_cbe_tmp__52;
  static  unsigned long long aesl_llvm_cbe_522_count = 0;
  float *llvm_cbe_tmp__53;
  static  unsigned long long aesl_llvm_cbe_523_count = 0;
  static  unsigned long long aesl_llvm_cbe_524_count = 0;
  static  unsigned long long aesl_llvm_cbe_525_count = 0;
  static  unsigned long long aesl_llvm_cbe_526_count = 0;
  static  unsigned long long aesl_llvm_cbe_527_count = 0;
  float *llvm_cbe_tmp__54;
  static  unsigned long long aesl_llvm_cbe_528_count = 0;
  static  unsigned long long aesl_llvm_cbe_529_count = 0;
  static  unsigned long long aesl_llvm_cbe_530_count = 0;
  static  unsigned long long aesl_llvm_cbe_531_count = 0;
  static  unsigned long long aesl_llvm_cbe_532_count = 0;
  static  unsigned long long aesl_llvm_cbe_533_count = 0;
  static  unsigned long long aesl_llvm_cbe_534_count = 0;
  static  unsigned long long aesl_llvm_cbe_535_count = 0;
  unsigned int llvm_cbe_tmp__55;
  static  unsigned long long aesl_llvm_cbe_536_count = 0;
  static  unsigned long long aesl_llvm_cbe_537_count = 0;
  static  unsigned long long aesl_llvm_cbe_538_count = 0;
  static  unsigned long long aesl_llvm_cbe_539_count = 0;
  static  unsigned long long aesl_llvm_cbe_540_count = 0;
  static  unsigned long long aesl_llvm_cbe_541_count = 0;
  static  unsigned long long aesl_llvm_cbe_542_count = 0;
  static  unsigned long long aesl_llvm_cbe_543_count = 0;
  static  unsigned long long aesl_llvm_cbe_544_count = 0;
  static  unsigned long long aesl_llvm_cbe_545_count = 0;
  static  unsigned long long aesl_llvm_cbe_546_count = 0;
  static  unsigned long long aesl_llvm_cbe_547_count = 0;
  static  unsigned long long aesl_llvm_cbe_548_count = 0;
  static  unsigned long long aesl_llvm_cbe_549_count = 0;
  static  unsigned long long aesl_llvm_cbe_550_count = 0;
  static  unsigned long long aesl_llvm_cbe_551_count = 0;
  static  unsigned long long aesl_llvm_cbe_552_count = 0;
  static  unsigned long long aesl_llvm_cbe_553_count = 0;
  static  unsigned long long aesl_llvm_cbe_554_count = 0;
  static  unsigned long long aesl_llvm_cbe_555_count = 0;
  static  unsigned long long aesl_llvm_cbe_556_count = 0;
  static  unsigned long long aesl_llvm_cbe_557_count = 0;
  static  unsigned long long aesl_llvm_cbe_558_count = 0;
  static  unsigned long long aesl_llvm_cbe_559_count = 0;
  static  unsigned long long aesl_llvm_cbe_560_count = 0;
  static  unsigned long long aesl_llvm_cbe_561_count = 0;
  static  unsigned long long aesl_llvm_cbe_562_count = 0;
  static  unsigned long long aesl_llvm_cbe_563_count = 0;
  float llvm_cbe_tmp__56;
  static  unsigned long long aesl_llvm_cbe_564_count = 0;
  double llvm_cbe_tmp__57;
  static  unsigned long long aesl_llvm_cbe_565_count = 0;
  unsigned int llvm_cbe_tmp__58;
  static  unsigned long long aesl_llvm_cbe_566_count = 0;
  static  unsigned long long aesl_llvm_cbe_567_count = 0;
  static  unsigned long long aesl_llvm_cbe_568_count = 0;
  static  unsigned long long aesl_llvm_cbe_569_count = 0;
  static  unsigned long long aesl_llvm_cbe_570_count = 0;
  static  unsigned long long aesl_llvm_cbe_571_count = 0;
  static  unsigned long long aesl_llvm_cbe_572_count = 0;
  static  unsigned long long aesl_llvm_cbe_573_count = 0;
  static  unsigned long long aesl_llvm_cbe_574_count = 0;
  static  unsigned long long aesl_llvm_cbe_575_count = 0;
  static  unsigned long long aesl_llvm_cbe_576_count = 0;
  static  unsigned long long aesl_llvm_cbe_577_count = 0;
  static  unsigned long long aesl_llvm_cbe_578_count = 0;
  static  unsigned long long aesl_llvm_cbe_579_count = 0;
  static  unsigned long long aesl_llvm_cbe_580_count = 0;
  static  unsigned long long aesl_llvm_cbe_581_count = 0;
  static  unsigned long long aesl_llvm_cbe_582_count = 0;
  static  unsigned long long aesl_llvm_cbe_583_count = 0;
  static  unsigned long long aesl_llvm_cbe_584_count = 0;
  static  unsigned long long aesl_llvm_cbe_585_count = 0;
  static  unsigned long long aesl_llvm_cbe_586_count = 0;
  static  unsigned long long aesl_llvm_cbe_587_count = 0;
  static  unsigned long long aesl_llvm_cbe_588_count = 0;
  static  unsigned long long aesl_llvm_cbe_589_count = 0;
  static  unsigned long long aesl_llvm_cbe_590_count = 0;
  static  unsigned long long aesl_llvm_cbe_591_count = 0;
  static  unsigned long long aesl_llvm_cbe_592_count = 0;
  static  unsigned long long aesl_llvm_cbe_593_count = 0;
  float llvm_cbe_tmp__59;
  static  unsigned long long aesl_llvm_cbe_594_count = 0;
  float *llvm_cbe_tmp__60;
  static  unsigned long long aesl_llvm_cbe_595_count = 0;
  static  unsigned long long aesl_llvm_cbe_596_count = 0;
  static  unsigned long long aesl_llvm_cbe_597_count = 0;
  static  unsigned long long aesl_llvm_cbe_598_count = 0;
  static  unsigned long long aesl_llvm_cbe_599_count = 0;
  float *llvm_cbe_tmp__61;
  static  unsigned long long aesl_llvm_cbe_600_count = 0;
  static  unsigned long long aesl_llvm_cbe_601_count = 0;
  static  unsigned long long aesl_llvm_cbe_602_count = 0;
  static  unsigned long long aesl_llvm_cbe_603_count = 0;
  static  unsigned long long aesl_llvm_cbe_604_count = 0;
  static  unsigned long long aesl_llvm_cbe_605_count = 0;
  static  unsigned long long aesl_llvm_cbe_putchar_count = 0;
  unsigned int llvm_cbe_putchar;
  static  unsigned long long aesl_llvm_cbe_606_count = 0;
  static  unsigned long long aesl_llvm_cbe_607_count = 0;
  static  unsigned long long aesl_llvm_cbe_608_count = 0;
  static  unsigned long long aesl_llvm_cbe_609_count = 0;
  static  unsigned long long aesl_llvm_cbe_610_count = 0;
  static  unsigned long long aesl_llvm_cbe_611_count = 0;
  static  unsigned long long aesl_llvm_cbe_612_count = 0;
  float llvm_cbe_tmp__62;
  static  unsigned long long aesl_llvm_cbe_613_count = 0;
  double llvm_cbe_tmp__63;
  static  unsigned long long aesl_llvm_cbe_614_count = 0;
  unsigned int llvm_cbe_tmp__64;
  static  unsigned long long aesl_llvm_cbe_615_count = 0;
  float llvm_cbe_tmp__65;
  static  unsigned long long aesl_llvm_cbe_616_count = 0;
  double llvm_cbe_tmp__66;
  static  unsigned long long aesl_llvm_cbe_617_count = 0;
  unsigned int llvm_cbe_tmp__67;
  static  unsigned long long aesl_llvm_cbe_618_count = 0;
  static  unsigned long long aesl_llvm_cbe_619_count = 0;
  static  unsigned long long aesl_llvm_cbe_620_count = 0;
  static  unsigned long long aesl_llvm_cbe_621_count = 0;
  static  unsigned long long aesl_llvm_cbe_622_count = 0;
  static  unsigned long long aesl_llvm_cbe_623_count = 0;
  float *llvm_cbe_tmp__68;
  static  unsigned long long aesl_llvm_cbe_624_count = 0;
  float llvm_cbe_tmp__69;
  static  unsigned long long aesl_llvm_cbe_625_count = 0;
  double llvm_cbe_tmp__70;
  static  unsigned long long aesl_llvm_cbe_626_count = 0;
  unsigned int llvm_cbe_tmp__71;
  static  unsigned long long aesl_llvm_cbe_627_count = 0;
  float *llvm_cbe_tmp__72;
  static  unsigned long long aesl_llvm_cbe_628_count = 0;
  float llvm_cbe_tmp__73;
  static  unsigned long long aesl_llvm_cbe_629_count = 0;
  double llvm_cbe_tmp__74;
  static  unsigned long long aesl_llvm_cbe_630_count = 0;
  unsigned int llvm_cbe_tmp__75;
  static  unsigned long long aesl_llvm_cbe_631_count = 0;
  static  unsigned long long aesl_llvm_cbe_632_count = 0;
  static  unsigned long long aesl_llvm_cbe_633_count = 0;
  static  unsigned long long aesl_llvm_cbe_634_count = 0;
  static  unsigned long long aesl_llvm_cbe_635_count = 0;
  static  unsigned long long aesl_llvm_cbe_636_count = 0;
  float *llvm_cbe_tmp__76;
  static  unsigned long long aesl_llvm_cbe_637_count = 0;
  float llvm_cbe_tmp__77;
  static  unsigned long long aesl_llvm_cbe_638_count = 0;
  double llvm_cbe_tmp__78;
  static  unsigned long long aesl_llvm_cbe_639_count = 0;
  unsigned int llvm_cbe_tmp__79;
  static  unsigned long long aesl_llvm_cbe_640_count = 0;
  float *llvm_cbe_tmp__80;
  static  unsigned long long aesl_llvm_cbe_641_count = 0;
  float llvm_cbe_tmp__81;
  static  unsigned long long aesl_llvm_cbe_642_count = 0;
  double llvm_cbe_tmp__82;
  static  unsigned long long aesl_llvm_cbe_643_count = 0;
  unsigned int llvm_cbe_tmp__83;
  static  unsigned long long aesl_llvm_cbe_644_count = 0;
  static  unsigned long long aesl_llvm_cbe_645_count = 0;
  static  unsigned long long aesl_llvm_cbe_646_count = 0;
  static  unsigned long long aesl_llvm_cbe_647_count = 0;
  static  unsigned long long aesl_llvm_cbe_648_count = 0;
  static  unsigned long long aesl_llvm_cbe_649_count = 0;
  float *llvm_cbe_tmp__84;
  static  unsigned long long aesl_llvm_cbe_650_count = 0;
  float llvm_cbe_tmp__85;
  static  unsigned long long aesl_llvm_cbe_651_count = 0;
  double llvm_cbe_tmp__86;
  static  unsigned long long aesl_llvm_cbe_652_count = 0;
  unsigned int llvm_cbe_tmp__87;
  static  unsigned long long aesl_llvm_cbe_653_count = 0;
  float *llvm_cbe_tmp__88;
  static  unsigned long long aesl_llvm_cbe_654_count = 0;
  float llvm_cbe_tmp__89;
  static  unsigned long long aesl_llvm_cbe_655_count = 0;
  double llvm_cbe_tmp__90;
  static  unsigned long long aesl_llvm_cbe_656_count = 0;
  unsigned int llvm_cbe_tmp__91;
  static  unsigned long long aesl_llvm_cbe_657_count = 0;
  static  unsigned long long aesl_llvm_cbe_658_count = 0;
  static  unsigned long long aesl_llvm_cbe_659_count = 0;
  static  unsigned long long aesl_llvm_cbe_660_count = 0;
  static  unsigned long long aesl_llvm_cbe_661_count = 0;
  static  unsigned long long aesl_llvm_cbe_662_count = 0;
  float *llvm_cbe_tmp__92;
  static  unsigned long long aesl_llvm_cbe_663_count = 0;
  float llvm_cbe_tmp__93;
  static  unsigned long long aesl_llvm_cbe_664_count = 0;
  double llvm_cbe_tmp__94;
  static  unsigned long long aesl_llvm_cbe_665_count = 0;
  unsigned int llvm_cbe_tmp__95;
  static  unsigned long long aesl_llvm_cbe_666_count = 0;
  float *llvm_cbe_tmp__96;
  static  unsigned long long aesl_llvm_cbe_667_count = 0;
  float llvm_cbe_tmp__97;
  static  unsigned long long aesl_llvm_cbe_668_count = 0;
  double llvm_cbe_tmp__98;
  static  unsigned long long aesl_llvm_cbe_669_count = 0;
  unsigned int llvm_cbe_tmp__99;
  static  unsigned long long aesl_llvm_cbe_670_count = 0;
  static  unsigned long long aesl_llvm_cbe_671_count = 0;
  static  unsigned long long aesl_llvm_cbe_672_count = 0;
  static  unsigned long long aesl_llvm_cbe_673_count = 0;
  static  unsigned long long aesl_llvm_cbe_674_count = 0;
  static  unsigned long long aesl_llvm_cbe_675_count = 0;
  float *llvm_cbe_tmp__100;
  static  unsigned long long aesl_llvm_cbe_676_count = 0;
  float llvm_cbe_tmp__101;
  static  unsigned long long aesl_llvm_cbe_677_count = 0;
  double llvm_cbe_tmp__102;
  static  unsigned long long aesl_llvm_cbe_678_count = 0;
  unsigned int llvm_cbe_tmp__103;
  static  unsigned long long aesl_llvm_cbe_679_count = 0;
  float *llvm_cbe_tmp__104;
  static  unsigned long long aesl_llvm_cbe_680_count = 0;
  float llvm_cbe_tmp__105;
  static  unsigned long long aesl_llvm_cbe_681_count = 0;
  double llvm_cbe_tmp__106;
  static  unsigned long long aesl_llvm_cbe_682_count = 0;
  unsigned int llvm_cbe_tmp__107;
  static  unsigned long long aesl_llvm_cbe_683_count = 0;
  static  unsigned long long aesl_llvm_cbe_684_count = 0;
  static  unsigned long long aesl_llvm_cbe_685_count = 0;
  static  unsigned long long aesl_llvm_cbe_686_count = 0;
  static  unsigned long long aesl_llvm_cbe_687_count = 0;
  static  unsigned long long aesl_llvm_cbe_688_count = 0;
  float *llvm_cbe_tmp__108;
  static  unsigned long long aesl_llvm_cbe_689_count = 0;
  float llvm_cbe_tmp__109;
  static  unsigned long long aesl_llvm_cbe_690_count = 0;
  double llvm_cbe_tmp__110;
  static  unsigned long long aesl_llvm_cbe_691_count = 0;
  unsigned int llvm_cbe_tmp__111;
  static  unsigned long long aesl_llvm_cbe_692_count = 0;
  float *llvm_cbe_tmp__112;
  static  unsigned long long aesl_llvm_cbe_693_count = 0;
  float llvm_cbe_tmp__113;
  static  unsigned long long aesl_llvm_cbe_694_count = 0;
  double llvm_cbe_tmp__114;
  static  unsigned long long aesl_llvm_cbe_695_count = 0;
  unsigned int llvm_cbe_tmp__115;
  static  unsigned long long aesl_llvm_cbe_696_count = 0;
  static  unsigned long long aesl_llvm_cbe_697_count = 0;
  static  unsigned long long aesl_llvm_cbe_698_count = 0;
  static  unsigned long long aesl_llvm_cbe_699_count = 0;
  static  unsigned long long aesl_llvm_cbe_700_count = 0;
  static  unsigned long long aesl_llvm_cbe_701_count = 0;
  float *llvm_cbe_tmp__116;
  static  unsigned long long aesl_llvm_cbe_702_count = 0;
  float llvm_cbe_tmp__117;
  static  unsigned long long aesl_llvm_cbe_703_count = 0;
  double llvm_cbe_tmp__118;
  static  unsigned long long aesl_llvm_cbe_704_count = 0;
  unsigned int llvm_cbe_tmp__119;
  static  unsigned long long aesl_llvm_cbe_705_count = 0;
  float *llvm_cbe_tmp__120;
  static  unsigned long long aesl_llvm_cbe_706_count = 0;
  float llvm_cbe_tmp__121;
  static  unsigned long long aesl_llvm_cbe_707_count = 0;
  double llvm_cbe_tmp__122;
  static  unsigned long long aesl_llvm_cbe_708_count = 0;
  unsigned int llvm_cbe_tmp__123;
  static  unsigned long long aesl_llvm_cbe_709_count = 0;
  static  unsigned long long aesl_llvm_cbe_710_count = 0;
  static  unsigned long long aesl_llvm_cbe_711_count = 0;
  static  unsigned long long aesl_llvm_cbe_712_count = 0;
  static  unsigned long long aesl_llvm_cbe_713_count = 0;
  static  unsigned long long aesl_llvm_cbe_714_count = 0;
  unsigned int llvm_cbe_tmp__124;
  static  unsigned long long aesl_llvm_cbe_715_count = 0;
  static  unsigned long long aesl_llvm_cbe_716_count = 0;
  static  unsigned long long aesl_llvm_cbe_717_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_718_count = 0;
  static  unsigned long long aesl_llvm_cbe_719_count = 0;
  unsigned int llvm_cbe_tmp__125;
  static  unsigned long long aesl_llvm_cbe_720_count = 0;
  unsigned int llvm_cbe_tmp__126;
  static  unsigned long long aesl_llvm_cbe_721_count = 0;
  unsigned int llvm_cbe_tmp__127;
  static  unsigned long long aesl_llvm_cbe_722_count = 0;

  CODE_FOR_MAIN();
const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @main\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = call %%struct._iobuf* @fopen(i8* getelementptr inbounds ([7 x i8]* @aesl_internal_.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str1, i32 0, i32 0)) nounwind, !dbg !4 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_8_count);
  llvm_cbe_tmp__1 = (l_struct_OC__iobuf *)aesl_fopen(( char *)((&aesl_internal__OC_str[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 7
#endif
])), ( char *)((&aesl_internal__OC_str1[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__1);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = call %%struct._iobuf* @fopen(i8* getelementptr inbounds ([13 x i8]* @aesl_internal_.str2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str3, i32 0, i32 0)) nounwind, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_12_count);
  llvm_cbe_tmp__2 = (l_struct_OC__iobuf *)aesl_fopen(( char *)((&aesl_internal__OC_str2[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 13
#endif
])), ( char *)((&aesl_internal__OC_str3[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__2);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = call %%struct._iobuf* @fopen(i8* getelementptr inbounds ([13 x i8]* @aesl_internal_.str4, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str3, i32 0, i32 0)) nounwind, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_16_count);
  llvm_cbe_tmp__3 = (l_struct_OC__iobuf *)aesl_fopen(( char *)((&aesl_internal__OC_str4[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 13
#endif
])), ( char *)((&aesl_internal__OC_str3[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__3);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = getelementptr inbounds [8 x float]* %%Gol_a, i32 0, i32 0, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_23_count);
  llvm_cbe_tmp__4 = (float *)(&llvm_cbe_Gol_a[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = getelementptr inbounds [8 x float]* %%Gol_b, i32 0, i32 0, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_24_count);
  llvm_cbe_tmp__5 = (float *)(&llvm_cbe_Gol_b[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds [8 x float]* %%Cor_a, i32 0, i32 0, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_25_count);
  llvm_cbe_tmp__6 = (float *)(&llvm_cbe_Cor_a[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = getelementptr inbounds [8 x float]* %%Cor_b, i32 0, i32 0, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_26_count);
  llvm_cbe_tmp__7 = (float *)(&llvm_cbe_Cor_b[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}
  llvm_cbe_storemerge5__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe__2e_preheader;

  do {     /* Syntactic loop '.preheader' to make GCC happy */
llvm_cbe__2e_preheader:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge5 = phi i32 [ 0, %%0 ], [ %%124, %%.preheader  for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_storemerge5_count);
  llvm_cbe_storemerge5 = (unsigned int )llvm_cbe_storemerge5__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge5 = 0x%X",llvm_cbe_storemerge5);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__124);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = call i32 (%%struct._iobuf*, i8*, ...)* @fscanf(%%struct._iobuf* %%1, i8* getelementptr inbounds ([3 x i8]* @aesl_internal_.str5, i32 0, i32 0), float* %%tmp) nounwind, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_33_count);
  fscanf((l_struct_OC__iobuf *)llvm_cbe_tmp__1, ( char *)((&aesl_internal__OC_str5[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 3
#endif
])), (float *)(&llvm_cbe_tmp));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__8);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = load float* %%tmp, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_61_count);
  llvm_cbe_tmp__9 = (float )*(&llvm_cbe_tmp);
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__9, *(int*)(&llvm_cbe_tmp__9));
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = fpext float %%9 to double, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_62_count);
  llvm_cbe_tmp__10 = (double )((double )llvm_cbe_tmp__9);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__10, *(long long*)(&llvm_cbe_tmp__10));
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @aesl_internal_.str6, i32 0, i32 0), double %%10) nounwind, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_63_count);
  printf(( char *)((&aesl_internal__OC_str6[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 4
#endif
])), llvm_cbe_tmp__10);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__10, *(long long*)(&llvm_cbe_tmp__10));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__11);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = load float* %%tmp, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_91_count);
  llvm_cbe_tmp__12 = (float )*(&llvm_cbe_tmp);
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__12, *(int*)(&llvm_cbe_tmp__12));

#ifdef AESL_BC_SIM
  assert(((signed int )0u) < 8 && "Write access out of array 'Gol_a' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store float %%12, float* %%4, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_92_count);
  *llvm_cbe_tmp__4 = llvm_cbe_tmp__12;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__12);

#ifdef AESL_BC_SIM
  assert(((signed int )0u) < 8 && "Write access out of array 'Gol_b' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store float %%12, float* %%5, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_96_count);
  *llvm_cbe_tmp__5 = llvm_cbe_tmp__12;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__12);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = call i32 (%%struct._iobuf*, i8*, ...)* @fscanf(%%struct._iobuf* %%1, i8* getelementptr inbounds ([3 x i8]* @aesl_internal_.str5, i32 0, i32 0), float* %%tmp) nounwind, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_103_count);
  fscanf((l_struct_OC__iobuf *)llvm_cbe_tmp__1, ( char *)((&aesl_internal__OC_str5[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 3
#endif
])), (float *)(&llvm_cbe_tmp));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__13);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = load float* %%tmp, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_131_count);
  llvm_cbe_tmp__14 = (float )*(&llvm_cbe_tmp);
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__14, *(int*)(&llvm_cbe_tmp__14));
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = fpext float %%14 to double, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_132_count);
  llvm_cbe_tmp__15 = (double )((double )llvm_cbe_tmp__14);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__15, *(long long*)(&llvm_cbe_tmp__15));
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @aesl_internal_.str6, i32 0, i32 0), double %%15) nounwind, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_133_count);
  printf(( char *)((&aesl_internal__OC_str6[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 4
#endif
])), llvm_cbe_tmp__15);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__15, *(long long*)(&llvm_cbe_tmp__15));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__16);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = load float* %%tmp, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_161_count);
  llvm_cbe_tmp__17 = (float )*(&llvm_cbe_tmp);
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__17, *(int*)(&llvm_cbe_tmp__17));
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = getelementptr inbounds [8 x float]* %%Gol_a, i32 0, i32 1, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_162_count);
  llvm_cbe_tmp__18 = (float *)(&llvm_cbe_Gol_a[(((signed int )1u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  assert(((signed int )1u) < 8 && "Write access out of array 'Gol_a' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store float %%17, float* %%18, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_163_count);
  *llvm_cbe_tmp__18 = llvm_cbe_tmp__17;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__17);
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = getelementptr inbounds [8 x float]* %%Gol_b, i32 0, i32 1, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_167_count);
  llvm_cbe_tmp__19 = (float *)(&llvm_cbe_Gol_b[(((signed int )1u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  assert(((signed int )1u) < 8 && "Write access out of array 'Gol_b' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store float %%17, float* %%19, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_168_count);
  *llvm_cbe_tmp__19 = llvm_cbe_tmp__17;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__17);
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = call i32 (%%struct._iobuf*, i8*, ...)* @fscanf(%%struct._iobuf* %%1, i8* getelementptr inbounds ([3 x i8]* @aesl_internal_.str5, i32 0, i32 0), float* %%tmp) nounwind, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_175_count);
  fscanf((l_struct_OC__iobuf *)llvm_cbe_tmp__1, ( char *)((&aesl_internal__OC_str5[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 3
#endif
])), (float *)(&llvm_cbe_tmp));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__20);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = load float* %%tmp, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_203_count);
  llvm_cbe_tmp__21 = (float )*(&llvm_cbe_tmp);
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__21, *(int*)(&llvm_cbe_tmp__21));
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = fpext float %%21 to double, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_204_count);
  llvm_cbe_tmp__22 = (double )((double )llvm_cbe_tmp__21);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__22, *(long long*)(&llvm_cbe_tmp__22));
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @aesl_internal_.str6, i32 0, i32 0), double %%22) nounwind, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_205_count);
  printf(( char *)((&aesl_internal__OC_str6[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 4
#endif
])), llvm_cbe_tmp__22);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__22, *(long long*)(&llvm_cbe_tmp__22));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__23);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = load float* %%tmp, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_233_count);
  llvm_cbe_tmp__24 = (float )*(&llvm_cbe_tmp);
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__24, *(int*)(&llvm_cbe_tmp__24));
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = getelementptr inbounds [8 x float]* %%Gol_a, i32 0, i32 2, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_234_count);
  llvm_cbe_tmp__25 = (float *)(&llvm_cbe_Gol_a[(((signed int )2u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  assert(((signed int )2u) < 8 && "Write access out of array 'Gol_a' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store float %%24, float* %%25, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_235_count);
  *llvm_cbe_tmp__25 = llvm_cbe_tmp__24;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__24);
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = getelementptr inbounds [8 x float]* %%Gol_b, i32 0, i32 2, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_239_count);
  llvm_cbe_tmp__26 = (float *)(&llvm_cbe_Gol_b[(((signed int )2u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  assert(((signed int )2u) < 8 && "Write access out of array 'Gol_b' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store float %%24, float* %%26, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_240_count);
  *llvm_cbe_tmp__26 = llvm_cbe_tmp__24;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__24);
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = call i32 (%%struct._iobuf*, i8*, ...)* @fscanf(%%struct._iobuf* %%1, i8* getelementptr inbounds ([3 x i8]* @aesl_internal_.str5, i32 0, i32 0), float* %%tmp) nounwind, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_247_count);
  fscanf((l_struct_OC__iobuf *)llvm_cbe_tmp__1, ( char *)((&aesl_internal__OC_str5[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 3
#endif
])), (float *)(&llvm_cbe_tmp));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__27);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = load float* %%tmp, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_275_count);
  llvm_cbe_tmp__28 = (float )*(&llvm_cbe_tmp);
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__28, *(int*)(&llvm_cbe_tmp__28));
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = fpext float %%28 to double, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_276_count);
  llvm_cbe_tmp__29 = (double )((double )llvm_cbe_tmp__28);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__29, *(long long*)(&llvm_cbe_tmp__29));
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @aesl_internal_.str6, i32 0, i32 0), double %%29) nounwind, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_277_count);
  printf(( char *)((&aesl_internal__OC_str6[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 4
#endif
])), llvm_cbe_tmp__29);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__29, *(long long*)(&llvm_cbe_tmp__29));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__30);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%31 = load float* %%tmp, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_305_count);
  llvm_cbe_tmp__31 = (float )*(&llvm_cbe_tmp);
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__31, *(int*)(&llvm_cbe_tmp__31));
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = getelementptr inbounds [8 x float]* %%Gol_a, i32 0, i32 3, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_306_count);
  llvm_cbe_tmp__32 = (float *)(&llvm_cbe_Gol_a[(((signed int )3u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  assert(((signed int )3u) < 8 && "Write access out of array 'Gol_a' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store float %%31, float* %%32, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_307_count);
  *llvm_cbe_tmp__32 = llvm_cbe_tmp__31;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__31);
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = getelementptr inbounds [8 x float]* %%Gol_b, i32 0, i32 3, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_311_count);
  llvm_cbe_tmp__33 = (float *)(&llvm_cbe_Gol_b[(((signed int )3u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  assert(((signed int )3u) < 8 && "Write access out of array 'Gol_b' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store float %%31, float* %%33, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_312_count);
  *llvm_cbe_tmp__33 = llvm_cbe_tmp__31;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__31);
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = call i32 (%%struct._iobuf*, i8*, ...)* @fscanf(%%struct._iobuf* %%1, i8* getelementptr inbounds ([3 x i8]* @aesl_internal_.str5, i32 0, i32 0), float* %%tmp) nounwind, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_319_count);
  fscanf((l_struct_OC__iobuf *)llvm_cbe_tmp__1, ( char *)((&aesl_internal__OC_str5[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 3
#endif
])), (float *)(&llvm_cbe_tmp));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__34);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = load float* %%tmp, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_347_count);
  llvm_cbe_tmp__35 = (float )*(&llvm_cbe_tmp);
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__35, *(int*)(&llvm_cbe_tmp__35));
if (AESL_DEBUG_TRACE)
printf("\n  %%36 = fpext float %%35 to double, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_348_count);
  llvm_cbe_tmp__36 = (double )((double )llvm_cbe_tmp__35);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__36, *(long long*)(&llvm_cbe_tmp__36));
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @aesl_internal_.str6, i32 0, i32 0), double %%36) nounwind, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_349_count);
  printf(( char *)((&aesl_internal__OC_str6[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 4
#endif
])), llvm_cbe_tmp__36);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__36, *(long long*)(&llvm_cbe_tmp__36));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__37);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%38 = load float* %%tmp, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_377_count);
  llvm_cbe_tmp__38 = (float )*(&llvm_cbe_tmp);
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__38, *(int*)(&llvm_cbe_tmp__38));
if (AESL_DEBUG_TRACE)
printf("\n  %%39 = getelementptr inbounds [8 x float]* %%Gol_a, i32 0, i32 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_378_count);
  llvm_cbe_tmp__39 = (float *)(&llvm_cbe_Gol_a[(((signed int )4u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  assert(((signed int )4u) < 8 && "Write access out of array 'Gol_a' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store float %%38, float* %%39, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_379_count);
  *llvm_cbe_tmp__39 = llvm_cbe_tmp__38;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__38);
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = getelementptr inbounds [8 x float]* %%Gol_b, i32 0, i32 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_383_count);
  llvm_cbe_tmp__40 = (float *)(&llvm_cbe_Gol_b[(((signed int )4u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  assert(((signed int )4u) < 8 && "Write access out of array 'Gol_b' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store float %%38, float* %%40, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_384_count);
  *llvm_cbe_tmp__40 = llvm_cbe_tmp__38;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__38);
if (AESL_DEBUG_TRACE)
printf("\n  %%41 = call i32 (%%struct._iobuf*, i8*, ...)* @fscanf(%%struct._iobuf* %%1, i8* getelementptr inbounds ([3 x i8]* @aesl_internal_.str5, i32 0, i32 0), float* %%tmp) nounwind, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_391_count);
  fscanf((l_struct_OC__iobuf *)llvm_cbe_tmp__1, ( char *)((&aesl_internal__OC_str5[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 3
#endif
])), (float *)(&llvm_cbe_tmp));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__41);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%42 = load float* %%tmp, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_419_count);
  llvm_cbe_tmp__42 = (float )*(&llvm_cbe_tmp);
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__42, *(int*)(&llvm_cbe_tmp__42));
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = fpext float %%42 to double, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_420_count);
  llvm_cbe_tmp__43 = (double )((double )llvm_cbe_tmp__42);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__43, *(long long*)(&llvm_cbe_tmp__43));
if (AESL_DEBUG_TRACE)
printf("\n  %%44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @aesl_internal_.str6, i32 0, i32 0), double %%43) nounwind, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_421_count);
  printf(( char *)((&aesl_internal__OC_str6[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 4
#endif
])), llvm_cbe_tmp__43);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__43, *(long long*)(&llvm_cbe_tmp__43));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__44);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%45 = load float* %%tmp, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_449_count);
  llvm_cbe_tmp__45 = (float )*(&llvm_cbe_tmp);
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__45, *(int*)(&llvm_cbe_tmp__45));
if (AESL_DEBUG_TRACE)
printf("\n  %%46 = getelementptr inbounds [8 x float]* %%Gol_a, i32 0, i32 5, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_450_count);
  llvm_cbe_tmp__46 = (float *)(&llvm_cbe_Gol_a[(((signed int )5u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  assert(((signed int )5u) < 8 && "Write access out of array 'Gol_a' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store float %%45, float* %%46, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_451_count);
  *llvm_cbe_tmp__46 = llvm_cbe_tmp__45;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__45);
if (AESL_DEBUG_TRACE)
printf("\n  %%47 = getelementptr inbounds [8 x float]* %%Gol_b, i32 0, i32 5, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_455_count);
  llvm_cbe_tmp__47 = (float *)(&llvm_cbe_Gol_b[(((signed int )5u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  assert(((signed int )5u) < 8 && "Write access out of array 'Gol_b' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store float %%45, float* %%47, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_456_count);
  *llvm_cbe_tmp__47 = llvm_cbe_tmp__45;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__45);
if (AESL_DEBUG_TRACE)
printf("\n  %%48 = call i32 (%%struct._iobuf*, i8*, ...)* @fscanf(%%struct._iobuf* %%1, i8* getelementptr inbounds ([3 x i8]* @aesl_internal_.str5, i32 0, i32 0), float* %%tmp) nounwind, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_463_count);
  fscanf((l_struct_OC__iobuf *)llvm_cbe_tmp__1, ( char *)((&aesl_internal__OC_str5[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 3
#endif
])), (float *)(&llvm_cbe_tmp));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__48);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%49 = load float* %%tmp, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_491_count);
  llvm_cbe_tmp__49 = (float )*(&llvm_cbe_tmp);
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__49, *(int*)(&llvm_cbe_tmp__49));
if (AESL_DEBUG_TRACE)
printf("\n  %%50 = fpext float %%49 to double, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_492_count);
  llvm_cbe_tmp__50 = (double )((double )llvm_cbe_tmp__49);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__50, *(long long*)(&llvm_cbe_tmp__50));
if (AESL_DEBUG_TRACE)
printf("\n  %%51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @aesl_internal_.str6, i32 0, i32 0), double %%50) nounwind, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_493_count);
  printf(( char *)((&aesl_internal__OC_str6[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 4
#endif
])), llvm_cbe_tmp__50);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__50, *(long long*)(&llvm_cbe_tmp__50));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__51);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%52 = load float* %%tmp, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_521_count);
  llvm_cbe_tmp__52 = (float )*(&llvm_cbe_tmp);
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__52, *(int*)(&llvm_cbe_tmp__52));
if (AESL_DEBUG_TRACE)
printf("\n  %%53 = getelementptr inbounds [8 x float]* %%Gol_a, i32 0, i32 6, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_522_count);
  llvm_cbe_tmp__53 = (float *)(&llvm_cbe_Gol_a[(((signed int )6u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  assert(((signed int )6u) < 8 && "Write access out of array 'Gol_a' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store float %%52, float* %%53, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_523_count);
  *llvm_cbe_tmp__53 = llvm_cbe_tmp__52;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__52);
if (AESL_DEBUG_TRACE)
printf("\n  %%54 = getelementptr inbounds [8 x float]* %%Gol_b, i32 0, i32 6, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_527_count);
  llvm_cbe_tmp__54 = (float *)(&llvm_cbe_Gol_b[(((signed int )6u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  assert(((signed int )6u) < 8 && "Write access out of array 'Gol_b' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store float %%52, float* %%54, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_528_count);
  *llvm_cbe_tmp__54 = llvm_cbe_tmp__52;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__52);
if (AESL_DEBUG_TRACE)
printf("\n  %%55 = call i32 (%%struct._iobuf*, i8*, ...)* @fscanf(%%struct._iobuf* %%1, i8* getelementptr inbounds ([3 x i8]* @aesl_internal_.str5, i32 0, i32 0), float* %%tmp) nounwind, !dbg !5 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_535_count);
  fscanf((l_struct_OC__iobuf *)llvm_cbe_tmp__1, ( char *)((&aesl_internal__OC_str5[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 3
#endif
])), (float *)(&llvm_cbe_tmp));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__55);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%56 = load float* %%tmp, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_563_count);
  llvm_cbe_tmp__56 = (float )*(&llvm_cbe_tmp);
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__56, *(int*)(&llvm_cbe_tmp__56));
if (AESL_DEBUG_TRACE)
printf("\n  %%57 = fpext float %%56 to double, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_564_count);
  llvm_cbe_tmp__57 = (double )((double )llvm_cbe_tmp__56);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__57, *(long long*)(&llvm_cbe_tmp__57));
if (AESL_DEBUG_TRACE)
printf("\n  %%58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @aesl_internal_.str6, i32 0, i32 0), double %%57) nounwind, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_565_count);
  printf(( char *)((&aesl_internal__OC_str6[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 4
#endif
])), llvm_cbe_tmp__57);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__57, *(long long*)(&llvm_cbe_tmp__57));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__58);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%59 = load float* %%tmp, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_593_count);
  llvm_cbe_tmp__59 = (float )*(&llvm_cbe_tmp);
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__59, *(int*)(&llvm_cbe_tmp__59));
if (AESL_DEBUG_TRACE)
printf("\n  %%60 = getelementptr inbounds [8 x float]* %%Gol_a, i32 0, i32 7, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_594_count);
  llvm_cbe_tmp__60 = (float *)(&llvm_cbe_Gol_a[(((signed int )7u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  assert(((signed int )7u) < 8 && "Write access out of array 'Gol_a' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store float %%59, float* %%60, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_595_count);
  *llvm_cbe_tmp__60 = llvm_cbe_tmp__59;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__59);
if (AESL_DEBUG_TRACE)
printf("\n  %%61 = getelementptr inbounds [8 x float]* %%Gol_b, i32 0, i32 7, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_599_count);
  llvm_cbe_tmp__61 = (float *)(&llvm_cbe_Gol_b[(((signed int )7u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  assert(((signed int )7u) < 8 && "Write access out of array 'Gol_b' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store float %%59, float* %%61, align 4, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_600_count);
  *llvm_cbe_tmp__61 = llvm_cbe_tmp__59;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__59);
if (AESL_DEBUG_TRACE)
printf("\n  %%putchar = call i32 @putchar(i32 10) nounwind, !dbg !8 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_putchar_count);
  putchar(10u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",10u);
printf("\nReturn putchar = 0x%X",llvm_cbe_putchar);
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @Efficient_Cor(float* %%4, float* %%5, float* %%6, float* %%7) nounwind, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_606_count);
  Efficient_Cor((float *)llvm_cbe_tmp__4, (float *)llvm_cbe_tmp__5, (float *)llvm_cbe_tmp__6, (float *)llvm_cbe_tmp__7);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )0u) < 8)) fprintf(stderr, "%s:%d: warning: Read access out of array 'Cor_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%62 = load float* %%6, align 4, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_612_count);
  llvm_cbe_tmp__62 = (float )*llvm_cbe_tmp__6;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__62, *(int*)(&llvm_cbe_tmp__62));
if (AESL_DEBUG_TRACE)
printf("\n  %%63 = fpext float %%62 to double, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_613_count);
  llvm_cbe_tmp__63 = (double )((double )llvm_cbe_tmp__62);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__63, *(long long*)(&llvm_cbe_tmp__63));
if (AESL_DEBUG_TRACE)
printf("\n  %%64 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%2, i8* getelementptr inbounds ([5 x i8]* @aesl_internal_.str8, i32 0, i32 0), double %%63) nounwind, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_614_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__2, ( char *)((&aesl_internal__OC_str8[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 5
#endif
])), llvm_cbe_tmp__63);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__63, *(long long*)(&llvm_cbe_tmp__63));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__64);
}

#ifdef AESL_BC_SIM
  if (!(((signed int )0u) < 8)) fprintf(stderr, "%s:%d: warning: Read access out of array 'Cor_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%65 = load float* %%7, align 4, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_615_count);
  llvm_cbe_tmp__65 = (float )*llvm_cbe_tmp__7;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__65, *(int*)(&llvm_cbe_tmp__65));
if (AESL_DEBUG_TRACE)
printf("\n  %%66 = fpext float %%65 to double, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_616_count);
  llvm_cbe_tmp__66 = (double )((double )llvm_cbe_tmp__65);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__66, *(long long*)(&llvm_cbe_tmp__66));
if (AESL_DEBUG_TRACE)
printf("\n  %%67 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%3, i8* getelementptr inbounds ([5 x i8]* @aesl_internal_.str8, i32 0, i32 0), double %%66) nounwind, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_617_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__3, ( char *)((&aesl_internal__OC_str8[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 5
#endif
])), llvm_cbe_tmp__66);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__66, *(long long*)(&llvm_cbe_tmp__66));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__67);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%68 = getelementptr inbounds [8 x float]* %%Cor_a, i32 0, i32 1, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_623_count);
  llvm_cbe_tmp__68 = (float *)(&llvm_cbe_Cor_a[(((signed int )1u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )1u) < 8)) fprintf(stderr, "%s:%d: warning: Read access out of array 'Cor_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%69 = load float* %%68, align 4, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_624_count);
  llvm_cbe_tmp__69 = (float )*llvm_cbe_tmp__68;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__69, *(int*)(&llvm_cbe_tmp__69));
if (AESL_DEBUG_TRACE)
printf("\n  %%70 = fpext float %%69 to double, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_625_count);
  llvm_cbe_tmp__70 = (double )((double )llvm_cbe_tmp__69);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__70, *(long long*)(&llvm_cbe_tmp__70));
if (AESL_DEBUG_TRACE)
printf("\n  %%71 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%2, i8* getelementptr inbounds ([5 x i8]* @aesl_internal_.str8, i32 0, i32 0), double %%70) nounwind, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_626_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__2, ( char *)((&aesl_internal__OC_str8[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 5
#endif
])), llvm_cbe_tmp__70);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__70, *(long long*)(&llvm_cbe_tmp__70));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__71);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%72 = getelementptr inbounds [8 x float]* %%Cor_b, i32 0, i32 1, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_627_count);
  llvm_cbe_tmp__72 = (float *)(&llvm_cbe_Cor_b[(((signed int )1u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )1u) < 8)) fprintf(stderr, "%s:%d: warning: Read access out of array 'Cor_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%73 = load float* %%72, align 4, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_628_count);
  llvm_cbe_tmp__73 = (float )*llvm_cbe_tmp__72;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__73, *(int*)(&llvm_cbe_tmp__73));
if (AESL_DEBUG_TRACE)
printf("\n  %%74 = fpext float %%73 to double, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_629_count);
  llvm_cbe_tmp__74 = (double )((double )llvm_cbe_tmp__73);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__74, *(long long*)(&llvm_cbe_tmp__74));
if (AESL_DEBUG_TRACE)
printf("\n  %%75 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%3, i8* getelementptr inbounds ([5 x i8]* @aesl_internal_.str8, i32 0, i32 0), double %%74) nounwind, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_630_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__3, ( char *)((&aesl_internal__OC_str8[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 5
#endif
])), llvm_cbe_tmp__74);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__74, *(long long*)(&llvm_cbe_tmp__74));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__75);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%76 = getelementptr inbounds [8 x float]* %%Cor_a, i32 0, i32 2, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_636_count);
  llvm_cbe_tmp__76 = (float *)(&llvm_cbe_Cor_a[(((signed int )2u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )2u) < 8)) fprintf(stderr, "%s:%d: warning: Read access out of array 'Cor_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%77 = load float* %%76, align 4, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_637_count);
  llvm_cbe_tmp__77 = (float )*llvm_cbe_tmp__76;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__77, *(int*)(&llvm_cbe_tmp__77));
if (AESL_DEBUG_TRACE)
printf("\n  %%78 = fpext float %%77 to double, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_638_count);
  llvm_cbe_tmp__78 = (double )((double )llvm_cbe_tmp__77);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__78, *(long long*)(&llvm_cbe_tmp__78));
if (AESL_DEBUG_TRACE)
printf("\n  %%79 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%2, i8* getelementptr inbounds ([5 x i8]* @aesl_internal_.str8, i32 0, i32 0), double %%78) nounwind, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_639_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__2, ( char *)((&aesl_internal__OC_str8[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 5
#endif
])), llvm_cbe_tmp__78);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__78, *(long long*)(&llvm_cbe_tmp__78));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__79);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%80 = getelementptr inbounds [8 x float]* %%Cor_b, i32 0, i32 2, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_640_count);
  llvm_cbe_tmp__80 = (float *)(&llvm_cbe_Cor_b[(((signed int )2u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )2u) < 8)) fprintf(stderr, "%s:%d: warning: Read access out of array 'Cor_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%81 = load float* %%80, align 4, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_641_count);
  llvm_cbe_tmp__81 = (float )*llvm_cbe_tmp__80;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__81, *(int*)(&llvm_cbe_tmp__81));
if (AESL_DEBUG_TRACE)
printf("\n  %%82 = fpext float %%81 to double, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_642_count);
  llvm_cbe_tmp__82 = (double )((double )llvm_cbe_tmp__81);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__82, *(long long*)(&llvm_cbe_tmp__82));
if (AESL_DEBUG_TRACE)
printf("\n  %%83 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%3, i8* getelementptr inbounds ([5 x i8]* @aesl_internal_.str8, i32 0, i32 0), double %%82) nounwind, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_643_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__3, ( char *)((&aesl_internal__OC_str8[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 5
#endif
])), llvm_cbe_tmp__82);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__82, *(long long*)(&llvm_cbe_tmp__82));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__83);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%84 = getelementptr inbounds [8 x float]* %%Cor_a, i32 0, i32 3, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_649_count);
  llvm_cbe_tmp__84 = (float *)(&llvm_cbe_Cor_a[(((signed int )3u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )3u) < 8)) fprintf(stderr, "%s:%d: warning: Read access out of array 'Cor_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%85 = load float* %%84, align 4, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_650_count);
  llvm_cbe_tmp__85 = (float )*llvm_cbe_tmp__84;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__85, *(int*)(&llvm_cbe_tmp__85));
if (AESL_DEBUG_TRACE)
printf("\n  %%86 = fpext float %%85 to double, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_651_count);
  llvm_cbe_tmp__86 = (double )((double )llvm_cbe_tmp__85);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__86, *(long long*)(&llvm_cbe_tmp__86));
if (AESL_DEBUG_TRACE)
printf("\n  %%87 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%2, i8* getelementptr inbounds ([5 x i8]* @aesl_internal_.str8, i32 0, i32 0), double %%86) nounwind, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_652_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__2, ( char *)((&aesl_internal__OC_str8[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 5
#endif
])), llvm_cbe_tmp__86);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__86, *(long long*)(&llvm_cbe_tmp__86));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__87);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%88 = getelementptr inbounds [8 x float]* %%Cor_b, i32 0, i32 3, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_653_count);
  llvm_cbe_tmp__88 = (float *)(&llvm_cbe_Cor_b[(((signed int )3u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )3u) < 8)) fprintf(stderr, "%s:%d: warning: Read access out of array 'Cor_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%89 = load float* %%88, align 4, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_654_count);
  llvm_cbe_tmp__89 = (float )*llvm_cbe_tmp__88;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__89, *(int*)(&llvm_cbe_tmp__89));
if (AESL_DEBUG_TRACE)
printf("\n  %%90 = fpext float %%89 to double, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_655_count);
  llvm_cbe_tmp__90 = (double )((double )llvm_cbe_tmp__89);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__90, *(long long*)(&llvm_cbe_tmp__90));
if (AESL_DEBUG_TRACE)
printf("\n  %%91 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%3, i8* getelementptr inbounds ([5 x i8]* @aesl_internal_.str8, i32 0, i32 0), double %%90) nounwind, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_656_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__3, ( char *)((&aesl_internal__OC_str8[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 5
#endif
])), llvm_cbe_tmp__90);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__90, *(long long*)(&llvm_cbe_tmp__90));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__91);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%92 = getelementptr inbounds [8 x float]* %%Cor_a, i32 0, i32 4, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_662_count);
  llvm_cbe_tmp__92 = (float *)(&llvm_cbe_Cor_a[(((signed int )4u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )4u) < 8)) fprintf(stderr, "%s:%d: warning: Read access out of array 'Cor_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%93 = load float* %%92, align 4, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_663_count);
  llvm_cbe_tmp__93 = (float )*llvm_cbe_tmp__92;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__93, *(int*)(&llvm_cbe_tmp__93));
if (AESL_DEBUG_TRACE)
printf("\n  %%94 = fpext float %%93 to double, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_664_count);
  llvm_cbe_tmp__94 = (double )((double )llvm_cbe_tmp__93);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__94, *(long long*)(&llvm_cbe_tmp__94));
if (AESL_DEBUG_TRACE)
printf("\n  %%95 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%2, i8* getelementptr inbounds ([5 x i8]* @aesl_internal_.str8, i32 0, i32 0), double %%94) nounwind, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_665_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__2, ( char *)((&aesl_internal__OC_str8[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 5
#endif
])), llvm_cbe_tmp__94);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__94, *(long long*)(&llvm_cbe_tmp__94));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__95);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%96 = getelementptr inbounds [8 x float]* %%Cor_b, i32 0, i32 4, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_666_count);
  llvm_cbe_tmp__96 = (float *)(&llvm_cbe_Cor_b[(((signed int )4u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )4u) < 8)) fprintf(stderr, "%s:%d: warning: Read access out of array 'Cor_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%97 = load float* %%96, align 4, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_667_count);
  llvm_cbe_tmp__97 = (float )*llvm_cbe_tmp__96;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__97, *(int*)(&llvm_cbe_tmp__97));
if (AESL_DEBUG_TRACE)
printf("\n  %%98 = fpext float %%97 to double, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_668_count);
  llvm_cbe_tmp__98 = (double )((double )llvm_cbe_tmp__97);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__98, *(long long*)(&llvm_cbe_tmp__98));
if (AESL_DEBUG_TRACE)
printf("\n  %%99 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%3, i8* getelementptr inbounds ([5 x i8]* @aesl_internal_.str8, i32 0, i32 0), double %%98) nounwind, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_669_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__3, ( char *)((&aesl_internal__OC_str8[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 5
#endif
])), llvm_cbe_tmp__98);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__98, *(long long*)(&llvm_cbe_tmp__98));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__99);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%100 = getelementptr inbounds [8 x float]* %%Cor_a, i32 0, i32 5, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_675_count);
  llvm_cbe_tmp__100 = (float *)(&llvm_cbe_Cor_a[(((signed int )5u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )5u) < 8)) fprintf(stderr, "%s:%d: warning: Read access out of array 'Cor_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%101 = load float* %%100, align 4, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_676_count);
  llvm_cbe_tmp__101 = (float )*llvm_cbe_tmp__100;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__101, *(int*)(&llvm_cbe_tmp__101));
if (AESL_DEBUG_TRACE)
printf("\n  %%102 = fpext float %%101 to double, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_677_count);
  llvm_cbe_tmp__102 = (double )((double )llvm_cbe_tmp__101);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__102, *(long long*)(&llvm_cbe_tmp__102));
if (AESL_DEBUG_TRACE)
printf("\n  %%103 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%2, i8* getelementptr inbounds ([5 x i8]* @aesl_internal_.str8, i32 0, i32 0), double %%102) nounwind, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_678_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__2, ( char *)((&aesl_internal__OC_str8[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 5
#endif
])), llvm_cbe_tmp__102);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__102, *(long long*)(&llvm_cbe_tmp__102));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__103);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%104 = getelementptr inbounds [8 x float]* %%Cor_b, i32 0, i32 5, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_679_count);
  llvm_cbe_tmp__104 = (float *)(&llvm_cbe_Cor_b[(((signed int )5u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )5u) < 8)) fprintf(stderr, "%s:%d: warning: Read access out of array 'Cor_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%105 = load float* %%104, align 4, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_680_count);
  llvm_cbe_tmp__105 = (float )*llvm_cbe_tmp__104;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__105, *(int*)(&llvm_cbe_tmp__105));
if (AESL_DEBUG_TRACE)
printf("\n  %%106 = fpext float %%105 to double, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_681_count);
  llvm_cbe_tmp__106 = (double )((double )llvm_cbe_tmp__105);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__106, *(long long*)(&llvm_cbe_tmp__106));
if (AESL_DEBUG_TRACE)
printf("\n  %%107 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%3, i8* getelementptr inbounds ([5 x i8]* @aesl_internal_.str8, i32 0, i32 0), double %%106) nounwind, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_682_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__3, ( char *)((&aesl_internal__OC_str8[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 5
#endif
])), llvm_cbe_tmp__106);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__106, *(long long*)(&llvm_cbe_tmp__106));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__107);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%108 = getelementptr inbounds [8 x float]* %%Cor_a, i32 0, i32 6, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_688_count);
  llvm_cbe_tmp__108 = (float *)(&llvm_cbe_Cor_a[(((signed int )6u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )6u) < 8)) fprintf(stderr, "%s:%d: warning: Read access out of array 'Cor_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%109 = load float* %%108, align 4, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_689_count);
  llvm_cbe_tmp__109 = (float )*llvm_cbe_tmp__108;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__109, *(int*)(&llvm_cbe_tmp__109));
if (AESL_DEBUG_TRACE)
printf("\n  %%110 = fpext float %%109 to double, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_690_count);
  llvm_cbe_tmp__110 = (double )((double )llvm_cbe_tmp__109);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__110, *(long long*)(&llvm_cbe_tmp__110));
if (AESL_DEBUG_TRACE)
printf("\n  %%111 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%2, i8* getelementptr inbounds ([5 x i8]* @aesl_internal_.str8, i32 0, i32 0), double %%110) nounwind, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_691_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__2, ( char *)((&aesl_internal__OC_str8[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 5
#endif
])), llvm_cbe_tmp__110);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__110, *(long long*)(&llvm_cbe_tmp__110));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__111);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%112 = getelementptr inbounds [8 x float]* %%Cor_b, i32 0, i32 6, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_692_count);
  llvm_cbe_tmp__112 = (float *)(&llvm_cbe_Cor_b[(((signed int )6u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )6u) < 8)) fprintf(stderr, "%s:%d: warning: Read access out of array 'Cor_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%113 = load float* %%112, align 4, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_693_count);
  llvm_cbe_tmp__113 = (float )*llvm_cbe_tmp__112;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__113, *(int*)(&llvm_cbe_tmp__113));
if (AESL_DEBUG_TRACE)
printf("\n  %%114 = fpext float %%113 to double, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_694_count);
  llvm_cbe_tmp__114 = (double )((double )llvm_cbe_tmp__113);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__114, *(long long*)(&llvm_cbe_tmp__114));
if (AESL_DEBUG_TRACE)
printf("\n  %%115 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%3, i8* getelementptr inbounds ([5 x i8]* @aesl_internal_.str8, i32 0, i32 0), double %%114) nounwind, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_695_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__3, ( char *)((&aesl_internal__OC_str8[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 5
#endif
])), llvm_cbe_tmp__114);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__114, *(long long*)(&llvm_cbe_tmp__114));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__115);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%116 = getelementptr inbounds [8 x float]* %%Cor_a, i32 0, i32 7, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_701_count);
  llvm_cbe_tmp__116 = (float *)(&llvm_cbe_Cor_a[(((signed int )7u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )7u) < 8)) fprintf(stderr, "%s:%d: warning: Read access out of array 'Cor_a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%117 = load float* %%116, align 4, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_702_count);
  llvm_cbe_tmp__117 = (float )*llvm_cbe_tmp__116;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__117, *(int*)(&llvm_cbe_tmp__117));
if (AESL_DEBUG_TRACE)
printf("\n  %%118 = fpext float %%117 to double, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_703_count);
  llvm_cbe_tmp__118 = (double )((double )llvm_cbe_tmp__117);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__118, *(long long*)(&llvm_cbe_tmp__118));
if (AESL_DEBUG_TRACE)
printf("\n  %%119 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%2, i8* getelementptr inbounds ([5 x i8]* @aesl_internal_.str8, i32 0, i32 0), double %%118) nounwind, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_704_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__2, ( char *)((&aesl_internal__OC_str8[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 5
#endif
])), llvm_cbe_tmp__118);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__118, *(long long*)(&llvm_cbe_tmp__118));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__119);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%120 = getelementptr inbounds [8 x float]* %%Cor_b, i32 0, i32 7, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_705_count);
  llvm_cbe_tmp__120 = (float *)(&llvm_cbe_Cor_b[(((signed int )7u))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )7u) < 8)) fprintf(stderr, "%s:%d: warning: Read access out of array 'Cor_b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%121 = load float* %%120, align 4, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_706_count);
  llvm_cbe_tmp__121 = (float )*llvm_cbe_tmp__120;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__121, *(int*)(&llvm_cbe_tmp__121));
if (AESL_DEBUG_TRACE)
printf("\n  %%122 = fpext float %%121 to double, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_707_count);
  llvm_cbe_tmp__122 = (double )((double )llvm_cbe_tmp__121);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__122, *(long long*)(&llvm_cbe_tmp__122));
if (AESL_DEBUG_TRACE)
printf("\n  %%123 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%3, i8* getelementptr inbounds ([5 x i8]* @aesl_internal_.str8, i32 0, i32 0), double %%122) nounwind, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_708_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__3, ( char *)((&aesl_internal__OC_str8[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 5
#endif
])), llvm_cbe_tmp__122);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__122, *(long long*)(&llvm_cbe_tmp__122));
printf("\nReturn  = 0x%X",llvm_cbe_tmp__123);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%124 = add nsw i32 %%storemerge5, 1, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_714_count);
  llvm_cbe_tmp__124 = (unsigned int )((unsigned int )(llvm_cbe_storemerge5&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__124&4294967295ull)));
  if (((llvm_cbe_tmp__124&4294967295U) == (16u&4294967295U))) {
    goto llvm_cbe_tmp__128;
  } else {
    llvm_cbe_storemerge5__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__124;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  }

  } while (1); /* end of syntactic loop '.preheader' */
llvm_cbe_tmp__128:
if (AESL_DEBUG_TRACE)
printf("\n  %%126 = call i32 @fclose(%%struct._iobuf* %%1) nounwind, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_719_count);
  fclose((l_struct_OC__iobuf *)llvm_cbe_tmp__1);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__125);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%127 = call i32 @fclose(%%struct._iobuf* %%2) nounwind, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_720_count);
  fclose((l_struct_OC__iobuf *)llvm_cbe_tmp__2);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__126);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%128 = call i32 @fclose(%%struct._iobuf* %%3) nounwind, !dbg !7 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_721_count);
  fclose((l_struct_OC__iobuf *)llvm_cbe_tmp__3);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__127);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @main}\n");
  return;
}

