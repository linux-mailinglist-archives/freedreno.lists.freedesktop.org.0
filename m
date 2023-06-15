Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B803A730F4E
	for <lists+freedreno@lfdr.de>; Thu, 15 Jun 2023 08:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F031010E482;
	Thu, 15 Jun 2023 06:28:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C4910E10A
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 06:28:34 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-bd0a359ca35so1410716276.3
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jun 2023 23:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686810513; x=1689402513;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Sl1LNkel2Jey/Q+VPNL7my6PAtZgOtyvxavcL0DTR4Y=;
 b=EygD5j0QlxcIGYupF35Vj1wtDKts5LDzLPDn5WDh9l6m+UlHM6cmB6bRcxjiCKro51
 RjdJaQiEUB+EdJjCtnhRvEVxyI7ClH6pEzI9YOxrfaAsNLDwj16sdqYxsUnDV99H4aaU
 ZJyZ6sFGAfNt0y1ekhXQNFZjigYPyD8mL0hZxZzxBkD2NBmAA1d1gm3As1xZKv42fxbv
 XnsOea/gFF7t+hy0RLiIbG9bwvuxHAgANu9ORtUe4jly0fsQQAIDc6IQQjgwvGBrKVVH
 qwaRPT35uNgdZN3aoMBr9Ys7C+0FBm3hV3MnQunimazRPsRle2qTonvW1gcNdzlNRJtC
 XouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686810513; x=1689402513;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sl1LNkel2Jey/Q+VPNL7my6PAtZgOtyvxavcL0DTR4Y=;
 b=OabXPwNkPlN/mXc9MC/BO6gKQ7wxlcfXDHAFduPzaWNTQxDBxm0FInzu2KMhggMz40
 ipFRZyL/Rv4QcheDJbLTPeJ0pejIDnMMH3S83wt7NDcLDWIGMtA2D352HSj0DiiCh35m
 yM4uWFg/2XOWtJr6ECt0PP40tuKsPVfgxF+eZfRNuNDu7fwqyDb2k9YjKYGwWXb29so/
 JDFOIaHVLOjcOTOyXSEEntXCyzOwhbUrEkN7FK+/yQ18hXFHvwJBy5NpecyWujlQh37x
 J27d18zViJlAoXHs2QpeARD6ktCt7KBXKB26ktBdJgLoPXuP4RvM736jZodF3AxPNAnc
 yJAQ==
X-Gm-Message-State: AC+VfDw7H3oQ0d4tZl2Oij7TP7gXufzIVcK4ttU4BbXJ+j+3cT2n3Uh5
 yg89B6W+jpBo7EH/qRXfmt02P3xyUAUDeis2WRU1ug==
X-Google-Smtp-Source: ACHHUZ5QQ7NM8OdLRY2rhKKn0eJJKrToeLatwb0wJspABwcTXVGkWpuDYwEgYMm7GhA+ErIn3CcSdu5DqMV6YDMP9G8=
X-Received: by 2002:a25:2601:0:b0:b9e:712f:4a17 with SMTP id
 m1-20020a252601000000b00b9e712f4a17mr3583179ybm.6.1686810513685; Wed, 14 Jun
 2023 23:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
From: Yongqin Liu <yongqin.liu@linaro.org>
Date: Thu, 15 Jun 2023 14:28:22 +0800
Message-ID: <CAMSo37UVzFyigaTvKjxV-4Gvit8H4n8DtwC=2PYWGTr6L555Rg@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dpu: do not enable
 color-management if DSPPs are not available
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 13 Jun 2023 at 02:25, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> We can not support color management without DSPP blocks being provided
> in the HW catalog. Do not enable color management for CRTCs if num_dspps
> is 0.
>
> Fixes: 4259ff7ae509 ("drm/msm/dpu: add support for pcc color block in dpu driver")
> Reported-by: Yongqin Liu <yongqin.liu@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Thanks for this fix!
With it applied to the ACK android-mainline branch,
the "dpu error" problem reported here:
    https://lore.kernel.org/lkml/CAMSo37VmhB1-PUp1qu8gaxOXtu98eEYmWd71FOai+cwLb-JvSg@mail.gmail.com/
is not reproduced.

Tested-by: Yongqin Liu <yongqin.liu@linaro.org>

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 6e684a7b49a1..1edf2b6b0a26 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1463,6 +1463,8 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
>  struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>                                 struct drm_plane *cursor)
>  {
> +       struct msm_drm_private *priv = dev->dev_private;
> +       struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>         struct drm_crtc *crtc = NULL;
>         struct dpu_crtc *dpu_crtc = NULL;
>         int i, ret;
> @@ -1494,7 +1496,8 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>
>         drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
>
> -       drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
> +       if (dpu_kms->catalog->dspp_count)
> +               drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
>
>         /* save user friendly CRTC name for later */
>         snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
> --
> 2.39.2
>

-- 
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android
