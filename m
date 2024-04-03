Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D2A896B07
	for <lists+freedreno@lfdr.de>; Wed,  3 Apr 2024 11:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECA7112600;
	Wed,  3 Apr 2024 09:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W5fnCt4i";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA95211295A
 for <freedreno@lists.freedesktop.org>; Wed,  3 Apr 2024 09:49:11 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dcbef31a9dbso3995569276.1
 for <freedreno@lists.freedesktop.org>; Wed, 03 Apr 2024 02:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712137751; x=1712742551; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3tvxwcGEaXlq9t2qggBvOm4jDfIobjVvvQgoLk34JPw=;
 b=W5fnCt4iUXkxSQdUW4cpQttpmRphPqFYUqzTLxOXhtRoRTlZmiSRqtPx45jAfyAcCE
 9BmYBIjytVQarBzIOVKNjmOeX1Dmp2WE5kUznuGyf3TvFAeQfErXiRrvgWPFUiisCzxI
 ndQ8DTfrq0+znfuSgMWFgMD1tHEILO4v8RH1AhbbSMtx+ONbqAg2Ulc37iLtqPwJp9ML
 zrWA3JwITfDIy1K+Rf0HD6BVs7+EPZX2SFStWpCufrU9CTDIGnchdvPV3k0W3bj8SieV
 cnv+3F55un8XnQsAqlSlnrXAi0Th5UqDzXgSf6oQtrMrzGtU3dSRjaCnwd3tAud8uZg0
 UrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712137751; x=1712742551;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3tvxwcGEaXlq9t2qggBvOm4jDfIobjVvvQgoLk34JPw=;
 b=CDFYvHPk0Rfxby7aBvsh96QnCZbm/VnoFecV8JoBYtNaPE3R8lVYZKslULrzsCtUXS
 BoQM0t4GwaJ9u0iNygC2RdSp0uR+mD2oXzsUlqFNhGcFL87JlbF/LwqgGwWUv5KZhMIq
 B+Pen0xWtaKujnjD3mC2djVSVHmC/JjUQFgoGpNQcG8Jf1yvDW/v3GhEiBeLeXz0A+BE
 iJke3tZT9M/yzXVIhvVPPKE1X3vFVK9pwdd/eWoeHgjO3YZRCFrVUwX+P6TyqoP3YOXs
 e8fYxrnMIIh++aMM7hMck7Za768G4SH4ez4nsH1w+pGR4FYIiDyZMw/1v/ssFTDA7KXQ
 j9Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXst+SwOJKpsRGG5wltnZLJ9VYy8WwG4lmhvdpJEXvv5GWbSDsSfJ1oWys+2U60YNgHFeG64ahvRroUOQxgj94a/ZTSjlNBn3kzPc9noIJg
X-Gm-Message-State: AOJu0YxaF8iqy12F43CzAr8wtctu8bRzUPfUYCEFf74nebjqQ5GxfFkI
 3S4r9ZYP9K+irIROsMIT/gb2IudqAwJRZoo1Z2cSzk9lbNSOnXe3lfg1XgYj+CJIBSW7pAV0pT0
 F8yt+JTpb2G7pzyh5ZyPrLn9qo28/T2PB7EtLGg==
X-Google-Smtp-Source: AGHT+IEpF2mJ7B2oXcCBJscSms9I5JdRsHzjwR2AXCUqHh+AiX5In12EGhsUtCqq2Re95OL5aJpNfwvGQHMpDLx4yAQ=
X-Received: by 2002:a25:b989:0:b0:dbd:8f9:a71 with SMTP id
 r9-20020a25b989000000b00dbd08f90a71mr12861423ybg.28.1712137750746; 
 Wed, 03 Apr 2024 02:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 12:49:00 +0300
Message-ID: <CAA8EJprd78g0jM4u2uY-vZnqQibbWevjxqzXFaPohkvmyWHkHw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add DSC support to DSI video panel
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jonathan Marek <jonathan@marek.ca>
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

On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
>
> This is follow up update to Jonathan's patch set.
>
> Changes vs V2:
> - Rebase to latest mainline.
> - Drop the INTF_CFG2_DATA_HCTL_EN change as it is handled in
>     latest mainline code.
> - Drop the bonded DSI patch as I do not have device to test it.
> - Address comments from version 2.

Which comments? "Adress comments" is the worst case of changelog.

Also, what do you consider as version 2? Jonathan Marek has only sent v1.

>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
> Jonathan Marek (5):
>       drm/msm/dpu: fix video mode DSC for DSI
>       drm/msm/dsi: set video mode widebus enable bit when widebus is enabled
>       drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC (fix video mode DSC)
>       drm/msm/dsi: add a comment to explain pkt_per_line encoding
>       drm/msm/dsi: support DSC configurations with slice_per_pkt > 1
>
> Jun Nie (1):
>       drm/display: Add slice_per_pkt for dsc
>
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  9 +++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  8 +++++
>  drivers/gpu/drm/msm/dsi/dsi.xml.h                  |  1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c                 | 42 +++++++++++-----------
>  include/drm/display/drm_dsc.h                      |  4 +++
>  5 files changed, 44 insertions(+), 20 deletions(-)
> ---
> base-commit: b1e6ec0a0fd0252af046e542f91234cd6c30b2cb
> change-id: 20240403-msm-drm-dsc-dsi-video-upstream-1156d110a53d
>
> Best regards,
> --
> Jun Nie <jun.nie@linaro.org>
>


--
With best wishes
Dmitry
