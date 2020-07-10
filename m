Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0555121C096
	for <lists+freedreno@lfdr.de>; Sat, 11 Jul 2020 01:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70816E1A5;
	Fri, 10 Jul 2020 23:11:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678306E1A5
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jul 2020 23:11:55 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id x62so5809338qtd.3
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jul 2020 16:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=54ZF/DC2XdS/e/GhSUjcB8qoFITR5sUGRvRbus64HRQ=;
 b=xga4wvwbBEC04/iZpEdO+nhnKTnoWlbbOevlszj0kqf16I1GjGr2sWmPrl1s1Ac8/T
 xM9JsU8YxXMfBlBfQ1zelM4fXOPxVB7GA2UJmQDJq3w4iKA4J2pKNLyKeqHSJw60q3+5
 fj+WGPSBLucdRgsJmDXtQuij5Y/RI7THik614lchFwEy3G5tAHFMXaRm8cEA6R6qFMsh
 18GHMINFtD+gVYbEE7G68OfsmO0mmB6KO9PgQhua53yFHm8B2LCo6u3nyIXIwifazrn7
 +/xvSRKtruklY3AJhwmfVjeyra2puvk+nh63Dzt1kXBlrLfxVje+VVjUv0nlpETSXQ50
 HSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=54ZF/DC2XdS/e/GhSUjcB8qoFITR5sUGRvRbus64HRQ=;
 b=at3p3X7HjCG0KMeAR2z+1N9FMNbGYGtDiPw0vxCKyhdUWvnVPn3I347X7NwOkCs3vo
 nZdbgePgAsTgV6qUjD5s4H2XHD0gxw1V1gGL2bQF3Ao7b9zKcaJFxvMRgokHXPIhKh0p
 AFJGiUpG1LGa3+hxhqz8fZknSup4+ZovSMwGRfKEKFreXiC3ha1SwaXZLjg+bY7bdjwg
 4f7ZYdnOokQKOWkHNfnI/oOG2G3sfkz8JQ3OMkWZ9SFdUKRBDZN9II5w6M1QUHltHThI
 PzPMx76l/39bgAWvZd5KXPUrLG4hD6VWXe305RNiCw3d3++Grz5Om3KCtCC/7xr95rpi
 zBkw==
X-Gm-Message-State: AOAM530dkaMioGO/gORD/VO1+ERDE8OgwnVQTMqdrenqj+SLrQ6mR96d
 79AqB9B6Ivt7G2CSXWbsdZ4l6A==
X-Google-Smtp-Source: ABdhPJyN68zcsLWPlfYAlpLa0B3HI+vp8uJq0nlRnX2FePWUTrlODNZIEv3VOJ1fuHsSCLi9SZGELQ==
X-Received: by 2002:ac8:674c:: with SMTP id n12mr67421310qtp.312.1594422714572; 
 Fri, 10 Jul 2020 16:11:54 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id k14sm10155785qtb.38.2020.07.10.16.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 16:11:54 -0700 (PDT)
To: Rob Clark <robdclark@gmail.com>
References: <20200709143404.11876-1-jonathan@marek.ca>
 <CAF6AEGsQFVptXi2wgx_JipyK0AOSUBHOHaDmRF_gG+hSH8mF5A@mail.gmail.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <3729cda9-2d02-c213-c31a-d3e1316798f8@marek.ca>
Date: Fri, 10 Jul 2020 19:10:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAF6AEGsQFVptXi2wgx_JipyK0AOSUBHOHaDmRF_gG+hSH8mF5A@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH v2] drm/msm: handle for EPROBE_DEFER for
 of_icc_get
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
Cc: Fabio Estevam <festevam@gmail.com>, David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Brian Masney <masneyb@onstation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 7/9/20 11:15 AM, Rob Clark wrote:
> On Thu, Jul 9, 2020 at 7:35 AM Jonathan Marek <jonathan@marek.ca> wrote:
>>
>> Check for errors instead of silently not using icc if the msm driver
>> probes before the interconnect driver.
>>
>> Allow ENODATA for ocmem path, as it is optional and this error
>> is returned when "gfx-mem" path is provided but not "ocmem".
>>
>> Remove the WARN_ON in msm_gpu_cleanup because INIT_LIST_HEAD won't have
>> been called on the list yet when going through the defer error path.
>>
>> Changes in v2:
>> * Changed to not only check for EPROBE_DEFER
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 17 ++++++++++++++---
>>   drivers/gpu/drm/msm/msm_gpu.c           |  2 --
>>   2 files changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> index 89673c7ed473..0f5217202eb5 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -940,12 +940,20 @@ static int adreno_get_pwrlevels(struct device *dev,
>>                   */
>>                  gpu->icc_path = of_icc_get(dev, NULL);
>>          }
>> -       if (IS_ERR(gpu->icc_path))
>> +       if (IS_ERR(gpu->icc_path)) {
>> +               ret = PTR_ERR(gpu->icc_path);
>>                  gpu->icc_path = NULL;
>> +               return ret;
>> +       }
>>
>>          gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
>> -       if (IS_ERR(gpu->ocmem_icc_path))
>> +       if (IS_ERR(gpu->ocmem_icc_path)) {
>> +               ret = PTR_ERR(gpu->ocmem_icc_path);
>>                  gpu->ocmem_icc_path = NULL;
>> +               /* allow -ENODATA, ocmem icc is optional */
>> +               if (ret != -ENODATA)
>> +                       return ret;
>> +       }
>>
>>          return 0;
>>   }
>> @@ -996,6 +1004,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>          struct adreno_platform_config *config = pdev->dev.platform_data;
>>          struct msm_gpu_config adreno_gpu_config  = { 0 };
>>          struct msm_gpu *gpu = &adreno_gpu->base;
>> +       int ret;
>>
>>          adreno_gpu->funcs = funcs;
>>          adreno_gpu->info = adreno_info(config->rev);
>> @@ -1007,7 +1016,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>
>>          adreno_gpu_config.nr_rings = nr_rings;
>>
>> -       adreno_get_pwrlevels(&pdev->dev, gpu);
>> +       ret = adreno_get_pwrlevels(&pdev->dev, gpu);
>> +       if (ret)
>> +               return ret;
>>
>>          pm_runtime_set_autosuspend_delay(&pdev->dev,
>>                  adreno_gpu->info->inactive_period);
>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>> index a22d30622306..ccf9a0dd9706 100644
>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>> @@ -959,8 +959,6 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
>>
>>          DBG("%s", gpu->name);
>>
>> -       WARN_ON(!list_empty(&gpu->active_list));
>> -
> 
> hmm, not a huge fan of removing the WARN_ON().. can we just init the
> list head earlier?
> 

There doesn't seem to be a nice way of doing that. Would it be 
reasonable to instead detect that msm_gpu_init wasn't called (checking 
if gpu->dev is NULL?), and just skip the msm_gpu_cleanup() call in 
adreno_gpu_cleanup() in that case?

> BR,
> -R
> 
>>          for (i = 0; i < ARRAY_SIZE(gpu->rb); i++) {
>>                  msm_ringbuffer_destroy(gpu->rb[i]);
>>                  gpu->rb[i] = NULL;
>> --
>> 2.26.1
>>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
