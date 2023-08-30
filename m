Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB7478E35D
	for <lists+freedreno@lfdr.de>; Thu, 31 Aug 2023 01:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DE010E632;
	Wed, 30 Aug 2023 23:40:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23DF10E167
 for <freedreno@lists.freedesktop.org>; Wed, 30 Aug 2023 23:40:10 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-d7bbaa8efa7so86264276.3
 for <freedreno@lists.freedesktop.org>; Wed, 30 Aug 2023 16:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693438810; x=1694043610; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NazOzKPkx7AjojgQQ4WRVyoU6M4Mb5zkgyFuSk7fqSA=;
 b=xNETmTwBLJkhL5lbSx2f6UviIQGIVhrFfZ2Idaml1jHamowqTc3q2tVQl4ii9CxrVz
 h0SYIpB2RwhhSd5kZJUqHFNLyHZ66bw+08dkzExTIc3LnzdCa9o/TJLJeI44R9rlRfHo
 efnl+wy3o7csOBOUPobgUN/I+KzitNo9GiIu4pfqe0NzAyZxhLsOYa7g7Hy0S5+N26GC
 do3S8l6JHDMAseHhhjrpjXCXrlTgayemKyA3/EOPB7dSqyqmQ6AfWwoy+sQmoABM5/DQ
 CtkCmh1ha4hce81NdyXH0kKwKbq4nTSLAgy0RjPVyxsUCSFoTmwgK9UGu6UzB3iOw7to
 dZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693438810; x=1694043610;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NazOzKPkx7AjojgQQ4WRVyoU6M4Mb5zkgyFuSk7fqSA=;
 b=Pg1u848N0QgrpUgPmOganjWjd+Wd/c4Y84ntLyTbGApLKicZVahEdIHAKcV8bs3Ka3
 gPYuilmnTkwip/pbja8AtA/8Zz6kZ+7kNjIGFxQVnMcusqMG8KSkwjR07sgIdcOIDFCF
 rOCjdHxSx9ZTQ2N+g3oYrQhmyLCG0KnaoMXlb54jlJnuVEOY7/8KMGxFhdK/FHMQynFe
 jQSExuZbi8ohLi4m5d1gv9rKCxDeSmn1pF+4Qrjd0gK7JzvRFgN2ardykzh5EBvqau5x
 OFSSRkysirbhBtxxttYFgB9to5MtdcWwWKhtP1EE0TADpb+++NSQ9oTDYtVgObp8cx3m
 CzAg==
X-Gm-Message-State: AOJu0YzajIdgY62RE4x0ThMJHcHriHQHfT7xk/F5ku++av5yerloSf+o
 Z8j2NsermcUDUw8AZGDAKwtrCU3UQGtPJLPHGff1+Q==
X-Google-Smtp-Source: AGHT+IFejm9Q+Ex9Nv89RkmnYcqWsShM6TIShSIoUZ/+RLO6C9oKn0Gw/p6tqXp2c+X6rIN0NlKUrtFa8py8qS1XbDM=
X-Received: by 2002:a25:2e47:0:b0:d72:a54d:4b7 with SMTP id
 b7-20020a252e47000000b00d72a54d04b7mr3334092ybn.1.1693438809917; Wed, 30 Aug
 2023 16:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-3-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-3-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Aug 2023 02:39:59 +0300
Message-ID: <CAA8EJpoNqWTspHADS6PKKMLcfHCKhgbZTXO39tueSZE+a64MwQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 02/16] drm/msm/dpu: add formats check for
 writeback encoder
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, Rob Clark <robdclark@gmail.com>,
 quic_parellan@quicinc.com, Daniel Vetter <daniel@ffwll.ch>,
 quic_jesszhan@quicinc.com, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023 at 01:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> In preparation of adding more formats to dpu writeback add

I think it is `preparation to'

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> format validation to it to fail any unsupported formats.
>
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 284a88060221..6a1f8e34f18a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -238,6 +238,7 @@ static int dpu_encoder_phys_wb_atomic_check(
>  {
>         struct drm_framebuffer *fb;
>         const struct drm_display_mode *mode = &crtc_state->mode;
> +       int ret;
>
>         DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
>                         phys_enc->hw_wb->idx, mode->name, mode->hdisplay, mode->vdisplay);
> @@ -274,6 +275,12 @@ static int dpu_encoder_phys_wb_atomic_check(
>                 return -EINVAL;
>         }
>
> +       ret = drm_atomic_helper_check_wb_encoder_state(phys_enc->parent, conn_state);
> +       if (ret < 0) {
> +               DPU_ERROR("invalid pixel format %p4cc\n", &fb->format->format);
> +               return ret;
> +       }
> +
>         return 0;
>  }
>
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
