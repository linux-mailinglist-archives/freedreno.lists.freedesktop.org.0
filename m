Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F3C9986EE
	for <lists+freedreno@lfdr.de>; Thu, 10 Oct 2024 15:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4459310E2CA;
	Thu, 10 Oct 2024 13:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pjOMOTJ+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21E210E2CA
 for <freedreno@lists.freedesktop.org>; Thu, 10 Oct 2024 13:01:04 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5398d171fa2so1125740e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 10 Oct 2024 06:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728565262; x=1729170062; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/87wXXc/sp8cu8fisdCuGHnQqXu+PRTq4hBnj2QHS1I=;
 b=pjOMOTJ+U2A0H+aK/D6d7CuB1ntx5gTPJcQyyuESojTMF4pwhmS9kk1J67nNEtdmXQ
 czzPeWt4Z2CjVuweVctkB8X3w+9NVzUlhGsIpIXbUNNxmORTRliRf3112oL5D1w9oHPX
 yGYb2mJTx5wH1yY83f9lS4orG68p2VVlKEL27/2Xcwwz3Apf4nMUxVByiXEBrYglW9eV
 pQFzQujyk5fbJS7OAvDvOlP5uJ0WpoJHUEo/qZOYG515Pn98hix+F4mB2yojwYzoK+1p
 q95p0jGyllP/wUA//B3odGa1/sixLYAX2sPXs5wEaqKH9jkgxp5LvVQUPp8mSgCrziFi
 G6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728565262; x=1729170062;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/87wXXc/sp8cu8fisdCuGHnQqXu+PRTq4hBnj2QHS1I=;
 b=fGVNrW2MYOcKuNUnKwJyNP+kS6LdJiqdL5iZb+2jYuWOb2cPhMgCxB0YxebBeg13IS
 PIp60KfYT5IUEa/5zOZBpo1jJJ4MoihA9OxV3FMaEW6eS67ozOe9ITfPx5o/1o6rLboz
 2T83xwWKb5m1XtIW6P0ZQeReiP5fb28WGdzv0+CCe6su/eEAUXvuI7OTxIksVp+31oSp
 mqgN7GOAEXQhyNWAkUJXzQ+SiOPdhA5GLj26JewII51ZPKyN7jPieIBz8IhNwYke9QyX
 ubo4hv3037obh/Hm+5un5aB1wSa9mrHsNhDNUYOaU7fnwy3V2g+hWr7oD7iQkb+h576O
 hMrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfYOCWlM7rZptGzmwGGK53BurTVfolD9ILHDit6Me6tcd0cUMFc7qXHzBUuIj6UkSai6xJUukTZHw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyc6yxWVBvYe3pHlvRaJdLwpZlnbxna88YoS83D/Jm7r0ZRFmZu
 8XxJwpHPCaxqBR26wV5JrFZoELT0mHSezg3AgGwrbCmmAZ2GDNcLoXEH7M4+nq0=
X-Google-Smtp-Source: AGHT+IGI3cE4GJxXPqkv7BkcTu+I9BR6+dZ4zRgvWww5xlpXaIyKaImwMbGL+v/uydmVX7pdtU2aZA==
X-Received: by 2002:a05:6512:108d:b0:52c:e170:9d38 with SMTP id
 2adb3069b0e04-539c48e461bmr3996836e87.31.1728565262114; 
 Thu, 10 Oct 2024 06:01:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539cb8f0e9csm246820e87.187.2024.10.10.06.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 06:01:01 -0700 (PDT)
Date: Thu, 10 Oct 2024 16:00:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/14] drm/msm/dpu: polish log for resource allocation
Message-ID: <3pdtrfs7cmdqtll5uonf7o6arm4har4dj3kcz4gsbtghb6e6n3@p6pgw7l3222u>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-1-76d4f5d413bf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-1-76d4f5d413bf@linaro.org>
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

On Wed, Oct 09, 2024 at 04:50:14PM GMT, Jun Nie wrote:
> Add resource allocation type info.

Please describe changes properly.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 15b42a6683639..2b03ab907c2bc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -778,6 +778,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
>  		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
>  }
>  
> +static char *dpu_hw_blk_type_name[] = {
> +	[DPU_HW_BLK_TOP] = "TOP",
> +	[DPU_HW_BLK_SSPP] = "SSPP",
> +	[DPU_HW_BLK_LM] = "LM",
> +	[DPU_HW_BLK_CTL] = "CTL",
> +	[DPU_HW_BLK_PINGPONG] = "pingpong",
> +	[DPU_HW_BLK_INTF] = "INTF",
> +	[DPU_HW_BLK_WB] = "WB",
> +	[DPU_HW_BLK_DSPP] = "DSPP",
> +	[DPU_HW_BLK_MERGE_3D] = "merge_3d",
> +	[DPU_HW_BLK_DSC] = "DSC",
> +	[DPU_HW_BLK_CDM] = "CDM",
> +	[DPU_HW_BLK_MAX] = "none",
> +};
> +
>  int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>  	struct dpu_global_state *global_state, uint32_t enc_id,
>  	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)
> @@ -828,13 +843,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>  			continue;
>  
>  		if (num_blks == blks_size) {
> -			DPU_ERROR("More than %d resources assigned to enc %d\n",
> -				  blks_size, enc_id);
> +			DPU_ERROR("More than %d %s assigned to enc %d\n",
> +				  blks_size, dpu_hw_blk_type_name[type], enc_id);
>  			break;
>  		}
>  		if (!hw_blks[i]) {
> -			DPU_ERROR("Allocated resource %d unavailable to assign to enc %d\n",
> -				  type, enc_id);
> +			DPU_ERROR("%s unavailable to assign to enc %d\n",
> +				  dpu_hw_blk_type_name[type], enc_id);
>  			break;
>  		}
>  		blks[num_blks++] = hw_blks[i];
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
