Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264F6199A9B
	for <lists+freedreno@lfdr.de>; Tue, 31 Mar 2020 18:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C990E6E85B;
	Tue, 31 Mar 2020 16:00:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8516E85B
 for <freedreno@lists.freedesktop.org>; Tue, 31 Mar 2020 16:00:21 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id q8so5831873vka.8
 for <freedreno@lists.freedesktop.org>; Tue, 31 Mar 2020 09:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/GMoukOL0KHHE8wEvMLxzDD6OsKNGd37py8qqC7r4eI=;
 b=Mdyk4hIdWk9iaKwb4+KZqwkLAVAFtwZV/5MocNo0ZUVnr90atdWYJplVeGt1osWlMJ
 tsGG0jSCSuDfx6UCog8dLugU+8D/yjeNzKb4ikMbN1zz2tOBe/7yHSe5i4d0VKOn18dH
 u6KGIqmobDm7Jdik275lPhk3ZHks5e56i9mV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/GMoukOL0KHHE8wEvMLxzDD6OsKNGd37py8qqC7r4eI=;
 b=cHbjLifU+lBBocQtF4/83Ydvgc5VFc3cLr5dXShkX1MoMw4YgxDhNL/8Xvi8a07Vy0
 Bd10v8wR1vgu3hqJ1f2KrFRWEzNgFUbeo+O4+2x5ChIiCstO8hWfs8CWpvDFE5WtS7/5
 a7SvHAWiwXEE9F9q+dBnNvmY3zi8Xy5OSf+uT8aXQOb1HQ4pKTkjJb77qSJm5otbNwZT
 lcFvho9sRWKIxl0qaWdm9D/WQB7mRdZSaXalnPxn8Wtl93guyT6drs3kpzcsILRKJPi9
 7FfhJYttU7fi10kEQQmSqf2Dw0TIEVffsAAcJhes+I/a5yw0xGBPCq/s2KNx2DS7gwpx
 VwXQ==
X-Gm-Message-State: AGi0PuaS1OJFtuootrUsnl9Q3aLxoRIlRo19xe6Y7IHN4EH+mMOeiEsw
 P1fLN2I1KjWvrSvjBge54Cbj+xmFYzY=
X-Google-Smtp-Source: APiQypKXw0eijFu4ll78p17ZED9SsWMAZrUR6OJezzWpUzH9a4jYBjIKRRcxA+sRXdFC3BMcMJKFPQ==
X-Received: by 2002:a1f:4ac6:: with SMTP id x189mr12000451vka.50.1585670419993; 
 Tue, 31 Mar 2020 09:00:19 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47])
 by smtp.gmail.com with ESMTPSA id u6sm1853059vsl.5.2020.03.31.09.00.18
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2020 09:00:19 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id d23so7621158uak.1
 for <freedreno@lists.freedesktop.org>; Tue, 31 Mar 2020 09:00:18 -0700 (PDT)
X-Received: by 2002:ab0:7406:: with SMTP id r6mr3595683uap.22.1585670417847;
 Tue, 31 Mar 2020 09:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <1585663107-12406-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1585663107-12406-1-git-send-email-kalyan_t@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 31 Mar 2020 09:00:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Up4y6GUkJc8NNJBdC28L+6LvUs7pCUg4pyMCgHMGEkug@mail.gmail.com>
Message-ID: <CAD=FV=Up4y6GUkJc8NNJBdC28L+6LvUs7pCUg4pyMCgHMGEkug@mail.gmail.com>
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

On Tue, Mar 31, 2020 at 6:58 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
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
> Add changes to force suspend on runtime devices during pm sleep.
>
> Changes in v1:
>  - Remove unnecessary checks in the function
>     _dpu_kms_disable_dpu (Rob Clark).
>
> Changes in v2:
>  - Avoid using suspend_late to reset the usagecount
>    as suspend_late might not be called during suspend
>    call failures (Doug).
>
> Changes in v3:
>  - Use force suspend instead of managing device usage_count
>    via runtime put and get API's to trigger callbacks (Doug).
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 ++
>  drivers/gpu/drm/msm/dsi/dsi.c           | 2 ++
>  drivers/gpu/drm/msm/msm_drv.c           | 4 ++++
>  3 files changed, 8 insertions(+)

This looks much saner to me.  Thanks!  I assume it still works fine
for you?  I'm still no expert on how all the pieces of DRM drivers
work together, but at least there's not a bunch of strange fiddling
with pm_runtime state and hopefully it will avoid weird corner
cases...


> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ce19f1d..b886d9d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1123,6 +1123,8 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>
>  static const struct dev_pm_ops dpu_pm_ops = {
>         SET_RUNTIME_PM_OPS(dpu_runtime_suspend, dpu_runtime_resume, NULL)
> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +                               pm_runtime_force_resume)
>  };
>
>  static const struct of_device_id dpu_dt_match[] = {
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 55ea4bc2..62704885 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -161,6 +161,8 @@ static int dsi_dev_remove(struct platform_device *pdev)
>
>  static const struct dev_pm_ops dsi_pm_ops = {
>         SET_RUNTIME_PM_OPS(msm_dsi_runtime_suspend, msm_dsi_runtime_resume, NULL)
> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +                               pm_runtime_force_resume)
>  };
>
>  static struct platform_driver dsi_driver = {
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 7d985f8..2b8c99c 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1051,6 +1051,8 @@ static int msm_pm_suspend(struct device *dev)
>                 return ret;
>         }
>
> +       pm_runtime_force_suspend(dev);

nit: check return value of pm_runtime_force_suspend()?


> +
>         return 0;
>  }
>
> @@ -1063,6 +1065,8 @@ static int msm_pm_resume(struct device *dev)
>         if (WARN_ON(!priv->pm_state))
>                 return -ENOENT;
>
> +       pm_runtime_force_resume(dev);

nit: check return value of pm_runtime_force_resume()?


-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
