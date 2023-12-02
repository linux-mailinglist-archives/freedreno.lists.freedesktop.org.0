Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 216B3801EDB
	for <lists+freedreno@lfdr.de>; Sat,  2 Dec 2023 22:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D40910E226;
	Sat,  2 Dec 2023 21:42:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A0410E0D4
 for <freedreno@lists.freedesktop.org>; Sat,  2 Dec 2023 21:40:19 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50bee606265so455475e87.2
 for <freedreno@lists.freedesktop.org>; Sat, 02 Dec 2023 13:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701553217; x=1702158017; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SBC2etg0t87/NEQAbw4GxIuosiaBjUOZpDVVT0P9EvQ=;
 b=O5Rw31ZUGuaAamnWITVDyTSbEuk9XrdciMa0Nuc8EMtFv092SdLT3b4P+KKpWF8Zvk
 u2w3yul5IgGShkgz7A2ZCgxdbdLc7VZmFNFs9Pidfr/BjNLjcdgc30FxpQao3KpXrBuL
 WXLWZ/5KOFGcwAQzYADgWzPl/itaKICZ6vmKIXIBhpiJV3jkDNNY9f1DL6s7Z8LshdYQ
 4dQ+kvkvrc6V+lanBxbCjfqXwFls3U4kJ+fQveAdwNMmomRwudF8r34suyXvzSncvrml
 iAsPAFb/NegI+RTQJOc8c+SwNoFCMx961QmKeZFF9EVHVzwWyxNycjwL3SP6KRn5JNZ5
 wuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701553217; x=1702158017;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SBC2etg0t87/NEQAbw4GxIuosiaBjUOZpDVVT0P9EvQ=;
 b=XqBkTCg9LHO4Yw+4tmDwUN/u6HVIgJepJtQvg48bOk4uUQeC/Tsw4mZZ0tWhsQbDcI
 nWFB1eeVXF9UVQe8xolnqsb2g3k8Gqq8VTcTA/27l0wlxJ4SBlmZgEqeUUaYedd7+QxQ
 mqGZw9qX3redwGrrczxMapM+y8FBpYhuEwBKFfDObirAy+Vpr5kwZdYRWqBcMo4qtt1n
 MCIRA5NtW/HMjD5U39mGsfZ7lj+Y6wKx5xeIEpeDNonk6dst6zvnx+v5BBRUpvxzEM9+
 fyL0oWV2QF5Jtv5bJF6jsXDn9u9S2zU+ABvYrMGWpfmXqAtnvLdesZoc9QT6ut44S1G2
 NxmA==
X-Gm-Message-State: AOJu0YyU1mNuA9ozPGB8cciHptg0oEj+faQnniyuFGTGWyNz8xrkoY5f
 A+Eph03Geu0q7bIp4XkCmekVBw==
X-Google-Smtp-Source: AGHT+IF5YX9R0gQVH2TWa8b1HlMk/s4pSRy3Qk5p94J6OHigE3id3WsnP2AAZXxSg9IBfJW/WuFa/w==
X-Received: by 2002:a05:6512:3086:b0:50b:cb52:3c2c with SMTP id
 z6-20020a056512308600b0050bcb523c2cmr2452649lfd.29.1701553217543; 
 Sat, 02 Dec 2023 13:40:17 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f24-20020ac25338000000b0050be6038170sm282996lfh.48.2023.12.02.13.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 13:40:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun,  3 Dec 2023 00:40:04 +0300
Message-Id: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 00/12] drm/msm: fold dpu_format into mdp_formats
 database
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

During the review of [1] Abhinav pointed out that mdp_rgb_formats and
mdp_rgb_yuv_formats arrays from patch 1 are directly based on the struct
mdp_format formats array. This was true, because MDP4 / MDP5 drivers
used their own (small) list of supported formats. The DPU driver,
supporting more formats, had larger database of the formats and their
properties. While we don't have plans to expand MDP5 formats support, it
make sense to merge these two databases into a common dataset.

[1] https://patchwork.freedesktop.org/series/120377/

Dmitry Baryshkov (12):
  drm/msm: fix BPC1 -> BPC4
  drm/msm/disp: add mdp_fetch_mode enum
  drm/msm/dpu: use format-related definitions from mdp_common.xml.h
  drm/msm: add arrays listing formats supported by MDP4/MDP5 hardware
  drm/msm/dpu: in dpu_format replace bitmap with unsigned long field
  drm/msm/dpu: pull format flag definitions to msm_drv.h
  drm/msm: merge dpu_format and mdp_format in struct msm_format
  drm/msm: convert msm_format::unpack_tight to the flag
  drm/msm: convert msm_format::unpack_align_msb to the flag
  drm/msm: convert msm_format::alpha_enable to the flag
  drm/msm: merge dpu format database to MDP formats
  drm/msm: drop msm_kms_funcs::get_format() callback

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  22 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |   4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   | 658 +-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |  23 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |  16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   | 123 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  45 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  75 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |   6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |   1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |  89 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  16 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |   1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |  98 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c      |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h      |   2 +-
 drivers/gpu/drm/msm/disp/mdp_common.xml.h     |   8 +-
 drivers/gpu/drm/msm/disp/mdp_format.c         | 611 +++++++++++++---
 drivers/gpu/drm/msm/disp/mdp_kms.h            |  17 -
 drivers/gpu/drm/msm/msm_drv.h                 |  64 ++
 drivers/gpu/drm/msm/msm_fb.c                  |   2 +-
 drivers/gpu/drm/msm/msm_kms.h                 |   4 -
 30 files changed, 884 insertions(+), 1065 deletions(-)

-- 
2.39.2

