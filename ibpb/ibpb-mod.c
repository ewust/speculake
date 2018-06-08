#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/proc_fs.h>
#include <asm/uaccess.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Eric Wustrow");
MODULE_DESCRIPTION("Time IBPB");
MODULE_VERSION("0.01");


#define PRED_CMD_IBPB           (1 << 0)
#define MSR_IA32_PRED_CMD       0x00000049
#define X86_FEATURE_USE_IBPB    ( 7*32+21)

uint64_t rdtscp(void)
{
    uint32_t low, high, aux=0;
    asm volatile("rdtscp\n" : "=a" (low), "=d" (high), "=c" (aux));
    return ((((uint64_t)high) << 32) | (uint64_t)low);
}

static __always_inline
void write_msr(unsigned int msr, uint64_t val, unsigned int feature)
{
    asm volatile(
        "wrmsr\n"
        : : "c" (msr),
            "a" ((uint32_t)val),
            "d" ((uint32_t)(val >> 32))//,
            //[feature] "i" (feature)
        : "memory");
}

void ibpb(void)
{
    uint64_t val = PRED_CMD_IBPB;
    write_msr(MSR_IA32_PRED_CMD, val, X86_FEATURE_USE_IBPB);
}

static ssize_t read_ibpb(struct file *filp, char __user *buf, size_t count, loff_t *offp)
{
    uint64_t t0, t1;

    if (count != sizeof(uint64_t)) {
        return -EINVAL;
    }

    t0 = rdtscp();
    ibpb();
    t1 = rdtscp();

    t1 -= t0;

    copy_to_user(buf, &t1, count);
    return count;
}

static struct file_operations proc_fops = {
    .owner =  THIS_MODULE,
    .read = read_ibpb,
};

static int __init lkm_ibpb_init(void) {
    uint64_t t0, t1;

    proc_create("ibpb", 0, NULL, &proc_fops);

    t0 = rdtscp();
    ibpb();
    t1 = rdtscp();
    printk(KERN_INFO "IBPB took %lld cycles\n", t1-t0);
    return 0;
}

static void __exit lkm_ibpb_exit(void) {
    remove_proc_entry("ibpb", NULL);
    printk(KERN_INFO "Unloading IBPB test\n");
}

module_init(lkm_ibpb_init);
module_exit(lkm_ibpb_exit);
