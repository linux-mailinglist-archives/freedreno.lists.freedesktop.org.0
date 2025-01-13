Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C8AA0B22F
	for <lists+freedreno@lfdr.de>; Mon, 13 Jan 2025 10:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB6E10E137;
	Mon, 13 Jan 2025 09:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B8zUODNH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845FE10E243
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jan 2025 09:02:48 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-540201cfedbso3641924e87.3
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jan 2025 01:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736758967; x=1737363767; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VYkQdxTA3vBXlKKUBFkrgSmL9ucWyZWWWLZyZzkAa3w=;
 b=B8zUODNH8FpEF2v9GqC/1hQpTgkl2uGoKdCkc0I2r3+Lpr5Dunybcnxdx4Rkjp2FVD
 Bt28J6glAXVJbWGqEgqA8XURRuJJXYH/sVvNwe61ocC920X/B6ZQnitGgohrYt4JQ089
 FwURZQ90C0Ufh2e0s0uppJ5SaplzhxXVIt0LQwa2XL9ujqixnQmoHBU4YumaEBUyggCY
 YRrg+CkBXQAFd/c2kT2PTjq/+JjkZk6mDOY7qlfgXVdM57Xy9keaMtn3On0VxC9lQdCV
 Hvh426/BgxEF4CtnUp7lY9ZvHT31XHJ1kxaFVe4817fFnqmEiaKs9szgRxz1O2ueulOQ
 FUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736758967; x=1737363767;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VYkQdxTA3vBXlKKUBFkrgSmL9ucWyZWWWLZyZzkAa3w=;
 b=YUjnfxUQ9Ui1I4zTi+RvFokC9bHmSWnGuPrMYlFAJ8vkiRcAWTp+Ji3JdgSNOKXOK/
 vkZrP1sYnyt13Y457T3LZJmmp0P5sRtXRbqfVugYnMB+kH/a332Rbs6k1bks6tNCACvn
 9EUckxVP23Lz9Azb9BWigVNhLUrhCS9KDyRV+iH9SxqSLXeAEOiWy/xCd9kihhf+ehwJ
 a6s9zzNRJ+BDLnM5VLdTChFHah5j+7SWRHb8fAKL24Ps1o9U5YJdcvJM5Tck4w3fTUzF
 HzUAAvD6xahN8FCfZrWnxmbezaIv3Ad1g0goe38FNwP2v2zEAQbSMN6hJV2ZqhkvHFKK
 ZHQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNSafQr3Bvg7f7N+O0TBy8RZT6QWmkkls6alZimY9xb9lqz1Le/wtGqrASRhisaFonrfsC5cVO2aQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyejvRUTikx5lXx2EFAIOzMKS+GrnbNL8FFqQcgvyKJuX8rtwTa
 A2ddQTKrubMrDL8yPeRj0C1Bj+STAdP81VKuy9viaTt68akJVPXoPYDrT7Z2Dxs=
X-Gm-Gg: ASbGncsjk1NcCfZnRv10gGQfNNxfksU9uaBYj+DSUnjNH0ms9bV0L8IwBPJaGMSWtW9
 cNbGEkVjwyDp/XJJ+Sx5HmXsf16zTrR3regsqpN3gwtOVQ3kecb9AshYM5W7JbAxPl+tgL953IH
 bIqXPIUGYcEP9wVsnH/WRAQ+fxydmnOvA6Q7L1wUtQSBv7El6hgOBzEk7PdcVWc+BeTFar+rYSb
 tJM+nHMzc4uNw1Eb1b7W1QhnXuVlFLk9Pm3ZRNUksQ5HDBKuN7RI/gULejW2JdqvQ3KV5qdsB5K
 DRnlWGBrN9LI6Lqsd7nwl3RQM9NXkqLqv3Gg
X-Google-Smtp-Source: AGHT+IHowqb7rFqBBDpRnlzRpSHyTMrFA26GRZ+fcN9JLnlQvPTm5oxedl6vvT+6rf1rsSPJNSIUoA==
X-Received: by 2002:a05:6512:3e17:b0:53d:ed69:a593 with SMTP id
 2adb3069b0e04-542845282a5mr6463480e87.22.1736758965311; 
 Mon, 13 Jan 2025 01:02:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be5483bsm1300830e87.105.2025.01.13.01.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 01:02:44 -0800 (PST)
Date: Mon, 13 Jan 2025 11:02:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 0/4] Display enablement changes for Qualcomm QCS8300
 platform
Message-ID: <qsq5so5i7fy3r7xcjtcr7aq2vtbywh57j3b3e7ddbsmmeu5qwy@pgcntgxknuul>
References: <20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com>
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

On Mon, Jan 13, 2025 at 04:03:07PM +0800, Yongxing Mou wrote:
> This series introduces support to enable the Mobile Display Subsystem (MDSS)
> , Display Processing Unit (DPU), DisplayPort controller for the Qualcomm 
> QCS8300 target. It includes the addition of the hardware catalog, compatible
> string, and their YAML bindings.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
> Changes in v3:Fixed review comments from Krzysztof, Dmitry.
> - Fix the missing space issue in commit message.[Krzysztof]
> - Separate the patch for the phy from this series.[Dmitry]
> - Remove unused dependencies and update in the cover letter.[Dmitry][Krzysztof]
> - Link to v2: https://lore.kernel.org/r/20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com
> 
> Changes in v2:Fixed review comments from Krzysztof, Dmitry, Rob.
> - Decouple the devicetree changes from this series.[Dmitry][Krzysztof]
> - Drop the dpu driver changes and reuse SA8775P DPU driver.[Dmitry]
> - Fix compilation issues in MDSS bindings.[Rob][Krzysztof]
> - Correct formatting errors and remove unnecessary status in MDSS
>   bindings.[Krzysztof]
> - Add the the necessary information in MDSS changes commit msg.[Dmitry]
> - Rebase MDSS driver changes to https://lore.kernel.org/dri-devel/
>   20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/.[Dmitry]
> - Package the DisplayPort controller and eDP PHY bindings document to
>   this patch series.
> - Collecting MDSS changes reviewd-by Dmitry.
> - Reuse the sa8775p eDP PHY as a fallback compat.[Dmitry]
> - Reuse the sm8650 DP controller as a fallback compat.[Dmitry]
> - Link to v1: https://lore.kernel.org/r/20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com
> ~
> 
> ---
> Yongxing Mou (4):
>       dt-bindings: display/msm: Document the DPU for QCS8300
>       dt-bindings: display: msm: dp-controller: document QCS8300 compatible
>       dt-bindings: display/msm: Document MDSS on QCS8300

Is there any reason for not using a common style for these three
commits?

>       drm/msm: mdss: Add QCS8300 support
> 
>  .../bindings/display/msm/dp-controller.yaml        |   4 +
>  .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 244 +++++++++++++++++++++
>  .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  13 +-
>  drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
>  4 files changed, 268 insertions(+), 4 deletions(-)
> ---
> base-commit: 2b88851f583d3c4e40bcd40cfe1965241ec229dd
> change-id: 20241224-mdssdt_qcs8300-11b7883dc60b
> 
> Best regards,
> -- 
> Yongxing Mou <quic_yongmou@quicinc.com>
> 

-- 
With best wishes
Dmitry
