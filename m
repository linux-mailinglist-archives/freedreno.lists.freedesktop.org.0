Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C7BA082DF
	for <lists+freedreno@lfdr.de>; Thu,  9 Jan 2025 23:40:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AD810E493;
	Thu,  9 Jan 2025 22:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jIY/h3mQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D729C10E493
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jan 2025 22:40:49 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53e384e3481so1363835e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jan 2025 14:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736462388; x=1737067188; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=H7PXcApU0JETFIR6N0uLhNM2Aw7BSg/72G4ZlEn/1Do=;
 b=jIY/h3mQQHUMK3V3qinThPhXZKhaoT+uUlftHhJWIpmMsqmzsweKuWo0MxA5Z4WzRm
 +1Sb3cowjS1ljk05wITz7awF1ZSRv/WxUOyS/kV1dMs9kAlzc/g86q7tWoNleiflfzYm
 ToKnzhDw3Cnx1Tv/8w3+0QbJytbw/jK6l8TuGnvoEhqBRdlS9EMojdm5jt8KsK50OIs2
 eywc4RSz+kUoWEvJd136nfGAFhZWDXfHM8krl3Aru+ZhckuJQ5xSGvTQWY4mDPDJusWV
 d4xHoPPdPJ6CdBdCQmpp7AUGoB+he6/fn3mSvaCAn63VdneY7fwb91B0+WbkiI7b8+vS
 zNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736462388; x=1737067188;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H7PXcApU0JETFIR6N0uLhNM2Aw7BSg/72G4ZlEn/1Do=;
 b=mrpFR+zhzaM4XZL6obY/g8JoiyR9yOfW/5YOKcASPh+Q+3DSJqeQ0i3R/ATH1RnFyi
 IlNBva6qVN23MaSlebuvt0ncGwPfxSR3ndRqQBX95rDAjMTo1CbnsF5oh8G8nh+yLUo8
 AYkjeOo/dyoEQSyGBb2s4XKQAu18wyAhc6IkzrFANqpVS1SPYO1eGZPb6cO7FHdRg0FN
 areqnDDlWPfs2CwK9aLNOR+catduf/6fjVXtfSDG9OzEP1pPcvJhnfkPALkbN9shsz45
 8BlZrdqWC1urIBckOacMfSurPTbXSbrYFt2M3SuHSots6y7TS/Xqbye5ht11MLqBmW71
 9CBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMA93kOBCvWYEfmrjJ67hI/3NQftPW4TjB07py5peD1ftFn/hYgRTCGrhBrwxLmvOBJaGeyiry0jc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4yXTjeKE0rSkx57d9sYqQrVpynC51shigQgWJiWDKH3/2scSF
 508Apfb68d1apL9WGfeEeEmGFIaX6Rd0RFxfNK3e4aeBBqT5obp7aEasMawRjEg=
X-Gm-Gg: ASbGncvXxRyLHdKPbgAmhY9qQdj7wkY+yxuvKy1DRRxvGqwsKBnGQUbTwIuVoQ/2kil
 TPYngPijy1ZxzsJMCHYsHLxx2oXWxetnlsYaQ596KXT4NrQ15+hk8vs0ENttRNMPERtjyCY6psl
 LqsQDDmMtVqVoTh677T+StUijgtmH3L8H2CDKSW1m3G5sYFN2DjlwLoUGGO4NgKyNb8zVowC3ea
 +LmpLU5hXPL7RrcTdxL/wbxPzdobEDAQUBQ0PZbjv8rmzMl+gEMe5Umkvozp07VOHgGazHo4AWu
 hyRyH/Oe5pqiiOB/XK2y4Tbt1TUMezms4UdE
X-Google-Smtp-Source: AGHT+IGjSVrLD+BTCfZfVNXTNwUqqxiO45ZG5ef6NG4hf2D5QyOSBg9wrPZDTY0SG9oxOVZaANgBhQ==
X-Received: by 2002:a05:6512:3c83:b0:542:2929:63ea with SMTP id
 2adb3069b0e04-542845c1e8amr3117213e87.24.1736462388248; 
 Thu, 09 Jan 2025 14:39:48 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be49eb2sm321608e87.41.2025.01.09.14.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 14:39:46 -0800 (PST)
Date: Fri, 10 Jan 2025 00:39:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH RFC 10/11] drm/msm/mdss: Add support for SM8750
Message-ID: <kn7gsm4nnp372t56ocbzkv6uw7o3ww2qel7jlcwvgxsugdk46w@d34hujbcswcw>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
 <20250109-b4-sm8750-display-v1-10-b3f15faf4c97@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-b4-sm8750-display-v1-10-b3f15faf4c97@linaro.org>
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

On Thu, Jan 09, 2025 at 02:08:37PM +0100, Krzysztof Kozlowski wrote:
> Add support for the Qualcomm SM8750 platform.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 33 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_mdss.h |  1 +
>  2 files changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index dcb49fd30402b80edd2cb5971f95a78eaad6081f..3f00eb6de3a9d2bee7637c6f516efff78b7d872b 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -222,6 +222,24 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
>  	}
>  }
>  
> +static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
> +{
> +	const struct msm_mdss_data *data = msm_mdss->mdss_data;
> +	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
> +		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
> +
> +	if (data->ubwc_bank_spread)
> +		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
> +
> +	if (data->macrotile_mode)
> +		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
> +
> +	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
> +
> +	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> +	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);

Nit: this probably can be folded into the msm_mdss_setup_ubwc_dec_40(),
but I would not require it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +}
> +
>  #define MDSS_HW_MAJ_MIN		\
>  	(MDSS_HW_VERSION_MAJOR__MASK | MDSS_HW_VERSION_MINOR__MASK)
>  

-- 
With best wishes
Dmitry
