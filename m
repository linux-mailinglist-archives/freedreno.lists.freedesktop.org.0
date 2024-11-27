Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9AE9DA98E
	for <lists+freedreno@lfdr.de>; Wed, 27 Nov 2024 15:04:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FDC10EAE4;
	Wed, 27 Nov 2024 14:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Et5dkxSy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51A610EAE8
 for <freedreno@lists.freedesktop.org>; Wed, 27 Nov 2024 14:04:45 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53de852a287so2377910e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 27 Nov 2024 06:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732716284; x=1733321084; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u4Ts7aUIWizov/NLYuaDxwP3nX1iyB8pequrCUYPZSs=;
 b=Et5dkxSyFilGGvSV/HD/6j4swjplUn1UbN0mIuQKJ7r5IkmI6ETXKXq+VJfOtAHeIk
 KJ7aY5ur6Ios1xUyO7Rlh/Xw1ZKlP3rWLsMIrABBXKgFnsjqVHHOdRzV69mBhmyDDs8k
 UBL/ZzKM/AZMqcamMgknJVc61U+/qly64LlAKkupLMJluwNAFXWBl9W7U43DE8vBT1lA
 dkAEgMBMRx0GER4zkfX8/udAC1YMlEQYldljjFPKJ6vNkLApXgwKF5ox3Jl7qtQnJQOF
 F0yb9wNdT9nIhaYHbmSH2zi+GvQehjRu5FRPMx7wYXA1wFv+KAQSkLw7CXQJoJqcOR1A
 //NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732716284; x=1733321084;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u4Ts7aUIWizov/NLYuaDxwP3nX1iyB8pequrCUYPZSs=;
 b=bv/qHyJ69DIq+U5HxaMZZ7MuSYqa8vlvKm/W59egAa3dwHCVrZ52oxkOIIybLNungB
 ZlaAOjfh0YQRByvQntkibUW5GgCvJsM6xDbuBBW1X0zoqSCcLQ/WisBd9/BzEPJUYaZQ
 y4WLpTRCeTLnh/jtdIO9Phj6oPIJhf3BwjU3Z+fiVe/LcWlYgr6t9N7Up2BkJxARY2Tl
 iUCo+/feUS2c6U84d/YitfUR95wNWjQMjdjjnOR1kLyie7IrGajDbjEfhujTNlZixZyL
 1AcZPgusw7WzZsgqxVWMoCXJTQgGHiiGI/97+kR48ISbaT3c3sHUvRZY2+2EI+U2GHBb
 ZYyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWox1LWt07MB3rrgeCRcbexkNE+LzilTca4M37zidoYrchuL1Bjz6L/eKt8Ci1Bmg+EQvBP1XFcBJs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywrh3vEfKiSTPuh4d6oo9otlRStc4Yg8Y2AXQS8yCeC8tfPpR6X
 guiToo4aKFGf4sPvypSrV5Cc2RLJR7xFWdFs263+mhSycW1UK5B4uw3D0eHo0URI4O10T72ZycV
 f
X-Gm-Gg: ASbGncs0FVB28qYvCHTMkcq7dvgXkTQwFEpayehZixJZJ10XxXY7mu3RYx5YXkKbrGC
 oXkza4BBFQf1WiM1Voi/d5HIc+LKjPKqX9MO81X+qD7/XB4dYJoYbBrKYC/6lFKCYjV4p67zkT7
 3cWg2tOGLIkzLdIl2RHbpvxigx50sQpIeCh5jDCCnzYJrKeixgou4ezAZ41uYtQzWhw56W/p0v9
 92YbL+4abcLogQVv+7hIoqXBmT7pCjSfux1TxZVKTao7IZsg+3SyJe8rw==
X-Google-Smtp-Source: AGHT+IGKW7mqkMGNSg9jVL3UeUo9m2hpnWRcx4+XgEbh8rHW/MWq3FNhz3Cl3UMtUlWPz/sntopdTA==
X-Received: by 2002:a05:6512:3d0f:b0:53d:ab0d:b9f9 with SMTP id
 2adb3069b0e04-53df00d3e42mr812209e87.23.1732716276835; 
 Wed, 27 Nov 2024 06:04:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd44cb7c5sm2157291e87.122.2024.11.27.06.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 06:04:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/3] drm/msm/mdss: rework UBWC registers programming
