Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9C42FE242
	for <lists+freedreno@lfdr.de>; Thu, 21 Jan 2021 07:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDED6E50E;
	Thu, 21 Jan 2021 06:06:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m42-8.mailgun.net (m42-8.mailgun.net [69.72.42.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010AA6E50E
 for <freedreno@lists.freedesktop.org>; Thu, 21 Jan 2021 06:06:39 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1611209201; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=EEQI0tFXhGI6CiVUJKLBMVeNZjfshm+qc4ajCowtZ14=;
 b=h+XZvRCqeOPs7oKbaD+ltsmRrSrdBK1BdZ9r5iewYJ5r30oSWg9bk1sysyBAKEgMiIlWpTrE
 hbMblGtboxfNSfhU21MrcpBxzJmQO3XnvbR69Iv+puMBUejwaJnpCPFMFc1kgfsH8HeNzQPm
 rpB0GmwfnWlJzMZiSkl8pv0EQf4=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 600919e3beacd1a252bb1ff2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 Jan 2021 06:06:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8FBFEC43462; Thu, 21 Jan 2021 06:06:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9D90AC433ED;
 Thu, 21 Jan 2021 06:06:24 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 21 Jan 2021 11:36:24 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
In-Reply-To: <CAF6AEGszGhdKKq+tW0hKxiE22_+9MUh1hXg3p+7XDo_G51pmSg@mail.gmail.com>
References: <cover.1610366113.git.saiprakash.ranjan@codeaurora.org>
 <c5848b1c15765c8d6db7de2305baac856e818f12.1610366113.git.saiprakash.ranjan@codeaurora.org>
 <CAF6AEGszGhdKKq+tW0hKxiE22_+9MUh1hXg3p+7XDo_G51pmSg@mail.gmail.com>
Message-ID: <b199dd6367154e29c0619d49d6d55b7c@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/a6xx: Create an A6XX GPU
 specific address space
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 Kristian H Kristensen <hoegsberg@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 angelogioacchino.delregno@somainline.org,
 freedreno <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2021-01-20 21:48, Rob Clark wrote:
> On Mon, Jan 11, 2021 at 4:04 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> A6XX GPUs have support for last level cache(LLC) also known
>> as system cache and need to set the bus attributes to
>> use it. Currently we use a generic adreno iommu address space
>> implementation which are also used by older GPU generations
>> which do not have LLC and might introduce issues accidentally
>> and is not clean in a way that anymore additions of GPUs
>> supporting LLC would have to be guarded under ifdefs. So keep
>> the generic code separate and make the address space creation
>> A6XX specific. We also have a helper to set the llc attributes
>> so that if the newer GPU generations do support them, we can
>> use it instead of open coding domain attribute setting for each
>> GPU.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 46 
>> ++++++++++++++++++++++++-
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 23 +++++--------
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  7 ++--
>>  3 files changed, 55 insertions(+), 21 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c 
>> b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 3b798e883f82..3c7ad51732bb 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1239,6 +1239,50 @@ static unsigned long a6xx_gpu_busy(struct 
>> msm_gpu *gpu)
>>         return (unsigned long)busy_time;
>>  }
>> 
>> +static struct msm_gem_address_space *
>> +a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device 
>> *pdev)
>> +{
>> +       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +       struct iommu_domain *iommu;
>> +       struct msm_mmu *mmu;
>> +       struct msm_gem_address_space *aspace;
>> +       u64 start, size;
>> +
>> +       iommu = iommu_domain_alloc(&platform_bus_type);
>> +       if (!iommu)
>> +               return NULL;
>> +
>> +       /*
>> +        * This allows GPU to set the bus attributes required to use 
>> system
>> +        * cache on behalf of the iommu page table walker.
>> +        */
>> +       if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
>> +               adreno_set_llc_attributes(iommu);
>> +
>> +       mmu = msm_iommu_new(&pdev->dev, iommu);
>> +       if (IS_ERR(mmu)) {
>> +               iommu_domain_free(iommu);
>> +               return ERR_CAST(mmu);
>> +       }
>> +
>> +       /*
>> +        * Use the aperture start or SZ_16M, whichever is greater. 
>> This will
>> +        * ensure that we align with the allocated pagetable range 
>> while still
>> +        * allowing room in the lower 32 bits for GMEM and whatnot
>> +        */
>> +       start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
>> +       size = iommu->geometry.aperture_end - start + 1;
>> +
>> +       aspace = msm_gem_address_space_create(mmu, "gpu",
>> +               start & GENMASK_ULL(48, 0), size);
>> +
>> +       if (IS_ERR(aspace) && !IS_ERR(mmu))
>> +               mmu->funcs->destroy(mmu);
>> +
>> +       return aspace;
>> +}
>> +
>>  static struct msm_gem_address_space *
>>  a6xx_create_private_address_space(struct msm_gpu *gpu)
>>  {
>> @@ -1285,7 +1329,7 @@ static const struct adreno_gpu_funcs funcs = {
>>                 .gpu_state_get = a6xx_gpu_state_get,
>>                 .gpu_state_put = a6xx_gpu_state_put,
>>  #endif
>> -               .create_address_space = 
>> adreno_iommu_create_address_space,
>> +               .create_address_space = a6xx_create_address_space,
>>                 .create_private_address_space = 
>> a6xx_create_private_address_space,
>>                 .get_rptr = a6xx_get_rptr,
>>         },
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c 
>> b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> index b35914de1b27..0f184c3dd9d9 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -186,11 +186,18 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, 
>> u32 pasid)
>>         return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, 
>> pasid);
>>  }
>> 
>> +void adreno_set_llc_attributes(struct iommu_domain *iommu)
>> +{
>> +       struct io_pgtable_domain_attr pgtbl_cfg;
>> +
>> +       pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
> 
> btw, since quirks is the only field in the struct currently, this is
> ok.  But better practice to do something like:
> 
>         struct io_pgtable_domain_attr pgtbl_cfg = {
>                 .quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA,
>         };
> 
> which will zero-initialize any additional fields which might be added
> later, rather than inherit random garbage from the stack.
> 

Right, I will correct this.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
