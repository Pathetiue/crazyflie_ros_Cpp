/* Produced by CVXGEN, 2019-09-24 21:44:39 -0400.  */
/* CVXGEN is Copyright (C) 2006-2017 Jacob Mattingley, jem@cvxgen.com. */
/* The code in this file is Copyright (C) 2006-2017 Jacob Mattingley. */
/* CVXGEN, or solvers produced by CVXGEN, cannot be used for commercial */
/* applications without prior written permission from Jacob Mattingley. */

/* Filename: solver.h. */
/* Description: Header file with relevant definitions. */
#ifndef SOLVER_H
#define SOLVER_H
/* Uncomment the next line to remove all library dependencies. */
/*#define ZERO_LIBRARY_MODE */
#ifdef MATLAB_MEX_FILE
/* Matlab functions. MATLAB_MEX_FILE will be defined by the mex compiler. */
/* If you are not using the mex compiler, this functionality will not intrude, */
/* as it will be completely disabled at compile-time. */
#include "mex.h"
#else
#ifndef ZERO_LIBRARY_MODE
#include <stdio.h>
#endif
#endif

#ifdef __cplusplus
 extern "C" {
#endif

/* Space must be allocated somewhere (testsolver.c, csolve.c or your own */
/* program) for the global variables vars, params, work and settings. */
/* At the bottom of this file, they are externed. */
#ifndef ZERO_LIBRARY_MODE
#include <math.h>
#define pm(A, m, n) printmatrix(#A, A, m, n, 1)
#endif
typedef struct Params_t {
  double R[9];
  double x_d[6];
  double Q[36];
  double Q_final[36];
  double A[36];
  double x_0[6];
  double B[18];
  double u_min[3];
  double u_max[3];
  double *x[1];
} Params;
typedef struct Vars_t {
  double *u_0; /* 3 rows. */
  double *x_1; /* 6 rows. */
  double *u_1; /* 3 rows. */
  double *x_2; /* 6 rows. */
  double *u_2; /* 3 rows. */
  double *x_3; /* 6 rows. */
  double *u_3; /* 3 rows. */
  double *x_4; /* 6 rows. */
  double *u_4; /* 3 rows. */
  double *x_5; /* 6 rows. */
  double *u_5; /* 3 rows. */
  double *x_6; /* 6 rows. */
  double *u_6; /* 3 rows. */
  double *x_7; /* 6 rows. */
  double *u_7; /* 3 rows. */
  double *x_8; /* 6 rows. */
  double *u_8; /* 3 rows. */
  double *x_9; /* 6 rows. */
  double *u_9; /* 3 rows. */
  double *x_10; /* 6 rows. */
  double *u_10; /* 3 rows. */
  double *x_11; /* 6 rows. */
  double *u_11; /* 3 rows. */
  double *x_12; /* 6 rows. */
  double *u_12; /* 3 rows. */
  double *x_13; /* 6 rows. */
  double *u_13; /* 3 rows. */
  double *x_14; /* 6 rows. */
  double *u_14; /* 3 rows. */
  double *x_15; /* 6 rows. */
  double *u_15; /* 3 rows. */
  double *x_16; /* 6 rows. */
  double *u_16; /* 3 rows. */
  double *x_17; /* 6 rows. */
  double *u_17; /* 3 rows. */
  double *x_18; /* 6 rows. */
  double *u_18; /* 3 rows. */
  double *x_19; /* 6 rows. */
  double *u[19];
  double *x[20];
} Vars;
typedef struct Workspace_t {
  double h[114];
  double s_inv[114];
  double s_inv_z[114];
  double b[114];
  double q[171];
  double rhs[513];
  double x[513];
  double *s;
  double *z;
  double *y;
  double lhs_aff[513];
  double lhs_cc[513];
  double buffer[513];
  double buffer2[513];
  double KKT[2073];
  double L[2232];
  double d[513];
  double v[513];
  double d_inv[513];
  double gap;
  double optval;
  double ineq_resid_squared;
  double eq_resid_squared;
  double block_33[1];
  /* Pre-op symbols. */
  double quad_729936371712[1];
  int converged;
} Workspace;
typedef struct Settings_t {
  double resid_tol;
  double eps;
  int max_iters;
  int refine_steps;
  int better_start;
  /* Better start obviates the need for s_init and z_init. */
  double s_init;
  double z_init;
  int verbose;
  /* Show extra details of the iterative refinement steps. */
  int verbose_refinement;
  int debug;
  /* For regularization. Minimum value of abs(D_ii) in the kkt D factor. */
  double kkt_reg;
} Settings;
extern Vars vars;
extern Params params;
extern Workspace work;
extern Settings settings;
/* Function definitions in ldl.c: */
void ldl_solve(double *target, double *var);
void ldl_factor(void);
double check_factorization(void);
void matrix_multiply(double *result, double *source);
double check_residual(double *target, double *multiplicand);
void fill_KKT(void);

/* Function definitions in matrix_support.c: */
void multbymA(double *lhs, double *rhs);
void multbymAT(double *lhs, double *rhs);
void multbymG(double *lhs, double *rhs);
void multbymGT(double *lhs, double *rhs);
void multbyP(double *lhs, double *rhs);
void fillq(void);
void fillh(void);
void fillb(void);
void pre_ops(void);

/* Function definitions in solver.c: */
double eval_gap(void);
void set_defaults(void);
void setup_pointers(void);
void setup_indexed_params(void);
void setup_indexed_optvars(void);
void setup_indexing(void);
void set_start(void);
double eval_objv(void);
void fillrhs_aff(void);
void fillrhs_cc(void);
void refine(double *target, double *var);
double calc_ineq_resid_squared(void);
double calc_eq_resid_squared(void);
void better_start(void);
void fillrhs_start(void);
long solve(void);

/* Function definitions in testsolver.c: */
int main(int argc, char **argv);
void load_default_data(void);

/* Function definitions in util.c: */
void tic(void);
float toc(void);
float tocq(void);
void printmatrix(char *name, double *A, int m, int n, int sparse);
double unif(double lower, double upper);
float ran1(long*idum, int reset);
float randn_internal(long *idum, int reset);
double randn(void);
void reset_rand(void);

#ifdef __cplusplus
 }
#endif

#endif