Date: Wed, 27 Nov 2024 16:04:31 +0200
Message-Id: <20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO8mR2cC/3XMSwrCMBSF4a2UjI3k5iHGkfsQB21y0wZsI4lGp
 WTvph0ICg7Pge+fScLoMZFDM5OI2ScfpjrEpiFmaKceqbd1E864ZJoDHdNIR5sSvXcPQ4Eptdf
 IlBOKVHON6Pxz7Z3OdQ8+3UJ8rfkMy/uvlIEyKgGscYJpy9Tx4qc2hm2IPVlSmX84ABe/nK9cS
 NmZHTptvngp5Q1c7rZL6gAAAA==
X-Change-ID: 20240921-msm-mdss-ubwc-105589e05f35
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Connor Abbott <cwabbott0@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2035;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Awfx1uj7GWmNyTbncLyYqj3YeiEUQM92uIC4PxSF4K4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnRybyTdBGPMzM2WIyfuTcNhdMbTAUb/2tvctHL
 Jam+Z4nmBKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0cm8gAKCRCLPIo+Aiko
 1Rx5B/9lunJDTciQmLjaJcsjsjKWM5jxx+FakpMngARXvBBZo4b2ntmIWJbBk00P6yfPhJjWkCk
 +S6QuYEw52Blfvsi7T5rFVqVeZ+2YcxiI8PDutT75UtGvfubgbXvOWxvGlDALnPw0NzzkLY/xs8
 KEf1p15baAKO19G1vZz97uQa+lMFNvRuHAur0PaAA6pMh/R48B9WfbziqlSltAgd5QYkDWf2fTo
 4foNKhePqDMVnwobTAUrSinMNNUBpK+y6krSYAfO2Mbds0An0Cc1NJYYF/MNz7jqzouSE/SCIvv
 7ATxElK5TwgWRF1qufGQ4yUxwkJcdl80acOpx3DgCUhwAUte
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

Current way of programming of the UBWC-related registers has been
inherited from vendor's drivers. The ubwc_static was supposed to contain
raw data to be programmed to the hardware, but was later repurposed to
define of the bits. As it can be seen by the commit 3e30296b374a
("drm/msm: fix the highest_bank_bit for sc7180") sometimes this data
gets out of sync.

Rework existing msm_mdss_setup_ubwc_dec_NN() functions to be closer to
the actual hardware bit definitions. Drop the ubwc_static field.

Unfortunately this also introduces several "unknown" bits, for which we
do not document the actual purpose. Hopefully comparing this data with
the more documented Adreno UBWC feature bits will provide information
about the meaning of those bits.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Changed UBWC_MIN_ACC_LEN to be two-bit field (Abhinav)
- Link to v2: https://lore.kernel.org/r/20241123-msm-mdss-ubwc-v2-0-41344bc6ef9c@linaro.org

Changes in v2:
- Dropped applied patches
- Added defines for UBWC_AMSBC, UBWC_MIN_ACC_LEN and UBWC_BANK_SPREAD
  and .ubwc_bank_spread flag in struct msm_mdss_data (kudos to Abhinav
  for helping to handle this on Qualcomm side)
- Changed msm_mdss_data to use true/false to set macrotile_mode
- Link to v1: https://lore.kernel.org/r/20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org

---
Dmitry Baryshkov (3):
      drm/msm/mdss: define bitfields for the UBWC_STATIC register
      drm/msm/mdss: reuse defined bitfields for UBWC 2.0
      drm/msm/mdss: use boolean values for macrotile_mode

 drivers/gpu/drm/msm/msm_mdss.c                 | 71 ++++++++++++++++----------
 drivers/gpu/drm/msm/msm_mdss.h                 |  4 +-
 drivers/gpu/drm/msm/registers/display/mdss.xml | 11 +++-
 3 files changed, 55 insertions(+), 31 deletions(-)
---
base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
change-id: 20240921-msm-mdss-ubwc-105589e05f35

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

