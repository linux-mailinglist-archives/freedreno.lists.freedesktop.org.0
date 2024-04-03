Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFACF896B32
	for <lists+freedreno@lfdr.de>; Wed,  3 Apr 2024 11:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B989112600;
	Wed,  3 Apr 2024 09:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="meQtWRVg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724A7112974
 for <freedreno@lists.freedesktop.org>; Wed,  3 Apr 2024 09:57:56 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-6152be7c58bso15381317b3.0
 for <freedreno@lists.freedesktop.org>; Wed, 03 Apr 2024 02:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712138275; x=1712743075; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8a49vn1g2GfhymP3UDOjKfMABn27AFlfMB3+8PtG0hY=;
 b=meQtWRVgB0sr7/pKIv6j7BJHb+l78o1A+vvbAVUOUOxW9wRwVLDyxZAmFNfiRtKLMm
 XidtZ14CAWtdWN4YCHPbOdbx3Dv262hpNC7T9oH5k7sdfmYmaIk+lUT8QescO26WoGb4
 xjKob6J2yby/2yM7HUUJ3qhWigE9SIu0L9XzUilLn1U4wJSvAJKOwHcbXn2TYceZltSl
 XBSbkkbcgye9qzB1ZVNp99h2V+jTuwM6ExOpJId2KX7phR5OFjB6IYWsCgm3oAxLbloK
 ixfq9fqutn8D4zSRojKctF0xgoHzshFhG2v1HcsMowX80/J3YUepeq20XuHxMWE056on
 Sfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712138275; x=1712743075;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8a49vn1g2GfhymP3UDOjKfMABn27AFlfMB3+8PtG0hY=;
 b=qzZpsmejU83uYmJfp+lTcR5iHxNdHIcNIyb/J1IXGqLh/xGI6mgO/+wnxXN7xup/oy
 +HumFdYrrrM26BNfdnUR+SHBqOpBODyMadBjXeaSNSXp5RMK4weJQAbHbxtzpJrfoWKp
 PauIoyYo4PXyOPpG62GkhwGRqw3+Q6tUIOVco8tnMG9yY29UBezWdWO2xPfWuwMtsQDk
 BpJsjVNPSUgjpz6db+9bXN1zHtqHh7+Kj0qJuxfxUNT39TPXJlR4yAs3M3+rdBvjsStF
 Q9s6IjonCo7f0r0fGG9iIoD2u58QtT1qhyFukJfulRNcUPQ3WDLGaPu+CvoVIF1IQiWV
 tbjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsTCymu8sg8yD34s5QOJ0iXLz1j6HauUZafPw/tc54n3P8+BOIqV81u/Zvg9uwKTrKXNToJTkgFr4sFz0K0okbFfgyMvZBSyUT+8/YP1Im
X-Gm-Message-State: AOJu0YyeStcMtHT2yZw19w3I9ekIWFL4h7/0Q6ByYHP+Zf4M0EXdLoK4
 LN9X5tncmz5t+HOZ9r5N9RL+u2JUiwNys4QYY7uI8bM3FL5wchRKFmyT6K9Whh6dkIpt29SzvEM
 jz7aXA9oQAs7OoFK+gHdGim0ouT0QzeDP7hfsyQ==
X-Google-Smtp-Source: AGHT+IG8nlvk6XbQkC/Ui1tRnBB3XNXB6LgbVsTQjpZEjnESvNEsU3CRk8wWXBQbvmEg7ARzBiH2C1TQfqjjaNgmJqs=
X-Received: by 2002:a5b:f07:0:b0:dc7:4c92:16a3 with SMTP id
 x7-20020a5b0f07000000b00dc74c9216a3mr11791901ybr.27.1712138275452; Wed, 03
 Apr 2024 02:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-1-db5036443545@linaro.org>
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-1-db5036443545@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 12:57:44 +0300
Message-ID: <CAA8EJpqF4rVsWG=A1fNYWWi7rjHDmu_ftZttXH1v41v8wBgAiQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] drm/msm/dpu: fix video mode DSC for DSI
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jonathan Marek <jonathan@marek.ca>
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

On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
>
> From: Jonathan Marek <jonathan@marek.ca>
>
> Add necessary DPU timing and control changes for DSC to work with DSI
> video mode.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 +++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 8 ++++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index d9e7dbf0499c..c7b009a60b63 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -115,6 +115,15 @@ static void drm_mode_to_intf_timing_params(
>                 timing->h_front_porch = timing->h_front_porch >> 1;
>                 timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
>         }
> +
> +       /*
> +        * for DSI, if compression is enabled, then divide the horizonal active
> +        * timing parameters by compression ratio.
> +        */
> +       if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
> +               timing->width = timing->width / 3; /* XXX: don't assume 3:1 compression ratio */
> +               timing->xres = timing->width;
> +       }
>  }
>
>  static u32 get_horizontal_total(const struct dpu_hw_intf_timing_params *timing)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 965692ef7892..079efb48db05 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -167,6 +167,14 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>                 intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
>
>         data_width = p->width;
> +       if (p->wide_bus_en && !dp_intf)
> +               data_width = p->width >> 1;

How is wide_bus relevant to the DSC case?
Is there a need for the Fixes tag?

> +
> +       if (p->compression_en)
> +               intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
> +
> +       if (p->compression_en && dp_intf)
> +               DPU_ERROR("missing adjustments for DSC+DP\n");
>
>         hsync_data_start_x = hsync_start_x;
>         hsync_data_end_x =  hsync_start_x + data_width - 1;
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
