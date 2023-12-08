Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA3780984F
	for <lists+freedreno@lfdr.de>; Fri,  8 Dec 2023 02:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFAA10E9BF;
	Fri,  8 Dec 2023 01:03:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F2D10E9BD
 for <freedreno@lists.freedesktop.org>; Fri,  8 Dec 2023 01:03:18 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50bfe99b6edso1744726e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 07 Dec 2023 17:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701997396; x=1702602196; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+k6qf+bNHQcvQl30mfuUz9ipkvgI67LW5R0klxiQSzU=;
 b=SMKUNiggxv3y2GOF33X7nzu0RABGGL2zThiOiRYiAqqGDEAQN/B3knZ6jlPrNXeYCx
 9ugo8uYtdlwS5wl5pv0fIrQpKY406L0kRKsBddoEztIuYH4m+V9XlrnCQ6hDiW+yiDiO
 UQ4GibRWWikdk8azEyJaFAsFM320PCngfwA1v9Jd7X82ygj1Wlb7yGxtsupvXYNvfxiU
 7O7jVh59bpAKAEwoLH/RDfIzJ0LAt4nVkNkMTw0Ua/zZ2Mcw/DnZeywhwwW8vGBBH/EM
 WV4fD+vh7lYE0LIro6s8BdQR63NIYr4hNLt9bNMVMsKMgZ4rf1k+brc0ByExmVC2W5/h
 KiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701997396; x=1702602196;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+k6qf+bNHQcvQl30mfuUz9ipkvgI67LW5R0klxiQSzU=;
 b=ktaqRv7//52piEVeeUnBa0Za2fvr3QQAEY1AGbUGNa13uUgGAA1Zb5DN0sV9XFsR5B
 4ploS8qHyypfHTcU3FOnyn3uS2eY5k2yqRG2gOcnCeZk0dyOD65MxUkEWenBLk558zAO
 8bNVpuxsNWarvg2dO0rTjzut0jolexpQIUzwZKDOLkEnEDz4WWqkC4SpJ9dF6trYAgRD
 j61dUCz+O2jhC/9ZH+coMdXE1+/GsyTqpX3/sxEgQUVBECEx4vshIgmsW4EYkY6OEyj1
 eMzch+CMsolajOaQui/cy4iqX11t4BNUwkc3k7qqM1S3Jsrs692eYwn5EfQjPgP5vWvE
 59mg==
X-Gm-Message-State: AOJu0YzgIryausCPPdmm+zBw5LPIhsJQMmBGqgcYUssMzPRLdzZ0HDSw
 GIAz8S4qbmHBYYdT9rTgtCoM7w==
X-Google-Smtp-Source: AGHT+IHnR+0WQEYXynumg+Qc9toMubczuekfzq5G2a/0OMdv4pHOEOU3FG1N9mU5AgUYB/y97N6lEQ==
X-Received: by 2002:ac2:48ae:0:b0:50b:e6ad:e7e8 with SMTP id
 u14-20020ac248ae000000b0050be6ade7e8mr2063009lfg.131.1701997396284; 
 Thu, 07 Dec 2023 17:03:16 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t28-20020ac2549c000000b0050bcb5b443dsm68415lfk.171.2023.12.07.17.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 17:03:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: [PATCH v4 0/2] drm/atomic-helper: rename
 drm_atomic_helper_check_wb_encoder_state
Date: Fri,  8 Dec 2023 04:03:12 +0300
Message-Id: <20231208010314.3395904-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The function drm_atomic_helper_check_wb_encoder_state() doesn't use
drm_encoder for anything sensible. Internally it checks
drm_writeback_connector's state. Thus it makes sense to let this
function accept drm_connector object and the drm_atomic_state
and rename it to drm_atomic_helper_check_wb_connector_state().

Changes since v3:
- Fix the function usage in vkms_wb_encoder_atomic_check() (Maxime)

Changes since v2:
- Make the function accept drm_connector instead of
  drm_writeback_connector (Maxime)

Changes since v1:
- Make the function accept drm_writeback_connector and drm_atomic_state
  (Maxime)
- Added a patch for VKMS to move atomic_check of WB path from encoder to
  connector helpers.

Dmitry Baryshkov (2):
  drm/atomic-helper: rename drm_atomic_helper_check_wb_encoder_state
  drm/vkms: move wb's atomic_check from encoder to connector

 drivers/gpu/drm/drm_atomic_helper.c   | 16 +++++++++-------
 drivers/gpu/drm/vkms/vkms_writeback.c | 25 +++++++++++++++----------
 include/drm/drm_atomic_helper.h       |  5 ++---
 3 files changed, 26 insertions(+), 20 deletions(-)

-- 
2.39.2

