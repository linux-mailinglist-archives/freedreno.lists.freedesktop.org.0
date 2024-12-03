Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BA79E2FFB
	for <lists+freedreno@lfdr.de>; Wed,  4 Dec 2024 00:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D2710E0B9;
	Tue,  3 Dec 2024 23:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gw/zaVH7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAF810E0B9
 for <freedreno@lists.freedesktop.org>; Tue,  3 Dec 2024 23:41:34 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53df80eeeedso6305846e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 03 Dec 2024 15:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733269292; x=1733874092; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8VaC+AymHtSt0FKShOF4pPudg6QHjxqRoyWJzcS7cQs=;
 b=gw/zaVH7WqVhJxbraw999YeUs5b4jZ0pe+LAjXBSmdKmLxgTiJmk5tn1nc68Kkb3W6
 v3VmkqjYB3HRcpsN4QG6fuWzpFBHRzRAL5qaUNuhV5rTiGoKgB8le647EWbQbZLbj70W
 Pzfe6QV7jXSvyWSfvlvfZC28zRS0k04JV+nAVfzbx3BUpNFBhqLzGKvEC+HWsuzALNuD
 jgMBrhULq+Yx4v6q0i3kb/UwkgR/eAEGmJwNSoLBQAzxY9dzhT9WkDW0nWICM/no1uT5
 N1/Zk2TpWCMNNZHFUh+8UgpcAYLKQPNnyjRePoiQrqf34k2oNVWDG0J+uW35t5DSLs2k
 PkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733269292; x=1733874092;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8VaC+AymHtSt0FKShOF4pPudg6QHjxqRoyWJzcS7cQs=;
 b=Djtb9PDf7RlgCbtVX5kywHw+qe0egT4OfbdVjT/qAMnX0bXfrif+1twyM7CBhR/TVQ
 k7Psv8SRPmIkNMt1fSOCH45bJO60lDgmSdYjFNK9YWDHxkgAqOyyCA/nrA1loJvkdBmF
 8ylcWwAVup8cu7qEOBt60qVOLIEusLJEkIJOPlCLy/JpqhWu2RCkS1G+ki591RGe7l3y
 hILbHFZrds8sfIKGX1apv/Yelgy9EDEkKUl0Zi7SQia4RKSxz8Ef9010tv07PACPWsoi
 LrjWmZhdmufN2GfTGakl+834Sr7z+E1Qg6Qu1Uwt4fTc+yCtCYEhSqX8dhMSS6WHmj1q
 l06Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW60QouBwIPz1rgTfKYqnN46aAVrT24LWkLv8R7BFbAH2A9pcRlYkWjkILNVsyTDBOQK5mfUT4v/nc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDyq2SmNS3k0viWVoiyHmyl9gBQCLUp8wnBW7zgVDy46f6UbpK
 J7IcGacxQik1ZbOxdVYE1KyherzT5jYh0ljVTfIAxN+bvwtRHJOqQMh8Z2sz4rU=
X-Gm-Gg: ASbGnctUGtCELczZsbWAY0wuh1gXVcMLh66zcHcblt2J54oWqdA7VHL36+ooQQuLTuG
 S+30jwujYemFDjM9FOiGMpxZMTWC7XBN/+xS/WY3HObww2DwjbZOiO8QyqH3R0MVwfhzZApKazM
 Fm6yXOMhjO8nwM4TRqSFQqzfvOkpPunrHqJKK+RPXAQ8UIyPpBri4/msbL6ifglUk61KOqI/A6H
 yYu2nZ0mJHDF7c2GyckLt4EwKqD6i4O8AXXy2gu5P7klualwD5P1PANirtdqQRXDj/hFZDSayyY
 cp/KxSAGDeSXT0FnS0hsqIy498xGvA==
X-Google-Smtp-Source: AGHT+IHKVny7lfTjFjv8vQ1LYIothrll+JFM6c9K9LYC/aAoAQoTnV/eiGZCUxd2b4XbU8ATpvpJTA==
X-Received: by 2002:a05:6512:239a:b0:53e:1364:f982 with SMTP id
 2adb3069b0e04-53e1364fa93mr2296539e87.17.1733269292308; 
 Tue, 03 Dec 2024 15:41:32 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e1356906esm371633e87.15.2024.12.03.15.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 15:41:30 -0800 (PST)
Date: Wed, 4 Dec 2024 01:41:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danylo Piliaiev <danylo.piliaiev@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/1] drm/msm: Expose uche trap base via uapi
Message-ID: <owl2yqfvo3riismpltxu2puytquy63hrx375mxedntfjxq3wve@yhofuagrozeh>
References: <20241203095920.505018-1-dpiliaiev@igalia.com>
 <20241203174011.731980-1-dpiliaiev@igalia.com>
 <20241203174011.731980-2-dpiliaiev@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203174011.731980-2-dpiliaiev@igalia.com>
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

On Tue, Dec 03, 2024 at 06:40:11PM +0100, Danylo Piliaiev wrote:
> On at least a6xx+, shader could read 64b ALWAYSON counter
> from UCHE_TRAP_BASE+0 address. In Mesa it will be used
> to implement VK_KHR_shader_clock and GL_ARB_shader_clock.
> These extensions provide shader functions to query a real-time or
> monotonically incrementing counter at the subgroup level or
> across the device level.
> 
> On a4xx and a5xx it was not tested what is at UCHE_TRAP_BASE
> address, there uche trap base is exposed just for completeness.
> 
> Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
> ---
> Changes in v2:
> - Rebased on top of https://patchwork.freedesktop.org/series/141667/
>   in order to return error via UERR when there is no uche trap base.
> - Updated commit message to explain why we need to expose the value.
> 
> ---
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 ++++--
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 10 ++++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 12 +++++++-----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 +++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
>  include/uapi/drm/msm_drm.h              |  1 +
>  6 files changed, 25 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nit: in future please don't send new versions of the patch as a reply to
the previous version. Please start a new thread for each new revision.

-- 
With best wishes
Dmitry
