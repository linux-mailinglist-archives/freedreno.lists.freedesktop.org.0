Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C279E83E9
	for <lists+freedreno@lfdr.de>; Sun,  8 Dec 2024 07:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D764010E239;
	Sun,  8 Dec 2024 06:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="y2RK1S64";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7093610E239
 for <freedreno@lists.freedesktop.org>; Sun,  8 Dec 2024 06:31:38 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53e389d8dc7so1786884e87.0
 for <freedreno@lists.freedesktop.org>; Sat, 07 Dec 2024 22:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733639496; x=1734244296; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aZ8VS1dgJrZl5iBo3P2WYLWkQ0RmM/v740EhGg00bcs=;
 b=y2RK1S64Ow/i16QMKHOim8JSBT5ZLB/gky7mHr8NURvfsmUm8W3Uh+SQ+iNPczCdj9
 E858akc9hWO1VI05DPVl/UlwuIlsWfNtcrhiRICSa0n4P7Wsht2UYT/3xktNDUV2Y9Qi
 OQ7oCThbfQcOuiHsTiHemXzvjdDRzDs5traUv9zzusrWxORjPYcIgT7YQU76zoHzJWHK
 LLBrutGORwYTr2ng3d/nlfhCYU4P1pXAJqlIBBqPDfsMhR161eaGZU9ZrlAOdy4kO4Ua
 sK9Kf0pUsJSYVBxXvbWmeUv8B4LZAPw5a1jRPf/MjknZB2gdMUJvwW475uS5zzc9ZMBa
 aZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733639496; x=1734244296;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aZ8VS1dgJrZl5iBo3P2WYLWkQ0RmM/v740EhGg00bcs=;
 b=UXMWPOnZSfyjf39QUqXMekUYWpor6vA6994YBFJnZ+/HeW9cTIxhp9TJnEQ3vzmVZQ
 l1S+tsQgGxk17qm3q0M2OH0I8iLEKrZOt4nnbQfx/s/ZsQS1oJK/4Wb35mnGHI3jAziH
 joHVrjIv/vgbhHX4G1eQF4dH2UQ3uLpbByvLgWcdrBVRSgd0W6F+PawxZPhLRKfh78xf
 MPS1Uyy0N6Rab22Q9HZNvo8tF70Nt95r0O9XE7rPwlPOrrA5n0PWuaoHZzLK+VjxhuPS
 nPIcQdj1wyKcQpgWz2R4tJyfZMoNwfZLCcWV4cY793q868unRaL++4LKEu8K78o8QJ8l
 jGVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7rNeGdXctAXGQLZtg3oACyG1lLY0rD1sGfIuOVKXTREvCd8MWHhp6pwNSPVj5g/oeYA6q3OagTTQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOU48/mAe+Kc4uCJQQssTodD/u7numyRhgjOKMZ5BnSQyJ/eLA
 1YTGfByl63pouXiXBp3uV97wAGYN4CZwJocIjQCujm74AIU4qOQQA8nALrMYO0A=
X-Gm-Gg: ASbGncuRLTdPJ/Yjvp+TZoK/Fx/lI/izzdk9S/9vFcEEq/xsRL2eF2g6R6GCbDwwMcb
 AtefHotRhqTNczF0g6S/DLezFFqzQU65V6BTA78Asr9DuDvaA9ymQYfHs/WFpUj5t4J9VsiT+cM
 s468FxCApZe+GomO8ncwTlLKjgAX2acFlk68oYQIjirN4ZyxnDTFBnI6XzSC4oLODAUgH12zSgi
 Ik+GlVt+IA7xcSX9eL6URkWSJAoNs5ZUXNIURdqesk9BTT3BEQG2sjQW19Fxz8xjtTeFHkk8WF6
 FMhrzACoMdIFhLfWm02q7SDUqFYp5g==
