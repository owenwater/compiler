
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.4.1"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Copy the first part of user declarations.  */

/* Line 189 of yacc.c  */
#line 2 "decaflex.y"

	#include "base.h"
	#include "memory.h"
	int yylex(void);
	void yyerror(char *s);
	Stack s;


/* Line 189 of yacc.c  */
#line 82 "parser.cpp"

/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

/* "%code requires" blocks.  */

/* Line 209 of yacc.c  */
#line 10 "decaflex.y"

	#define YYSTYPE string



/* Line 209 of yacc.c  */
#line 112 "parser.cpp"

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     T_COMMA = 258,
     T_ASSIGN = 259,
     T_BOOL = 260,
     T_BREAK = 261,
     T_CALLOUT = 262,
     T_CONTINUE = 263,
     T_CLASS = 264,
     T_COMMENT = 265,
     T_DOT = 266,
     T_ELSE = 267,
     T_WQ = 268,
     T_EXTENDS = 269,
     T_FOR = 270,
     T_IF = 271,
     T_NEW = 272,
     T_NULL = 273,
     T_RETURN = 274,
     T_SEMICOLON = 275,
     T_VOID = 276,
     T_WHILE = 277,
     T_INT = 278,
     T_ID = 279,
     T_STRINGCONSTANT = 280,
     T_TRUE = 281,
     T_INTCONSTANT = 282,
     T_FALSE = 283,
     T_CHARCONSTANT = 284,
     T_OR = 285,
     T_AND = 286,
     T_EQ = 287,
     T_NEQ = 288,
     T_LT = 289,
     T_LEQ = 290,
     T_GT = 291,
     T_GEQ = 292,
     T_ROT = 293,
     T_RIGHTSHIFT = 294,
     T_LEFTSHIFT = 295,
     T_PLUS = 296,
     T_MINUS = 297,
     T_MULT = 298,
     T_MOD = 299,
     T_DIV = 300,
     T_NOT = 301,
     T_UMINUS = 302,
     T_RPAREN = 303,
     T_LPAREN = 304,
     T_RSB = 305,
     T_LSB = 306,
     T_RCB = 307,
     T_LCB = 308
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif


/* Copy the second part of user declarations.  */


