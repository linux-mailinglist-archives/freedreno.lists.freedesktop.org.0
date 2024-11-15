Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6E99CE11F
	for <lists+freedreno@lfdr.de>; Fri, 15 Nov 2024 15:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5102410E061;
	Fri, 15 Nov 2024 14:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qn3zAUgk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CF310E061
 for <freedreno@lists.freedesktop.org>; Fri, 15 Nov 2024 14:20:24 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-539e59dadebso2155763e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 15 Nov 2024 06:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731680422; x=1732285222; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9kxLZh7oIW/Qu6MO9UxZ5HRBg1gE82+4pLIY8QLKtus=;
 b=qn3zAUgkNaxQVDXvMG13T98VDBWQhEGZGtmYLSarRSX3eJTVwa2ngwPsabohKdP1AY
 YSEYpMSSpJGXvzjWaHqHWWBvhEcQoqvcZeYGyZTJJRDP62+IVlLRJVKzr3FmEWQOUiSY
 xDo4/iSgaEKNxv8uB1AD8Jl4Dan1Otcb1OrcACUPvxCC47XOgCwyxtOC2ZMJ7rQJCut/
 V8qsVcTM9kaUOZZh3i+nYM+fSSsBwSZWNyF98ZO2VUeYH+FLCdzeInzVkSQABdO7LRHU
 cix9DDr7RxlK3byqZdRWuFt3W2cVY/m/iOIcyafzNIjwD3KWcITVcJGFqPuvHS2YDZ5G
 Q0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731680422; x=1732285222;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9kxLZh7oIW/Qu6MO9UxZ5HRBg1gE82+4pLIY8QLKtus=;
 b=mKmd7aghN1nv6A5rW/gfH7zzxC7LBgRgqcsKvYDjLxmIB0yN9hYC5Sz6G1S34OxMnz
 h7/afJeOnKI/N9HbMZB6yXb7eqWMOokK+b8DiL8DC3qMtCXAQODLdugeZsFzKCUBj4uv
 8gZKViJAozgd+Wh0dgSoRj0sFvC5Rt1nAlTrJCamGqUsn+O7DU73gIGoTsaecxhxM6Xe
 2DHrHhwtBma9MuldXbP/5D6EmyrQEVy3pqj/iECQyqfZyyzFs5TGdz1tz/2VW1A1c9xh
 fcQRMSOQwn2mrXdtOl1wrS0LfqxA4GC+W0G4JR2koigx/E0B8WEn61tPqQ9GfewHzbon
 C7sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz+OZ07uL/gJnX3d8yCctVoKa9yIIrdfv7znBGP1V0wC9i3VNk6r//AWUDcQUQCvaPwhit6pVeIZM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4y5rozYGCPWNlf3bumYDt4e1oIaMT7f98GEUrwvP8ucjCZ4Ku
 3uB6LF35FaFtAMUOVRuxnWYXS3kCxks09qY72W1E6+vLYIdbb6G1csPyMKpAJrM=
X-Google-Smtp-Source: AGHT+IEBU8A15vScg0ia4WplSofYKJIuXC0KSALSXA7EzvPsyMeCtNrpJisnibjIPA6EZmUQQ6oJwQ==
X-Received: by 2002:a05:6512:3a88:b0:539:96a1:e4cf with SMTP id
 2adb3069b0e04-53dab2ab63fmr1545621e87.32.1731680422383; 
 Fri, 15 Nov 2024 06:20:22 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53da6549034sm584101e87.272.2024.11.15.06.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 06:20:21 -0800 (PST)
Date: Fri, 15 Nov 2024 16:20:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix x1e80100 intf_6 underrun/vsync interrupt
Message-ID: <7qx65y6o4fvnnnspof2exzk7xru4bgpda43655deeu7hw6wowt@zcnpzyw2xutm>
References: <20241115-x1e80100-dp2-fix-v1-1-727b9fe6f390@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115-x1e80100-dp2-fix-v1-1-727b9fe6f390@linaro.org>
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

On Fri, Nov 15, 2024 at 01:55:13PM +0100, Stephan Gerhold wrote:
> The IRQ indexes for the intf_6 underrun/vsync interrupts are swapped.
> DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16) is the actual underrun interrupt and
> DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17) is the vsync interrupt.
> 
> This causes timeout errors when using the DP2 controller, e.g.
>   [dpu error]enc37 frame done timeout
>   *ERROR* irq timeout id=37, intf_mode=INTF_MODE_VIDEO intf=6 wb=-1, pp=2, intr=0
>   *ERROR* wait disable failed: id:37 intf:6 ret:-110
> 
> Correct them to fix these errors and make DP2 work properly.
> 
> Cc: stable@vger.kernel.org
> Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

This matches other DPU hardware, so

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
