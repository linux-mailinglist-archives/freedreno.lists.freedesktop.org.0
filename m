Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E30ABD0F7
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 09:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F7910E1A6;
	Tue, 20 May 2025 07:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oJCNwa+3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5B410E2CA
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 07:53:45 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3a35919fa8bso1998207f8f.0
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 00:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747727624; x=1748332424; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=pqIA/ECFbgjRZMqQH31Wh+NeKgfBysFqVWpEKA5YoBA=;
 b=oJCNwa+3o07/cyl1GJZjsmys0uF51cdh3ow3s2c3b1XJiignm29CE7nmHtd5xZS73g
 Vt6MfcboYfKhJic7jvEyPohj6Ysrir1US/El2axSVu4zlmOVF9mSejO1LfYBjY95lI+g
 DG4HxcWp1Z9IjYMEyfczqY0hh+hxMmMWqw4Cm0xHo2VIfAhh0a79PuCJC54qBsL9swSY
 l6tc/vstC/7o8zzl5OgvOc3Hl8ETnFUJdHyZtTylo3Gne3xzWQ/x7FC5BTra2MpfwAP5
 +PGlUkfpDSR7OHFD8lcENs35R1pcn6E5PiLmLISmJLeYPCsKPT3u/NMIfWLQAv4AAeHk
 NvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747727624; x=1748332424;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pqIA/ECFbgjRZMqQH31Wh+NeKgfBysFqVWpEKA5YoBA=;
 b=aWoiixiO+sqbPEACsw46PRX5swMrGSX0I8Ku8lD99mfx5aJ48o3pokE3ZKK0Y+fBgd
 pV56ouEd3eLq23NLZB18UV3NB7zf5FyvQd7AQqba1pVPdZQxQ5VCzKYKfBCmbf5EfUbC
 /NQ+qm7yEshQDgdyvhAPQrJTpFrCnn5W0hXyTGJbRMTJOdu4lZjFotuZ6A2QlXp9P5Vu
 k+/uGXNLRpOfQyfG5qc30UmoXmi1rA6RZWSyehMpEcoCCg9smaguX2UPOW2r6YBrpTFc
 4oJhU74XtJei4m2uJbuQpYbWfw6eMDf6giiWGVZWoGsAuEo+w78fVZiJvVqc/1f/MJZG
 7Zxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwU7Tfww7RqWQkUJSbYJO9dTpNkTKPvLdOHZ6TiuowyRNRvfCh7TKXz92c4g2mB+YmO9HHXy94ufs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxalJq4MfQlIP8QOtDDvX1Zo2NWzdYAWCbeA8mUFEnyPOj7qTME
 TvPW2VrNPG6CThKaqKgNd2nZmXAYwnN9UO/t26x72bWliv2q0CExgZGPV58+w0KZzDM=
X-Gm-Gg: ASbGncvxc+jxITbvbXJ692hFTpTpA9zONeqZNV6QCA+4lHEsvUVc6PSc+LMQ9tVkqpv
 jX7DGAEjK++97ZwebbQv0uaAu4C97Re8z7gM+yuu4Ppng13z8JldE41wuD3g9GmOi4fJkFiAAdt
 pR9qfqei2RBnnbNFXaFJzqECwk8f3moqs0UwJ6QvzXkUuZXpZkY3KzsLyKqWbUlb75HM9jm+GB0
 teSXJzqgdFuCXUJNDaO6tKKyQVHaTRQY4HuuWyjnn1TqZ8acuDMixDY54vKQOWXSMzHUHQOvK/b
 Y6Is9kvEeQM4dCrvcHgOwUQuQyiM2+vR1LmKtYT1eiTMFYHbR2lbAQ1i7yx1gq0D23px2ElZ8Z4
 EFZIcfg5LenZoDuhL0Kc7u5v0sEhv
X-Google-Smtp-Source: AGHT+IEI12u+0JzU8Dw2TE1yYstJIWJV0XyjXtSQP5XMbSxjpixoaVXb0TBg8cX4ao3XbPRrbWp9BA==
X-Received: by 2002:a05:6000:178a:b0:3a3:79cb:8aec with SMTP id
 ffacd0b85a97d-3a379cb8cd7mr1160622f8f.58.1747727624072; 
 Tue, 20 May 2025 00:53:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f1ef035csm20152255e9.11.2025.05.20.00.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 00:53:43 -0700 (PDT)
