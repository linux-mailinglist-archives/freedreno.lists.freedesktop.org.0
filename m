Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54FC9DFE19
	for <lists+freedreno@lfdr.de>; Mon,  2 Dec 2024 11:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8390610E69B;
	Mon,  2 Dec 2024 10:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rDNCKnDG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DFD10E698
 for <freedreno@lists.freedesktop.org>; Mon,  2 Dec 2024 10:06:43 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53df7f6a133so4239992e87.3
 for <freedreno@lists.freedesktop.org>; Mon, 02 Dec 2024 02:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733134001; x=1733738801; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8t93WpEYk3nDKkUudzjr3g8bA0wys8uB5XNs0VtJ1aI=;
 b=rDNCKnDG4opDwCAGU+HwnFED470pUV+v9P3NYqO4h4itbR0MDGD6boP9u5tExPs9Kf
 y+INK2YEbf6NkTHE5V5WMrZ2SUsGNkZ7GU8e04uvPLXfYR8eYCSZWgguNlwAzQRto7FE
 0xJ7pM7GBg2WvzMmlO9b3jQbTOgiOkB6iq9tSfTC9u6OycrHEIvxnDivh/UrEv70vFCp
 tGh+qquWm6zncqoT01ntjLtEXUD/2RvHDGVvCMRddNXHSJJ5vtihUcdTBrRtz1o0bRAY
 jD8e/uBmR1HdRA9Ls+ujr2IOySgzPx2TZcadEqD/HnH+Y6qWIF8kYQAQjhBgb1JPAIxx
 4z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733134001; x=1733738801;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8t93WpEYk3nDKkUudzjr3g8bA0wys8uB5XNs0VtJ1aI=;
 b=rQ3RBVEDBjEdXNzOxuTtjjeYfKGLkQUqghnVKNCbaTk70Ox0d5M/Y6XZk0df4FGVPL
 WVoAP8DYjXVXMxeuyTkq4Dj4vd0to0w8fWxNVxATZw5JZ6JhrjFAHq2HaUMLonkADebb
 sty35T/gpuAlhTNefVjFui7XwjCMzgsGWD4WvO3RWJBrTVVTY0+NIJ9I7LiwcZW3dkCS
 R01KrLUn2XUf/iLusy+WhwS/NtNe1X3PWKbBW0+Pmh5LhH8ogcDtkPLoypewoxlh6uud
 J0MyA38R80zxnbz+Un4I1BPPp43YXxq2qkgTrL5u/vrxHzAE6W0QMjQJ3AnS/aYXdjah
 zhWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVNxojFgO51HQorRPKmkDjOwjyaNSN6e2TVwyhA7f+HNhVjBEY0DDS348p8wNnq3DlWKfTy9cva7w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQNERTBaCS3JTIVwYGr6JYo3hu/CFmiHqD3xI2R13nnVT4sUzj
 BEGsv466dE/uK03JD7PBzuU/Iziz7qSGTKYdJa/MadUgYG8OOvnSXgXPeGINQuw=
X-Gm-Gg: ASbGncvXk3V/5kAJT1b8kQcf85z3o+baNZcQ2DJWXDabA3tT3Cr7nbfOSyCK/m9aWbJ
 rxdPp9GJ1/a3St2XOtNc8lhE2DGD7H05wNdQYFrHCXIE1q3nCmFvakS2KImmBo3yVsMeGt33lPs
 ux0l0NV0jmHpaI3vby/4w+o9xYDfMBhx6Iivqk+ZO6b4oK4n4KhSP/S3VMqnj6GhjbI0IwTGA1l
 j4S8K1rdKS32LLPXb+HLYgxpCEM7WkstpEzUAcUJwXwS2TlGhKZYBk25w==
X-Google-Smtp-Source: AGHT+IHbH0cvmJT2yx5NWUiOIEXeDVP9elqk8kJiJCCcfIiHjfj52Z/RMITv0CgC14CJdFE5cVHdfw==
X-Received: by 2002:a05:6512:3181:b0:53d:d5be:4bd9 with SMTP id
 2adb3069b0e04-53df00cf711mr11571431e87.22.1733134001292; 
 Mon, 02 Dec 2024 02:06:41 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df646f191sm1418314e87.136.2024.12.02.02.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 02:06:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 00/14] drm/msm/dp: perform misc cleanups
