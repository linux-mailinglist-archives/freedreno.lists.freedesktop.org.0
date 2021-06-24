Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D349C3B31E2
	for <lists+freedreno@lfdr.de>; Thu, 24 Jun 2021 16:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD136EC15;
	Thu, 24 Jun 2021 14:57:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C96D6EC13
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jun 2021 14:57:39 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id k10so10705957lfv.13
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jun 2021 07:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ia9jH+C7md2MacvtUXiDMLbc784RQr0SQ8WvwoL6eCw=;
 b=W9jyfgYCw/a2GAnolWq8YqIz6ASKOYbmlJcHMBWQQxDOFPROyy6LgTDSKkYbPCUH61
 y/PQE7gx0S7DTAfeuslnsveKq0lXTaElVuxJi09XOuV1biGOngmRbMnN3MMHK3MvyQnm
 3J5E4Zze9JkZHBR31YnYJSQvBSil+Aj4vlNewOfgAYSxZtvEDAcqEbP5d45fK+4rKsVi
 HQpo4cXdkJirZIlrPde7vrPPyXn+CCt++FupdGkNBSNU2gXN8Xe2bTXYteYlzLkcLp5o
 FC6MzDctap4/kG1GtkJ54CJB2cIb+85Y3L9lUruCvuDC2Uc/MyiLrpQokTusV+9WoCtf
 7hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ia9jH+C7md2MacvtUXiDMLbc784RQr0SQ8WvwoL6eCw=;
 b=TK3ijh8P62fr+TXUZnFLlGi0uxv+AIHob46ayld9iaDfWVpNXKUmGsidW1WfjQB0xg
 RqIxJq7aLSB/XDsIpNifbDY7vOTWS4F4pRJrw5+9COpoxU/9YZBYUVAGQX7gwZtWjv9S
 So34kzRqkcBynt8z/7fo0dm/XkWnemdVz7F2Bs/yrf4pbWbds+Q1tkzmpLtmzdsVtASq
 PLvk08mTTon5yIWBjirLssZ78ybv10O7X9WNZx0Ugd59do1ihjqY8eyy4XS9QottAW+P
 3JWOUY9vv2fTfSQXQBNhP6ls2anjqBngGPePAEWVStFoF+kozAMb3aUEK/hoq7GQzrPq
 5stA==
X-Gm-Message-State: AOAM532oZQzByC2xMScL39gEc/aR7VTOnfVj4cp98c48BA7SwKIwdzsx
 vBoPyjjVQhy/gMkDyBxxC02dow==
X-Google-Smtp-Source: ABdhPJy9pvB8R4NLyfB0BMG79NbtPH7wQCg6nzDbsIR5DeQsPRjGffDtH2N8SuGtJa1gyTE9YJ/4lA==
X-Received: by 2002:a05:6512:33c8:: with SMTP id
 d8mr4034338lfg.21.1624546658106; 
 Thu, 24 Jun 2021 07:57:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:57:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Thu, 24 Jun 2021 17:57:16 +0300
Message-Id: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 00/17] drm/msm/dpu: switch dpu_plane to be
 virtual
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

As discussed on IRC, change dpu_plane implementation to be virtual:
register unified planes and select backing SSPP block at runtime. In
future this would allow implementing multirect (or wide planes) in a
proper way, without requiring zpos hacks or additional userspace
handling.

The last patch adds a compile time #if to select between virtual planes
or traditional planes. It is implemented this way to ease testing of
this patchset. In the next versions it is going to be morphed into
the proper module parameter.

The following changes since commit e88bbc91849b2bf57683119c339e52916d34433f:

  Revert "drm/msm/mdp5: provide dynamic bandwidth management" (2021-06-23 14:06:20 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git dpu-virtual-planes

for you to fetch changes up to c0b20040e9b265e77cbf02c5b5312090b3677f81:

  drm/msm/dpu: switch into using virtual planes (2021-06-24 17:50:54 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (17):
      drm/msm/dpu: move LUT levels out of QOS config
      drm/msm/dpu: remove pipe_qos_cfg from struct dpu_plane
      drm/msm/dpu: drop pipe_name from struct dpu_plane
      drm/msm/dpu: remove stage_cfg from struct dpu_crtc
      drm/msm/dpu: rip out master planes support
      drm/msm/dpu: move dpu_hw_pipe_cfg out of struct dpu_plane
      drm/msm/dpu: don't cache pipe->cap->features in dpu_plane
      drm/msm/dpu: don't cache pipe->cap->sblk in dpu_plane
      drm/msm/dpu: rip out debugfs support from dpu_plane
      drm/msm/dpu: simplify colorspace conversion setup
      drm/msm/dpu: drop src_split and multirect check from dpu_crtc_atomic_check
      drm/msm/dpu: add list of supported formats to the DPU caps
      drm/msm/dpu: simplify DPU_SSPP features checks
      drm/msm/dpu: do not limit the zpos property
      drm/msm/dpu: add support for SSPP allocation to RM
      drm/msm/dpu: add support for virtualized planes
      drm/msm/dpu: switch into using virtual planes

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       | 215 ++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h       |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  10 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    |  17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    |  44 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 139 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |  70 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 709 ++++++++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |  42 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |  81 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h         |   6 +
 14 files changed, 560 insertions(+), 783 deletions(-)


_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
