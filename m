Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36663797FC8
	for <lists+freedreno@lfdr.de>; Fri,  8 Sep 2023 02:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A9710E0E0;
	Fri,  8 Sep 2023 00:35:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903F010E0E0
 for <freedreno@lists.freedesktop.org>; Fri,  8 Sep 2023 00:35:17 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2bd0d19a304so27118831fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 07 Sep 2023 17:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694133316; x=1694738116; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WufLjNztGlChBv98FBmKb2FlfCV1VsF4EoYLdsQzy3U=;
 b=UlegSlTKgjjJZJKJnDo9zDO2GJdnWp5DoHDJ8rr3+7+/EdHmw0EYrGmknR1LZvrluK
 /Bmos3od30OwBKNYKDQ2vwb3PZAxXom8MwY4PJazgoinZe8ahJLT1IbchI7nGovnpnWb
 KZDSzOlc0NkWt0pRwp41/mKSKSD1Nj9Ah8CAqAGH/A61ymhAil1QJ5dnakj/qi6g1fYg
 a5tIIIgyJmGKwPzzksbOZ6OUzL+g3vRWlwIBMaNhlR0NkDYr87LeeShCQpJZgqKBRR6u
 KW/FFSl7b0TYsuXQwj6fcWu8qiR7LUz1LktMghmdFDBg7pNu3fbWqRJ7a4xRMiw2GjwC
 /iDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694133316; x=1694738116;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WufLjNztGlChBv98FBmKb2FlfCV1VsF4EoYLdsQzy3U=;
 b=e11NZr6DNHILdi8JVRu4s3dhKkuMhH0HXFw/J9acc86YD3lz5LbnxFnFLPaTYe0teu
 pjLveBqUY8WY0+rMHOMQYe8M4qT3ITAAIXXyt5G2jjkW/G2uiyY4ZuMK1MZkrLtEA6Sa
 OPsazqcGLpq6IthTGBUxi1eo8l0M5Tv1w5jmFeLH7uGz7zBhLZ94z/iZTxZLvsRkQ4YG
 ZzQtqVYmAn1gOguQcXchna29hA7uOb/AfHjIuf6O8GEJlsO9bO6a+HD5gsZ64kcXcjKS
 rvVlhyiE257UdkVDfqonViMuQ2eRlmI1wcs7PpHEtoAEXlxn/ifPvV8r5KL8dQkBXUNA
 C6AA==
X-Gm-Message-State: AOJu0YyLe99qhj2HLu+ckXrv1XTyEwchucFnBIMWJKv8Kos+8nhXoXaG
 C4xMdMYwzIkyliFFFcvgTOwfqw==
X-Google-Smtp-Source: AGHT+IEG4qe0Wnk8qI7Djt2pE2CXmT2pRRN8CzJa4p9Pz+uJgkGUR0afl2XPdHrEJ6PdPoYLGQg/YQ==
X-Received: by 2002:a2e:9782:0:b0:2ba:6519:c50f with SMTP id
 y2-20020a2e9782000000b002ba6519c50fmr484086lji.52.1694133315738; 
 Thu, 07 Sep 2023 17:35:15 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a17090671d200b0099cf840527csm280373ejk.153.2023.09.07.17.35.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 17:35:15 -0700 (PDT)
Message-ID: <f110b0fa-f41f-47e8-a83b-30de2f2b128c@linaro.org>
Date: Fri, 8 Sep 2023 03:35:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kalyan Thota <quic_kalyant@quicinc.com>
References: <20230908003240.14104-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230908003240.14104-1-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: change _dpu_plane_calc_bw() to
 use u64 to avoid overflow
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com, nespera@igalia.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/09/2023 03:32, Abhinav Kumar wrote:
> _dpu_plane_calc_bw() uses integer variables to calculate the bandwidth
> used during plane bandwidth calculations. However for high resolution
> displays this overflows easily and leads to below errors

Can we move the u64 conversion closer to the place where we actually 
need it? Having u64 source width looks very strange.

> 
> [dpu error]crtc83 failed performance check -7
> 
> Promote the intermediate variables to u64 to avoid overflow.
> 
> Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for display")
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/32
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index ae970af1154f..c6193131beec 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -118,7 +118,7 @@ static u64 _dpu_plane_calc_bw(const struct dpu_mdss_cfg *catalog,
>   	const struct drm_display_mode *mode,
>   	struct dpu_sw_pipe_cfg *pipe_cfg)
>   {
> -	int src_width, src_height, dst_height, fps;
> +	u64 src_width, src_height, dst_height, fps;
>   	u64 plane_prefill_bw;
>   	u64 plane_bw;
>   	u32 hw_latency_lines;

-- 
With best wishes
Dmitry

