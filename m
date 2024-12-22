Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EE69FA7EA
	for <lists+freedreno@lfdr.de>; Sun, 22 Dec 2024 21:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D694D10E00A;
	Sun, 22 Dec 2024 20:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="q9661ibf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F010510E0A4
 for <freedreno@lists.freedesktop.org>; Sun, 22 Dec 2024 20:14:11 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53f22fd6887so3374065e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 22 Dec 2024 12:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734898450; x=1735503250; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QxprhQ4J3lQhku7F3H5lnA88gGNPLgwQxX0RIJtyMRs=;
 b=q9661ibfZ5lWApzl6stekv1ffGKlNXtrqg2CS6XUp5A7R+gWXwqnpsxgzpdP9DxeZg
 cuqawPzfQxNmep0ADh6KmUFf8GkviFs1X47rIqz+0eq3QJa2vSgpwJGXN4FqpvFvIlVB
 th6XBXuC9HIUTAiizk2IKjcMIaCOPxoS0/hoeTYB3v0OnXSdbHQw4cnteyaOefXERch+
 hREtPHa2CG3a2yxx13Cxf0UnWnyfPg1j1jqCBoRZKeXFPtfokL4yzmep7hP2+tAw9Yr9
 +EEmqbH/p0KSge6MKnuD8rMhjrULIMQo0yiRvPicDV+m94d6hE2ixZQWaECy5gNdOl5i
 XNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734898450; x=1735503250;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QxprhQ4J3lQhku7F3H5lnA88gGNPLgwQxX0RIJtyMRs=;
 b=E9SUrF2fFUO2qKJuHMMB/TTzDre+rnsJY0IPONl/B4Bx2RoBBKIBooFdARCxrjI+hB
 yKX1tgzmnfY7Pi25Wik0iXUbIvFftRCRmy0VEdqGceh5fgwo2VlLbLx/Baehwd1Ihv3J
 0jWVsMkmtYmS/04Dr+gzQbf2w9udMpdOU5gRAxXc8dsepjkjNGqkBd3WVk+ErwX2bNys
 XwV2lFnzZ2GpDOg/8LNWl2VzSkZEjHcfM2r28CH9CK/XuySIyx/SmjhJnYEmIuRB2Oda
 1yTHxyLUZ7EFoA4qurBHq4e9qmxJG1/FNr6rZzTeLk3+OSxkPHURxDlKmHE73EeRDtsF
 rtZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS/liffyian/OtVbYV48uXQwOfdRGi3wg/8vT3Ze1nPsAQ3C4lhtYZKbtyZwFrUyqE/GbKmCMYupU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAPOnLMNcPzyWgVMm20OohT6BqLpzBmnv13hfGkpY0zezGzbDs
 3s+do44yRHyNNsUGTa8EXeBtz4ad7qH+qB1QtOIL5eD9RIh0CPj5kook7QaXE5c=
X-Gm-Gg: ASbGnctRCK+jawW1kBAEj6ZyVfLGUSDueBTJ5MdGxdFvj50ibgY8jMK2wV36hfOYV4a
 qQyPt6PsAjGB0b1hILdagoDGwazXDmodfQS0d1lMgp0esfRVX6V0tDry/8mWemKuUsC6bY2jAmC
 L2QkgymFt1uo+sNGgpX/Co/LK87Ue0QP1PaEncTm8E4nUD0/htC/cuPKuhE/uXOrVKVgwCjj/oR
 9Up2pDxqRgxlxC4RZOW2FiqCR6qTh7WItXQj67L7vcv7e/oFnZzprMupgbu/VHB
X-Google-Smtp-Source: AGHT+IHuJKl0EsUunMGN5Ubn6CwgCiRILGyED81vP+KryR9UlYeYvtqF6+jk2ruBXuO9Ts6rda9Jwg==
X-Received: by 2002:a05:6512:2394:b0:541:21f9:45b6 with SMTP id
 2adb3069b0e04-54229562a7bmr3656179e87.37.1734898450076; 
 Sun, 22 Dec 2024 12:14:10 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f7765sm1034331e87.13.2024.12.22.12.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2024 12:14:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 00/11] drm/msm/dp: perform misc cleanups
Date: Sun, 22 Dec 2024 22:14:03 +0200
Message-Id: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAtzaGcC/23OwQ7CIAwG4FcxnMVQxpB58j2MB0aLkpixMF00Z
 u9u3UWNu5D+bfqVpxioJBrEbvUUhcY0pNxxqNcrEc6+O5FMyFlopY2yUMuIEnvpb5iyjOl+47r
 RzlXkGzJK8F5fiAezeThyPqfhmstjPjHCuztrAMotaCNIJY0Kjqi1KsR6f0mdL3mTy0m8uVF/C
 H6WCM0ENuC2/CmLHv+I6ouARaJiQrUQbE1bbH31R5hvwi4RhonoEBoLIWodf4hpml4HX8FNfAE
 AAA==
