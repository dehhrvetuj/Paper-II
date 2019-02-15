/********************************************************************
   UDF for averaging DPM concentration and displaying it in the     
   console at the end of the current iteration or time step  
*********************************************************************/

#include "udf.h"
#include <stdlib.h>
#include <stdio.h>


/*********************************************************************
	This UDF can be used for parallel run.
	NOTE: '%e' should be used instead of '%f' 
	at Line 74 if DPM concentration is to be output. 
*********************************************************************/
 
static real var = 0.0;
static real vol = 0.0;

static const real SIZE[ND_ND] = {0.4,0.6,0.4};
static const real POS[ND_ND] = {3.50,4.46,1.2};

int Weight(const real x[ND_ND], const real pos[ND_ND]);

DEFINE_EXECUTE_AT_END(vol_ave_var)
{
	face_t f;
	cell_t c;
	Thread *t;
	Domain *domain;
	
	real c_x[ND_ND] = {0.0,0.0,0.0};	

	real c_var = 0.0;
	real c_vol = 0.0;
	
	var = 0.0;
	vol = 0.0;

	domain = Get_Domain(1);

	#if !RP_HOST	/* serial or node; excluding host */
	
	thread_loop_c(t,domain)	/* loop over all cells in the domain */
	{
		if (FLUID_THREAD_P(t))
		{	
			begin_c_loop_int(c,t)	/* looping over interior cells if parallel; loop all cells if serial */
			{
				C_CENTROID(c_x,c,t);

				c_vol = C_VOLUME(c,t);
				c_var = C_DPMS_CONCENTRATION(c,t);

				c_vol *= Weight(c_x,POS);

				vol += c_vol;
				var += c_var*c_vol;
			}
			end_c_loop_int (c,t)
		}
	}
	#endif
	
    
    #if RP_NODE     /* only parallel compute nodes involved here; perform node synchronized action here */        
        var = PRF_GRSUM1(var);
		vol = PRF_GRSUM1(vol);
    #endif	
	
	if ( vol > 1E-16 )
	{
		var /= vol;
		Message0("Volume Averaged Variable at (%f %f %f) is %e\n",POS[0],POS[1],POS[2],var); 
	}
	else
	{
		Message0("\nZero volume - wrong specified locations at %f %f %f\n",POS[0],POS[1],POS[2]);
	}	

}


int Weight(const real x[ND_ND], const real pos[ND_ND])
{
	int flag = 1;
	int dim = 0;
	
	for	(dim=0; dim<ND_ND; dim++)
	{
		if (fabs(x[dim]-pos[dim]) <= SIZE[dim]/2.0)
			flag *= 1;
		else
			flag *= 0;
	}
	
	return  flag;
} 
