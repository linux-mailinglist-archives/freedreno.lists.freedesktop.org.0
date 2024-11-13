Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C36D39C6EB5
	for <lists+freedreno@lfdr.de>; Wed, 13 Nov 2024 13:10:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B56410E6E1;
	Wed, 13 Nov 2024 12:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uMv/fDO9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD1410E6E2
 for <freedreno@lists.freedesktop.org>; Wed, 13 Nov 2024 12:09:59 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e35e9e993f9so1311344276.0
 for <freedreno@lists.freedesktop.org>; Wed, 13 Nov 2024 04:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731499798; x=1732104598; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vurz8Z4ymLq0OAC/znWews1WaS5VvMmTAw7TGG6DFzQ=;
 b=uMv/fDO9T+Emu1vOYKFJzrmpIrL88TSDAWwVWacoT6FhkWC/XC/xXVy4RhGOp6pbcP
 goTXYku3cKDWm0o0Tuq6qIDSW9a96SjioaUX+c83VXEB/ZReiEaRq6EZqc69khYjC/UE
 VDPtPg/tYBdhHhH0z+D6XeWmr6k/lTi1yM/ZzmmhCKWcyW5qPQpKdp0nu9humGV/aIhW
 MJg85xPBvg7NSxuUfGWph/VvMilbxndJA+AQN1CG7v8Sp4396cmudpMCty2wz93n9+AI
 eNhSmLq5XGqxEiNY31DF88U+mZMR2VAzfK796s/C1Lt7NBQa5TZJhfDkDqCZyt3O7Dlj
 zq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731499798; x=1732104598;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vurz8Z4ymLq0OAC/znWews1WaS5VvMmTAw7TGG6DFzQ=;
 b=O/Ano13/J/YixDFm/LMZa9TNeJjRrEWkqR/9W7It4QXZoOtmp+OOPfsxI1GP67Mmme
 lHa38YpcYVR9vbkzJt13/Tu51D/VjxWiclqVrW7zGSivNcAfxbz5AP+4Q+jEAvg1M+DX
 Wf5Wnu4BNFZQcuGQWvKqZnhw4HY19mQASHbwU4ihCWoS8eEXgY3KqNaRiaUtYfGRAQhE
 21JGITR8KKHDRG5iEXPd28WIP7MpfHBkh2I6OH42tEbo7O2i/JNOncbCpvp8u43f7ikm
 MvyPmTNj5ah1/aCgv8UolN8MF4KVXmlWR36dXzRbj4Os7q3Njz9JPDgZX+ANa4wF8wpw
 XIVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWTw+fMjvgdLnTl/PyWjtMC5KFK96y7BKkc2S5aemvIael1PyHqOIaJ8nU0hdzXmDUmABJbfY61tY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXTAtkbh5Ik5baKjRuFOZPzyCQrdErwDY9htInLpeI9AmzTI3I
 uqvbn3s3CwCJaatXaoMvvfRmuiI+R4kcSw4edqR2ZinT6C2ibCOGE1tw1Obc7zoV0tVhJ85PcS8
 3tgzyFE/vkurWORy/Q4vMRGVC81roQMjLuA/hKg==
X-Google-Smtp-Source: AGHT+IEbVbENHDimLrclLq81k2K+eV3PjRDffS3YjYrYwNAjJe5acWC3fJAW8eAeTcDDEGpWp1iOm9mjfIL5BjU6U0s=
X-Received: by 2002:a05:6902:848:b0:e30:d4e4:b9ea with SMTP id
 3f1490d57ef6-e33a1f73693mr11483612276.28.1731499793667; Wed, 13 Nov 2024
 04:09:53 -0800 (PST)
MIME-Version: 1.0
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-4-2873eb6fb869@quicinc.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-4-2873eb6fb869@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Nov 2024 14:09:42 +0200
Message-ID: <CAA8EJpp2MyXZ28GQV3GDgQp9uCbr4devi++nzkeHA1fk6UZXxw@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] drm/msm/dpu: Add QCS615 support
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 13 Nov 2024 at 13:53, Fange Zhang <quic_fangez@quicinc.com> wrote:
>
> From: Li Liu <quic_lliu6@quicinc.com>
>
> Add definitions for the display hardware
> used on the Qualcomm QCS615 platform.
>
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_qcs615.h | 263 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 266 insertions(+)
>

This patch completely ignored some bits of the review done for v1.
Please take a step back, check what you have missed, respond to those
comments, etc.

-- 
With best wishes
Dmitry
