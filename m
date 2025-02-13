Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E616A34A4C
	for <lists+freedreno@lfdr.de>; Thu, 13 Feb 2025 17:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F28A10EB37;
	Thu, 13 Feb 2025 16:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IddctXV1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73D410EB37
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 16:42:11 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-54298ec925bso1486476e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 08:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464930; x=1740069730; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1RWxYWTxZAj0F+vDqmj/VMNxzXDPmkoI5uZXNhq06BA=;
 b=IddctXV1YqiGEAFIq7PDVggyIZzOK7nbH8xUJsFW2eo9ORikm1tbk/eQ+wpI/Q5s8I
 VzB2hGPM2tDra/arD+qBmvyAck7PdYCQRT7FiZAXV59yVKrSf/3HlC/5NPwNXEM/Eetq
 mgpN8dHcP9EEfkMsMAgfNeGJv8WoQlt38271gaRCKxC0Hl8eQWsJgIVgYmr5usq/YwZS
 vc3mFQGkRAK8JG1TalQpuMlI3eUYLdWNyy65LbdUiKk4dtHOj3s9I2gvhpGEl0fEQm3d
 CVKxphQrmCHa3OnxaQnmKV8tZ5wu76K6/aAXuOxhgBaEIqrfhCuhkQMGNmHbnHXYt6GH
 dB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464930; x=1740069730;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1RWxYWTxZAj0F+vDqmj/VMNxzXDPmkoI5uZXNhq06BA=;
 b=gj3Qn/YukKrsy8WU+mGBmPHBnw+KvF7qB16uKZ18VfHNtH2wU05QCz1pZuk4uLYaUj
 QyANZWthmusyln7W79A+p/QsINe6H9KudBpmw4GI7SltahLM32KKy2K+Hv/TrYV0CK8j
 CbkddR08GQ2l5s9D5mVnZWjix1Wfrc+1dAw0Sd8TYuCgEDH90JM2zNqR+2iobbK0kZaa
 IRMv4OrnHZ7MJ8B4lk/n2jHfJXpLJJde0hmH5i/E3JoqLBnAwF54Z2ALZa0tetTPgkM3
 DfFaX4i6MHL5CLRz/D8qLHv5abdoPUm3FKJgjBDssM/YFhtnEpTdkXpvB1s0fQ5ErQW7
 NUWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhekTgRPCADmXx/OURcPpkRrhMrsK+mVuZKAk8EBwKsOgeYpFtv3c4JcdQJ+sT05k2RCaM70G/OZA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwkbVxXi43huLovxIVyNStTfGWQjfkgTl2CoXDvb798tnj1wE1
 UEUk6aipgCzR/Co+BvGNX7aEZllcumtW6jnh2CuBI3fsOpS8Cn3DS6vf/n5nsu4=
X-Gm-Gg: ASbGncslEfWIOhlSLqI+0u3vjFm/TH3iuLEDBc2TLsU+SM4Jakcs7LCYivfTLzP64fD
 IeuuCULzc3pOYORLzk6n/HrJUqYqwa0694cmR83cH2VsH7bEKWVB03VCHaJgJ0bPqkapzkp/6ij
 7gh4Dl1t2S9kV6oxAtA3V4dw8M5TOmJS6CjC+I5iU7bDGV2TP+TGX8SYKc9+huaWzCLG/DT5Vzp
 15/BJaVRLGJQkVDlY4ZtMKVsg2oLH91kJ9cnYIyTX1J6hkwnuuiDqsV5KYAWpKbKc0Q23WC3D6m
 9ENz4x8ad79zPeRMr9ShPVWvelFAF2C4h5hO+USpccedIuH+hT6is2rpd+t7oQ2afET0sxQ=
X-Google-Smtp-Source: AGHT+IEK8JK5DtZLaAkJMolAlSlboIjYitOyjK3vekr4hRL/4+W/nuknTnupS56IhVxnTVQaQLo3jw==
X-Received: by 2002:ac2:4e04:0:b0:542:2e09:639a with SMTP id
 2adb3069b0e04-545180ea26dmr2471042e87.10.1739464929907; 
 Thu, 13 Feb 2025 08:42:09 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f09d0d4sm218066e87.100.2025.02.13.08.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:42:08 -0800 (PST)
Date: Thu, 13 Feb 2025 18:42:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH 0/5] EDITME: Support for Adreno 623 GPU
Message-ID: <wdeqpz7ckpzw5sx7pigcp7fjx7nf4irz23kvj6xwamv34vfyba@rwzavxd5o6o3>
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
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

On Thu, Feb 13, 2025 at 09:40:05PM +0530, Akhil P Oommen wrote:

Nit: subject needs to be fixed

> This series adds support for A623 GPU found in QCS8300 chipsets. This
> GPU IP is very similar to A621 GPU, except for the UBWC configuration
> and the GMU firmware.
> 
> Both DT patches are for Bjorn and rest of the patches for Rob Clark to
> pick up.
> 
> ---
> Jie Zhang (5):
>       drm/msm/a6xx: Fix gpucc register block for A621
>       drm/msm/a6xx: Add support for Adreno 623
>       dt-bindings: display/msm/gmu: Add Adreno 623 GMU
>       arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
>       arm64: dts: qcom: qcs8300-ride: Enable Adreno 623 GPU
> 
>  .../devicetree/bindings/display/msm/gmu.yaml       |  1 +
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  8 ++
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 93 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 29 +++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  8 ++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        | 13 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        | 17 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  5 ++
>  8 files changed, 171 insertions(+), 3 deletions(-)
> ---
> base-commit: 6a25088d268ce4c2163142ead7fe1975bb687cb7
> change-id: 20250213-a623-gpu-support-f6698603fb85
> prerequisite-change-id: 20250131-b4-branch-gfx-smmu-b03261963064:v5
> prerequisite-patch-id: f8fd1a2020c940e595e58a8bd3c55d00d3d87271
> prerequisite-patch-id: 08a0540f75b0f95fd2018b38c9ed5c6f96433b4d
> 
> Best regards,
> -- 
> Akhil P Oommen <quic_akhilpo@quicinc.com>
> 

-- 
With best wishes
Dmitry