X-Google-Smtp-Source: AGHT+IH6hoZScy0MbedHNXt8kj+dVMVo4BB42zGWyZlNI1Ar7AQiGDckU1+y1l3Sqi29CH+nNiPp8w==
X-Received: by 2002:a05:6512:61b:b0:53e:3a73:d05a with SMTP id
 2adb3069b0e04-53e3a73d106mr1079651e87.55.1733639495903; 
 Sat, 07 Dec 2024 22:31:35 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401c0382c5sm112619e87.32.2024.12.07.22.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 22:31:34 -0800 (PST)
Date: Sun, 8 Dec 2024 08:31:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 39/45] drm/msm/dp: initialize dp_mst module for each DP
 MST controller
Message-ID: <qu3b5cfxvxnnxwn4rwuqyxdpadrpvkhycyprs5n4aycecmdb4f@pvt2n3aajpxv>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-39-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-39-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:32:10PM -0800, Abhinav Kumar wrote:
> For each MST capable DP controller, initialize a dp_mst module to
> manage its DP MST operations. The DP MST module for each controller
> is the central entity to manage its topology related operations as
> well as interfacing with the rest of the DP driver.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  6 ++++++
>  drivers/gpu/drm/msm/dp/dp_display.c     | 12 ++++++++++++
>  drivers/gpu/drm/msm/msm_drv.h           |  7 +++++++
>  3 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 359de04abf4bbead3daa5e8b357a3c34216e3e65..734d8972bbd65153778d5d70a55ac09dfc693ac9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -664,6 +664,12 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  		stream_cnt = msm_dp_get_mst_max_stream(priv->dp[i]);
>  
>  		if (stream_cnt > 1) {
> +			rc = msm_dp_mst_register(priv->dp[i]);
> +			if (rc) {
> +				DPU_ERROR("dp_mst_init failed for DP, rc = %d\n", rc);
> +				return rc;
> +			}
> +

This seems to be put backwards. I'd prefer if DPU driver allocated all
MST encoders and then called into the DP driver, letting it handle all
MST-related internals.

>  			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
>  				info.stream_id = stream_id;
>  				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index eafec9ab4f83cb44e861687e7550748b4d9b7ece..7f2eace17c126e3758c68bb0dee67662463a6e05 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -69,6 +69,8 @@ enum {
>  
>  #define WAIT_FOR_RESUME_TIMEOUT_JIFFIES (HZ / 2)
>  
> +#define MAX_DPCD_TRANSACTION_BYTES 16
> +
>  struct msm_dp_event {
>  	u32 event_id;
>  	u32 data;
> @@ -1689,6 +1691,16 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
>  	return 0;
>  }
>  
> +int msm_dp_mst_register(struct msm_dp *dp)
> +{
> +	struct msm_dp_display_private *dp_display;
> +
> +	dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> +
> +	return msm_dp_mst_init(dp, dp_display->max_stream,
> +			   MAX_DPCD_TRANSACTION_BYTES, dp_display->aux);

This doesn't seem to change between plaforms. Please push it to
msm_dp_mst_init() instead.

> +}
> +
>  void msm_dp_display_atomic_prepare(struct msm_dp *dp)
>  {
>  	int rc = 0;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 12b50a797772f574122481cd8a1c7c88aacb8250..7ed0e25d6c2bc9e4e3d78895742226d22d103e4c 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -376,6 +376,8 @@ int msm_dp_get_mst_max_stream(const struct msm_dp *dp_display);
>  
>  int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
>  
> +int msm_dp_mst_register(struct msm_dp *dp_display);
> +
>  #else
>  static inline int __init msm_dp_register(void)
>  {
> @@ -397,6 +399,11 @@ static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
>  	return -EINVAL;
>  }
>  
> +static inline int msm_dp_mst_register(struct msm_dp *dp_display)
> +{
> +	return -EINVAL;
> +}
> +
>  int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
>  {
>  	return -EINVAL;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