/* Line 264 of yacc.c  */
#line 188 "parser.cpp"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  4
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   262

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  54
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  76
/* YYNRULES -- Number of rules.  */
#define YYNRULES  128
/* YYNRULES -- Number of states.  */
#define YYNSTATES  200

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   308

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,    10,    12,    15,    16,    19,    25,    29,
      32,    34,    39,    42,    43,    50,    57,    59,    60,    64,
      66,    69,    74,    77,    78,    83,    87,    88,    90,    92,
      94,    97,    98,   101,   104,   110,   118,   124,   134,   138,
     141,   144,   146,   150,   152,   156,   161,   166,   169,   173,
     174,   176,   178,   180,   182,   187,   191,   193,   195,   196,
     198,   200,   202,   206,   209,   212,   216,   218,   220,   222,
     224,   226,   228,   230,   232,   234,   236,   238,   240,   242,
     244,   246,   248,   250,   252,   254,   256,   258,   260,   262,
     264,   266,   268,   270,   272,   274,   276,   278,   280,   282,
     284,   286,   288,   290,   292,   294,   296,   298,   300,   302,
     304,   306,   308,   310,   312,   314,   316,   318,   320,   322,
     324,   326,   328,   330,   332,   334,   336,   338,   340
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
      55,     0,    -1,    99,    56,   109,    57,    61,   122,    -1,
      94,    -1,    57,    58,    -1,    -1,    70,    59,    -1,    70,
      94,    96,    90,   128,    -1,    60,   100,    59,    -1,    60,
     128,    -1,    94,    -1,    94,   113,    92,   127,    -1,    61,
      62,    -1,    -1,    70,    94,   112,    63,   126,    66,    -1,
      71,    94,   112,    63,   126,    66,    -1,    64,    -1,    -1,
      65,   100,    64,    -1,    65,    -1,    70,    94,    -1,   109,
      67,    72,   122,    -1,    68,    67,    -1,    -1,    70,    94,
      69,   128,    -1,   100,    94,    69,    -1,    -1,    23,    -1,
       5,    -1,    21,    -1,    73,    72,    -1,    -1,    75,   128,
      -1,    76,   128,    -1,   108,   112,    84,   126,    66,    -1,
     108,   112,    84,   126,    66,   103,    66,    -1,   129,   112,
      84,   126,    66,    -1,   105,   112,    74,   128,    84,   128,
      74,   126,    66,    -1,   123,    83,   128,    -1,    97,   128,
      -1,   101,   128,    -1,    66,    -1,    75,   100,    74,    -1,
      75,    -1,    81,    96,    84,    -1,    80,   112,    82,   126,
      -1,    98,   112,    77,   126,    -1,    93,    78,    -1,   100,
      79,    78,    -1,    -1,    84,    -1,    93,    -1,    94,    -1,
      94,    -1,    94,   113,    84,   127,    -1,    83,   100,    82,
      -1,    83,    -1,    84,    -1,    -1,    81,    -1,    76,    -1,
      90,    -1,    84,    85,    84,    -1,   115,    84,    -1,   119,
      84,    -1,   112,    84,   126,    -1,    86,    -1,    87,    -1,
      88,    -1,    89,    -1,   121,    -1,   115,    -1,   117,    -1,
     102,    -1,   116,    -1,   110,    -1,   124,    -1,   125,    -1,
     106,    -1,   107,    -1,   111,    -1,   114,    -1,   104,    -1,
     118,    -1,    95,    -1,   120,    -1,    92,    -1,    29,    -1,
      91,    -1,    26,    -1,    28,    -1,    27,    -1,    25,    -1,
      24,    -1,    31,    -1,     4,    -1,     6,    -1,     7,    -1,
       9,    -1,     3,    -1,     8,    -1,    45,    -1,    12,    -1,
      32,    -1,    15,    -1,    37,    -1,    36,    -1,    16,    -1,
      53,    -1,    40,    -1,    35,    -1,    49,    -1,    51,    -1,
      34,    -1,    42,    -1,    44,    -1,    43,    -1,    33,    -1,
      46,    -1,    30,    -1,    41,    -1,    52,    -1,    19,    -1,
      39,    -1,    38,    -1,    48,    -1,    50,    -1,    20,    -1,
      22,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,    32,    32,    36,    39,    42,    43,    46,    49,    52,
      53,    56,    60,    63,    65,    69,    74,    77,    78,    81,
      84,    86,    89,    92,    94,    99,   101,   104,   105,   107,
     109,   112,   115,   118,   121,   124,   127,   130,   133,   136,
     139,   142,   146,   149,   152,   159,   162,   166,   169,   173,
     176,   179,   182,   184,   185,   189,   192,   196,   197,   199,
     202,   205,   208,   215,   218,   221,   225,   226,   227,   228,
     230,   231,   232,   233,   234,   235,   236,   237,   239,   240,
     241,   242,   244,   245,   247,   248,   250,   257,   260,   263,
     264,   265,   268,   269,   271,   272,   273,   274,   275,   276,
     277,   278,   280,   281,   283,   284,   285,   286,   287,   288,
     289,   290,   291,   292,   293,   294,   295,   296,   298,   300,
     301,   302,   303,   304,   305,   306,   307,   308,   309
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "T_COMMA", "T_ASSIGN", "T_BOOL",
  "T_BREAK", "T_CALLOUT", "T_CONTINUE", "T_CLASS", "T_COMMENT", "T_DOT",
  "T_ELSE", "T_WQ", "T_EXTENDS", "T_FOR", "T_IF", "T_NEW", "T_NULL",
  "T_RETURN", "T_SEMICOLON", "T_VOID", "T_WHILE", "T_INT", "T_ID",
  "T_STRINGCONSTANT", "T_TRUE", "T_INTCONSTANT", "T_FALSE",
  "T_CHARCONSTANT", "T_OR", "T_AND", "T_EQ", "T_NEQ", "T_LT", "T_LEQ",
  "T_GT", "T_GEQ", "T_ROT", "T_RIGHTSHIFT", "T_LEFTSHIFT", "T_PLUS",
  "T_MINUS", "T_MULT", "T_MOD", "T_DIV", "T_NOT", "T_UMINUS", "T_RPAREN",
  "T_LPAREN", "T_RSB", "T_LSB", "T_RCB", "T_LCB", "$accept", "program",
  "class_name", "field_decl_list", "field_decl", "field_list", "field",
  "method_decl_list", "method_decl", "param_list", "param_comma_list",
  "param", "block", "var_decl_list", "var_decl", "id_comma_list", "type",
  "tvoid", "statement_list", "statement", "assign_comma_list", "assign",
  "method_call", "callout_arg_list", "callout_arg_comma_list",
  "callout_arg", "method_name", "lvalue", "expr_comma_list", "opt_expr",
  "expr", "bin_op", "arith_op", "rel_op", "eq_op", "cond_op", "constant",
  "bool_constant", "intconstant", "stringconstant", "id", "tand",
  "tassign", "tbreak", "tcallout", "tclass", "tcomma", "tcontinue", "tdiv",
  "telse", "teq", "tfor", "tgeq", "tgt", "tif", "tlcb", "tleftshift",
  "tleq", "tlparen", "tlsb", "tlt", "tminus", "tmod", "tmult", "tneq",
  "tnot", "tor", "tplus", "trcb", "treturn", "trightshift", "trot",
  "trparen", "trsb", "tsemicolon", "twhile", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    54,    55,    56,    57,    57,    58,    58,    59,    59,
      60,    60,    61,    61,    62,    62,    63,    63,    64,    64,
      65,    66,    67,    67,    68,    69,    69,    70,    70,    71,
      72,    72,    73,    73,    73,    73,    73,    73,    73,    73,
      73,    73,    74,    74,    75,    76,    76,    77,    78,    78,
      79,    79,    80,    81,    81,    82,    82,    83,    83,    84,
      84,    84,    84,    84,    84,    84,    85,    85,    85,    85,
      86,    86,    86,    86,    86,    86,    86,    86,    87,    87,
      87,    87,    88,    88,    89,    89,    90,    90,    90,    91,
      91,    92,    93,    94,    95,    96,    97,    98,    99,   100,
     101,   102,   103,   104,   105,   106,   107,   108,   109,   110,
     111,   112,   113,   114,   115,   116,   117,   118,   119,   120,
     121,   122,   123,   124,   125,   126,   127,   128,   129
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     6,     1,     2,     0,     2,     5,     3,     2,
       1,     4,     2,     0,     6,     6,     1,     0,     3,     1,
       2,     4,     2,     0,     4,     3,     0,     1,     1,     1,
       2,     0,     2,     2,     5,     7,     5,     9,     3,     2,
       2,     1,     3,     1,     3,     4,     4,     2,     3,     0,
       1,     1,     1,     1,     4,     3,     1,     1,     0,     1,
       1,     1,     3,     2,     2,     3,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,    98,     0,     0,     1,    93,     0,     3,   108,     5,
      13,    28,    27,     4,     0,     0,    29,   121,    12,     0,
       0,     2,     6,     0,    10,     0,     0,    99,   127,     0,
       9,    95,   112,     0,     0,   111,    17,    17,     8,    10,
      89,    91,    90,    87,     0,    88,    86,     0,     0,    16,
      19,     0,     0,     7,   126,    11,   125,     0,     0,    20,
       0,    14,    23,    18,    15,    31,    23,     0,    96,    97,
     100,   104,   107,   122,   128,    41,     0,    31,     0,     0,
       0,     0,    53,     0,     0,     0,     0,     0,    58,     0,
      22,    26,    21,    30,    32,    33,    58,     0,     0,    39,
       0,    40,     0,     0,   114,   118,    60,    59,     0,    57,
      61,     0,     0,     0,     0,     0,     0,     0,    56,    44,
       0,    92,     0,    49,     0,    43,    53,     0,    38,   119,
      94,   103,   117,   113,   110,   106,   105,   124,   123,   109,
     120,   116,   115,   101,     0,    66,    67,    68,    69,    84,
      73,    82,    78,    79,    75,    80,    81,    71,    74,    72,
      83,    85,    70,    76,    77,     0,    63,    64,     0,    24,
      26,    45,    58,    54,    46,    47,     0,     0,     0,     0,
      62,    65,     0,    25,    55,    49,    50,    51,     0,    42,
      34,    36,    48,     0,   102,     0,     0,    35,     0,    37
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     6,    10,    13,    22,    23,    14,    18,    48,
      49,    50,    75,    65,    66,   115,    51,    20,    76,    77,
     124,   125,   106,   122,   175,   185,    80,   107,   117,   118,
     109,   144,   145,   146,   147,   148,   110,    45,    46,   123,
      82,   149,    33,    83,    84,     3,   116,    85,   150,   195,
     151,    86,   152,   153,    87,    62,   154,   155,   111,    34,
     156,   112,   158,   159,   160,   113,   161,   162,    21,    88,
     163,   164,    57,    55,    30,    89
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -152
static const yytype_int16 yypact[] =
{
       5,  -152,    30,    22,  -152,  -152,    -4,  -152,  -152,  -152,
       8,  -152,  -152,  -152,     2,    22,  -152,  -152,  -152,    22,
      22,  -152,  -152,    18,     7,     3,     3,  -152,  -152,    22,
    -152,  -152,  -152,    49,    33,  -152,     8,     8,  -152,    11,
    -152,  -152,  -152,  -152,    43,  -152,  -152,    17,    20,  -152,
      67,    22,    20,  -152,  -152,  -152,  -152,    -4,     8,  -152,
      -4,  -152,     8,  -152,  -152,   116,     8,    22,  -152,  -152,
    -152,  -152,  -152,  -152,  -152,  -152,    19,   116,    43,    43,
       3,    68,     4,    43,     3,    43,     3,     3,   138,     3,
    -152,    67,  -152,  -152,  -152,  -152,   138,   138,   138,  -152,
      55,  -152,    22,   138,  -152,  -152,  -152,  -152,    43,   217,
    -152,   138,   138,   138,   138,    43,    22,    20,    67,   217,
     177,  -152,    20,    67,    43,    67,    11,   198,  -152,  -152,
    -152,  -152,  -152,  -152,  -152,  -152,  -152,  -152,  -152,  -152,
    -152,  -152,  -152,  -152,   138,  -152,  -152,  -152,  -152,  -152,
    -152,  -152,  -152,  -152,  -152,  -152,  -152,  -152,  -152,  -152,
    -152,  -152,  -152,  -152,  -152,   198,  -152,   217,   198,  -152,
      67,  -152,   138,  -152,  -152,  -152,   130,   138,    22,    -4,
     217,  -152,    -4,  -152,  -152,    67,   217,  -152,   161,  -152,
      69,  -152,  -152,    22,  -152,    -4,    20,  -152,    -4,  -152
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -152,  -152,  -152,  -152,  -152,    54,  -152,  -152,  -152,    47,
      31,  -152,   -54,    24,  -152,   -78,    -5,  -152,    14,  -152,
    -151,   -55,   -21,  -152,   -92,  -152,  -152,   -57,   -77,     6,
     -79,  -152,  -152,  -152,  -152,  -152,    71,  -152,    73,   -74,
      -3,  -152,    29,  -152,  -152,  -152,   -22,  -152,  -152,  -152,
    -152,  -152,  -152,  -152,  -152,   109,  -152,  -152,    25,   -67,
    -152,   -80,  -152,  -152,  -152,  -152,  -152,  -152,    40,  -152,
    -152,  -152,   -48,    -2,   -42,  -152
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -53
static const yytype_int16 yytable[] =
{
       7,    29,    53,    61,    60,    15,    64,    11,    81,    19,
      78,    31,    24,    11,     1,    98,    25,    26,   119,   120,
      81,    27,    78,    16,   127,    12,    39,   189,    58,   157,
       4,    12,   165,   166,   167,   168,    94,    95,    28,   157,
     157,    99,   196,   101,    79,    81,     5,   157,    59,     8,
      36,    37,    35,   -52,    17,    32,    79,    67,    32,    98,
      41,    67,    32,    28,    91,   180,   128,    54,    56,   171,
      27,    17,    31,   169,   174,    40,    41,    42,    43,   179,
     121,   194,   177,    38,    52,   157,   157,   157,   157,    63,
      90,    93,   183,   192,   108,   184,   172,   186,   188,   126,
     157,   176,   187,   178,    44,    96,   157,    47,   157,   100,
      97,   102,   103,   170,   114,     9,    92,   181,   173,     0,
     182,    81,    68,    69,    70,   190,     0,     0,   191,     0,
       0,    71,    72,     0,     0,    73,    81,    69,    74,     0,
       5,   197,     0,     0,   199,    69,   193,     0,   198,     0,
       0,     0,     0,     0,     5,   121,    40,    41,    42,    43,
       0,     0,     5,   176,    40,    41,    42,    43,     0,     8,
       0,     0,   104,     0,     0,   126,   105,     0,     0,    35,
     104,    28,     0,     0,   105,     0,     0,    35,     0,     0,
     126,   129,   130,   131,   132,   133,   134,   135,   136,   137,
     138,   139,   140,   104,   141,   142,   143,   129,   130,   131,
     132,   133,   134,   135,   136,   137,   138,   139,   140,   104,
     141,   142,   143,     0,     0,     0,     0,    54,   129,   130,
     131,   132,   133,   134,   135,   136,   137,   138,   139,   140,
     104,   141,   142,   143,     0,     0,    56,   129,   130,   131,
     132,   133,   134,   135,   136,   137,   138,   139,   140,   104,
     141,   142,   143
};

static const yytype_int16 yycheck[] =
{
       3,    23,    44,    57,    52,    10,    60,     5,    65,    14,
      65,     4,    15,     5,     9,    82,    19,    20,    97,    98,
      77,     3,    77,    21,   103,    23,    29,   178,    50,   109,
       0,    23,   111,   112,   113,   114,    78,    79,    20,   119,
     120,    83,   193,    85,    65,   102,    24,   127,    51,    53,
      25,    26,    49,    49,    52,    51,    77,    62,    51,   126,
      27,    66,    51,    20,    67,   144,   108,    50,    48,   117,
       3,    52,     4,   115,   122,    26,    27,    28,    29,   127,
      25,    12,   124,    29,    37,   165,   166,   167,   168,    58,
      66,    77,   170,   185,    88,   172,   118,   176,   177,   102,
     180,   123,   176,   125,    33,    80,   186,    34,   188,    84,
      81,    86,    87,   116,    89,     6,    76,   165,   120,    -1,
     168,   178,     6,     7,     8,   179,    -1,    -1,   182,    -1,
      -1,    15,    16,    -1,    -1,    19,   193,     7,    22,    -1,
      24,   195,    -1,    -1,   198,     7,   188,    -1,   196,    -1,
      -1,    -1,    -1,    -1,    24,    25,    26,    27,    28,    29,
      -1,    -1,    24,   185,    26,    27,    28,    29,    -1,    53,
      -1,    -1,    42,    -1,    -1,   178,    46,    -1,    -1,    49,
      42,    20,    -1,    -1,    46,    -1,    -1,    49,    -1,    -1,
     193,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    -1,    -1,    -1,    -1,    50,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    -1,    -1,    48,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     9,    55,    99,     0,    24,    56,    94,    53,   109,
      57,     5,    23,    58,    61,    70,    21,    52,    62,    70,
      71,   122,    59,    60,    94,    94,    94,     3,    20,   100,
     128,     4,    51,    96,   113,    49,   112,   112,    59,    94,
      26,    27,    28,    29,    90,    91,    92,    92,    63,    64,
      65,    70,    63,   128,    50,   127,    48,   126,   100,    94,
     126,    66,   109,    64,    66,    67,    68,    70,     6,     7,
       8,    15,    16,    19,    22,    66,    72,    73,    75,    76,
      80,    81,    94,    97,    98,   101,   105,   108,   123,   129,
      67,    94,   122,    72,   128,   128,   112,    96,   113,   128,
     112,   128,   112,   112,    42,    46,    76,    81,    83,    84,
      90,   112,   115,   119,   112,    69,   100,    82,    83,    84,
      84,    25,    77,    93,    74,    75,    94,    84,   128,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    43,    44,    45,    85,    86,    87,    88,    89,    95,
     102,   104,   106,   107,   110,   111,   114,   115,   116,   117,
     118,   120,   121,   124,   125,    84,    84,    84,    84,   128,
      94,   126,   100,   127,   126,    78,   100,   128,   100,   126,
      84,   126,   126,    69,    82,    79,    84,    93,    84,    74,
      66,    66,    78,   128,    12,   103,    74,    66,   126,    66
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}

/* Prevent warnings from -Wmissing-prototypes.  */
#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */


/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*-------------------------.
| yyparse or yypush_parse.  |
`-------------------------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{


    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.

       Refer to the stacks thru separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yytoken = 0;
  yyss = yyssa;
  yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */
  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss_alloc, yyss);
	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:

/* Line 1455 of yacc.c  */
#line 32 "decaflex.y"
    {
	   		//cout <<"(program "<<$1 << $2 << $3<<$4;
			//cout << $5 << $6<< ")" <<endl;
	   ;}
    break;

  case 3:

/* Line 1455 of yacc.c  */
#line 36 "decaflex.y"
    {
		  	/*$$ = "(class_name "+$1+")";*/
		  ;}
    break;

  case 4:

/* Line 1455 of yacc.c  */
#line 39 "decaflex.y"
    {
			   		/*$$ = "(field_decl_list "+ $1+$2+")";*/
			   ;}
    break;

  case 5:

/* Line 1455 of yacc.c  */
#line 42 "decaflex.y"
    { /*$$ = "(field_decl_list EPSILON)";*/;}
    break;

  case 6:

/* Line 1455 of yacc.c  */
#line 43 "decaflex.y"
    {
		  			/*$$ = "(field_decl "+$1 + $2 + ")";*/
		       ;}
    break;

  case 7:

/* Line 1455 of yacc.c  */
#line 46 "decaflex.y"
    {
		   			/*$$ = "(field_decl "+$1+$2+$3+$4+$5+")";*/
		   	   ;}
    break;

  case 8:

/* Line 1455 of yacc.c  */
#line 49 "decaflex.y"
    {
		  		/*$$ = "(field_list " +$1+ $2 + $3 +")";*/
		    ;}
    break;

  case 9:

/* Line 1455 of yacc.c  */
#line 52 "decaflex.y"
    {/*$$ = "(field_list "+$1+$2+")";*/;}
    break;

  case 10:

/* Line 1455 of yacc.c  */
#line 53 "decaflex.y"
    {
				/*$$ = "(field "+ $1 + ")";*/
			;}
    break;

  case 11:

/* Line 1455 of yacc.c  */
#line 56 "decaflex.y"
    {
		 		/*$$ = "(field "+ $1+$2+$3+$4+")";*/
		    ;}
    break;

  case 12:

/* Line 1455 of yacc.c  */
#line 60 "decaflex.y"
    {
					/*$$ = "(method_decl_list "+ $1+$2+")";*/
				;}
    break;

  case 13:

/* Line 1455 of yacc.c  */
#line 63 "decaflex.y"
    {
				/*$$ = "";*/;}
    break;

  case 14:

/* Line 1455 of yacc.c  */
#line 65 "decaflex.y"
    {
		   		cout << (yyvsp[(2) - (6)]) << ":"<< endl;
		   		/*$$ = "(method_decl " + $1+$2+$3+$4+$5+$6+")";*/
		   ;}
    break;

  case 15:

/* Line 1455 of yacc.c  */
#line 69 "decaflex.y"
    {
		   		cout << (yyvsp[(2) - (6)]) << ":"<< endl;
		   		/*$$ = "(method_decl " + $1+$2+$3+$4+$5+$6+")";*/
		   ;}
    break;

  case 16:

/* Line 1455 of yacc.c  */
#line 74 "decaflex.y"
    {
		  		/*$$ = "(param_list "+$1 + ")";*/
		  ;}
    break;

  case 17:

/* Line 1455 of yacc.c  */
#line 77 "decaflex.y"
    {/*$$ = "(param_list EPSILON)";*/;}
    break;

  case 18:

/* Line 1455 of yacc.c  */
#line 78 "decaflex.y"
    {
				/*$$ = "(param_comma_list "+ $1+$2+$3+")";*/
				;}
    break;

  case 19:

/* Line 1455 of yacc.c  */
#line 81 "decaflex.y"
    {
					/*$$= "(param_comma_list " + $1+")";*/
				;}
    break;

  case 20:

/* Line 1455 of yacc.c  */
#line 84 "decaflex.y"
    {/*$$ = "(param "+$1+$2+")";*/;}
    break;

  case 21:

/* Line 1455 of yacc.c  */
#line 86 "decaflex.y"
    {
					/*$$ = "(block " + $1+$2+$3+$4+")";*/
				;}
    break;

  case 22:

/* Line 1455 of yacc.c  */
#line 89 "decaflex.y"
    {
			 	/*$$ = "(var_decl_list " + $1+$2+")";*/
			 ;}
    break;

  case 23:

/* Line 1455 of yacc.c  */
#line 92 "decaflex.y"
    {/*$$ = "(var_decl_list EPSILON)";*/;}
    break;

  case 24:

/* Line 1455 of yacc.c  */
#line 94 "decaflex.y"
    {
			int rt = s.stack[s.sp].add_var((yyvsp[(2) - (4)]));
			/*$$ = "(var_decl "+$1+$2+$3+$4+")";*/
		;}
    break;

  case 25:

/* Line 1455 of yacc.c  */
#line 99 "decaflex.y"
    {
			 		/*$$ = "(id_comma_list "+$1+$2+$3+")";*/;}
    break;

  case 26:

/* Line 1455 of yacc.c  */
#line 101 "decaflex.y"
    {
			   /*$$ =  "(id_comma_list EPSILON)";*/
			   ;}
    break;

  case 27:

/* Line 1455 of yacc.c  */
#line 104 "decaflex.y"
    {/*$$ = "(type (T_INT int))";*/;}
    break;

  case 28:

/* Line 1455 of yacc.c  */
#line 105 "decaflex.y"
    {/*$$ = "(type (T_BOOL bool))";*/;}
    break;

  case 29:

/* Line 1455 of yacc.c  */
#line 107 "decaflex.y"
    {/*$$ = "(T_VOID void)";*/;}
    break;

  case 30:

/* Line 1455 of yacc.c  */
#line 109 "decaflex.y"
    {
			  	/*$$ = "(statement_list "+$1+$2+")";*/
			  ;}
    break;

  case 31:

/* Line 1455 of yacc.c  */
#line 112 "decaflex.y"
    {/*$$ = "(statement_list EPSILON)";*/;}
    break;

  case 32:

/* Line 1455 of yacc.c  */
#line 115 "decaflex.y"
    {
		 	/*$$ = "(statement "+$1+$2+")";*/
		 ;}
    break;

  case 33:

/* Line 1455 of yacc.c  */
#line 118 "decaflex.y"
    {
		 	/*$$ = "(statement "+$1+$2+")";*/
		 ;}
    break;

  case 34:

/* Line 1455 of yacc.c  */
#line 121 "decaflex.y"
    {
		 	/*$$ = "(statement "+$1+$2+$3+$4+$5+")";*/
		 ;}
    break;

  case 35:

/* Line 1455 of yacc.c  */
#line 124 "decaflex.y"
    {
		 	/*$$ = "(statement "+$1+$2+$3+$4+$5+$6+$7+")";*/
		 ;}
    break;

  case 36:

/* Line 1455 of yacc.c  */
#line 127 "decaflex.y"
    {
		 	/*$$ = "(statement "+$1+$2+$3+$4+$5+")";*/
		 ;}
    break;

  case 37:

/* Line 1455 of yacc.c  */
#line 130 "decaflex.y"
    {
		 	/*$$ = "(statement "+$1+$2+$3+$4+$5+$6+$7+$8+")";*/
		 ;}
    break;

  case 38:

/* Line 1455 of yacc.c  */
#line 133 "decaflex.y"
    {
		 	/*$$ = "(statement "+$1+$2+$3+")";*/
		 ;}
    break;

  case 39:

/* Line 1455 of yacc.c  */
#line 136 "decaflex.y"
    {
		 	/*$$ = "(statement "+$1+$2+")";*/
		 ;}
    break;

  case 40:

/* Line 1455 of yacc.c  */
#line 139 "decaflex.y"
    {
		 	/*$$ = "(statement "+$1+$2+")";*/
		 ;}
    break;

  case 41:

/* Line 1455 of yacc.c  */
#line 142 "decaflex.y"
    {
		 	/*$$ = "(statement "+$1+")";*/
		 ;}
    break;

  case 42:

/* Line 1455 of yacc.c  */
#line 146 "decaflex.y"
    {
				 	/*$$ = "(assign_comma_list "+$1+$2+$3+")";*/
				 ;}
    break;

  case 43:

/* Line 1455 of yacc.c  */
#line 149 "decaflex.y"
    {
				 	/*$$ = "(assign_comma_list "+ $1+")";*/
				 ;}
    break;

  case 44:

/* Line 1455 of yacc.c  */
#line 152 "decaflex.y"
    {
	  		s.stack[s.sp].set_var((yyvsp[(1) - (3)]), (yyvsp[(3) - (3)]));
			s.stack[s.sp].remove_slot((yyvsp[(3) - (3)]));
			(yyval) = (yyvsp[(1) - (3)]);
	  		/*$$ = "(assign " + $1+$2+$3+")";*/
	  	;}
    break;

  case 45:

/* Line 1455 of yacc.c  */
#line 159 "decaflex.y"
    {
				/*$$ = "(method_call "+ $1+$2+$3+$4+")";*/
			;}
    break;

  case 46:

/* Line 1455 of yacc.c  */
#line 162 "decaflex.y"
    {
				/*$$ = "(method_call "+ $1+$2+$3+$4+")";*/
			;}
    break;

  case 47:

/* Line 1455 of yacc.c  */
#line 166 "decaflex.y"
    {
					/*$$ = "(callout_arg_list " + $1+$2+")";*/
				;}
    break;

  case 48:

/* Line 1455 of yacc.c  */
#line 169 "decaflex.y"
    {
					  /*$$ = "(callout_arg_comma_list " + $1+$2+$3+")";*/

				;}
    break;

  case 49:

/* Line 1455 of yacc.c  */
#line 173 "decaflex.y"
    {
					/*$$ = "(callout_arg_comma_list EPSILON)";*/
				;}
    break;

  case 50:

/* Line 1455 of yacc.c  */
#line 176 "decaflex.y"
    {
		   		/*$$ = "(callout_arg " + $1 + ")";*/
		   ;}
    break;

  case 51:

/* Line 1455 of yacc.c  */
#line 179 "decaflex.y"
    {
		   		/*$$ = "(callout_arg " + $1 +")";*/
			;}
    break;

  case 52:

/* Line 1455 of yacc.c  */
#line 182 "decaflex.y"
    {/*$$ = $1;*/;}
    break;

  case 53:

/* Line 1455 of yacc.c  */
#line 184 "decaflex.y"
    { (yyval) = (yyvsp[(1) - (1)]);/*$$ = "(lvalue " + $1 + ")";*/;}
    break;

  case 54:

/* Line 1455 of yacc.c  */
#line 185 "decaflex.y"
    {
	  	/*$$ = "(lvalue " + $1+$2+$3+$4+ ")";*/
	  ;}
    break;

  case 55:

/* Line 1455 of yacc.c  */
#line 189 "decaflex.y"
    {
			   		/*$$ = "(expr_comma_list "+$1+$2+$3+")";*/
				;}
    break;

  case 56:

/* Line 1455 of yacc.c  */
#line 192 "decaflex.y"
    {
			   		/*$$ = "(expr_comma_list "+$1+")";*/
				;}
    break;

  case 57:

/* Line 1455 of yacc.c  */
#line 196 "decaflex.y"
    { /*$$ = "(opt_expr " + $1+ ")";*/;}
    break;

  case 58:

/* Line 1455 of yacc.c  */
#line 197 "decaflex.y"
    {/*$$ = "(opt_expr EPSILON)";*/;}
    break;

  case 59:

/* Line 1455 of yacc.c  */
#line 199 "decaflex.y"
    {
		/*$$ = "(expr " + $1+")";*/
	  ;}
    break;

  case 60:

/* Line 1455 of yacc.c  */
#line 202 "decaflex.y"
    {
		/*$$ = "(expr " + $1+")";*/
	  ;}
    break;

  case 61:

/* Line 1455 of yacc.c  */
#line 205 "decaflex.y"
    {
		/*$$ = "(expr " + $1+")";*/
	  ;}
    break;

  case 62:

/* Line 1455 of yacc.c  */
#line 208 "decaflex.y"
    {
	    string res = s.stack[s.sp].find_slot();
	  	cout << (yyvsp[(2) - (3)]) <<" $"<<res<<", $"<< (yyvsp[(1) - (3)])<<", $"<< (yyvsp[(3) - (3)])<< endl;
		s.stack[s.sp].remove_slot((yyvsp[(1) - (3)]));
		s.stack[s.sp].remove_slot((yyvsp[(3) - (3)]));
		(yyval) = res;
	  ;}
    break;

  case 63:

/* Line 1455 of yacc.c  */
#line 215 "decaflex.y"
    {
		/*$$ = "(expr " + $1+$2+")";*/
	  ;}
    break;

  case 64:

/* Line 1455 of yacc.c  */
#line 218 "decaflex.y"
    {
		/*$$ = "(expr " + $1+$2+")";*/
	  ;}
    break;

  case 65:

/* Line 1455 of yacc.c  */
#line 221 "decaflex.y"
    {
		/*$$ = "(expr " + $1+$2+$3+")";*/
	  ;}
    break;

  case 66:

/* Line 1455 of yacc.c  */
#line 225 "decaflex.y"
    { (yyval) = (yyvsp[(1) - (1)]);;}
    break;

  case 67:

/* Line 1455 of yacc.c  */
#line 226 "decaflex.y"
    {/*$$ = $1;*/;}
    break;

  case 68:

/* Line 1455 of yacc.c  */
#line 227 "decaflex.y"
    {/*$$ = $1;*/;}
    break;

  case 69:

/* Line 1455 of yacc.c  */
#line 228 "decaflex.y"
    {/*$$ = $1;*/;}
    break;

  case 70:

/* Line 1455 of yacc.c  */
#line 230 "decaflex.y"
    { (yyval) = "add";}
    break;

  case 71:

/* Line 1455 of yacc.c  */
#line 231 "decaflex.y"
    {/*$$ = $1;*/;}
    break;

  case 72:

/* Line 1455 of yacc.c  */
#line 232 "decaflex.y"
    {/*$$ = $1;*/;}
    break;

  case 73:

/* Line 1455 of yacc.c  */
#line 233 "decaflex.y"
    {/*$$ = $1;*/;}
    break;

  case 74:

/* Line 1455 of yacc.c  */
#line 234 "decaflex.y"
    {/*$$ = $1;*/;}
    break;

  case 75:

/* Line 1455 of yacc.c  */
#line 235 "decaflex.y"
    {/*$$ = $1;*/;}
    break;

  case 76:

/* Line 1455 of yacc.c  */
#line 236 "decaflex.y"
    {/*$$ = $1;*/;}
    break;

  case 77:

/* Line 1455 of yacc.c  */
#line 237 "decaflex.y"
    {/*$$ = $1;*/;}
    break;

  case 78:

/* Line 1455 of yacc.c  */
#line 239 "decaflex.y"
    {/*$$ = $1;*/;}
    break;

  case 79:

/* Line 1455 of yacc.c  */
#line 240 "decaflex.y"
    {/*$$ = $1;*/;}
    break;

  case 80:

/* Line 1455 of yacc.c  */
#line 241 "decaflex.y"
    {/*$$ = $1;*/;}
    break;

  case 81:

/* Line 1455 of yacc.c  */
#line 242 "decaflex.y"
    {/*$$ = $1;*/;}
    break;

  case 82:

/* Line 1455 of yacc.c  */
#line 244 "decaflex.y"
    {/*$$ = $1;*/;}
    break;

  case 83:

/* Line 1455 of yacc.c  */
#line 245 "decaflex.y"
    {/*$$ = $1;*/;}
    break;

  case 84:

/* Line 1455 of yacc.c  */
#line 247 "decaflex.y"
    {/*$$ = $1;*/;}
    break;

  case 85:

/* Line 1455 of yacc.c  */
#line 248 "decaflex.y"
    {/*$$ = $1;*/;}
    break;

  case 86:

/* Line 1455 of yacc.c  */
#line 250 "decaflex.y"
    {
			stringstream ss((yyvsp[(1) - (1)]));
			int value;
			ss >> value;
			(yyval) = s.stack[s.sp].new_value(value);
			/*$$ = "(constant "+$1+")";*/
		;}
    break;

  case 87:

/* Line 1455 of yacc.c  */
#line 257 "decaflex.y"
    {
			/*$$ = "(constant (T_CHARCONSTANT '"+$1+"'))";*/
		;}
    break;

  case 88:

/* Line 1455 of yacc.c  */
#line 260 "decaflex.y"
    {
			/*$$ = "(constant " + $1 + ")";*/
		;}
    break;

  case 89:

/* Line 1455 of yacc.c  */
#line 263 "decaflex.y"
    {/*$$ = "(bool_constant (T_TRUE "+$1+"))";*/;}
    break;

  case 90:

/* Line 1455 of yacc.c  */
#line 264 "decaflex.y"
    {/*$$ = "(bool_constant (T_FALSE "+$1+"))";*/;}
    break;

  case 91:

/* Line 1455 of yacc.c  */
#line 265 "decaflex.y"
    { /*$$ = "(T_INTCONSTANT "+$1+")";*/;}
    break;

  case 92:

/* Line 1455 of yacc.c  */
#line 268 "decaflex.y"
    {/*$$ = "(T_STRINGCONSTANT "+$1+")";*/ ;}
    break;

  case 93:

/* Line 1455 of yacc.c  */
#line 269 "decaflex.y"
    { (yyval) = (yyvsp[(1) - (1)]); /*$$ = "(T_ID "+ $1+")";*/;}
    break;

  case 94:

/* Line 1455 of yacc.c  */
#line 271 "decaflex.y"
    { /*$$ = "(T_AND &&)";*/ ;}
    break;

  case 95:

/* Line 1455 of yacc.c  */
#line 272 "decaflex.y"
    { /*$$ = "(T_ASSIGN =)";*/ ;}
    break;

  case 96:

/* Line 1455 of yacc.c  */
#line 273 "decaflex.y"
    { /*$$ = "(T_BREAK break)";*/ ;}
    break;

  case 97:

/* Line 1455 of yacc.c  */
#line 274 "decaflex.y"
    { /*$$ = "(T_CALLOUT callout)";*/ ;}
    break;

  case 98:

/* Line 1455 of yacc.c  */
#line 275 "decaflex.y"
    { /*$$ = "(T_CLASS class)";*/ ;}
    break;

  case 99:

/* Line 1455 of yacc.c  */
#line 276 "decaflex.y"
    { /*$$ = "(T_COMMA ,)";*/ ;}
    break;

  case 100:

/* Line 1455 of yacc.c  */
#line 277 "decaflex.y"
    { /*$$ = "(T_CONTINUE continue)";*/ ;}
    break;

  case 101:

/* Line 1455 of yacc.c  */
#line 278 "decaflex.y"
    { /*$$ = "(T_DIV /)";*/ ;}
    break;

  case 102:

/* Line 1455 of yacc.c  */
#line 280 "decaflex.y"
    { /*$$ = "(T_ELSE else)";*/ ;}
    break;

  case 103:

/* Line 1455 of yacc.c  */
#line 281 "decaflex.y"
    { /*$$ = "(T_EQ ==)";*/ ;}
    break;

  case 104:

/* Line 1455 of yacc.c  */
#line 283 "decaflex.y"
    { /*$$ = "(T_FOR for)";*/ ;}
    break;

  case 105:

/* Line 1455 of yacc.c  */
#line 284 "decaflex.y"
    { /*$$ = "(T_GEQ >=)";*/ ;}
    break;

  case 106:

/* Line 1455 of yacc.c  */
#line 285 "decaflex.y"
    { /*$$ = "(T_GT >)";*/ ;}
    break;

  case 107:

/* Line 1455 of yacc.c  */
#line 286 "decaflex.y"
    { /*$$ = "(T_IF if)";*/ ;}
    break;

  case 108:

/* Line 1455 of yacc.c  */
#line 287 "decaflex.y"
    { s.in();/*$$ = "(T_LCB {)";*/ ;}
    break;

  case 109:

/* Line 1455 of yacc.c  */
#line 288 "decaflex.y"
    { /*$$ = "(T_LEFTSHIFT <<)";*/ ;}
    break;

  case 110:

/* Line 1455 of yacc.c  */
#line 289 "decaflex.y"
    { /*$$ = "(T_LEQ <=)";*/ ;}
    break;

  case 111:

/* Line 1455 of yacc.c  */
#line 290 "decaflex.y"
    { /*$$ = "(T_LPAREN \\()";*/ ;}
    break;

  case 112:

/* Line 1455 of yacc.c  */
#line 291 "decaflex.y"
    { /*$$ = "(T_LSB [)";*/ ;}
    break;

  case 113:

/* Line 1455 of yacc.c  */
#line 292 "decaflex.y"
    { /*$$ = "(T_LT <)";*/ ;}
    break;

  case 114:

/* Line 1455 of yacc.c  */
#line 293 "decaflex.y"
    { /*$$ = "(T_MINUS -)";*/ ;}
    break;

  case 115:

/* Line 1455 of yacc.c  */
#line 294 "decaflex.y"
    { /*$$ = "(T_MOD %)";*/ ;}
    break;

  case 116:

/* Line 1455 of yacc.c  */
#line 295 "decaflex.y"
    { /*$$ = "(T_MULT *)";*/ ;}
    break;

  case 117:

/* Line 1455 of yacc.c  */
#line 296 "decaflex.y"
    { /*$$ = "(T_NEQ !=)";*/ ;}
    break;

  case 118:

/* Line 1455 of yacc.c  */
#line 298 "decaflex.y"
    { /*$$ = "(T_NOT !)";*/ ;}
    break;

  case 119:

/* Line 1455 of yacc.c  */
#line 300 "decaflex.y"
    { /*$$ = "(T_OR or)";*/ ;}
    break;

  case 120:

/* Line 1455 of yacc.c  */
#line 301 "decaflex.y"
    { /*$$ = "(T_PLUS +)";*/ ;}
    break;

  case 121:

/* Line 1455 of yacc.c  */
#line 302 "decaflex.y"
    { s.out();/*$$ = "(T_RCB })";*/ ;}
    break;

  case 122:

/* Line 1455 of yacc.c  */
#line 303 "decaflex.y"
    { /*$$ = "(T_RETURN return)";*/ ;}
    break;

  case 123:

/* Line 1455 of yacc.c  */
#line 304 "decaflex.y"
    { /*$$ = "(T_RIGHTSHIFT >>)";*/ ;}
    break;

  case 124:

/* Line 1455 of yacc.c  */
#line 305 "decaflex.y"
    { /*$$ = "(T_ROT rot)";*/ ;}
    break;

  case 125:

/* Line 1455 of yacc.c  */
#line 306 "decaflex.y"
    { /*$$ = "(T_RPAREN \\))";*/ ;}
    break;

  case 126:

/* Line 1455 of yacc.c  */
#line 307 "decaflex.y"
    { /*$$ = "(T_RSB ])";*/ ;}
    break;

  case 127:

/* Line 1455 of yacc.c  */
#line 308 "decaflex.y"
    { /*$$ = "(T_SEMICOLON ;)";*/ ;}
    break;

  case 128:

/* Line 1455 of yacc.c  */
#line 309 "decaflex.y"
    { /*$$ = "(T_WHILE while)";*/ ;}
    break;



/* Line 1455 of yacc.c  */
#line 2611 "parser.cpp"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined(yyoverflow) || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}



/* Line 1675 of yacc.c  */
#line 312 "decaflex.y"


void yyerror(char *s)
{
	string msg(s);
	cerr << s << endl;
}

int main()
{
	try{
		yydebug = 0;
		cout << ".data"<< endl;
		cout << ".text"<< endl;
		cout << ".globl main"<< endl;
		yyparse();
	}
	catch (const char *s)
	{
		string err(s);
		cerr << err << endl;
	}
	return 0;
}

