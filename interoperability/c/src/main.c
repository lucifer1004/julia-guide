#include <julia.h>
JULIA_DEFINE_FAST_TLS // 如果希望提高代码运行速度，在一个可执行程序中定义这一选项且仅定义一次。

int main(int argc, char *argv[])
{
    /* 初始化 Julia 环境（必须进行这一步骤） */
    jl_init();

    /* 从 Julia 的 `Main` 模块中获取 `sqrt` 函数 */
    jl_value_t *jl_sqrt = jl_get_function(jl_main_module, "sqrt");

    /* 调用 `sqrt` 函数。这里需要对 C 中的数值进行装箱。 */
    jl_value_t *result = jl_call1(jl_sqrt, jl_box_float64(2.0));

    /* 输出结果。这里需要对 Julia 函数的运行结果进行拆箱。 */
    printf("sqrt(2.0) = %f", jl_unbox_float64(result));

    /* 清理并推出 Julia 环境（强烈建议进行这一步骤） */
    jl_atexit_hook(0);
    return 0;
}