X-Change-ID: 20240615-fd-dp-audio-fixup-a92883ea9e40
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3056;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nltqBJNSym88t0xwGnPmhRirL/N2i25MU95l0p1iW20=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaHMNNB4WdPK3Tw2Vu/f6YwHbW/BeP1HUlHfG4
 LjP8+7MpXCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2hzDQAKCRCLPIo+Aiko
 1WBbB/wKv0fU2PHu9ZtrvZoEFNMBVuzH2QjvNYtiLZBEn1FKCGulwoUvAUMW/3TLKgdKLvmcvQ9
 Y/Fm6E/bS/FbdQZG89e/0cVEIuBiqaUY1RFWKcpS/bM0rw5A6gfhRkk/w8ommpLkcgCQH2mm/Jb
 5bxpFIWpIQeg7gif2DcYGAdQQfiwQxmUn46nEdJ6Bg59512iekuv8wrWyfpKfOh8s7Sbpzca9t0
 Sk6c6ESbAeCk5OHU4jN9J/Mfjkh5Nmtxyi71LcXenSiBXtAh1sbpe9uq/3J7/k1uoZxEKXlQlBK
 lHR6A1f3lJbA7PQXsy8UPEpuuJs3hhtWhlIHD75wDqPU3kZl
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Rework most of the register programming functions to be local to the
calling module rather than accessing everything through huge dp_catalog
monster.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v5:
- Dropped applied patches.
- Removed MMSS_DP_DSC_DTO programming from msm_dp_catalog_ctrl_config_msa() (Abhinav)
- Pulled the hw_revision patch closer to the top of the series (Abhinav)
- Link to v4: https://lore.kernel.org/r/20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org

Changes in v4:
- Rebased on top of linux-next + msm-fixes, dropping picked up patches
  (Abhinav)
- Reordered patches to move dp_audio patches earlier (Abhinav).
- Added several more patches, dropping dp_catalog.c completely.
- Link to v3: https://lore.kernel.org/r/20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org

Changes in v3:
- Fixed falce -> false typo (Abhinav)
- Dropped wrong c&p comment from msm_dp_read_p0() (Stephen)
- Changed msm_dp_aux_clear_hw_interrupts() to return void (Stephen)
- Fixed most of line length warnings
- Link to v2: https://lore.kernel.org/r/20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org

Changes in v2:
- Set safe_to_exit_level before printing it (LKP)
- Keep TPG-related functions (Abhinav)
- Link to v1: https://lore.kernel.org/r/20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org

---
Dmitry Baryshkov (11):
      drm/msm/dp: split MMSS_DP_DSC_DTO register write to a separate function
      drm/msm/dp: read hw revision only once
      drm/msm/dp: pull I/O data out of msm_dp_catalog_private()
      drm/msm/dp: move I/O functions to global header
      drm/msm/dp: move/inline AUX register functions
      drm/msm/dp: move/inline panel related functions
      drm/msm/dp: move/inline audio related functions
      drm/msm/dp: move/inline ctrl register functions
      drm/msm/dp: move more AUX functions to dp_aux.c
      drm/msm/dp: move interrupt handling to dp_ctrl
      drm/msm/dp: drop the msm_dp_catalog module

 drivers/gpu/drm/msm/Makefile        |    1 -
 drivers/gpu/drm/msm/dp/dp_audio.c   |  130 +++-
 drivers/gpu/drm/msm/dp/dp_audio.h   |    5 +-
 drivers/gpu/drm/msm/dp/dp_aux.c     |  216 +++++-
 drivers/gpu/drm/msm/dp/dp_aux.h     |   15 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 1298 -----------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  113 ---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  607 ++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   19 +-
 drivers/gpu/drm/msm/dp/dp_debug.c   |    1 -
 drivers/gpu/drm/msm/dp/dp_display.c |  150 +++-
 drivers/gpu/drm/msm/dp/dp_link.c    |    1 +
 drivers/gpu/drm/msm/dp/dp_panel.c   |  256 ++++++-
 drivers/gpu/drm/msm/dp/dp_panel.h   |   13 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     |   19 +
 15 files changed, 1242 insertions(+), 1602 deletions(-)
---
base-commit: c9261bcc1546a564407513e148c35a79a58bc2b9
change-id: 20240615-fd-dp-audio-fixup-a92883ea9e40

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

