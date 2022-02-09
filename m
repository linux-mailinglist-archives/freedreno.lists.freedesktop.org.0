Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 729A94AF805
	for <lists+freedreno@lfdr.de>; Wed,  9 Feb 2022 18:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0329389A34;
	Wed,  9 Feb 2022 17:25:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2031089A34
 for <freedreno@lists.freedesktop.org>; Wed,  9 Feb 2022 17:25:24 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id o2so5607826lfd.1
 for <freedreno@lists.freedesktop.org>; Wed, 09 Feb 2022 09:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6QoNkw201jmWYI2ZvFOwA35KwNfMMnBn8u5YRCFPRuo=;
 b=lekhbXiwBQhRlgUOFnQGhFF2kovB0evdrZ1prOnNfCG93Uplho9arDXFUwEwD8QK5+
 CL8ASVgUHtY7q97MaI/im2nZiNIIdSs1J8RS2gFLTmdrbAVOqthhla0K74B3FZ5+xPZ+
 4LjBDtIfK90r2gjzi6qpi5fKnft2Lxn6pPRkJsibAFxZ+xv4Y+sLsJeM9ubKSAU8WChw
 DkhfNOXtnG1G0N1EJjRBhT9BCD4L1EQg/IUjhqqjwyWmH7QQgaQKVk9UIsO58pKBIfaX
 JCwwZ/y88m+VRoWn589Zpm3A94Ad91AzgkQ9a/JPD/wO+TFTCDqTQfj8Gj5fkW2eZRDh
 67cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6QoNkw201jmWYI2ZvFOwA35KwNfMMnBn8u5YRCFPRuo=;
 b=0nrYkV23WGfdEIYf/lBVyVUCiXApx9rIgmW0oP5F4QtA4/SHjE0uztHcpzDPxwyPPG
 J3hZ3mTklxELymIN69cCyYvJahiNxsRjNEfKQiqiDELXRiqOg0CjephGTFbXlRwN/aO6
 h8fWKTZUeCsyCeshYasBXR2K1iMJlpY9IRbay5t1LZt6UxASe2f0yQvr88u2NHXTAats
 jmfp65SIT85aQnfCp3FOx5s9d73SjRa7DTE4XUosEcLss3L3t+AMw8ptwNxJ8buBVY/0
 E8q2Pyhgz8ggCuUC0pJ6vouI5mlKQTO5g9iM2fcUId06udztnsHv2m+ZhgLyYxp7WGhX
 ZeAA==
X-Gm-Message-State: AOAM530pa3LRGtwIt5GZ57tyvox51NgjZfu+1hkPFE0O3e7TdZeYPG5t
 UX8/CmsCk7oVQ9AAgdtJM77ZAw==
X-Google-Smtp-Source: ABdhPJzspwOL8tBkHWxdZzBiE7r2qRpMZRD1XKC34zQnA/D9jM2b8gDJpfLQEj5hRBo5pZZdjjXNFw==
X-Received: by 2002:a05:6512:3d17:: with SMTP id
 d23mr2261513lfv.76.1644427522431; 
 Wed, 09 Feb 2022 09:25:22 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:25:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  9 Feb 2022 20:24:55 +0300
Message-Id: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 00/25] drm/msm/dpu: wide planes support
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

It took me a way longer to finish than I expected. And more patches that
I initially hoped. This patchset brings in multirect usage to support
using two SSPP rectangles for a single plane. Virtual planes support is
omitted from this pull request, it will come later.

Dmitry Baryshkov (25):
  drm/msm/dpu: rip out master planes support
  drm/msm/dpu: do not limit the zpos property
  drm/msm/dpu: add support for SSPP allocation to RM
  drm/msm/dpu: move SSPP debugfs creation to dpu_kms.c
  drm/msm/dpu: move pipe_hw to dpu_plane_state
  drm/msm/dpu: inline dpu_plane_get_ctl_flush
  drm/msm/dpu: drop dpu_plane_pipe function
  drm/msm/dpu: get rid of cached flush_mask
  drm/msm/dpu: dpu_crtc_blend_setup: split mixer and ctl logic
  drm/msm/dpu: introduce struct dpu_sw_pipe
  drm/msm/dpu: use dpu_sw_pipe for dpu_hw_sspp callbacks
  drm/msm/dpu: inline _dpu_plane_set_scanout
  drm/msm/dpu: pass dpu_format to _dpu_hw_sspp_setup_scaler3()
  drm/msm/dpu: move stride programming to
    dpu_hw_sspp_setup_sourceaddress
  drm/msm/dpu: remove dpu_hw_fmt_layout from struct dpu_hw_pipe_cfg
  drm/msm/dpu: drop EAGAIN check from dpu_format_populate_layout
  drm/msm/dpu: drop src_split and multirect check from
    dpu_crtc_atomic_check
  drm/msm/dpu: move the rest of plane checks to dpu_plane_atomic_check()
  drm/msm/dpu: don't use unsupported blend stages
  drm/msm/dpu: add dpu_hw_pipe_cfg to dpu_plane_state
  drm/msm/dpu: simplify dpu_plane_validate_src()
  drm/msm/dpu: rewrite plane's QoS-related functions to take dpu_sw_pipe
    and dpu_format
  drm/msm/dpu: rework dpu_plane_atomic_check() and
    dpu_plane_sspp_atomic_update()
  drm/msm/dpu: populate SmartDMA features in hw catalog
  drm/msm/dpu: add support for wide planes

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 355 +++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h      |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |   4 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  78 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  35 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 136 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  88 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  21 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 813 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  42 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  81 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  19 +-
 15 files changed, 827 insertions(+), 863 deletions(-)

-- 
2.34.1

