Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 762286BD659
	for <lists+freedreno@lfdr.de>; Thu, 16 Mar 2023 17:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7C310ED6E;
	Thu, 16 Mar 2023 16:55:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2FC10ED6E
 for <freedreno@lists.freedesktop.org>; Thu, 16 Mar 2023 16:55:45 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id f16so2360974ljq.10
 for <freedreno@lists.freedesktop.org>; Thu, 16 Mar 2023 09:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678985744;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ddCuXBQgnXQh+/CwTja1CP3GIxaM+lqK2/Q3SFDKyrM=;
 b=yRzfuiAwV5saRxCLWZKFDDN4GuouYN4WkqeoSNB9dIbpAEBWA1cvf0mjBeDO4FbTJD
 RdMS5cqXPfFhjnO/5VUBGHNHTMEyKmZHnWFZdIvDLo4X1a/Q/O918NJmzK57LxpvuTrF
 1wJjcKUYsyaC9rSN47AG7vXUK1VaDv5yGPN0Khs7kR4TQUG7tWK9F9f5U9TpWSCxPp/Z
 8Hiz+SrNReFTkhs/jaNENxUwlg11u9gin/LsonHS/LkwHVc7UvYtvzJKC1iY7rTqD6+7
 4z4DMvZN2zM4vyyPmUZNzGU7LYS1WdIv5oVktXsNF417Hrj6MGd9Y/pVAumr5vDhgg1v
 NVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678985744;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ddCuXBQgnXQh+/CwTja1CP3GIxaM+lqK2/Q3SFDKyrM=;
 b=33kh+Ee452HXN1eNodnm+oFu1hiMH+byss1RcDr10K455RoLx8xLoyKms1x7kND3o6
 +aaZc/wq6qc7iNPiEZv56DbuUKLDI3+ZxrODTPPwIBhgU6bUCQyW88vCr2/T8SKRMFMg
 eDsJ4wH0Kg3BQXiXyYX+xj59vwlN+Z8JphwPK5KPnKwNowWYrnhilnK/oZeh9ouqHbpi
 UPeq1rAYqB0DzHZCAtq2sm/ccFsQ9C8nUIWK10fc04pFHwP0qPes0ojFA7+o0ykqFabq
 znAoRVqeQzp41b7lUMtMr0qyi8ZhylaP4YQ/BUDSqLbr1GYCVCqchabb4wkkapr7UtHF
 oMcw==
X-Gm-Message-State: AO0yUKUFkS4FMJX1vkG9Lza0bPdzqJipNSroIJl+3AlUwrZOfHFUq9m4
 dzDgMYppxnLm+CRbXsgy7zhBVg==
X-Google-Smtp-Source: AK7set81w+9x/crPh4QUOdMXw89IwpB46ddLI6CCN308X57c23h7e1oWoIPnSY7hZ1AY0o3UFGhQWQ==
X-Received: by 2002:a2e:351a:0:b0:299:ac62:1460 with SMTP id
 z26-20020a2e351a000000b00299ac621460mr705588ljz.53.1678985743895; 
 Thu, 16 Mar 2023 09:55:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a2e9c52000000b002934b5d6a61sm2661ljj.121.2023.03.16.09.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:55:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 16 Mar 2023 19:55:30 +0300
Message-Id: <20230316165542.4109764-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v1 00/12] drm/msm/dpu: support virtual wide
 planes
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

As promised in the basic wide planes support ([1]) here comes a series
supporting 2*max_linewidth for all the planes.

Note: Proper support for rot90 is pending. Granted that it is only
enabled on sc7280 and it only supports UBWC (tiled) framebuffers, it was
quite low on my priority list. I plan to get it done for v2.

Note#2 to simplify the dpu_plane_virtual_assign_resources(), which
already becomes big enough, I stripped support for sharing the SSPP
across two planes (doubling amount of planes available to some of
compositors/applications). I plan to get back to this topic once this
series lands.

Dependencies: msm-next + msm-fixes, [1], [2]

[1] https://patchwork.freedesktop.org/series/99909/

[2] https://patchwork.freedesktop.org/series/113423/

Dmitry Baryshkov (12):
  drm/atomic-helper: split not-scaling part of
    drm_atomic_helper_check_plane_state
  drm/msm/dpu: encoder: simplify debugfs handling
  drm/msm/dpu: remove unused fields from dpu_encoder_virt
  drm/msm/dpu: get rid of struct dpu_rm_requirements
  drm/msm/dpu: switch RM to use crtc_id rather than enc_id for
    allocation
  drm/msm/dpu: move resource allocation to CRTC
  drm/msm/dpu: fill CRTC resources in dpu_crtc.c
  drm/msm/dpu: move pstate->pipe initialization to
    dpu_plane_atomic_check
  drm/msm/dpu: add list of supported formats to the DPU caps
  drm/msm/dpu: add a field describing inline rotation to dpu_caps
  drm/msm/dpu: add support for virtual planes
  drm/msm/dpu: allow using two SSPP blocks for a single plane

 drivers/gpu/drm/drm_atomic_helper.c           |  85 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 162 ++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 150 +------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |   8 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   3 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  27 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 120 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 398 ++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  33 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 240 ++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  40 +-
 include/drm/drm_atomic_helper.h               |   4 +
 14 files changed, 933 insertions(+), 357 deletions(-)

-- 
2.30.2

