#include "http_core.h"
#include "http_protocol.h"

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
    /* Create a hook in the request handelr, so we get called when a request arrives */
    ap_hook_handler(example_handler, NULL, NULL, APR_HOOK_LAST);
}

static int example_handler(request_rec *r)
{
    return HTTP_NOT_FOUND;
}
