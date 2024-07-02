Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B77F191EEF5
	for <lists+freedreno@lfdr.de>; Tue,  2 Jul 2024 08:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9069B10E50E;
	Tue,  2 Jul 2024 06:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bOGuWYX9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22D210E50E
 for <freedreno@lists.freedesktop.org>; Tue,  2 Jul 2024 06:26:56 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52cdb0d816bso3771586e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 01 Jul 2024 23:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719901615; x=1720506415; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2Ff4Ris1lJRxR6e0xGu/YQpNzFw2f0z8KnYBgggSnQY=;
 b=bOGuWYX9fQnTTrYJ/xUeO9Ofos0w2U7v739b3KkdJ+s78duwT6Cc6h8vv43BSpvefp
 TmUVcCzrwxhJ4R8cV9OXhlpfVBLFLPP9HZiGwnXuM5UuJaKyeHUOg9vlAHz45y1MUPbY
 ifK9ZAWewZU8yd292zBjDBJcff4Y7H7gTyTrAG0hS05mOpyKqSRYunWlTzMRffmOKbXy
 W4/QynCW+SbG2uu4mtrMzEG3SzmZkGfdTM/aYNCcpHXy+Y/AnmOSUeqAk6h5vEag+zhK
 1VoG4X6ykzaXQBGkwYTRHRbpLtRDxONAE6CfmFTJjCIkPic1e9OOMci2RPlqMZSKwN6B
 MhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719901615; x=1720506415;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Ff4Ris1lJRxR6e0xGu/YQpNzFw2f0z8KnYBgggSnQY=;
 b=NP/h7sm5sklbjdTqGVhKuUZBQMGhQzL4kjCoJT5DmwrITwmiv0VrbW6RPxZNFKbvRE
 6GfWpJ9fXs2JXo4Fn/8eP8FEVshAFcgsePr5on1B8e6CoGDx8sZVo08ssXQR4nD5U/h7
 9I5/TpnSqn93kvmVpn68ermGoWyaWDms8vGQX4i0SThlqJn/dFoUz5QiZY+MpQ29F7mm
 7SDuDjU4PAZhrCOHOpck62QvArDsaVW95WwAabqmdHqIIX6746909vg3frHWLwPFjkO+
 eUohRuffOmeHoPhBQJXq9+LMjquksQJUkt4U/Tn4ptRcSVXdyrGPaJjewbczZMbwNkga
 XsDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIbdZ/WZpF+HQ3IO64ZsKRVMTzCK6GYlDi+0TELBRyl9g6zrsAw9gLSzMtG5j0fnbdxQ4JOn6qNdsRaoqNrZMiLEhDk8qU6ZnM0tHM5y+D
X-Gm-Message-State: AOJu0YzObE4+VFw+pD/KBKka4Ibb7rFUcj3lJchP7qAlUyujxyznshF6
 UvwnEB7ts1AqLMEA10tIMD7RnD22Q+6mTMEI8M0tBqdWYS92MVRjE9C7tFHVPSs=
X-Google-Smtp-Source: AGHT+IGTfSdpdThJDoiFSVsTbt1wJIsaM88cMQegT3fVR+tIB61p9i1DpXSZ416qGf5KdbnNaDBD+w==
X-Received: by 2002:ac2:5f6e:0:b0:52c:7fc8:8658 with SMTP id
 2adb3069b0e04-52e7b92f94dmr2534884e87.34.1719901615025; 
 Mon, 01 Jul 2024 23:26:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab0bc5fsm1642862e87.49.2024.07.01.23.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 23:26:54 -0700 (PDT)
Date: Tue, 2 Jul 2024 09:26:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
 kernel test robot <lkp@intel.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/a6xx: Add missing __always_unused
Message-ID: <i46daa63dnz5an5y4463airqi57homwitfetepg6voxard3wgd@xds6h6grlpou>
References: <20240701212330.426399-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701212330.426399-1-robdclark@gmail.com>
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

On Mon, Jul 01, 2024 at 02:23:29PM GMT, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The __build_asserts() function only exists to have a place to put
> build-time asserts.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202407010401.rfunrBSx-lkp@intel.com/
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
