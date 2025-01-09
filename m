Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA48A069C2
	for <lists+freedreno@lfdr.de>; Thu,  9 Jan 2025 01:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF55E10E246;
	Thu,  9 Jan 2025 00:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="H8caAM1B";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E12F10E445
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jan 2025 00:06:57 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53e28cf55cdso285217e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jan 2025 16:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736381156; x=1736985956; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HIgUgl4N79dadeiXZRtpkyo/N44P164pFj//QzRGV20=;
 b=H8caAM1BJgxvmP9tvuaZsy+qxwf/IhwiRCS9n3SM4BVlgx5s323O2Z2zpamx01+MAv
 SbhI4IunrujxqK8ssU0UThA1aJcb9GnMpvDu1sbnhPGmPgnZ3dWJ5mglrCCjbApMZc0m
 25y+ay1f5+zFYiVUovyAi8WHNFZOajNbsTSDUuzzikJc6pXG5mabaXW4yp5lEcJJQgc/
 bX/Rhghlw/gSJRcmRSIAxJvLEV8qDWKsK0BMc4J5gPPFpI0dQM6SQDu8+kJtGr6oEsbo
 d6ZdP7B71EMmhUcnRkdpaDOKAMT7GnKYFazkqsIopes3Q7FX3aZw3vvPlq4Guo4cfi6m
 DMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736381156; x=1736985956;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HIgUgl4N79dadeiXZRtpkyo/N44P164pFj//QzRGV20=;
 b=p/w4XjvGkBJhdQ7N80HI41Z3+LBXxSGDgEKdVNx5tpNrOEKcK8p0F/MvHQZKF5xPpY
 2PeAyyxxZV0oSoASlHhh38Bj+mbJQpOdQ/0hqlHjvi1jZ/tER2S3DX+KtIietiyqZrTV
 ytLCywOAgR8BEryrcYped5PHe88JTgFSKLEZVaZroouxfN/DwoXLGvtJcxHGHqdTeVr/
 rdtLnT6lzSbMKDszje1JWFrdulc7E3MZRzE/JdNXvj5FHG9sFSyUJJSNyhsE26FADIoa
 T3tQYYRTSjJW5ZzIV6ZW/9nn1vPpXGUMQ9ESrbMytiFRB9IaIUjWm+HnRFxdXl3uwtik
 AVMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9VWrpkgQvuZhs/EeLsclFVDLyv/FZ5USbr/hnfxpk5lqCRozmjxaAIIh6q2uz5ZFY97AWqbvvphQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzw0tj9XxfqAo4b6Lo7ePiVNrRZGA93C/Llem3tgzbKKdpjyEfG
 CIM+841ig1zFLv3lSj8yB0+1xnu7LMg7DJtdsUx5tR9IwlJ00VsudAlBPD7Ll+I=
X-Gm-Gg: ASbGncs578ERtJW45dpxZl6VnEWQpLpysm80JKWava7DQCyeul86otVuj6q/wBQcMG4
 QhKlW7geGWWybsIrsmDwE/jvqvK2Mr31ZN2SV/B+IkantLuMfkqly2Ru2EYh//JTbjNyr8CUyA5
 97f5HzrY81qi+ipBde7KzOponp2OmJI6wI1CHkThkAG1bfEQuVFd2AihEqX9kkeYjhFscvcLNTN
 AfqT7JhqJepF2v/tKEIMKRujcCKh7DvnDYz359RWRsnJueLdy2t2tDM3PC5kHahfpBXMZ6s0dYh
 6IITGsjju93tE56IPCvYlcc9OksBYiPzpuYN
X-Google-Smtp-Source: AGHT+IELUqPRnCGpQ4QsIILyGi10OQNYGAtMxjnWsGZVt+RoeZcTFjHg8GOZFcw/nz8qgnwgQ+uKZw==
X-Received: by 2002:a05:6512:b0f:b0:540:3566:985c with SMTP id
 2adb3069b0e04-542845d1495mr1192732e87.26.1736381155638; 
 Wed, 08 Jan 2025 16:05:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be49a28sm30057e87.42.2025.01.08.16.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 16:05:54 -0800 (PST)
Date: Thu, 9 Jan 2025 02:05:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/msm/dpu: Initialize return value for
 dpu_assign_plane_resources()
Message-ID: <nlxhx5dlc6y4m5htbfv6l27ms66jpse4umj4c42fzrcctnvy6a@5dbsjmuqsjwn>
References: <20250108-virtual-planes-fixes-v1-0-420cb36df94a@quicinc.com>
 <20250108-virtual-planes-fixes-v1-1-420cb36df94a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-virtual-planes-fixes-v1-1-420cb36df94a@quicinc.com>
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

On Wed, Jan 08, 2025 at 02:40:47PM -0800, Jessica Zhang wrote:
> Initialize the return value so that the dpu_crtc_atomic_check() doesn't
> fail if the virtual planes command line parameter is enabled and no planes
> are visible.
> 
> Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