Message-ID: <ab430c92-ac4f-47a9-9808-ebf5c77f5a86@linaro.org>
Date: Tue, 20 May 2025 09:53:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 20/30] drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-20-6c5e88e31383@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250519-dpu-drop-features-v4-20-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Continue migration to the MDSS-revision based checks and replace
> DPU_MDP_AUDIO_SELECT feature bit with the core_major_ver == 8 ||
> core_major_ver == 5 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c              | 3 ++-
>   7 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index 3e66feb3e18dcc1d9ed5403a42989d97f84a8edc..72a7257b4d7ba5bfe89ec76bac19550e023a2b50 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -23,7 +23,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
>   static const struct dpu_mdp_cfg sdm845_mdp = {
>   	.name = "top_0",
>   	.base = 0x0, .len = 0x45c,
> -	.features = BIT(DPU_MDP_AUDIO_SELECT),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> index 3a60432a758a942eb1541f143018bd466b2bdf20..ce169a610e195cbb6f0fee1362bcaaf05df777cb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> @@ -11,7 +11,6 @@
>   static const struct dpu_mdp_cfg sdm670_mdp = {
>   	.name = "top_0",
>   	.base = 0x0, .len = 0x45c,
> -	.features = BIT(DPU_MDP_AUDIO_SELECT),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index e07c2cc4188bb12e2253068ca8666ce9364c69c1..23a3a458dd5c260399a42e5f4d4361b3c4e82c4f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -23,7 +23,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
>   static const struct dpu_mdp_cfg sm8150_mdp = {
>   	.name = "top_0",
>   	.base = 0x0, .len = 0x45c,
> -	.features = BIT(DPU_MDP_AUDIO_SELECT),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index b350dba28caed77e542d6a41ceac191a93e165a7..75f8f69123a4a6afe8234a9de21ce68b23c11605 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -23,7 +23,6 @@ static const struct dpu_caps sc8180x_dpu_caps = {
>   static const struct dpu_mdp_cfg sc8180x_mdp = {
>   	.name = "top_0",
>   	.base = 0x0, .len = 0x45c,
> -	.features = BIT(DPU_MDP_AUDIO_SELECT),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> index 27c71a8a1f31921e5e1f4b6b15e0efc25fb63537..6b895eca2fac53505f7a1d857d30bb8a5d23d4c8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> @@ -23,7 +23,6 @@ static const struct dpu_caps sm7150_dpu_caps = {
>   static const struct dpu_mdp_cfg sm7150_mdp = {
>   	.name = "top_0",
>   	.base = 0x0, .len = 0x45c,
> -	.features = BIT(DPU_MDP_AUDIO_SELECT),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index d3a7f46488a21e81a24a9af5071a9a7f5f48cdac..9ba9e273f81ab1966db1865b4ce28f8c18f750b8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -38,7 +38,6 @@
>   enum {
>   	DPU_MDP_PANIC_PER_PIPE = 0x1,
>   	DPU_MDP_10BIT_SUPPORT,
> -	DPU_MDP_AUDIO_SELECT,
>   	DPU_MDP_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> index c49a67da86b0d46d12c32466981be7f00519974c..5c811f0142d5e2a012d7e9b3a918818f22ec11cf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> @@ -280,7 +280,8 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
>   	if (mdss_rev->core_major_ver >= 5)
>   		ops->dp_phy_intf_sel = dpu_hw_dp_phy_intf_sel;
>   
> -	if (cap & BIT(DPU_MDP_AUDIO_SELECT))
> +	if (mdss_rev->core_major_ver == 4 ||
> +	    mdss_rev->core_major_ver == 5)

Commit message says: core_major_ver == 8 || core_major_ver == 5

Which one is right ?

Neil

>   		ops->intf_audio_select = dpu_hw_intf_audio_select;
>   }
>   
> 

