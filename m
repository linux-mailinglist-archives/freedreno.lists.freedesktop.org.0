Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D1296444A
	for <lists+freedreno@lfdr.de>; Thu, 29 Aug 2024 14:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEDD10E66A;
	Thu, 29 Aug 2024 12:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JyXkxHZA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9148410E668
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 12:23:06 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e13cda45037so629647276.3
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 05:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724934185; x=1725538985; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oBRgy1SwbqgGgsChwDpW9dCKtLDOgboL57fncnEqPqg=;
 b=JyXkxHZAZxN6ccGMT6PYElC24jKC7iRvpifRyKt12BtGHXoBj7JkiUqIc14nGw5HXy
 265peszk4GOBh65IazmpxBBtRzJEyXk2SswfQX47z16WYV+XPKUwlqP8tdiQyka7VMyl
 2Q88GsUuwrd+ZEBqSQ6kJjLvQlj84XloPjzB0aoU+fKNfK41BNoa8I/AGM7aYd80x1mp
 Dc/+dIA9o99pvIEvr2e2001KuB3YJoDt8SFQmsJmAx1BjyB+QcQiibYY56enQtCJ+5e7
 S0TqCHto4qg7x6QXsAZ1U7XnG0FZlw3mJCcPaf8/rS6xtC3qcBuxFv/GeKQqZgIsJ83j
 Iq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724934185; x=1725538985;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oBRgy1SwbqgGgsChwDpW9dCKtLDOgboL57fncnEqPqg=;
 b=ElxUfWpN8lpz6ul/JkL79FkVWiTgo05XIm361qFpfKoy4qf0bHoR2LOxYfOt51Zunm
 wMV0/PE4nXdPT0c3A3lEgNgurqYfi79ppSYD7XASM1OM9iQgEN6jxi46FihNHc1T7kG1
 pPVy4/ha1UQ2s5XCZ2V8lmhn6E9bWQk7+539cCiF6WrQainsYfZLg5UMP6MNM54TnnTf
 Js5cazxE1SatpSTXYT+c1c2SB5wbATHUuQzo1ZeUnmCh1CdNrQUclXTUnKT1iGUSJqey
 oK9h1vcpn4pFrF8+6h1HTowtn2mQmfLf/YtVmxRGWAVRS/25AAy4v+++9KkB98p42qPE
 htdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn207OXimLXs8BuJR01GNBA1rwjpVqJPiXdiJP79sOZ/XuxN3otbQR9fHr52jXj/vq31BfGQnnCpc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJudMXoNxqG9HWs0AV3oYnt/iD0F5H9Hjuystkz8HS15oTlH1e
 bZ0pUlPuFvDhPylNCiA+2uN1Facqj0/xiOfmMyrMcPVNZQto7zPBOTat6zFyF4Xtg9Z2i2P4Ok2
 BYKGjO3txZMC1UCYKnAiUl+MBLfaOn1oPG1/JzUC6Qhfq6mDe
X-Google-Smtp-Source: AGHT+IE2JwdDtHrXWOXkr8swPM5s7DryraYBiVanjT5C61UlNu+OUKVCm0356LXp35L2K1UItF9VpHBO/lLLY49AnQM=
X-Received: by 2002:a05:6902:2e11:b0:e0b:e550:4e46 with SMTP id
 3f1490d57ef6-e1a5ab452e5mr2752227276.5.1724934185317; Thu, 29 Aug 2024
 05:23:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 15:22:54 +0300
Message-ID: <CAA8EJpoD_=FaBL2xj+xu21BG0X2vOtVcskOyeZFrWg4XL3m_tw@mail.gmail.com>
Subject: Re: [PATCH 00/21] drm/msm: Support quad pipe with dual-DSI
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
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

On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
>
> 2 SSPP and dual-DSI interface are need for super wide DSI panel.
> This patch set make changes to DSI driver and extend pipes
> and related mixer blending logic to support quad pipe.
>
> This patch set is based on virtual plane patch set:
> https://patchwork.freedesktop.org/series/131109/

Is this "depends" or "used some ideas" or something else?

If it depends, please say that clearly, including the revision of the patchset.

Next, generic feedback for the series.
- Please provide detailed commit messages. Describe why the change is
being introduced.
- Please grok why and how SSPPs are handled in non-virtual and
especially in a virtual case. Feel free to ask questions, but I really
don't expect to see patches assuming single SSPP per pair of pipes.
- Please drop all unrelated changes. DSI, DSC, etc must go to separate series.
- Please take care about the commit trailers. If the change is a fix,
it should have the Fixes trailer.

Next, please restructure the series. The patches should be ordered and
split in a logical order.
Start with a commit that gets rid of r_pipe. Don't increase
PIPES_PER_STAGE, etc, just loop over two pipes. Note how the code
handles r_pipe->sspp and keep that unchanged. Be sure to handle odd
plane sizes correctly. You can not just divide width by two to get the
pipe width.
Next, split PIPES_PER_STAGE into two defines: one for mixer code, one
for the pipes per plane.
Next come additional patches, like PP stride, etc.
Then extract the code to handle a single LM pair.
Finally introduce quad pipe, allocate two sets of LM configs, etc.
Each LM config still gets two pipes per plane. Each plane can have 4
pipes. Be extremely careful with splitting of the plane framebuffer
into the pipe configuration. Both x coordinate and width can be odd.
And a pair of pipes can not cross the screen middle line.

>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
> Jonathan Marek (3):
>       drm/msm/dsi: add support to DSI CTRL v2.8.0
>       drm/msm/dsi: fix DSC width for the bonded DSI case
>       drm/msm/dsi: support DSC configurations with slice_per_pkt > 1
>
> Jun Nie (18):
>       drm/msm/dsi: pass the right width to dsc
>       drm/msm/dpu: polish log for resource allocation
>       drm/msm/dpu: Add utility to get mixer number
>       drm/msm/dpu: Support dynamic DSC number
>       drm/msm/dpu: decide right side per last bit
>       drm/msm/dpu: request more mixer for 4K+ DSC case
>       drm/msm/dpu: fix lm number counter for quad-pipe
>       drm/msm/dpu: Support 4 mixers at most
>       drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
>       drm/msm/dpu: Support quad pipe in header files
>       drm/msm/dpu: Support quad-pipe in SSPP checking
>       drm/msm/dpu: support plane splitting in quad-pipe case
>       drm/msm/dpu: support SSPP assignment for quad-pipe case
>       drm/msm/dpu: setup pipes with 2 set of stage config
>       drm/msm/dpu: blend pipes by left and right
>       drm/msm/dpu: bind correct pingpong for quad pipe
>       drm/msm/dpu: support quad pipe in general operations
>       drm/msm/dpu: revise debug info to support quad pipe
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 119 ++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  11 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  73 +++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c       |  19 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h       |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h      |  11 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 385 ++++++++++++-----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  30 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 209 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  19 +-
>  drivers/gpu/drm/msm/dsi/dsi.h                    |   3 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c               |  54 ++--
>  drivers/gpu/drm/msm/dsi/dsi_manager.c            |   2 +-
>  include/drm/drm_mipi_dsi.h                       |   2 +
>  18 files changed, 566 insertions(+), 393 deletions(-)
> ---
> base-commit: 9651fbfb684e7a1288dbae3bf1f15cd484c0217a
> change-id: 20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-d2d6b3eb1d57
>
> Best regards,
> --
> Jun Nie <jun.nie@linaro.org>
>


-- 
With best wishes
Dmitry
