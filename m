Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1118510B83
	for <lists+freedreno@lfdr.de>; Tue, 26 Apr 2022 23:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A991410E0D0;
	Tue, 26 Apr 2022 21:50:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771DE10E0D0
 for <freedreno@lists.freedesktop.org>; Tue, 26 Apr 2022 21:50:44 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id s131so125362oie.1
 for <freedreno@lists.freedesktop.org>; Tue, 26 Apr 2022 14:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=pjo5mXaYQ8tuJfJZuu4TdSNcsnRgj5B9DLZVepdghWQ=;
 b=CQiwaHLvsuJ+ikXqofBkW8jrqC5ybJyYGda2ADk6TuRwRak/ZZrAWQr+Oc3GoIyUxL
 jAiQC84FRkg0/xIgPZYwLmYHAR/MiaTGiJk7wDC3ByWcpz0mVRL0o5yr3i5GeTh9YxTq
 TczVSgufsKZt2Yp2vNv7WM6j9VMoK+ZRTN5VI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=pjo5mXaYQ8tuJfJZuu4TdSNcsnRgj5B9DLZVepdghWQ=;
 b=OH7iZAIuPtNzk3F64gVrWXk33ah4yAN90GzqpO1YoEO6sQbnDTIdII2cY844+lXsY4
 IUz/HIKd9zgnCfCsdQ/nkOr3i8w9tTTFsv13qwytR/eEgCcpgtTPDFSrLHpWt0/uD/dw
 oghHJkqfby/usq8Bl7/PemvUB7fq4FdKyv9YYWARXy2HEzKJfKED3e7lqLCdRcaLpZrM
 SAEYu9nURxvi7cIQYPW/JS79iBXeuE/xjtHA6ur0jzs/tngCzNH79PHTesNEmYByIDMz
 gSW8/nkIKWjE6wnigd7E0ermbioT9NX1cUae4DDxbPyB15ffFIjEbfTRmT5ZZ7AqoDpD
 QBeg==
X-Gm-Message-State: AOAM533H0WpdHzxkMkmRDO23aAxrMKi6Fh1v99BxR7fiQF3ZPlPEoUTo
 3rTGtK6fkcTjh1iwS/SDJa6YYbEsIlvLS0fepOvSYQ==
X-Google-Smtp-Source: ABdhPJwyMTUw/mtFu6agjAsPIJW+iWTJHYIxIVvFs4+GRM3nbBnWOJM3vPKxiLw52uQ1xwjfjvHgiiuMneQ854bVIsM=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr11888453oif.63.1651009843704; Tue, 26
 Apr 2022 14:50:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 Apr 2022 14:50:43 -0700
MIME-Version: 1.0
In-Reply-To: <1650952931-31988-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1650952931-31988-1-git-send-email-quic_vpolimer@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 26 Apr 2022 14:50:43 -0700
Message-ID: <CAE-0n52cSR_xCxF+_UeK8CaHqsu=4HOtfWQ3BMmx2Tx3kmk-ZA@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/disp/dpu1: avoid clearing hw
 interrupts if hw_intr is null during drm uninit
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
Cc: dmitry.baryshkov@linaro.org, quic_kalyant@quicinc.com, robdclark@gmail.com,
 linux-kernel@vger.kernel.org, dianders@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Vinod Polimera (2022-04-25 23:02:11)
> Avoid clearing irqs and derefernce hw_intr when hw_intr is null.

Presumably this is only the case when the display driver doesn't fully
probe and something probe defers? Can you clarify how this situation
happens?

>
> BUG: Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>
> Call trace:
>  dpu_core_irq_uninstall+0x50/0xb0
>  dpu_irq_uninstall+0x18/0x24
>  msm_drm_uninit+0xd8/0x16c
>  msm_drm_bind+0x580/0x5fc
>  try_to_bring_up_master+0x168/0x1c0
>  __component_add+0xb4/0x178
>  component_add+0x1c/0x28
>  dp_display_probe+0x38c/0x400
>  platform_probe+0xb0/0xd0
>  really_probe+0xcc/0x2c8
>  __driver_probe_device+0xbc/0xe8
>  driver_probe_device+0x48/0xf0
>  __device_attach_driver+0xa0/0xc8
>  bus_for_each_drv+0x8c/0xd8
>  __device_attach+0xc4/0x150
>  device_initial_probe+0x1c/0x28
>
> Fixes: a73033619ea ("drm/msm/dpu: squash dpu_core_irq into dpu_hw_interrupts")

The fixes tag looks odd. In dpu_core_irq_uninstall() at that commit it
is dealing with 'irq_obj' which isn't a pointer. After commit
f25f656608e3 ("drm/msm/dpu: merge struct dpu_irq into struct
dpu_hw_intr") dpu_core_irq_uninstall() starts using 'hw_intr' which is
allocated on the heap. If we backported this patch to a place that had
a73033619ea without f25f656608e3 it wouldn't make any sense.

> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index c515b7c..ab28577 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -599,6 +599,9 @@ void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
>  {
>         int i;
>
> +       if (!dpu_kms->hw_intr)
> +               return;
> +
>         pm_runtime_get_sync(&dpu_kms->pdev->dev);
>         for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
