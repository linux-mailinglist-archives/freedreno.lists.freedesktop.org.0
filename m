Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A99A38BCE
	for <lists+freedreno@lfdr.de>; Mon, 17 Feb 2025 20:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9CC10E5AB;
	Mon, 17 Feb 2025 19:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r9ClpqaW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A1F10E5AB
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 19:00:47 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-543cc81ddebso5038970e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 11:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739818845; x=1740423645; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XOaJBOao+MMu0MuGznU61rfSupDYmEn2N+XP1yk32jY=;
 b=r9ClpqaWijJX2tFuQ4MwU4XWzXFaSHa3CEjJEQl1zq5X1m0tcZX0gvddL1AKtcovca
 bs1TPypgIIaDB+fC0nw8gWBLSnEoKlMlUkJTEdcgM04EP0vHlLheawLQRsrPoOtHNXl+
 uKAquKPFQBUxlMnPoZiKIg4yOw2+wIat0GqzQbsNMwZQza4hhvvbbBKGE7NozFKCs85G
 d3bh3XHqrXvHCjdrGeWrEJt58wNM3X7OU18N90HCXCRSAcmftlOvMGgt/nd2s5xEHVIC
 NWyVk9E753JZSqt7p6OpwcZEo5EmTWWhFoPAY1RfkvMfrB4g6ywPsaV5R2tbjHUIIAiF
 t1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739818845; x=1740423645;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XOaJBOao+MMu0MuGznU61rfSupDYmEn2N+XP1yk32jY=;
 b=hAdZgOpow1VUXuSLEp5YL0J1mjywxgQtnknMHqDVFjCzwd7rA0oggirxqdylW8ESs7
 FXsXv/OAvgCOM4UhMsKDi2xr80nycS/lxsX0Sw+arRo7h13F0r6XzVHUiIjOtMtxY2tP
 HqOVhkln9leChTRD7KqFpubh2QZwHMHLGRPk9zOClNSeXHcwOcjNT0/8h2PPLsuhK1xf
 ri+ChedjLAaSoibVbJWTOqnpnBWzu1QTaq2/s+aGRKHQPY+45GWhCQrssw148L812RR2
 KYfAheAXzkjmVPaFILhWi5op6PWDOYOTHqkeSy0uTtaWwJ3enr0PnDImG6L+u7H6/Q+Y
 7lTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgnBkzu7iz9PwZiY7FqRwSloEo5GzNBD5rUv75tv6lB+V8qaRKyFq2jt24U3f9fGvs2X+Y0ZOQvpw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwEamwbqra7qw3ZfpnjBDIFMPSKBPyCKHX3zc0+uXJVck/LrsI
 0yt9ScEJryGA1q4Zb/x8K79rNZ0KuJTPT28pQdVisAFHJA8xLwWrJo5mI0TqZvI=
X-Gm-Gg: ASbGncvnZxUFpVpha+jnOqULN5hnrAr/GrNAX0rWaTt2Awp0N2FaB/Z64E2M5DNb8uN
 sYMNT9+BecSqF40eJ7VXDuOyCcX/kT3RFdpegurrnd9Ucs08umMZgzqNfBAp3A0y7tU4nnepdvI
 d5ucM1M22U5mo1cWVsA8obxRlW+4CrCIBXwdE6JZ0F1YWl99Lvhm14rHUX1xqsjfUtNrEQYKNIp
 DzYGtfp3f04cJdIlcgPrr2fRJxWTUK/2K2U4/JQTjLaiL5BigHGwiJOXvUkRdx3ffBqWUutWcj7
 hv2sqRuMFmI1BkDiLJHrIGJ2o73oRbWSPyVd8w0zwX063TsvLWAySJZetq7+ZU+3ybcQ2Xo=
X-Google-Smtp-Source: AGHT+IEslo4JCXXW70CatTE3GyUrVciwejCa+A19BXKrlebG5EgoNg1Rdkp6bulWdiqf9EJHhBrftQ==
X-Received: by 2002:a05:6512:3990:b0:545:746:f36a with SMTP id
 2adb3069b0e04-5452fe90480mr4199200e87.34.1739818845416; 
 Mon, 17 Feb 2025 11:00:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54531d76843sm923155e87.84.2025.02.17.11.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:00:44 -0800 (PST)
Date: Mon, 17 Feb 2025 21:00:41 +0200
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
Subject: Re: [PATCH v2 09/16] drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and
 MERGE_3D_5
Message-ID: <eetx7fuv2vearihvpu3mvfaokmfihiq2plstyhkblh5hklspz4@p7fslha5nong>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-9-d201dcdda6a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-9-d201dcdda6a4@linaro.org>
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

On Mon, Feb 17, 2025 at 05:41:30PM +0100, Krzysztof Kozlowski wrote:
> Add IDs for new blocks present in MDSS/MDP v12 for LM, DSC, PINGPONG and
> MERGE_3D blocks.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
