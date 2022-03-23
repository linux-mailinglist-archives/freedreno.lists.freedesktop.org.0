Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC774E4F3F
	for <lists+freedreno@lfdr.de>; Wed, 23 Mar 2022 10:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A86B899BC;
	Wed, 23 Mar 2022 09:25:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A81899E7
 for <freedreno@lists.freedesktop.org>; Wed, 23 Mar 2022 09:25:41 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id b5so968550ljf.13
 for <freedreno@lists.freedesktop.org>; Wed, 23 Mar 2022 02:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fvjRDTA2PHAlGFO2FpdE45QYwvQjOSHNe4XoKh928v0=;
 b=odabUKNblygvx+Syti9Owoko3d6g7SLDWjHmrot5+hraYUPnROcP6gnYa81bym3pCD
 oeArRwxeKX5KKkE7bjuaIcr3IzojRwIUDOvOT2pDlzQe855uqmU9jMBVXDhxwSEm+6le
 b0wptKL7ElZtCWGEvgk6DEA8uMXZ6ekiXx4EKRwwCbPFtxSbgzDnKuXc23zS5klEFCUU
 A6o6dTk/363HzaVDNNyo//te08wQGKMqJcMFZka0EXnA4jjpPFAxAjVng1licqbvbHsE
 QzbWHjc2kc+kuQzrdGu02DNIAJcGDjGwicWkUmRc7vJUF2QSCwnvsd1Nvvnv7ssAzxWV
 rymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fvjRDTA2PHAlGFO2FpdE45QYwvQjOSHNe4XoKh928v0=;
 b=oQjagYwtPwSy0wa+A2pfElQ5PiIWPji+QY9t3BlocP4hdRyU8nJ2R2FRbbUeMVJsGd
 MRuoqe/zb6FUOIzqBLzawZKLK9m/Q36g7wOztXPCSWbLlBZ6p41IVWmcdVYlNnHchYOK
 CezcJYwRv2jA3u5DEV2ogQjPOv+0OmwST28uhFsOj7uVRPXOCNhcctWp7q826gqlVu7o
 LubpY5Cbqi6/4Q7IsFGLhkqBn6ZCKgDhF8tfTd93JlF7+xt++xHYq2urzcHspyxLWhDV
 crzBv13tXxKJm5jvFOtaMjX48xCwOtCVBAyDyK4UbOhdHEVhImLMmt3ZgTFBfcIRRvyq
 sCsQ==
X-Gm-Message-State: AOAM531bjVzSPK9Fj++UeaKtXYm0hOJKjWVHtOPGLEDT2XcxVjvCwzJf
 dyzJxMEYYi2ea8bp+/HdLuxi8Q==
X-Google-Smtp-Source: ABdhPJyCYvUuHklHkrRy2ybKyWKzmlY1S9EFMDIqtaglPZxKvLIyr8wx5fsy2eluw7K8dawNj3ZM4w==
X-Received: by 2002:a2e:bf01:0:b0:247:dfe7:62dc with SMTP id
 c1-20020a2ebf01000000b00247dfe762dcmr22281064ljr.365.1648027540016; 
 Wed, 23 Mar 2022 02:25:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 br12-20020a056512400c00b0044a2c454ebcsm986026lfb.27.2022.03.23.02.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 02:25:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed, 23 Mar 2022 12:25:32 +0300
Message-Id: <20220323092538.1757880-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 0/6] drm/msm: rework MDSS drivers
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

These patches coninue work started by AngeloGioacchino Del Regno in the
previous cycle by further decoupling and dissecting MDSS and MDP drivers
probe/binding paths.

This removes code duplication between MDP5 and DPU1 MDSS drivers, by
merging them and moving to the top level.

This patchset depends on the patches 1 and 2 from [1]

Changes since v3:
 - Rebased on top of current msm/msm-next
 - Fixed issue with enabling/disabling MDP4/MDP5 vs DSI driver (per
   Stephen's suggestion)
 - Reworked mdss_probe to remove extra platform_set_drvdata calls (per
   Stephen's suggestion)
 - Fixed a typo in the Kconfig (noted by Rob)
 - Added a patch to move component mastership from mdss to mdp5/dpu1
   devices

Changes since v2:
 - Rebased on top of current msm/msm-next(-staging)
 - Allow disabling MDP4/MDP5/DPU/HDMI components (like we do for DP and
   DSI)
 - Made mdp5_mdss_parse_clock() static
 - Changed mdp5 to is_mdp5 argument in several functions
 - Dropped boolean device data from the mdss driver
 - Reworked error handling in msm_pdev_probe()
 - Removed unused header inclusion
 - Dropped __init/__exit from function prototypes

Changes since v1:
 - Rebased on top of [2] and [1]

[1] https://patchwork.freedesktop.org/series/99066/
[2] https://patchwork.freedesktop.org/series/98521/

Dmitry Baryshkov (6):
  drm/msm: unify MDSS drivers
  drm/msm: remove extra indirection for msm_mdss
  drm/msm: split the main platform driver
  drm/msm: stop using device's match data pointer
  drm/msm: allow compile time selection of driver components
  drm/msm: make mdp5/dpu devices master components

 drivers/gpu/drm/msm/Kconfig                   |  50 ++-
 drivers/gpu/drm/msm/Makefile                  |  25 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  78 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      | 260 ------------
 .../gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c  |   3 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  54 ++-
 .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  |   3 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |  54 +--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c     | 252 ------------
 drivers/gpu/drm/msm/msm_drv.c                 | 261 +++---------
 drivers/gpu/drm/msm/msm_drv.h                 |  61 ++-
 drivers/gpu/drm/msm/msm_kms.h                 |  21 -
 drivers/gpu/drm/msm/msm_mdss.c                | 379 ++++++++++++++++++
 13 files changed, 645 insertions(+), 856 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.c

-- 
2.35.1

