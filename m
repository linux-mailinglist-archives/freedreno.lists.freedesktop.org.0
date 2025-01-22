Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9500AA19AC1
	for <lists+freedreno@lfdr.de>; Wed, 22 Jan 2025 23:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E01610E773;
	Wed, 22 Jan 2025 22:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZZedrW/M";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0704310E772
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jan 2025 22:15:40 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-304e4562516so2856811fa.1
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jan 2025 14:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737584079; x=1738188879; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jwZtc77vhcVJuVM8Re9KLoWSMRTvcITBEPJQXYppitQ=;
 b=ZZedrW/MJ9pQPRlE1muu4oWuqaoRvPz7pAAyBX4F9Ilo4+88Xh3E549QZKGnUvS9XY
 H4aGTzgQH+I9aVzF2ZC7WBwErgYuaZXuxvqEh0S9zBZ5FCs/XEKS1gy0qCEBmdCIasVg
 xkEGCD1xL+rdrVhASkL/LLjadfwQqS7LnhLuKM59HWwCBkxhp3j5WCEy56Dyq8H/YzpL
 Trk8K/zX+Ed9mz/WFO3LhO4hn9JdHhXnYySQIu+HOxxmha0ywixcEhBwqzZvTe+XZi5a
 0G2MFWeigqAGYi+WGo3yaHIK463xmvW2Zr5yKL2rjjJuXD93KvGoNWoRHBtsFE7KJV5X
 Y8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737584079; x=1738188879;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jwZtc77vhcVJuVM8Re9KLoWSMRTvcITBEPJQXYppitQ=;
 b=PO1c1D2bKho6d66yXjvJ+qbuTI/1UbGgGtBUgs3MA4mX5k+Ph0mwj7aNUnWpFziPBU
 7PrXQyVbpHhaRsOzu4xh6NpN7GAzgySOJPg9YMgSQeph9zxQzOPod6FvwBFUrKr8Khjk
 t5nhEp2bb5DwlDqQUzUPp4F9wiakf7TyjHRrqCMBQE1x6yF+usrknvG/PNU4BGfwlYeE
 NayskqbXq3A+wbao7xA/XJ2RAb9rT9GSZOZ3bLYd9RoFpYVuzTh5pTwd+4OGi/6v+kUS
 fshEiUndSEXYH4Kpeh5CW/lPef4WTNlyKvN0codrU6icDQSUUuX/tQdHqYwUNaQ/P7KT
 JrAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFNqRZS50TiSV/xb1Vqajj3mxU6mvGk7j+iasTY8ferVxmZbd8YsvtF1G8pq3upIEIcnrxxHxG06U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsDQ0Bx28Ckworj5+GYA2Yjub5+OG31RdglF7FGvDzKN1cKJab
 CPKoJZGdFu0JLoDdIF8VrPsgxcalqIF5J/om84joS5Qp9T/OAJmEfQSBTAIFMMM=
X-Gm-Gg: ASbGnctv1FTrn7QHqQIZXJcIGAPczIx/Be7AbUQKE8BzVfRl2gpYGEtJf19tl1qFdRK
 YIMfO0dfw3UYyOSELz+Of+FvbIHYLAEwAzOgtZuR8nf35b1M1DvOwc1psF5FG4ZCTrJ4umrBLLw
 jgUVrRDMM4P7RjuZ97Ag6yOdtGdSUwWK2XVZhiz8KbhVEwF4dE8tZoLdScI4GhdMBdqobpqwJcK
 YDPP8r3AFGI5qxE3A9BaGbNn7F5ORSpODgj1zpFDGpeFMWBvB/qcZI3zleYdeSBFng1qdb+pKCj
 H5IKUl+cfKge5w3SQ7BOPCm6Q94JesdlKMDF3Dxc/9dNUW9kXYP/TZRxmfNB
X-Google-Smtp-Source: AGHT+IFK/4GQM98jZZ/5OPlTud8xH7WRoXr9IJVmyofaZZMHWNRpLmTWDBbwwb5fKkA6+eFoKUKwWg==
X-Received: by 2002:a05:651c:410d:b0:300:3307:389f with SMTP id
 38308e7fff4ca-307619c49c8mr1819821fa.0.1737584079129; 
 Wed, 22 Jan 2025 14:14:39 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a4ed2d2sm27708361fa.74.2025.01.22.14.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 14:14:37 -0800 (PST)
Date: Thu, 23 Jan 2025 00:14:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 0/7] drm/display: dp: add new DPCD access functions
Message-ID: <ctla3nt6o3osdxek63zyidyuofzgq3mgshh2azong3ntcqevhi@3rrzr3hrzbor>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
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

On Fri, Jan 17, 2025 at 10:56:35AM +0200, Dmitry Baryshkov wrote:
> Existing DPCD access functions return an error code or the number of
> bytes being read / write in case of partial access. However a lot of
> drivers either (incorrectly) ignore partial access or mishandle error
> codes. In other cases this results in a boilerplate code which compares
> returned value with the size.
> 
> As suggested by Jani implement new set of DPCD access helpers, which
> ignore partial access, always return 0 or an error code. Reimplement
> existing helpers using the new functions to ensure backwards
> compatibility.
> 
> This series targets only the DRM helpers code. If the approach is found
> to be acceptable, each of the drivers should be converted on its own.

Gracious ping for the series, it's been posted a week ago.

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (7):
>       drm/display: dp: change drm_dp_dpcd_read_link_status() return
>       drm/display: dp: implement new access helpers
>       drm/display: dp: use new DCPD access helpers
>       drm/display: dp-aux-dev: use new DCPD access helpers
>       drm/display: dp-cec: use new DCPD access helpers
>       drm/display: dp-mst-topology: use new DCPD access helpers
>       drm/display: dp-tunnel: use new DCPD access helpers
> 
>  drivers/gpu/drm/display/drm_dp_aux_dev.c      |  12 +-
>  drivers/gpu/drm/display/drm_dp_cec.c          |  37 ++-
>  drivers/gpu/drm/display/drm_dp_helper.c       | 345 +++++++++++---------------
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 132 +++++-----
>  drivers/gpu/drm/display/drm_dp_tunnel.c       |  20 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c              |  45 ++--
>  drivers/gpu/drm/msm/dp/dp_link.c              |  17 +-
>  include/drm/display/drm_dp_helper.h           |  81 +++++-
>  include/drm/display/drm_dp_mst_helper.h       |  10 +-
>  9 files changed, 354 insertions(+), 345 deletions(-)
> ---
> base-commit: 440aaf479c9aaf5ecea9a463eb826ec243d5f1cf
> change-id: 20241231-drm-rework-dpcd-access-b0fc2e47d613
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry
