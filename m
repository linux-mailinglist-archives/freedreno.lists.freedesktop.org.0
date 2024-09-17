Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4432E97B542
	for <lists+freedreno@lfdr.de>; Tue, 17 Sep 2024 23:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB8710E231;
	Tue, 17 Sep 2024 21:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BcNrsQ/Y";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD4D10E0F5
 for <freedreno@lists.freedesktop.org>; Tue, 17 Sep 2024 21:34:37 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2f761cfa5e6so52411151fa.0
 for <freedreno@lists.freedesktop.org>; Tue, 17 Sep 2024 14:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726608875; x=1727213675; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HFldS9Osdx5r6O9PMhBljuz6I+61/ph8KM1Rie1JbL4=;
 b=BcNrsQ/Y5JqCTbwEudhHwkoqp8fQZreBC6r8eThhSRlvPaAF96zkbjtFsxHw7cm7qv
 9X1vzQuCPCMiOBbE/t54zpg5BxBSXI8FMpxaMEzfYXk2feHmH4AYCiXSRKZEHv+puEKi
 axLBc+h+5M3sb6m0/lF75UzZuRCu9g5c0oNRt3TPs8NJKCbnobyALL2BWHBoReo+Bbck
 342sTQLvsY0L0uvllOaBI6fBuK5IpvwBDHUD560W85H1TCA8m1lUW2zuPa+pvGAABrXC
 YEsDwfFu6XZ0bSETYQ5GBdgOo1I2/vnmy2vrtVGrV+D1vzAO5mBVEbbB+uHwrR9ltiIk
 fL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726608875; x=1727213675;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HFldS9Osdx5r6O9PMhBljuz6I+61/ph8KM1Rie1JbL4=;
 b=ECyD3Ugref5jnR22O02Af9Hf/mD035y41Uj5pP4g3EhzQXv74kQAmfyQIvknS96rCj
 BKirOnLYB+z9RbZ+tDNoReGpubysBjV3Nc2S/djJodkCpMpJxu4WhFiBS925+8he3Pi+
 bCSHglMVoUI6AxnejVaOjO74uh8FS5QTO0GHYAVGAuE8NqebPFPseahbj6gtQTWAVJe4
 xWzG5YJsyfyEid5oJtnGkdDTgXEYZgpyotmv8BOMk6r28Ad7RWQoiRyxJtWOHVcX0AD3
 YQvjezHZeDHYs5KBxnyLmNDOBuUSx4ey++SkkmBioTmsH9UAyy6EvEdrVOuCjogydmHU
 87XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHho2smfXpR9ybvDEBb+CBy8enGDhc/kSfp/FlGSI0/0j0R22zj/vdf6vskB/+YDOKUb8M5dQG7tE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywm18+H8s0vxyZyBQcaEmRFMvQ68zPNabrmdziP0RyWT+p8M7/n
 a0wtt3Q45OZBY4bke2aguB5biM3MYGLga1wazgpaP2bcHoqZomXmlt9FFSvOsj8=
X-Google-Smtp-Source: AGHT+IFP+a/C17oarNAKaUkNRdE2Hq0QrQUtL8hBbqvyTR7hjc/+lmNIHk6fTZvBOLwdgfVvs5vVbA==
X-Received: by 2002:a05:651c:509:b0:2f3:f5aa:b3d0 with SMTP id
 38308e7fff4ca-2f791a58278mr74395181fa.35.1726608874759; 
 Tue, 17 Sep 2024 14:34:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d2e1c91sm12083751fa.17.2024.09.17.14.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 14:34:34 -0700 (PDT)
Date: Wed, 18 Sep 2024 00:34:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH 0/3] DRM/MSM: Support for Adreno 663 GPU
Message-ID: <5fxmsbtyagtzt2pizdjoadiwxt3klafaulrhxoz4adevapxyoj@5jg7qaqhwkgr>
References: <20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com>
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

On Wed, Sep 18, 2024 at 02:08:40AM GMT, Akhil P Oommen wrote:
> This series adds support for Adreno 663 gpu found in SA8775P chipsets.
> The closest gpu which is currently supported in drm-msm is A660.
> Following are the major differences with that:
> 	1. gmu/zap firmwares
> 	2. Recommended to disable Level2 swizzling
> 
> Verified kmscube with the below Mesa change [1]. This series is rebased
> on top of msm-next.

Is there a chance of you sharing Vulkan CTS results?

> 
> Patch (1) & (2) for Rob Clark and Patch (3) for Bjorn
> 
> [0] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31211
> 
> To: Rob Clark <robdclark@gmail.com>
> To: Sean Paul <sean@poorly.run>
> To: Konrad Dybcio <konrad.dybcio@linaro.org>
> To: Abhinav Kumar <quic_abhinavk@quicinc.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Bjorn Andersson <andersson@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> Puranam V G Tejaswi (3):
>       drm/msm/a6xx: Add support for A663
>       dt-bindings: display/msm/gmu: Add Adreno 663 GMU
>       arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
> 
>  .../devicetree/bindings/display/msm/gmu.yaml       |  1 +
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |  8 +++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 75 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 19 ++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  8 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c              | 33 ++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  5 ++
>  7 files changed, 148 insertions(+), 1 deletion(-)
> ---
> base-commit: 15302579373ed2c8ada629e9e7bcf9569393a48d
> change-id: 20240917-a663-gpu-support-b1475c828606
> 
> Best regards,
> -- 
> Akhil P Oommen <quic_akhilpo@quicinc.com>
> 

-- 
With best wishes
Dmitry
