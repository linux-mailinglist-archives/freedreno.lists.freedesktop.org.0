Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 391E9A2DDD9
	for <lists+freedreno@lfdr.de>; Sun,  9 Feb 2025 13:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E34210E31F;
	Sun,  9 Feb 2025 12:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JZ6lHdyU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1A610E3F8
 for <freedreno@lists.freedesktop.org>; Sun,  9 Feb 2025 12:43:09 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-545075ff6d5so793303e87.3
 for <freedreno@lists.freedesktop.org>; Sun, 09 Feb 2025 04:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739104988; x=1739709788; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9gsXK1c1HmBF0r91iHeQ51YNAu0JZcecPSTcAdGkjgo=;
 b=JZ6lHdyUAv5h8a+UtwZldMDZrjvjfGt5RAm2BdlvPYjmoJT6kTnBQXBHEjiFVb+zZv
 wRJ22YBYzoevutgrXaRs7eS+6BfPSGhgXz7SCU+Yj5sHAcbfVXm5BSOUI+LsINzGA1gS
 7Bp/p8mBnrv5wlO6QMRpkgYp9Z5MVDf1LCzvpXHwUDlZ5i+LOaTQWnpz8ED3aUJb/mNj
 YdYIZ8UhpwrLj2o+R+HDTWhzi1VGhYYmBEfsenmQs0PAkGcyRid5opAhaDQ8+Tp0jalD
 IQJsMnWzkHHbCHHBFzVXFDSQKqdBLa4trkUzgEsL4jZhn3EiuV9Jvo3RxWpcoC/RBlYV
 zPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739104988; x=1739709788;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9gsXK1c1HmBF0r91iHeQ51YNAu0JZcecPSTcAdGkjgo=;
 b=J7E+pW/d5cmkmqC1C9hMT5SgBqSXmC+aFNosvqIg5sSgnmCagDG8AT4xej/upHmCVv
 49PoyllozqtFj8HKi9i40O5YKtkoX7Pm2YccOdHp/o2pUy4FZMtQ067IP9Qe4MA2cxMq
 fZ+YrOgpHuCjw+aNrU/NPeWDaSolbzyV5CMw9KhOr2RO8yxwlCJ7//+uauKC+uX9+SmN
 mgDVBJRgK4+dbqyclRUK5Ro7ihJoNVMZLBWm01L02OwgIlpm0CnJQJ0WTerXbGyGz1ir
 l8Gv8cYBVTbn5Fc4GNZ/hWbNy4uFs/nWSyVb7wOOSCH4/AzxYazASlJDipwzrR2Tafng
 AeGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjSb4oaPNbni5RJ6zmjaUCJsfHQEV867DjlrI8fI6barflA7b3RuBDLU5DM78v+D1JyVoK+3In1JE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzxoo9sEUHjnGVE8hg7l1YCfRM62ajErfxhzyFDOIhYsw7JmYcm
 QEAbA+5EurhEqYzbAOg5URp0+Ou1y+zzDGtpQebPPXPel/p2K9sr75BpXgDs5dw=
X-Gm-Gg: ASbGncte75Fj83X88FqMF4EAcwpVXdt/bBSfseWGhWwD49JTiXnhwY6Qzu117w9Ck7Y
 vbh3fZEKq7H3svRXAMUFJOg6qorRINvcH3cfb8oUMCVgJq9MZGerGzEbOMEz+Nq1WC8bYhrbDfW
 2gIwj3gyTBsZpF+Cvux0N6fhAJEc4+cpYfucOPqT8Wq26ox98IuhBxtoYhH03aaijOjF8TGqic5
 96osxrJOdA2ktq9AIjZ6ApeTkwVlhojCS/661aiEJ403wNMJnWPht2AkdN3PjjCKsTLanMAZBDI
 YmuTNpD5Sk83KQdEKCMvtYcfrZQD6sM2Zt0mjH4nYiDklXNrbpUeUdkCK+bzwYNDpuWqTb4=
X-Google-Smtp-Source: AGHT+IGo53O+US6XScRqpOTQ1EFQWQ3fdSrf5MEgBBs2ShlxBiJl7TtgukYGj4l7WJRi3NjYq3C2SQ==
X-Received: by 2002:a05:6512:a8b:b0:545:ba7:26f5 with SMTP id
 2adb3069b0e04-5450ba727f9mr302724e87.46.1739104987991; 
 Sun, 09 Feb 2025 04:43:07 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450a1fbfc6sm146222e87.92.2025.02.09.04.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2025 04:43:06 -0800 (PST)
Date: Sun, 9 Feb 2025 14:43:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/bridge-connector: handle subconnector types
Message-ID: <k5ziaxb3jgqfxd3wadi4irk6kbtawudzkkatcmr635gidw6tf5@i62xyzbv2gyx>
References: <20250117-subconnector-v3-1-1e241c13e576@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117-subconnector-v3-1-1e241c13e576@linaro.org>
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

On Fri, Jan 17, 2025 at 11:50:50AM +0200, Dmitry Baryshkov wrote:
> If the created connector type supports subconnector type property,
> create and attach corresponding it. The default subtype value is 0,
> which maps to the DRM_MODE_SUBCONNECTOR_Unknown type. Also remove
> subconnector creation from the msm_dp driver to prevent having duplicate
> properties on the DP connectors.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> This is a leftover of my previous attempt to implement USB-C DisplayPort
> uABI. The idea was dropped, but I consider this part still to be useful,
> as it allows one to register corresponding subconnector properties and
> also to export the subconnector type.
> ---
> Changes in v3:
> - Rebased on top of linux-next
> - Drop subconnector property from msm_dp driver
> - Link to v2: https://lore.kernel.org/r/20230903214934.2877259-1-dmitry.baryshkov@linaro.org
> 
> Changes in v2:
> - Dropped all DP and USB-related patches
> - Dropped the patch adding default subtype to
>   drm_connector_attach_dp_subconnector_property()
> - Replaced creation of TV subconnector property with the check that it
>   was created beforehand (Neil, Laurent)
> - Link to v1: https://lore.kernel.org/r/20230729004913.215872-1-dmitry.baryshkov@linaro.org/
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 28 +++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_drm.c                |  3 ---
>  include/drm/drm_bridge.h                       |  4 ++++
>  3 files changed, 31 insertions(+), 4 deletions(-)

It seems this isn't getting any response. Also we don't have (and don't
expect) DVI-I and TV bridges. Let me merge DP part to [1] and drop other
parts.

https://lore.kernel.org/linux-arm-msm/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org

-- 
With best wishes
Dmitry
