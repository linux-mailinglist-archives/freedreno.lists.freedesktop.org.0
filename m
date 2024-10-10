Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B914B998B43
	for <lists+freedreno@lfdr.de>; Thu, 10 Oct 2024 17:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A0710E95D;
	Thu, 10 Oct 2024 15:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="u4t7IiRe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A66810E95D
 for <freedreno@lists.freedesktop.org>; Thu, 10 Oct 2024 15:20:41 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53995380bb3so1386668e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 10 Oct 2024 08:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728573639; x=1729178439; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Yl+AJ7lyFwjwDvwphBTlSXLZHqolk5S2mucilQyKVTA=;
 b=u4t7IiRePivhQHQd0j5HZaNaWBwm7kX9C6c+z2uDe9CN44n9wbYnFfsImgY4vWDjBe
 v/gIYX7Zkxz6utUBftuvUWUpLGDMbUkrWGFYPh8Qv9lZtVwHlNcIW9EfUBYYv4hvISvP
 78GVJkwlvXea3DN6FDUUTy7vgAoloFHNilAxxcYus3ZAcRrXC+SE+VNS2TWp9uL0eBq2
 64xzaQ2FxCvluWvWS4RLHpo7bd6tRyeIl1ZeKOuoWujHrKSDfj9cOMN+nS8t/gcjzXzJ
 76VTp+v4RtIIw01V9AgfMJzCCsP5tGjORJy4c20aN5fiP/SLQCYnd0HOPITtDQ+G8Oy0
 InJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728573639; x=1729178439;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yl+AJ7lyFwjwDvwphBTlSXLZHqolk5S2mucilQyKVTA=;
 b=cibdlomdDPXFjmKeIFsEvb+EVSGIJv5L+vJL/1FKp353IZdPZ5QLUZVEgc1TbI7HKz
 R1kTQTcV9KLLKpvPJU4I41mI/xQRBsE4naq/euqRjkZj+k/QqIQPNtEabjX0kU9+sxD1
 1K3bzMh9V1e8Icp2Fp+fivkIK4g0oybMhm1fWTuoIIvyB10E4tkVfnU4F2+NqdssE8XJ
 TaoPU7zBIy9YplV49BU7tkzO5OMc+5Q8oPkyurpzlVoolfiPtsMcArCQEnCRiowvrrsW
 pHQc3XMQ9RZ68LyXgApKT8abDh1cX60GgFyApzp9GUnqEOlUK53ASDuBFwmnnnnPnVZX
 MupA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7+44jh08OuCZpJdpNOoCNTtNbVkf3v37I4z4qAbML+9ZAyON8XKPxvyBUIGGygs7TKTKfglkCVLc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpIg/303qwrM/e9WQjPIJmZ6lPYckGdLfduznACiKL7mRKJe5f
 LsOaqSVcbgVyUbfz5z5jJdhVR2uGY1IzNX68K2O2EkUbHfC1Q7eAiQn94tqzagg=
X-Google-Smtp-Source: AGHT+IH/AhoqLxAeDa8GrTS+pYtnDRk05gpq3mqxJbZBvTFUqCKS16r2AzappociNsYeq9ZA5HsNug==
X-Received: by 2002:a05:6512:3195:b0:535:3ca5:daa with SMTP id
 2adb3069b0e04-539c488d6f3mr4627086e87.7.1728573638749; 
 Thu, 10 Oct 2024 08:20:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539cb905182sm287086e87.258.2024.10.10.08.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 08:20:37 -0700 (PDT)
Date: Thu, 10 Oct 2024 18:20:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH] drm/msm/dpu: Don't always set merge_3d pending flush
Message-ID: <5scqahnsr5i26rkumg5eqdiwrg5n7rrnrp5642c6moxucf6w3r@xcgrxtjhj3pz>
References: <20241009-mode3d-fix-v1-1-c0258354fadc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-mode3d-fix-v1-1-c0258354fadc@quicinc.com>
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

On Wed, Oct 09, 2024 at 08:41:13PM GMT, Jessica Zhang wrote:
> Don't set the merge_3d pending flush bits if the mode_3d is
> BLEND_3D_NONE.
> 
> Always flushing merge_3d can cause timeout issues when there are
> multiple commits with concurrent writeback enabled.
> 
> This is because the video phys enc waits for the hw_ctl flush register
> to be completely cleared [1] in its wait_for_commit_done(), but the WB
> encoder always sets the merge_3d pending flush during each commit
> regardless of if the merge_3d is actually active.
> 
> This means that the hw_ctl flush register will never be 0 when there are
> multiple CWB commits and the video phys enc will hit vblank timeout
> errors after the first CWB commit.

From this description, wouldn't it be more correct to always set
intf_cfg.merge_3d in WB code (even if mode_3d is NONE)?

> [1] commit fe9df3f50c39 ("drm/msm/dpu: add real wait_for_commit_done()")
> 
> Fixes: 3e79527a33a8 ("drm/msm/dpu: enable merge_3d support on sm8150/sm8250")
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 5 ++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c  | 5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
