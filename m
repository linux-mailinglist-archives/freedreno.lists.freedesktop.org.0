Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1906D28BF1F
	for <lists+freedreno@lfdr.de>; Mon, 12 Oct 2020 19:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81106E0E7;
	Mon, 12 Oct 2020 17:40:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01576E0D8
 for <freedreno@lists.freedesktop.org>; Mon, 12 Oct 2020 17:40:38 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id x16so15021208pgj.3
 for <freedreno@lists.freedesktop.org>; Mon, 12 Oct 2020 10:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KPCBQGJFn0SxOT5QAxB8SIDlgbbUMf897x10D8eAgl4=;
 b=FvsoGzfEMAk7KCFRI3bHDorDFAvOk6IoDRmR44X64G369voHZ2IeqDSdfjZildjfP0
 RZZWKR2sJelEXoAwAsaPQaX6yTj4panBgXDHYIZbKV3H/3GIY/RypYvGctGRov0L0ehN
 BNuf+At3a39634/FaSGSTwgyMcM0EF42V5ZMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KPCBQGJFn0SxOT5QAxB8SIDlgbbUMf897x10D8eAgl4=;
 b=GjBx2X8KLEAQcIHgoyiNI77z5Hh6jlWf571+fWpzI0tBFYzOow6FfDCibkFtzGNGP3
 agUzYAcmpviey+8+WAaO1CQgWQ9UmcrohNHZPH2DxZRx9mIYW7UkBsmL7zae+GSSVGbj
 lH5CKf+XyVINVm/CrQrTc3smWxnftCKq2Cdz6XfeXbl90psnex4vy5Tm0sidGVAYG1bK
 C9cTWo15RGjF8O4xSfMvezwPWmgkqLCsrw92F/7As3bCFdoiN8rWdG6v4XU/EgLT5bHQ
 qik0FOXNqfzsszrjcLwdcR4w4EzrM4+O+Ecv5PDJ4qNa1dTvrQYpyromaCSDPU+WSbrg
 Jw/Q==
X-Gm-Message-State: AOAM530iDRDVU2amp3+U0WCCOPstaX71BnNmTPYUfJFYUCMdX+pVGdd6
 p1SJThE+gkyNZ+CjG7jHe4W/ew==
X-Google-Smtp-Source: ABdhPJx4n2kFy/ocJYOXijLTETMFaYerFoXQf6WoDsch6QEnFEuDBxSgbzWWb9ZwlRnPsbgGotlw/A==
X-Received: by 2002:a17:90a:5881:: with SMTP id
 j1mr11925578pji.56.1602524438208; 
 Mon, 12 Oct 2020 10:40:38 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
 by smtp.gmail.com with ESMTPSA id w74sm6240640pff.200.2020.10.12.10.40.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 10:40:37 -0700 (PDT)
Date: Mon, 12 Oct 2020 10:40:35 -0700
From: mka@chromium.org
To: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <20201012174035.GA44627@google.com>
References: <1602176947-17385-2-git-send-email-akhilpo@codeaurora.org>
 <20201009183640.GB1292413@google.com>
 <cab2105e-7a8c-988f-dcc1-056692a94e8b@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cab2105e-7a8c-988f-dcc1-056692a94e8b@codeaurora.org>
Subject: Re: [Freedreno] [2/2] drm/msm: Add support for GPU cooling
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
Cc: robh@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Oct 12, 2020 at 07:03:51PM +0530, Akhil P Oommen wrote:
> On 10/10/2020 12:06 AM, mka@chromium.org wrote:
> > Hi Akhil,
> > 
> > On Thu, Oct 08, 2020 at 10:39:07PM +0530, Akhil P Oommen wrote:
> > > Register GPU as a devfreq cooling device so that it can be passively
> > > cooled by the thermal framework.
> > > 
> > > Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> > > ---
> > >   drivers/gpu/drm/msm/msm_gpu.c | 13 ++++++++++++-
> > >   drivers/gpu/drm/msm/msm_gpu.h |  2 ++
> > >   2 files changed, 14 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > > index 55d1648..93ffd66 100644
> > > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > > @@ -14,6 +14,7 @@
> > >   #include <generated/utsrelease.h>
> > >   #include <linux/string_helpers.h>
> > >   #include <linux/devfreq.h>
> > > +#include <linux/devfreq_cooling.h>
> > >   #include <linux/devcoredump.h>
> > >   #include <linux/sched/task.h>
> > > @@ -107,9 +108,18 @@ static void msm_devfreq_init(struct msm_gpu *gpu)
> > >   	if (IS_ERR(gpu->devfreq.devfreq)) {
> > >   		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
> > >   		gpu->devfreq.devfreq = NULL;
> > > +		return;
> > >   	}
> > >   	devfreq_suspend_device(gpu->devfreq.devfreq);
> > > +
> > > +	gpu->cooling = of_devfreq_cooling_register(gpu->pdev->dev.of_node,
> > > +			gpu->devfreq.devfreq);
> > > +	if (IS_ERR(gpu->cooling)) {
> > > +		DRM_DEV_ERROR(&gpu->pdev->dev,
> > > +				"Couldn't register GPU cooling device\n");
> > > +		gpu->cooling = NULL;
> > > +	}
> > >   }
> > >   static int enable_pwrrail(struct msm_gpu *gpu)
> > > @@ -926,7 +936,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> > >   	msm_devfreq_init(gpu);
> > > -
> > >   	gpu->aspace = gpu->funcs->create_address_space(gpu, pdev);
> > >   	if (gpu->aspace == NULL)
> > > @@ -1005,4 +1014,6 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
> > >   		gpu->aspace->mmu->funcs->detach(gpu->aspace->mmu);
> > >   		msm_gem_address_space_put(gpu->aspace);
> > >   	}
> > > +
> > > +	devfreq_cooling_unregister(gpu->cooling);
> > 
> > Resources should be released in reverse order, otherwise the cooling device
> > could use resources that have already been freed.
> > Why do you think this is not the correct order? If you are thinking
> about devfreq struct, it is managed device resource.

I did not check specifically if changing the frequency really uses any of the
resources that are released previously, In any case it's not a good idea to
allow other parts of the kernel to use a half initialized/torn down device.
Even if it isn't a problem today someone could change the driver to use any
of these resources (or add a new one) in a frequency change, without even
thinking about the cooling device, just (rightfully) asuming that things are
set up and torn down in a sane order.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
