Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D178C9F4947
	for <lists+freedreno@lfdr.de>; Tue, 17 Dec 2024 11:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A482C10E073;
	Tue, 17 Dec 2024 10:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Rw1GuGDq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F052D10E073
 for <freedreno@lists.freedesktop.org>; Tue, 17 Dec 2024 10:55:00 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5401be44b58so5185889e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 17 Dec 2024 02:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734432899; x=1735037699; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tHWIkqKFIPrZfDR6fwGCJpX7T0cdK1Nh9XGTjtxdWTw=;
 b=Rw1GuGDqQGv0lOFFH+AWlA+ImBkamv7+1SozeeArAEnuv9C9Dr3Q+u5hHxL9HSoDZI
 TzV1Bk3BZNaxTVUEqQJYEcV9+9vPpR6jNDGVsezlpndzpAmUeMHO4N1HXUiVMQKEPbPJ
 OhnZEsLx04Ujz9SRTv/DTBvdY0naUio6X+lBDsvhEu10++f6J9qO4QgasdejM2yTuUD3
 JmrynPG6PvsSaUd6LHyLk52mGpSexQOyMVeW7fBS4v7xD1MFkXHbeTIuVB5nM64MK5c9
 NgQP/QPzaYVwzFO+qMJhyRVLk7AbBcOfEJUpYnlZRFOHNLtCzr0pNUOdxb70zZ88Nna2
 upRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734432899; x=1735037699;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tHWIkqKFIPrZfDR6fwGCJpX7T0cdK1Nh9XGTjtxdWTw=;
 b=hiSjE+4VodCu1nDRfZKZiTWrb81cIpkHXn3Ag+SuSPfpicvt//xRx+GzoTDAROciKt
 sRyrtuGzsU9DQWlG2feB7BL00hj8toq/eMuH8moW3u2jYfffG0Nr78qFlQuBMBW6LvzX
 v2rfn7NiJWl4VtWBV2wJObnPwViezPg9JT2jVSS0Xc9DjlRF7vFaj86hjQ21pf6MCJIQ
 O959HjTsqwj9rRj6yFLdqRvJNd12jxrP/2p96Lz6+q6KolI3ixzWtRqdTsWQsMj2KnTZ
 2KA14/Js8qE6hY8/dsq25g5lnMNEo6dn2Nm3B6CRk+vJ9629NaN7VDNdSeroAFq2ADQ8
 7YMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkkoA79c56aOknHW+GERrdvpf3DddIq9wRdkjca0B2fLRtjzrwwtHpyvRbp63Honjr1uFQueMcdI4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywPBpXkUSukSmgr5SB2931B6xLoxeQD8innv13/AP1sXQgNoKt
 BkIb5X8/aNoJJhOlpKyftwXasVWkuWVMGJEcpR785gs0PizfD69iYaqS9I+X8C0=
X-Gm-Gg: ASbGncuqNhjgC2qA5qEk5hs2yyb8MrWLJRR9YZPTudiUqSVeJazKFtlAuliTO29m2vg
 tLVaecuUtnHTPuTwEk4oI5etPxxM5dWBN2VHjOm9eY515sth+/GmANvdrAgKDJTSdVYN4h28AdX
 rHQhCRi6ZKP+iryoGV9BP0tRhTp5voeot3ARfWn3qOVyinHwruBGyQWTMBXmtAqtYZqQAKPaRrs
 b96ukTBACPezCOgrGI577NWxyQ0+8j3kxjM1lUWHpUOdCwVHjx2y2E3Ybzyf8JDv3rCRpqZiYes
 TEqq8PLGrKTL3pjrypo3Fu2umcshUaHkTUC8
X-Google-Smtp-Source: AGHT+IHIIXGB/X+gwvncRHBdy9tDryU1EfA09rbZDao5aKxh/K7dmzH4R4ChpaOmldxWkT0LNMbwvw==
X-Received: by 2002:a05:6512:2809:b0:53e:362e:ed0 with SMTP id
 2adb3069b0e04-540916d7331mr4458490e87.44.1734432899164; 
 Tue, 17 Dec 2024 02:54:59 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c1fb46sm1125836e87.235.2024.12.17.02.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 02:54:57 -0800 (PST)
Date: Tue, 17 Dec 2024 12:54:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Liu Li <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/9] drm/msm/dpu: Add SM6150 support
Message-ID: <ntffm2jwr44m77z2bvuifv3itkpywco3cemgzkizzdp7e2ekdv@htfktmyyoe3k>
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
 <20241210-add-display-support-for-qcs615-platform-v4-5-2d875a67602d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210-add-display-support-for-qcs615-platform-v4-5-2d875a67602d@quicinc.com>
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

On Tue, Dec 10, 2024 at 02:53:56PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add definitions for the display hardware used on the Qualcomm SM6150
> platform.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 254 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 257 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..621a2140f675fa28b3a7fcd8573e59b306cd6832
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h

[...]

> +
> +const struct dpu_mdss_cfg dpu_sm6150_cfg = {
> +	.mdss_ver = &sm6150_mdss_ver,
> +	.caps = &sm6150_dpu_caps,
> +	.mdp = &sm6150_mdp,
> +	.ctl_count = ARRAY_SIZE(sm6150_ctl),
> +	.ctl = sm6150_ctl,
> +	.sspp_count = ARRAY_SIZE(sm6150_sspp),
> +	.sspp = sm6150_sspp,
> +	.mixer_count = ARRAY_SIZE(sm6150_lm),
> +	.mixer = sm6150_lm,
> +	.dspp_count = ARRAY_SIZE(sm6150_dspp),
> +	.dspp = sm6150_dspp,
> +	.pingpong_count = ARRAY_SIZE(sm6150_pp),
> +	.pingpong = sm6150_pp,
> +	.intf_count = ARRAY_SIZE(sm6150_intf),
> +	.intf = sm6150_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.perf = &sm6150_perf_data,

I noticed that the catalog entry doesn't provide writeback configuration
although the vendor DTSi specified that there is WB_2 on this platform.
Please send a followup patch enabling writeback on this platform.

> +};
> +
> +#endif

-- 
With best wishes
Dmitry