Date: Mon, 02 Dec 2024 12:06:30 +0200
Message-Id: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKaGTWcC/22NQQ6CMBBFr0Jm7ZhpLaS48h6GRaUDTGIoaYVoC
 He3du1u3v/5b3ZIHIUTXKsdIm+SJMwZ9KmCfnLzyCg+M2jShhpV4+DRL+hWLwEHea/5brW1F3Y
 tG4K8WyLnojjvXeZJ0ivET3mxqV9abEqR/WPbFBIa6i3zo6F+qG9PmV0M5xBH6I7j+AIizTofs
 wAAAA==
X-Change-ID: 20240615-fd-dp-audio-fixup-a92883ea9e40
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2287;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GgRTctJjjmFR+2EV4ZLRM9XiD3udOEtrsRG/wQwZASg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnTYasqHrxgs6JE7M1hdNH3pJDJpsqVsEy30IHc
 OgfiW2uBP+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ02GrAAKCRCLPIo+Aiko
 1a/yB/9yeB+1vh6Ib4i/1wq8ZlRx95FOtXSk+vAwqwI+qAQ/T66c/gjRGwveviKMzjYp5HGqNch
 yW37GhGioJontuzz92aByij7NmUpY7OaJA9Y7n1UE9f6gPltN70WNcLwGqvv2LgpR1qwzmnfQvD
 z6OBbiEkYFUDBkzTcv20abdx3qTku6ZSp0BrZIHCMBu8rlTM6zfSKasJhJ9BfpimlD0dftil7Wh
 Hp0wvrCw1fOURXBvFfdd7I98OZLcLJUGKT1C9TIBXG/VDGezOga7fIP6xRFW16d+LoV2uuhv8Qp
 V5fiCnKIdkA46Kf5wem2VGKJfcgHDqE2PkL6De/CWynSSsvU
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

- Fix register programming in the dp_audio module
- Rework most of the register programming functions to be local to the
  calling module rather than accessing everything through huge
  dp_catalog monster.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Set safe_to_exit_level before printing it (LKP)
- Keep TPG-related functions (Abhinav)
- Link to v1: https://lore.kernel.org/r/20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org

---
Dmitry Baryshkov (14):
      drm/msm/dp: set safe_to_exit_level before printing it
      drm/msm/dp: fix msm_dp_utils_pack_sdp_header interface
      drm/msm/dp: drop msm_dp_panel_dump_regs() and msm_dp_catalog_dump_regs()
      drm/msm/dp: pull I/O data out of msm_dp_catalog_private()
      drm/msm/dp: move I/O functions to global header
      drm/msm/dp: move/inline AUX register functions
      drm/msm/dp: move/inline ctrl register functions
      drm/msm/dp: move/inline panel related functions
      drm/msm/dp: use msm_dp_utils_pack_sdp_header() for audio packets
      drm/msm/dp: drop obsolete audio headers access through catalog
      drm/msm/dp: move/inline audio related functions
      drm/msm/dp: move more AUX functions to dp_aux.c
      drm/msm/dp: drop struct msm_dp_panel_in
      drm/msm/dp: move interrupt handling to dp_ctrl

 drivers/gpu/drm/msm/dp/dp_audio.c   |  362 ++++------
 drivers/gpu/drm/msm/dp/dp_aux.c     |  195 +++++-
 drivers/gpu/drm/msm/dp/dp_aux.h     |    9 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 1267 +----------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  177 +++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  575 ++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |    5 +-
 drivers/gpu/drm/msm/dp/dp_display.c |   36 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   |  234 ++++++-
 drivers/gpu/drm/msm/dp/dp_panel.h   |   14 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     |   17 +
 drivers/gpu/drm/msm/dp/dp_utils.c   |   10 +-
 drivers/gpu/drm/msm/dp/dp_utils.h   |    2 +-
 13 files changed, 1176 insertions(+), 1727 deletions(-)
---
base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
change-id: 20240615-fd-dp-audio-fixup-a92883ea9e40

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

