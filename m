Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 515786F469E
	for <lists+freedreno@lfdr.de>; Tue,  2 May 2023 17:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD0D10E2AD;
	Tue,  2 May 2023 15:05:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37AC10E2AD
 for <freedreno@lists.freedesktop.org>; Tue,  2 May 2023 15:05:36 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2a8b766322bso37703151fa.1
 for <freedreno@lists.freedesktop.org>; Tue, 02 May 2023 08:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683039934; x=1685631934;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=er6uZ2Jm9haTMcFY7KD9AAR3BYHrxeDV+fDEIq+qzbU=;
 b=lwvMRaTbj6M2HCTghvl8PCWKQb9xxtECbfnG/oj529Mz2WWUhUo2u1UKfYuh8pQU1+
 mZDLHQwoLJ7e7dqsmCKkuVtTpqrbo48LR3k9rR7VbyeaqOn1v2O7QrddsZipwn8DUAOL
 kDhjseYlcnkrkgwUljCA8t2b4dKmhU/ESppGfjw+BiF9hGWqEXztYwRF9A9xKrS75joW
 jnh7MywkbmMlBg2DesIQeWOudFsISLa8fkRE/2pVp7jHwC9sAgu5NdJVgwL3yH7C26Tc
 uh6KR85RCFWfS3JkPAD3HK1kmjAOtnt7mNxPTST41EQ7KXc+Rg/1JO3SVH5TV+PkXVI2
 TBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683039934; x=1685631934;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=er6uZ2Jm9haTMcFY7KD9AAR3BYHrxeDV+fDEIq+qzbU=;
 b=U5kC+wR+1AqQJOsBenhvlvcOCfPM8dhB2BR+XbLi1f28Uj+vXKKSORiSTbQ65ejU+3
 RMIjjgvLTV+5GB119gcPKXbrp1hG+3+gbxiT7KHcQVIApmDl1oPGLpK1ESA7YoqNPAnd
 XXer+BeCz7v10UqxfFTQZDbrAumdo/ABtRA8ViJmnmL4qhfQr8rzgSYcJIpV11wV7Qxc
 EVOL8cw4Ej1FQ4dDLjMbuXcYDwR5XWcVzVttU15C+LolIjbQ6jfZ4hlECDWVofKIN02O
 Db6iL3wWdD8nxzJHtgWaQMQzTSWyY3kqZeztCGMNfrk3QlBzLjnqGoRQq99zJ/sarFTa
 Oyiw==
X-Gm-Message-State: AC+VfDw/9lAmKJpx4scDbJovCGgxWVlsdtjVMeWpVwM0D/8+HtENYaoR
 BlwPOOEcnGH0KvoAlOmRJo9IZQ==
X-Google-Smtp-Source: ACHHUZ4Y2KzHHTiUxhebn6B6ijI7/6qVJ3xvmzPc5H3/8SF5nY/wKX7Z0R7LOIxWrQclhtp99uBiKw==
X-Received: by 2002:a2e:b00e:0:b0:2a8:b286:826e with SMTP id
 y14-20020a2eb00e000000b002a8b286826emr4642926ljk.33.1683039934435; 
 Tue, 02 May 2023 08:05:34 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a22-20020a2e8316000000b002a8bb52d994sm5341659ljh.25.2023.05.02.08.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 08:05:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue,  2 May 2023 18:05:24 +0300
Message-Id: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/9] drm/msm/dpu: simplify QoS/CDP programming
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

Merge SSPP and WB code programming QoS and CDP. This allows us to drop
intermediate structures and duplicate code.

Changes since v1:
- Fixed kerneldoc for _dpu_plane_set_qos_ctrl()
- Fixed danger_safe_en programming conditions (Jeykumar)
- Simplified the code surrounding setup_cdp() calls (Jeykumar)

Dmitry Baryshkov (9):
  drm/msm/dpu: fix SSPP register definitions
  drm/msm/dpu: simplify CDP programming
  drm/msm/dpu: fix the condition for (not) applying QoS to CURSOR SSPP
  drm/msm/dpu: rearrange QoS setting code
  drm/msm/dpu: drop DPU_PLANE_QOS_VBLANK_CTRL
  drm/msm/dpu: simplify qos_ctrl handling
  drm/msm/dpu: drop DPU_PLANE_QOS_PANIC_CTRL
  drm/msm/dpu: remove struct dpu_hw_pipe_qos_cfg
  drm/msm/dpu: use common helper for WB and SSPP QoS setup

 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  21 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   4 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 142 +++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  52 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  52 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |  32 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  48 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     |  27 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 165 +++++-------------
 9 files changed, 194 insertions(+), 349 deletions(-)

-- 
2.39.2

