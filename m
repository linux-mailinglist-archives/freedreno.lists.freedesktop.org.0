Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2317C2685D
	for <lists+freedreno@lfdr.de>; Fri, 31 Oct 2025 19:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771E310E374;
	Fri, 31 Oct 2025 18:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="b/kwE4Ae";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6FD10EC11
 for <freedreno@lists.freedesktop.org>; Fri, 31 Oct 2025 18:08:28 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b704db3686cso560491766b.3
 for <freedreno@lists.freedesktop.org>; Fri, 31 Oct 2025 11:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1761934107; x=1762538907; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=k8d3ECFMhnrvwiqROxc/5OIhq95iyP7zpdKInqKWJBA=;
 b=b/kwE4Aef4hw+MIJ4+nMFUvgCubx3RdyOLQh5aCJmwm71WtvXSRH9WlR3WoZw/MKSN
 isLauRxJz3hiPUWa/l8QROC4C6BB3xQR68Wt56OksBrb0abJMo2ZfxL5r+BACfcUXfz+
 ysGEPN/TEAY8e9PWlCQyNkuHOZBanlgOTsQzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761934107; x=1762538907;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k8d3ECFMhnrvwiqROxc/5OIhq95iyP7zpdKInqKWJBA=;
 b=v0tdZ6L67MS7ubrlwmjhio4p9j1XKra7BbcpVB4ZpilqLDauvUSu47iVqmfuBwdVho
 TvXeNIWsOgo/2pwTa+FBz2GYzAwKod9HiWKv+mxo6D+iwBKxg8RbB6cjm5mgiFMhvAfm
 lCX9t2BsZLD0d7FOvRW8UYHeiPl/21/HidSnT7TjcbNunjRwnXqy6YvCvxhyiL9/2GUk
 LWFLHA42xkG8pzTUUruKcG2ihcnuyUMcUYq9tL8SccEFszYYMH5IMMl9/RednQx+GOLQ
 ZPZKEke9Pk+UBpJSBOPMqZRd7dazJ4eVnCszIpVWvPeiNfbCLTkMjJrsQAegQOIV6sAn
 ww8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDVAOfYw/rFKn+k1uTy4ujx1D9X1k8lLYfWG9UFypuTg5A+54KNplarxu7/obLe3GWhGn/ydMHBnk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzpzi6ghb3Pr5f859UjGr18PsfNCx/xD6FASU0eW2NDO79Uz6nj
 65kHRx0/mUHyG77UQJ5xBDFHWS0XIKJqg0rQdN+DgUY8iyZUxXs6UffrdfaFgBmNshA=
X-Gm-Gg: ASbGncv4E9M4o/cPPens+Z6xs5AoPzokCvPXBK9msDv2LHCveCrXztpWkFPP2y+CE9U
 c5kMAEpAlLeEA0Xpi1a16e/Co8m00RUL/DcOmmQXL/rwTGXt7atzy7bWy1goL4znzjP/Lo75qMX
 jRDsLp6QMKajNhoD0ndONSSpDzIehjQzCVGRJkIGyxzv15lJSSEM3eP1yTBS+rgMTB72TOyHeHY
 4AOxbWqPFoyQ8ZZJ11a/Yca8xIpWu7BlGtdY/REMZuAGHZCGth8NhsvCUacjFo756CHiatHwWgW
 9UQYoZuyA2/gS4HYijaKHbmNGIhf/ACRth0x2a5EMxHUZewIGdV1/Qi0p3fI6VmV8Uq3Qg0i44Y
 rIHmatFMBsBJAjEgfLU/OzdMR3yNr5pqEdIi1ZQUk7PCy+w37hNIgCDAYKQIobA1Wo+M/svKUan
 W3ryuIeh4Yz9E=
