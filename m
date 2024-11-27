Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F299DA8F1
	for <lists+freedreno@lfdr.de>; Wed, 27 Nov 2024 14:46:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC95810EADC;
	Wed, 27 Nov 2024 13:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VEU2gMiV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2FB10EADC
 for <freedreno@lists.freedesktop.org>; Wed, 27 Nov 2024 13:46:47 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ffc86948dcso31239111fa.2
 for <freedreno@lists.freedesktop.org>; Wed, 27 Nov 2024 05:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732715206; x=1733320006; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gTlm0pK08VxN90bSYKa0+atSkrR5Fs4v3H4AKqAzKv8=;
 b=VEU2gMiV1ysMVCoif1HiP9u/zupDgyJIorUDZjUPerekRBPPjnJKrIHoXYOf8F3Z6C
 CyLY8HGpJlzH1xCHckBuqTkcvhxSVhwl16bQGG79ja0z2FY1bAkM9GOKfprsTuYRBLTC
 3m0BauzOqjU8U3uXJ8RDv1T4Dn90jlQxbrp/yhIDtEEzwcljoIAXUk3sgGpWZHGVpmIl
 pHUbf/ZibdildOceAjrlvFgsA8BOX9e3ULpjMuE8vVgsHiDolOKtFHBONV5naaun00z9
 V103GGoDDPeLKTyiEG0Y/p8XOmjomSvYUnjSDwhXY8FANJH65KDBF8ssKBJkXm97h5Hf
 TDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732715206; x=1733320006;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gTlm0pK08VxN90bSYKa0+atSkrR5Fs4v3H4AKqAzKv8=;
 b=AjDjSo0Yve/om33Bqzeu1ShTIar1M3bjgB9Y3sf7vNYGmzQ4qQG4+71c0TafZpto3G
 +VRVoZQh+pcE6ndWz3PH0KVNCpCcGlaweL3ltn1d7JETdC2MMf1YQmVI6WFcjqOZVnGt
 VtOhuZgA4KoVgcclO1t3ZmO3+JcVs77VFxE3FE3pv6GqhcUMOuXC9nxhnhvxSEbVOAd2
 VYxAYKOkoPHB1/fxJbQvPP9M9h8e3pxe07UHDCYMIstvOI0k4Q/YXFxdeiOM+4BQppmU
 ubK9b5rUgTQo9xNrFzxDXSN2rYt5npfJLTAAPmHp7ikHeGYhXabNQ/Gh5y0eET67a2hH
 dASw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkX2d16eEL0rmPsM1bUDFY7G7sqWWYqU+hTrIlUV0FY51qAR190bGEVCSY/t5IkW+TgRgUC/cwXsM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7gdd06I9YMipwZVr4t1HlfqzsExATYUgvrCqbaa4/jiEkyKHq
 mGWcPmNrT+Uv+KCzP+fKVN25NlmaoOv8fFGz/gz9aNxtLtSk+yyFUh/bZC0Otsg=
X-Gm-Gg: ASbGnctI31ujLhpPiBcWIE6puk7cgSKGJaDheUpf5RiResLvuEdIG9GnNLKHC1Pwtq/
 l+s8dI1FwpLMeY4gikS6gIlLzh4okKQEa54BEeL7WcQSKDFkm6Tk24yx6AG/gKMymd2JAwvR/PG
 y6ye+gKnS/3jnbJtRZupHRQlQDcOsv+ZfxO4lXwOh/UxBHcahM7GBZSPKAHje+C0PdtpHDnS+XY
 fRohdD3R06xrxDTUu++gESqIvz88IA+JWzCt93CmAVZ53HUMKdCngKZXNXwKoq1ZQhU5DrjthT/
 8X77xgtSlPD65ttBy/4o7dfJx1ajOQ==
X-Google-Smtp-Source: AGHT+IE5YvUnBxv51yjqkhV3Fi45R5BfRmA/OHDbr1MX0yiJhZssNxaHBIh9Ihr9OWpmi0uPhR+jZg==
X-Received: by 2002:a05:651c:220d:b0:2ff:a8e9:a64d with SMTP id
 38308e7fff4ca-2ffd5ff5131mr17990441fa.2.1732715205762; 
 Wed, 27 Nov 2024 05:46:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffd3269561sm3194711fa.45.2024.11.27.05.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 05:46:45 -0800 (PST)
Date: Wed, 27 Nov 2024 15:46:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/msm: mdss: Add QCS8300 support
Message-ID: <nllulh3vskl3hm3hvjux4khxtanqj7cpoytodwkzphwn4ajmo7@g46rgnhp637b>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-3-29b2c3ee95b8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127-mdss_qcs8300-v1-3-29b2c3ee95b8@quicinc.com>
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

On Wed, Nov 27, 2024 at 03:05:03PM +0800, Yongxing Mou wrote:
> Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.

Please mention, why do you need it at all. I see that the UBWC swizzle
and HBB settings are different. Is this really the case? Is it because
of the different memory being used on those platforms?

> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index b7bd899ead44bf86998e7295bccb31a334fa6811..90d8fe469d3134ec73f386153509ac257d75930a 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -568,6 +568,16 @@ static const struct msm_mdss_data qcm2290_data = {
>  	.reg_bus_bw = 76800,
>  };
>  
> +static const struct msm_mdss_data qcs8300_data = {
> +	.ubwc_enc_version = UBWC_4_0,
> +	.ubwc_dec_version = UBWC_4_0,
> +	.ubwc_swizzle = 6,
> +	.ubwc_static = 1,
> +	.highest_bank_bit = 3,
> +	.macrotile_mode = 1,
> +	.reg_bus_bw = 74000,
> +};
> +
>  static const struct msm_mdss_data sa8775p_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_0,
> @@ -715,6 +725,7 @@ static const struct of_device_id mdss_dt_match[] = {
>  	{ .compatible = "qcom,mdss" },
>  	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
>  	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
> +	{ .compatible = "qcom,qcs8300-mdss", .data = &qcs8300_data },
>  	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
>  	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
>  	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
