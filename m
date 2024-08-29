Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B9B96429C
	for <lists+freedreno@lfdr.de>; Thu, 29 Aug 2024 13:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDD910E617;
	Thu, 29 Aug 2024 11:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QsJw0qU7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B2810E3DC
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 11:06:10 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6b0c5b1adfaso4892997b3.0
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 04:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724929570; x=1725534370; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t00GbWajI0fY42GgBRY0b15sJ+hM+PSIwwNAsxYr2Mg=;
 b=QsJw0qU7hbeWJ7ViCW7l/LNrUzicZjO+7uM4sWmDIdB3jzZmujAOnNB5W4lsmqjQgo
 6fDdbSr2jSpcbeAD0rHeEWmVwtnXykPdq9lRff+wnS4O6HuP4bKLmOVBHn7nBZdj6+CR
 UAuSbUpmB5j2O4jki3kLyiqzjttCOYbjuQ93EXjiDd4lfUBpzOSAWsQ04gDNCyB+6ax1
 i406w8XkmpWM+lcLgks52ryXV9kiy/lgRTxtnJAaBp3zGGhX0uALgZIb/LItQComMFzQ
 kcKgX0b+aG2O4wNRftE+ttjGsEKCBTRSGaHcBOHP/+oYKGUpL7hKAUfRBPc0REy6KdAS
 UVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724929570; x=1725534370;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t00GbWajI0fY42GgBRY0b15sJ+hM+PSIwwNAsxYr2Mg=;
 b=OSObZhv88FZ1GQGqWvzJ2bSXeDzeewSTNvi+tLsJvv4QNLWLS0NzVu2uJkv0IEtAjb
 cTQgZTrIRGU7aYOYjWxx+84uTbodpYTiRJcalkSjCicjyZWO4tT5Lr3DOg5XF9NZo2hB
 CVabZ+wsz3VZYasbE94YOV8/7yEplr1KsYlrhij5A6kWmQ9bFw06WxVZxbjzf6G5Gep6
 NTzipIF7nTgvwj5BJpGa0qJMaEd57b5F9s/ngZsfUyvIf2KvADEnCL4qN2+Z5+Rv7WxU
 RXSUxE2XNfKpORm1Zui/XTwUTkf0rWZ8hCLXuuy9kGgUK6qWWOHjTgaE9A+Tc497o2Nk
 HlXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGd+cedR5veWmVIHVyWGKv2n8TmEhcQ/nq2GrNvXIYXPE1/fQyHC+h81pO+mkn5xGDQFt1IWuO4TE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0D06zSUy3363WukNOIaExGy/ior/t9COryfuyJVAB7lbZ9ixg
 Fos/O4MSqDDC0gp2iHabvoljl7WXyERbRyhgcW567DE5ctxVNoAOkJKAxtgCCBaYS9HGgAirEBm
 NN9iXKssFRQq6+60oZJkKoRjfz9w54c/9Qu/ozQ==
X-Google-Smtp-Source: AGHT+IFIHaboJ6IIfGbmUtGfNnqOp+c8jA6Hk5SaKD8wA7zMol9LODyzVqgOo6qMWeJVq2ejhZvuGsmKKNXu0fxcXgU=
X-Received: by 2002:a05:690c:3391:b0:6b5:71b2:13da with SMTP id
 00721157ae682-6d277777516mr24559917b3.32.1724929569807; Thu, 29 Aug 2024
 04:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-5-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-5-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 14:05:59 +0300
Message-ID: <CAA8EJpqJxF4fOaFT6Uu=D5A35HdEDYRhgkkT0TdZ+ckDS95Nag@mail.gmail.com>
Subject: Re: [PATCH 05/21] drm/msm/dpu: polish log for resource allocation
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
>
> Add resource allocation type info.
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 15b42a6683639..e219d706610c2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -778,6 +778,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
>                 ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
>  }
>
> +static char *dpu_hw_blk_type_name[] = {
> +       [DPU_HW_BLK_TOP] = "blk_top",
> +       [DPU_HW_BLK_SSPP] = "blk_sspp",
> +       [DPU_HW_BLK_LM] = "blk_lm",
> +       [DPU_HW_BLK_CTL] = "blk_ctl",
> +       [DPU_HW_BLK_PINGPONG] = "blk_pingpong",
> +       [DPU_HW_BLK_INTF] = "blk_intf",
> +       [DPU_HW_BLK_WB] = "blk_wb",
> +       [DPU_HW_BLK_DSPP] = "blk_dspp",
> +       [DPU_HW_BLK_MERGE_3D] = "blk_merge_3d",
> +       [DPU_HW_BLK_DSC] = "blk_dsc",
> +       [DPU_HW_BLK_CDM] = "blk_cdm",

Drop blk_, upcase all abbreviations.

> +       [DPU_HW_BLK_MAX] = "blk_none",
> +};
> +
>  int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>         struct dpu_global_state *global_state, uint32_t enc_id,
>         enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)
> @@ -828,13 +843,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>                         continue;
>
>                 if (num_blks == blks_size) {
> -                       DPU_ERROR("More than %d resources assigned to enc %d\n",
> -                                 blks_size, enc_id);
> +                       DPU_ERROR("More than %d %s assigned to enc %d\n",
> +                                 blks_size, dpu_hw_blk_type_name[type], enc_id);
>                         break;
>                 }
>                 if (!hw_blks[i]) {
> -                       DPU_ERROR("Allocated resource %d unavailable to assign to enc %d\n",
> -                                 type, enc_id);
> +                       DPU_ERROR("%s unavailable to assign to enc %d\n",
> +                                 dpu_hw_blk_type_name[type], enc_id);
>                         break;
>                 }
>                 blks[num_blks++] = hw_blks[i];
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
