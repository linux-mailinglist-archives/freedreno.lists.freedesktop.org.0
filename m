Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA2F80150E
	for <lists+freedreno@lfdr.de>; Fri,  1 Dec 2023 22:18:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32DB10E962;
	Fri,  1 Dec 2023 21:18:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC54910E82A
 for <freedreno@lists.freedesktop.org>; Fri,  1 Dec 2023 21:18:48 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c9c4df1287so35094831fa.2
 for <freedreno@lists.freedesktop.org>; Fri, 01 Dec 2023 13:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701465527; x=1702070327; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=20zjbppwrtzRWByvdBLmKkSD4EbfKKz8iGPt9sPg16s=;
 b=diWDe6XkqY3RPhfHjA9zHfCf5Fgu3MVD7QypWBBrOZ9uzN5LYtktKqKQ3Aay4Ne1F+
 loz0A/izhU2oAXPfXJ3zTMSvJF5aA5B/eQROL0N5c5IOolABfL7VDHMYpXE8LbnYy6nr
 MCPmDI6uk1oF0Tme//2pGZgQHChoA3xR3uiniUcw19TgCB5+Xmjs/bfYf48YeayftsN0
 Jdh00iEtx6/Y1U5niDSryeT65RR9m/OpCgGsMFxtX9Sp+Nto0imH1Zuo9xEBQzDnsaRg
 PT/u5g3e62grax/HLbTuCyF6xS0tZwWDbjIXmBgqUCth8wM99cYj3cxO0iuLb8zm7YDj
 1PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701465527; x=1702070327;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=20zjbppwrtzRWByvdBLmKkSD4EbfKKz8iGPt9sPg16s=;
 b=e2Djf88h8g7Bnmhl4RKGCX8Ru6hB8qwa+gy6KD1ue+oD+YK1qMxiEQgYOlnRCbeq+y
 cnKU7vyzlhFJGzDlfpyxH8L/qx03AMItJ69pu4UAcjyeJYyYN3vXNerKTjIsYGoINkRW
 cXGZ59a9LHhPqHTazXU38eQ/gsG02qkzEwoXAUM0BqdUHT6ZcK/cIWB/wxpnhGFGSa2u
 68zsb5kyX0U299qEWjjUeULkU2jqZR5nObyTL7fHaYJK9FTBUD7jQUllzL1yvlYLZJ3N
 lT3Tnp+8DInn8V+1eqHESOETs5wuc05vcUwGRR8Z3ekFA4IB2CsYStuoMRqAQ+fdRMbA
 BcFg==
X-Gm-Message-State: AOJu0YyNCKTZb5e5y0TYbiJgcOuT/rTgvlWfmjqsBdsc0ckBGs0sQiv2
 tPDP9xhC+whWTIt64fPGICtzNQ==
X-Google-Smtp-Source: AGHT+IEcEcNgkjsjd+9AsovIHFHtqWCkCcFtHXmf+FS5o5F7e3mtMZVAaZwHAGCPafb/VTyIBKwtkA==
X-Received: by 2002:a2e:b24d:0:b0:2c8:39fc:acf5 with SMTP id
 n13-20020a2eb24d000000b002c839fcacf5mr1149901ljm.2.1701465526822; 
 Fri, 01 Dec 2023 13:18:46 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a05651c022400b002c123b976acsm503612ljn.76.2023.12.01.13.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 13:18:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat,  2 Dec 2023 00:18:32 +0300
Message-Id: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 00/13] drm/msm/dpu: use managed memory
 allocations
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

In a lots of places in DPU driver memory is allocated by using the
kzalloc and then manually freed using kfree. However thes memory chunks
have a well-defined life cycle. They are either a part of the driver's
runtime and can be devm_kzalloc'ed or are exposed to userspace via the
DRM objects and thus can be drmm_alloc'ed. Implement corresponding
runtime resource manangement for the DPU driver.

Changes since v3:
- Rebased on top of msm-next

Changes since v2:
- Added missing dependencies to the cover letter (Jessica)
- Fixed commit message for patch 4 (Jessica)

Changes since v1:
- Fix error handling for some of drmm_foo_alloc() functions, which
  return error pointer in case of an error rather than typical NULL.

Dmitry Baryshkov (13):
  drm/msm/dpu: cleanup dpu_kms_hw_init error path
  drm/msm/dpu: remove IS_ERR_OR_NULL for dpu_hw_intr_init() error
    handling
  drm/msm/dpu: use devres-managed allocation for interrupts data
  drm/msm/dpu: use devres-managed allocation for VBIF data
  drm/msm/dpu: use devres-managed allocation for MDP TOP
  drm/msm/dpu: use devres-managed allocation for HW blocks
  drm/msm/dpu: drop unused dpu_plane::lock
  drm/msm/dpu: remove QoS teardown on plane destruction
  drm/msm/dpu: use drmm-managed allocation for dpu_plane
  drm/msm/dpu: use drmm-managed allocation for dpu_crtc
  drm/msm/dpu: use drmm-managed allocation for dpu_encoder_phys
  drm/msm/dpu: drop dpu_encoder_phys_ops::destroy
  drm/msm/dpu: use drmm-managed allocation for dpu_encoder_virt

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 25 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 77 ++++------------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 10 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 15 +---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 13 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 21 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    | 19 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    | 16 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 12 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    | 10 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c    |  7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   | 16 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h   | 12 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 14 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 11 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 16 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   | 13 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     | 14 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h     | 12 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    | 14 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h    | 13 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 15 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 17 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   | 16 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    | 17 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c   | 14 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h   |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     | 15 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     | 13 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 55 ++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 59 +++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 90 +++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        | 11 +--
 36 files changed, 226 insertions(+), 487 deletions(-)

-- 
2.39.2

