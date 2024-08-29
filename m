Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BBF9642C4
	for <lists+freedreno@lfdr.de>; Thu, 29 Aug 2024 13:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B8C10E633;
	Thu, 29 Aug 2024 11:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SVXzZRWR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9063C10E62D
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 11:12:10 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2d3ec4bacc5so1195699a91.1
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 04:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724929930; x=1725534730; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0LT3I5USuqdHB66fieoDxuDUolxHbQhLFiZF0asjZzM=;
 b=SVXzZRWR3hTHZUKNi+uDfHjeWpO3gXrbqAErd7aapssDcEwvq5iR5afh/7ADV0yI0S
 1+3K+PioyvLx+1RYgH8Iag9o8Ox2tNS+/XrLdQUm38bHmNWwEvmTKy0rTor2FN4SZflq
 S+VyGYiFUKLvu5WIldWRyt3rSjKsJSQxKVZfWK2+HsqeSLNOyDM4sPFzB225pQ0cpqCC
 Uof4n4y8S8GVqoF3rUeuDOLYTGUVnlFW2UoeCihHO5oZOVA2A2rGBTilHkyVPYoiu47l
 wMX8MIQYks95sqMOTTtwUjxkL0ms2GlhJTTYRWq+9PmKkMioxgAXd1fjlOk10HA9z/MP
 6ibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724929930; x=1725534730;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0LT3I5USuqdHB66fieoDxuDUolxHbQhLFiZF0asjZzM=;
 b=Cnf66p32gMH+ehMDGAZ70r3Oy5K/3UI1hWoj80bUK8V8haH9wQ3kQWN/mH/Jrspdei
 seLd/MWO7S0LtqegwUgX/gGV/ySE3rXQS6h9ebCPTVRrxCI66wUeFNCY34K7qP6CGoBk
 y+y8yi3RjvRNcf47LDdhCok+r0y6hZCmmJRBHg/CytPi26NJMryBht+eD4U8pO/e2gm4
 QG62DJZM6TVQFAzI0MYdMD2Jh+80alK1+pFY1KnTNeldsDy9RO3qHfBC6bdbNNwf6qiq
 FBV9IG7eWM4x2aP7ENNJnT+GnnGDouY0wEwlHQ9Qi1HCDmdXMmILOubjH7o40EYnlWX2
 Pgww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnZQ39LlCef/aAdpnMrVQpOOu/jNKm+rxXFAsp7Gvzo5UAsMpEsa5EpSGl4PnCh1qhaAB2CiZKD8o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdTl/7Ez4GhMhHZMUFTom1ynuxZRZSz+RS97wLBfMfdo4+8jTq
 V98eC+21H+JKBhsmmVfkw4lkMJAUMXNBRRYfya7jW70E6JMZVaArcYRKXRNweszMSKUW9cK/Z0w
 dGguc+38Bg3SgSBquOL51nReM+DQEqM89xpYe7w==
X-Google-Smtp-Source: AGHT+IHuUtkpV/kCfgeCDeFSQtyZmOGgPIEFHPTwcwQPFLoYSq23mMMBRn9u66SKdd6NIBPJ/VPiWoO9n5k9fZu1gIk=
X-Received: by 2002:a17:902:c94c:b0:1fd:9648:2d66 with SMTP id
 d9443c01a7336-20516776254mr21438125ad.17.1724929929590; Thu, 29 Aug 2024
 04:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-9-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-9-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 14:11:57 +0300
Message-ID: <CAA8EJppAaHtwaDLQVG6f4zTmhpkpuuF0-NK9-iB7UzFcwO3hdw@mail.gmail.com>
Subject: Re: [PATCH 09/21] drm/msm/dpu: request more mixer for 4K+ DSC case
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

On Thu, 29 Aug 2024 at 13:20, Jun Nie <jun.nie@linaro.org> wrote:
>
> request more mixer for the case that hdisplay exceeding 4096
> and DSC enabled.

This doesn't seem to match the code. And it misses the _reason_ to do it.

>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 05b203be2a9bc..33cfd94badaba 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -59,6 +59,7 @@
>  #define IDLE_SHORT_TIMEOUT     1
>
>  #define MAX_HDISPLAY_SPLIT 1080
> +#define MAX_HDISPLAY_DSC_SPLIT 2560
>
>  /* timeout in frames waiting for frame done */
>  #define DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES 5
> @@ -588,15 +589,19 @@ static struct msm_display_topology dpu_encoder_get_topology(
>
>         /* Datapath topology selection
>          *
> -        * Dual display
> +        * Dual display without DSC
>          * 2 LM, 2 INTF ( Split display using 2 interfaces)
>          *
> +        * Dual display with DSC
> +        * 4 LM, 2 INTF ( Split display using 2 interfaces)

This doesn't match the code

> +        *
>          * Single display
>          * 1 LM, 1 INTF
>          * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
>          *
>          * Add dspps to the reservation requirements if ctm is requested
>          */
> +
>         if (intf_count == 2)
>                 topology.num_lm = 2;
>         else if (!dpu_kms->catalog->caps->has_3d_merge)
> @@ -615,10 +620,21 @@ static struct msm_display_topology dpu_encoder_get_topology(
>                  * 2 DSC encoders, 2 layer mixers and 1 interface
>                  * this is power optimal and can drive up to (including) 4k
>                  * screens
> +                * But for dual display with hdisplay exceeding 4096, we need
> +                * 4 layer mixer. Because DSC has a max width of 2048 and
> +                * a single plane can only be used by one mixer pair
>                  */
> -               topology.num_dsc = 2;
> -               topology.num_lm = 2;
> -               topology.num_intf = 1;
> +
> +               if (intf_count == 2 &&
> +                   mode->hdisplay > MAX_HDISPLAY_DSC_SPLIT) {
> +                       topology.num_dsc = 4;
> +                       topology.num_lm = 4;
> +                       topology.num_intf = 2;
> +               } else {
> +                       topology.num_dsc = 2;
> +                       topology.num_lm = 2;
> +                       topology.num_intf = 1;
> +               }
>         }
>
>         return topology;
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
