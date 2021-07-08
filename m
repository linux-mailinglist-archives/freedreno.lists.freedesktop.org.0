Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 599C13BF928
	for <lists+freedreno@lfdr.de>; Thu,  8 Jul 2021 13:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D906E8AD;
	Thu,  8 Jul 2021 11:38:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C7B6E8AB
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jul 2021 11:38:44 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id s4so5252881qkm.13
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jul 2021 04:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pdT67ZAjjxOqbY6V2cjTYgIg9rCc8phajEZLUlLXgeg=;
 b=rjNG93BPgj9AGSiSqrEBFuzyaSBTjTCuK3WnOo8zwYfI6rDja3Eh+Mhq+EX6MfPcro
 /05SilWpB1W4XI9XGWMLeMC9JEg2Bh8QwSadSyZlRtaaDo7vKFZxmW/KLmuArZUzbl1J
 4swV1pk3QIwZZDg+YYZarB1yyFMOExptk+kZlttoBvLgyinGj1h9yJKbowe0Ap0qS5+k
 iuFyrecEG7JaV4nq/TQoGtj2+qzL9Pr8h95Q8gDee6uRST6hEnyQcgJadbGZiDJETDd3
 svh3LGi+NKFIEr5DbZnizmH49PF40IGsian6KUOOnStKd6vzmFkIyCi4La97PmUao4N2
 Yx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pdT67ZAjjxOqbY6V2cjTYgIg9rCc8phajEZLUlLXgeg=;
 b=m7bMovN4r77VeJRpoNvb7hW3gbXcrUxYWc4U8DkxT18hR26dwOLtUcjOuYhwxSKV5+
 wjOf10ZxuyQvPq1Qq/UETUtGyLAo6YHq+qYhPn6Vnvv7F4rrl6WA0WxhBbHDbClB3Q/z
 VJc+VqDPkU3fyWAnsIBv3UOxStMe66yrBVZS9/hAsnqb1sMHG5PUqk8TEbKcUyrBCy44
 yNtHrEYnN4UTCWLauOs++95n73+ZyIL3pY+lQFuKUV1nAJujqP3/MrhLa6NHcVIgytQJ
 ZLloib0r9t5i8cj29tZT3mK69OryReIYQkfYJRdcPm1xV1P+WgX3Zq0hvZG3ftTlCzCH
 9Suw==
X-Gm-Message-State: AOAM530TySzbQa6qYKDrflFkoRnjVuxpGc4CUnnSS5Ao21LO+iZ9w5qB
 0rNbBqDUo01iPrKAF+unarmRnrdP4I/N3wqkHe8vGw==
X-Google-Smtp-Source: ABdhPJzYWdG8T+IBKuhBvIPzgfm/PnzWBGXAmU22UIEFseDKn9jaTlFmZpw5V/xP7DM++zadOmnW6ApXNlK441So3jQ=
X-Received: by 2002:a05:620a:651:: with SMTP id
 a17mr7019470qka.434.1625744323877; 
 Thu, 08 Jul 2021 04:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210708065619.999199-1-swboyd@chromium.org>
In-Reply-To: <20210708065619.999199-1-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 8 Jul 2021 14:38:33 +0300
Message-ID: <CAA8EJppvcnQmJJ-TfMQTvdJwSN-F0A4nREShGHwMqOOAj=4X1w@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Add newlines to printks
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 8 Jul 2021 at 09:56, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Add some missing newlines to the various DRM printks in this file.
> Noticed while looking at logs. While we're here unbreak quoted
> strings so grepping them is easier.
>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1c04b7cce43e..0e9d3fa1544b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -274,20 +274,20 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>
>         /* return EWOULDBLOCK since we know the wait isn't necessary */
>         if (phys_enc->enable_state == DPU_ENC_DISABLED) {
> -               DRM_ERROR("encoder is disabled id=%u, intr=%d, irq=%d",
> +               DRM_ERROR("encoder is disabled id=%u, intr=%d, irq=%d\n",
>                           DRMID(phys_enc->parent), intr_idx,
>                           irq->irq_idx);
>                 return -EWOULDBLOCK;
>         }
>
>         if (irq->irq_idx < 0) {
> -               DRM_DEBUG_KMS("skip irq wait id=%u, intr=%d, irq=%s",
> +               DRM_DEBUG_KMS("skip irq wait id=%u, intr=%d, irq=%s\n",
>                               DRMID(phys_enc->parent), intr_idx,
>                               irq->name);
>                 return 0;
>         }
>
> -       DRM_DEBUG_KMS("id=%u, intr=%d, irq=%d, pp=%d, pending_cnt=%d",
> +       DRM_DEBUG_KMS("id=%u, intr=%d, irq=%d, pp=%d, pending_cnt=%d\n",
>                       DRMID(phys_enc->parent), intr_idx,
>                       irq->irq_idx, phys_enc->hw_pp->idx - PINGPONG_0,
>                       atomic_read(wait_info->atomic_cnt));
> @@ -303,8 +303,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>                 if (irq_status) {
>                         unsigned long flags;
>
> -                       DRM_DEBUG_KMS("irq not triggered id=%u, intr=%d, "
> -                                     "irq=%d, pp=%d, atomic_cnt=%d",
> +                       DRM_DEBUG_KMS("irq not triggered id=%u, intr=%d, irq=%d, pp=%d, atomic_cnt=%d\n",
>                                       DRMID(phys_enc->parent), intr_idx,
>                                       irq->irq_idx,
>                                       phys_enc->hw_pp->idx - PINGPONG_0,
> @@ -315,8 +314,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>                         ret = 0;
>                 } else {
>                         ret = -ETIMEDOUT;
> -                       DRM_DEBUG_KMS("irq timeout id=%u, intr=%d, "
> -                                     "irq=%d, pp=%d, atomic_cnt=%d",
> +                       DRM_DEBUG_KMS("irq timeout id=%u, intr=%d, irq=%d, pp=%d, atomic_cnt=%d\n",
>                                       DRMID(phys_enc->parent), intr_idx,
>                                       irq->irq_idx,
>                                       phys_enc->hw_pp->idx - PINGPONG_0,
>
> base-commit: e9f1cbc0c4114880090c7a578117d3b9cf184ad4
> --
> https://chromeos.dev
>


-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
