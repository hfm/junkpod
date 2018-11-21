#include "http_core.h"
#include "http_protocol.h"
#include "apr_strings.h"

static void register_hooks(apr_pool_t *pool);
static int example_handler(request_rec *r);

module AP_MODULE_DECLARE_DATA example_module =
{
    STANDARD20_MODULE_STUFF,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    register_hooks
};

static void register_hooks(apr_pool_t *pool)
{
    /* Call a function that initializes some stuff */
    example_init_function(pool);

    /* Create a hook in the request handelr, so we get called when a request arrives */
    ap_hook_handler(example_handler, NULL, NULL, APR_HOOK_LAST);
}

static int example_handler(request_rec *r)
{
    const char *original = "You can't edit this!";
    char *copy;
    int *integers;

    /* Allocate space for 10 integer values and set them all to zero. */
    integers = apr_pcalloc(r->pool, sizeof(int)*10);

    /* Create a copy of the 'original' variable that we can edit. */
    copy = apr_pstrdup(r->pool, original);
    return OK;
}
