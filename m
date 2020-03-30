Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C841983C5
	for <lists+freedreno@lfdr.de>; Mon, 30 Mar 2020 20:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8337C6E47E;
	Mon, 30 Mar 2020 18:55:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCEBD6E47E
 for <freedreno@lists.freedesktop.org>; Mon, 30 Mar 2020 18:55:39 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id s10so11760748vsi.9
 for <freedreno@lists.freedesktop.org>; Mon, 30 Mar 2020 11:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g1gheYJXxxb4j05ZqgCh1WDjANy6+6oZN8fr+WGCLZA=;
 b=PF9JCctEmZbycQHUREYCFpB93WZDn96lnP3Obqh6+qo2li0m+PomDclPw436h+k5nE
 HPlEJnAMbHLsbEzWSUiQzAE/czvmUKvzYnBU/0y75CHLnzbcOLHIgDqMclZpnP93bXel
 +PqZr9hZkasdPSR3g/8xLCfssCG0GE51W/VMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g1gheYJXxxb4j05ZqgCh1WDjANy6+6oZN8fr+WGCLZA=;
 b=PUzt3lpnOVJ2MlXgPhjI3ZvKeZuu1OVaHdb/nng1LbVHUrtzgnHNt4nwbmGk7T3fDr
 eAnW6lWakFvmiTSG1xDCR1NHjVQXKCZXAU/IRxDg/hQWbrehYLl9fQy+vKO6Fz5a/CLm
 wG391nOjaueO7+RpdsQLS9lHDGF4QTQvnEf06aYfoQ317C5dYalYpsh66/iKoaWB7xs1
 RDdQl0NmKx1DS489fiAvoZOiCnYFoGqd+tcXQsS0bv+RNBjPXn112G0Hqw9x3hUliIwN
 cxVSg6qjZRuHfkBDORlVOf5d8Suea7757JuZxHDlbQcte2ugntc+HMltQqSRPCdj8zJp
 qHNg==
X-Gm-Message-State: AGi0PuZbTN8jNV+OoCglGFaGjgjy1QO+IDA0mIU0hwG2hDnacFkWaoi5
 o2iGYRTzqwzVm8OtYDA2GJBGOrp7CGU=
X-Google-Smtp-Source: APiQypLhIMhILD9zya2Gv1vH9XMrZVI4h5BSFNZhrkTxbYLrckT9VxcbdHmA3YSEYK4ieZNM7Iq2Mg==
X-Received: by 2002:a67:c31e:: with SMTP id r30mr9720915vsj.197.1585594538374; 
 Mon, 30 Mar 2020 11:55:38 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51])
 by smtp.gmail.com with ESMTPSA id l73sm3520915vkl.27.2020.03.30.11.55.37
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2020 11:55:37 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id x82so11724679vsc.12
 for <freedreno@lists.freedesktop.org>; Mon, 30 Mar 2020 11:55:37 -0700 (PDT)
X-Received: by 2002:a67:2c81:: with SMTP id s123mr9594577vss.198.1585594536858; 
 Mon, 30 Mar 2020 11:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <1585559008-12705-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1585559008-12705-1-git-send-email-kalyan_t@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 30 Mar 2020 11:55:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WcFahUm8jK+QTwx7BkCb3GTgKqFLP_pdqWBqN-zawrbw@mail.gmail.com>
Message-ID: <CAD=FV=WcFahUm8jK+QTwx7BkCb3GTgKqFLP_pdqWBqN-zawrbw@mail.gmail.com>
To: Kalyan Thota <kalyan_t@codeaurora.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: ensure device suspend happens
 during PM sleep
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, travitej@codeaurora.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 30, 2020 at 2:04 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> "The PM core always increments the runtime usage counter
> before calling the ->suspend() callback and decrements it
> after calling the ->resume() callback"
>
> DPU and DSI are managed as runtime devices. When
> suspend is triggered, PM core adds a refcount on all the
> devices and calls device suspend, since usage count is
> already incremented, runtime suspend was not getting called
> and it kept the clocks on which resulted in target not
> entering into XO shutdown.
>
> Add changes to manage runtime devices during pm sleep.
>
> Changes in v1:
>  - Remove unnecessary checks in the function
>    _dpu_kms_disable_dpu (Rob Clark).
>
> Changes in v2:
>  - Avoid using suspend_late to reset the usagecount
>    as suspend_late might not be called during suspend
>    call failures (Doug).
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 33 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_drv.c           |  4 ++++
>  drivers/gpu/drm/msm/msm_kms.h           |  2 ++
>  3 files changed, 39 insertions(+)

I am still 100% baffled by your patch and I never did quite understand
your response to my previous comments [1].  I think you're saying that
the problem you were facing is that if you call "suspend" but never
called "runtime_suspend" that the device stays active.  Is that right?
 If that's true, did you try something like this suggestion I made?

SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)


> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ce19f1d..2343cbd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -26,6 +26,7 @@
>  #include "dpu_encoder.h"
>  #include "dpu_plane.h"
>  #include "dpu_crtc.h"
> +#include "dsi.h"
>
>  #define CREATE_TRACE_POINTS
>  #include "dpu_trace.h"
> @@ -325,6 +326,37 @@ static void dpu_kms_disable_commit(struct msm_kms *kms)
>         pm_runtime_put_sync(&dpu_kms->pdev->dev);
>  }
>
> +static void _dpu_kms_disable_dpu(struct msm_kms *kms)
> +{
> +       struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> +       struct drm_device *dev = dpu_kms->dev;
> +       struct msm_drm_private *priv = dev->dev_private;
> +       struct msm_dsi *dsi;
> +       int i;
> +
> +       dpu_kms_disable_commit(kms);
> +
> +       for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
> +               if (!priv->dsi[i])
> +                       continue;
> +               dsi = priv->dsi[i];
> +               pm_runtime_put_sync(&dsi->pdev->dev);
> +       }
> +       pm_runtime_put_sync(dev->dev);
> +
> +       /* Increment the usagecount without triggering a resume */
> +       pm_runtime_get_noresume(dev->dev);
> +
> +       pm_runtime_get_noresume(&dpu_kms->pdev->dev);
> +
> +       for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
> +               if (!priv->dsi[i])
> +                       continue;
> +               dsi = priv->dsi[i];
> +               pm_runtime_get_noresume(&dsi->pdev->dev);
> +       }
> +}

My pm_runtime knowledge is pretty weak sometimes, but the above
function looks crazy.  Maybe it's just me not understanding, but can
you please summarize what you're trying to accomplish?

-Doug

[1] https://lore.kernel.org/r/114130f68c494f83303c51157e2c5bfa@codeaurora.org
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