X-Google-Smtp-Source: AGHT+IGqIcTutuaI6gZsnpUKDuo7K+T8kt8BjV1yz4nEoXEK2pIhTNz970Lt/A0xE/Jshiw649tVtA==
X-Received: by 2002:a17:907:d7cb:b0:b3b:9832:f9b with SMTP id
 a640c23a62f3a-b7070191794mr462444466b.25.1761934106546; 
 Fri, 31 Oct 2025 11:08:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7077ce927csm235947166b.63.2025.10.31.11.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 11:08:25 -0700 (PDT)
Date: Fri, 31 Oct 2025 19:08:24 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: David Airlie <airlied@gmail.com>,
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <freedreno@lists.freedesktop.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Vignesh Raman <vignesh.raman@collabora.com>
Subject: Re: [pull] drm/msm: drm-msm-fixes-2025-10-29 for v6.18-rc4
Message-ID: <aQT7GMYPkgALgJ5q@phenom.ffwll.local>
References: <CACSVV03kUm1ms7FBg0m9U4ZcyickSWbnayAWqYqs0XH4UjWf+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACSVV03kUm1ms7FBg0m9U4ZcyickSWbnayAWqYqs0XH4UjWf+A@mail.gmail.com>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64
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

On Wed, Oct 29, 2025 at 03:39:06PM -0700, Rob Clark wrote:
> Hi Dave,
> 
> Fixes for v6.18-rc4
> 
> The following changes since commit b5bad77e1e3c7249e4c0c88f98477e1ee7669b63:
> 
>   drm/msm/registers: Sync GPU registers from mesa (2025-09-10 14:48:12 -0700)
> 
> are available in the Git repository at:
> 
>   drm-msm-fixes-2025-10-29

This is not really a git repo, there is something busted with your
scripting. I just used the url from the last pr, which seems to have
worked, but please fix this.

Anyway, pulled into drm-fixes, thanks!
-Sima

> 
> for you to fetch changes up to f5d079564c44baaeedf5e25f4b943aa042ea0eb1:
> 
>   drm/msm/dpu: Fix adjusted mode clock check for 3d merge (2025-10-29
> 00:20:47 +0200)
> 
> ----------------------------------------------------------------
> Akhil P Oommen (1):
>       drm/msm/a6xx: Fix GMU firmware parser
> 
> Anna Maniscalco (1):
>       drm/msm: make sure last_fence is always updated
> 
> Jessica Zhang (1):
>       drm/msm/dpu: Fix adjusted mode clock check for 3d merge
> 
> Neil Armstrong (1):
>       drm/msm: dsi: fix PLL init in bonded mode
> 
> Rob Clark (4):
>       drm/msm: Fix GEM free for imported dma-bufs
>       drm/msm: Fix pgtable prealloc error path
>       drm/msm: Reject MAP_NULL op if no PRR
>       drm/msm: Ensure vm is created in VM_BIND ioctl
> 
> Vignesh Raman (1):
>       drm/ci: disable broken MR check in sanity job
> 
> Vladimir Lypak (6):
>       drm/msm/dpu: Fix allocation of RGB SSPPs without scaling
>       drm/msm/dpu: Propagate error from dpu_assign_plane_resources
>       drm/msm/dpu: Disable scaling for unsupported scaler types
>       drm/msm/dpu: Fix pixel extension sub-sampling
>       drm/msm/dpu: Require linear modifier for writeback framebuffers
>       drm/msm/dpu: Disable broken YUV on QSEED2 hardware
> 
>  drivers/gpu/drm/ci/gitlab-ci.yml               |  2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c          |  5 ++++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c        |  7 -------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  3 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 14 ++++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c  |  3 +++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h          |  1 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c      | 18 ++----------------
>  drivers/gpu/drm/msm/msm_gem.c                  | 10 +++++++---
>  drivers/gpu/drm/msm/msm_gem_submit.c           |  9 +++++----
>  drivers/gpu/drm/msm/msm_gem_vma.c              |  8 +++++++-
>  drivers/gpu/drm/msm/msm_gpu.h                  | 11 +++++++++++
>  drivers/gpu/drm/msm/msm_iommu.c                |  5 +++++
>  15 files changed, 59 insertions(+), 43 deletions(-)

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
