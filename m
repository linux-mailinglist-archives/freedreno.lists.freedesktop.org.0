Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 705CD4A8055
	for <lists+freedreno@lfdr.de>; Thu,  3 Feb 2022 09:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5899510E9FC;
	Thu,  3 Feb 2022 08:26:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49ACF10E9FC
 for <freedreno@lists.freedesktop.org>; Thu,  3 Feb 2022 08:26:15 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id b9so4360151lfq.6
 for <freedreno@lists.freedesktop.org>; Thu, 03 Feb 2022 00:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S38tuxTwAJF2h0gRAdGhSXbP3RaFlufeQHI0R6YpVOU=;
 b=aWN6QKSPaM41d5unF2QXaafMSwWO7hi4eOS4AVCDKNIWIISbQJtAqbyYCy9MtFVLmH
 QTikXmb+lWaWW1Imx818pj2+p47bsadYEtrQ113ok8k+a7suBuVc+j/1pOuVgu9YJ9fm
 CFnUXNNiXQzmIahD6thOTfjn4XFrmPlj1g/uWS2gVmblGY2vOEHIHqTZNmUCGt+1oMof
 3XkwcWGLkvHOhgOjFafCJGTuJ3Y9zc7FbclwS0PyXYufE7XdWB47tUqUryAO4XQb5vzu
 mufi6ze2Zr9ipi/8l/DHUi580vcIpndMg33n0Qcs1z4anG0NErGxyDYEvryicOvnbwRN
 wZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S38tuxTwAJF2h0gRAdGhSXbP3RaFlufeQHI0R6YpVOU=;
 b=M3QJi0iF7T6f22bjyDand/pk5IDzlNOweUw11/6sJL5E+W2H2R8DnODHyEhGRdJWRV
 Jl/jLLCKmHW9y4TWHpUKnxWVMDpgMqMKHqh4JheNNi9XeRdfAezJ3FIc8AqxHrAFRnB0
 o1twWfPliGPurMWGjN6a6NMgV+xbcqLtVISvj5ISqoMN1EtUGl0xK3fuog4lXe1VNBIN
 6DQc/5VW/6uR3sKLCusaXBv9rt1BNtxrbyoC8zDHkQnoFd6STKyFAUzVzlpWTlavXejS
 Ch2uBzOpo+Mj3sa0o85o9iBKb0DMRPinPl51QkEnB0VnYmEIDSGrXvf8QkdW0IGZf9Rd
 Y7+w==
X-Gm-Message-State: AOAM533vGhgCDyaxXmBQJwrYpDYMI45Otix51M/Z7oVtsOoVHbAOjKjE
 LJ6SSjb8KmZUGSFl8h/ynbLlYQ==
X-Google-Smtp-Source: ABdhPJzTuWkFCHuo3KIaNz64Zq3zWmSn2BH5AXTpKPvbi2E5D4xcbKbDwwl5d9BZx95Tu9HdRou6gg==
X-Received: by 2002:ac2:5ccc:: with SMTP id f12mr26515293lfq.335.1643876773463; 
 Thu, 03 Feb 2022 00:26:13 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id n15sm4083440ljh.36.2022.02.03.00.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 00:26:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu,  3 Feb 2022 11:26:04 +0300
Message-Id: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/7] drm/msm/dpu: cleanup dpu encoder code
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

This patchset targets DPU encoder code, removing unused artifacts (empty
callbacks, MSM bus client id, etc).

Dmitry Baryshkov (7):
  drm/msm: move struct msm_display_info to dpu driver
  drm/msm/dpu: simplify intf allocation code
  drm/msm/dpu: remove msm_dp cached in dpu_encoder_virt
  drm/msm/dpu: drop bus_scaling_client field
  drm/msm/dpu: encoder: drop unused callbacks
  drm/msm/dpu: switch dpu_encoder to use atomic_mode_set
  drm/msm/dpu: pull connector from dpu_encoder_phys to dpu_encoder_virt

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 118 +++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  18 +++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  18 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  28 +----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  28 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   4 +-
 drivers/gpu/drm/msm/msm_drv.h                 |  18 ---
 7 files changed, 63 insertions(+), 169 deletions(-)

-- 
2.34.1

