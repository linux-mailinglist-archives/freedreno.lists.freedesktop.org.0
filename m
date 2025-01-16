Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04097A13468
	for <lists+freedreno@lfdr.de>; Thu, 16 Jan 2025 08:55:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31E910E8C6;
	Thu, 16 Jan 2025 07:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bGSV7q/n";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BDC10E8C6
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 07:55:22 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-3002c324e7eso5395141fa.3
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jan 2025 23:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737014121; x=1737618921; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=W9r2mShDaZUavqmU+EODFd4L0OlYF5VNWr4sQ3SuH3g=;
 b=bGSV7q/nbcuDbX6z7sW8nMqS0PDmZ11W2+F77AM59IU9JJO5Ge5qLTZdRluZROCO/y
 hFH6hVj9UWA+PRVe3Be2+N8iRals7APsGE9ejP/HngY71iZTWEa4LoOI2GeeTZQCjyjr
 S48HS8ZMjqSrNeUm4QOSQjYDoUbs5VlW4LyQCrd8kNnvDwy53R2xSoVMU9dau923Ayby
 irCGmicUOBwNBRVfiqHryE8a3+qsA+nAH4V2dX8QfXDns7lqGLpHUOP17muiBV2JkUIe
 E4WuJ5ax/8pcpeRFEFK41gxXMz9Acrxkl0MfzIyvskQKsQq/k+fdKb2z3YhtdF2ZNVi9
 rihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737014121; x=1737618921;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W9r2mShDaZUavqmU+EODFd4L0OlYF5VNWr4sQ3SuH3g=;
 b=XVl5CAGNRoP+7XBM4nJkmY6utXNdl6SIf7JUSsarRYVYk6LFD+VMeEjrHVPrOQ3eyA
 80bZ8VlSnuEjUu1GsTcDx53d8NztwRrl50smqXieEgnlnZJb7HtBWlx+bo12DxrZ9jf+
 1kghIbbeQ5SFyEd26yu7JER9lmAa5jtl/Qn9/MnwVcTpNH0/fJ1gIcGfv07DapthZS4S
 f86mA+/8sk48sZ4cnX9KB9e98l96AcC3TLxb4C7n3X4Sxcos52oxmHSKwyCNvo4/jqs5
 RwFxG1/EC+8FGhSg75pA5ArZV/r2UCzAEaCHyvDy4uccBgexhutLExewbcRiH0Smf2vd
 QdSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJtA8oJtTS8tm9UGyi43uCdarfHZhalCo/6Ud12f2hWoIOuLdaaDoIaTOtXNId9GF6urEwZz3PSG0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzhf4rNh9V84nP5ZGCUgkDyIeEi/LE6biVG9kYjN/5ETqvcuVU1
 j/4LeoDhWZNG2kJu9fkjLT6KqHlLthPKXEDso8EptMmZEdCtM2pp+rBAO2nhu6Q=
X-Gm-Gg: ASbGncv9CmLtVSMq+iutnjMkb9eNaPEPo7p/UFs/Nre3wcdEPNVff4ZnWbRFBlOkyFD
 bEllmkZKqrQBZ1Ss72+ia8++bh+/ZjkzVXVUNlAWQyGB430lLtP+hkfeM8+ZT9zPhpAtfXrRrTS
 tk77xWt53sm795vnp+zRWJhx3xrRO3vEr5HCMAX7iXxkNsGa2+aePDs9JmYTbTszqdVFCGgBt5o
 /Fs7riuAm75VMkdmWDqW2uZGcr15+TAzzruhq3toHYn9mjOVaH4l8LZAWg20rh8m/wWka8aDxFv
 Q12RJzrSwIyE2pa9s+k2b76IIhv0OCqwH0Ym
X-Google-Smtp-Source: AGHT+IHfj3JfIrhEc5djBNosWJ+fiBasPZMlyhcF4dJudhn38zLrNos988Dhlf2AaunAFR7XhZyUEA==
X-Received: by 2002:a2e:bea8:0:b0:302:1b18:2c09 with SMTP id
 38308e7fff4ca-305f45ba080mr114128361fa.27.1737014120610; 
 Wed, 15 Jan 2025 23:55:20 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff0e712dsm24319121fa.51.2025.01.15.23.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:55:19 -0800 (PST)
Date: Thu, 16 Jan 2025 09:55:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/16] drm/msm/dpu: Add pipe as trace argument
Message-ID: <jnazuwxroizov6hysv7bhsjtqnzfrtqotjmjzar4lbhrdokf64@wzbfkkpcfch7>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-9-74749c6eba33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-9-74749c6eba33@linaro.org>
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

On Thu, Jan 16, 2025 at 03:25:58PM +0800, Jun Nie wrote:
> Add pipe as trace argument in trace_dpu_crtc_setup_mixer() to ease
> converting pipe into pipe array later.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
