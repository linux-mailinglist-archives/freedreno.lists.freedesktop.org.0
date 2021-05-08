Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86030376FFA
	for <lists+freedreno@lfdr.de>; Sat,  8 May 2021 08:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD4B6E855;
	Sat,  8 May 2021 06:09:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AECE6E855
 for <freedreno@lists.freedesktop.org>; Sat,  8 May 2021 06:09:56 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id d21so10784314oic.11
 for <freedreno@lists.freedesktop.org>; Fri, 07 May 2021 23:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=+ehCmrhhM5OGDTE20S4py5cwY10k0xIadseOT++JVkU=;
 b=filaKRYCVqTgLrB7WYSzzG3Fi5HrJFb7fpcmY1plN+C7xJALT1EJeR+Yqm9YTg6/hP
 N3FPBwLjZaSQwbDlFOfRY/lRGwTqgshbIylR37I495etiV4LoY/JA2jzzGThnnzpq2Or
 +82ApXbQhbi2MA3dplRMFrTSqRg4ogvzrlWsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=+ehCmrhhM5OGDTE20S4py5cwY10k0xIadseOT++JVkU=;
 b=TJKvjYWBktGZarZ3huI9SRscAgu6aw3yzrLwXCeRCk30zY5T076+kYv0mIiU+7Q6ZY
 b1rgcr8XP9MSbN90XjhC/junEbNMPfLeTHWt2UbL/xg+qFKvr01mgyK93AXAapLaaehs
 +1FWTSbSbS9e+mVBFuKDfHmEI211GLjOKOW88+p6D9JWDaCokF4sX7y+esQB8hAx9Jx8
 ICcZoJivjIn9WHHX3DslqFZThoH0GGly1Rtk39JMhybvYbEGqIsvtl+XejK/3TGMo5+Z
 R0zEXNbmq5fEPaPs2iT16JmCQCQT4938KUXpdgGYxKRKFUe7DvjCJ4jVJbgnuY5WPODy
 qbzA==
X-Gm-Message-State: AOAM533KaWbNFAq3aYEoblmJbV+8jwsX9NVZG06FJFsVABuYKdqzC5Uw
 qVRa3bzQiTy4ORwzYuc6ruUOljOj7Yzsg8xYB5r6tg==
X-Google-Smtp-Source: ABdhPJwCjdFMtu/woUmAWajk3S7zPVWlf7VcEkGyAgxE1bs3Mv227JjHZld7Ob9xYKO0lx4jgnp4g2qGCeSaEupXPEg=
X-Received: by 2002:aca:654d:: with SMTP id j13mr17682432oiw.125.1620454195844; 
 Fri, 07 May 2021 23:09:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 8 May 2021 02:09:55 -0400
MIME-Version: 1.0
In-Reply-To: <20210508024254.1877-1-thunder.leizhen@huawei.com>
References: <20210508024254.1877-1-thunder.leizhen@huawei.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Sat, 8 May 2021 02:09:55 -0400
Message-ID: <CAE-0n51owL8RGJyz_5BUCTjrUW5m0X-DTKUx=mqRL=-4i-tMDA@mail.gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Zhen Lei <thunder.leizhen@huawei.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Freedreno] [PATCH 1/1] drm/msm/dpu: Fix error return code in
 dpu_mdss_init()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Zhen Lei (2021-05-07 19:42:54)
> Fix to return a negative error code from the error handling case instead
> of 0, as done elsewhere in this function.
>
> Fixes: 070e64dc1bbc ("drm/msm/dpu: Convert to a chained irq chip")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> index 06b56fec04e0..1b6c9fb500a1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> @@ -253,8 +253,10 @@ int dpu_mdss_init(struct drm_device *dev)
>                 goto irq_domain_error;
>
>         irq = platform_get_irq(pdev, 0);
> -       if (irq < 0)
> +       if (irq < 0) {
> +               ret = irq;
>                 goto irq_error;
> +       }

It would be even better if ret wasn't assigned to 0 at the start of this
function.

>
>         irq_set_chained_handler_and_data(irq, dpu_mdss_irq,
>                                          dpu_mdss);
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
