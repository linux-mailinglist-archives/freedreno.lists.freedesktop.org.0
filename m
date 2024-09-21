Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5985997DC1D
	for <lists+freedreno@lfdr.de>; Sat, 21 Sep 2024 10:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293A110E033;
	Sat, 21 Sep 2024 08:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vA+v2W5H";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE6D10E183
 for <freedreno@lists.freedesktop.org>; Sat, 21 Sep 2024 08:17:38 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53659867cbdso4176874e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 21 Sep 2024 01:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726906657; x=1727511457; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E9/tDMi0UFQzl7ArS3IW9+nNYwPjqkN7+k/yDaV0L7c=;
 b=vA+v2W5HRk8wAATKvNzsQMgFlpF5DbilhpojgMkPQtBHJKfcL7SXv8M2OOf/PFsx3J
 aaGt7JajeYOUlc0Q+VGtS0qyAnRfP9Joyknq78+Yyt9kWhHNCIX4ee7Cl+E3SOmrXdbQ
 vBWdlurrnLkTIq260iVWgXKWloP/ytwQfM85OMsA6jL68lIM190NBK8PuDgV2C9iXU19
 j6n5ke05EjzD63aZ/s/fan3aO5Rh2wA/Rk+m2i3J0oonwHXQtiKTSP/UocsdnmR5qYxv
 abTEPqxmcD42+hATcrkZHHF+LhHCl8mh2L84BXVbMIpw5uCzg/h6uumW+fQ11V7+EuIz
 BbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726906657; x=1727511457;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E9/tDMi0UFQzl7ArS3IW9+nNYwPjqkN7+k/yDaV0L7c=;
 b=QzzeoPVRylj6UQEGPna9Urji0ME86tq8+RQgUuubcIqW5QMp5pVzX3FZed6KAArsz/
 8Far17W29d71DzoFZ3OimErYXi33OcrRXRHKCO+lFgMbHicb5UeTuEB1vvokpkBoMY/e
 UOTrRumvXL2on17r+L7TWoSHMo4/Sw2sXusxnwa5okxChKvVLsQcaEl9PU8o+tw7se+V
 K57764bvQLSpz2R2HhICYSETDB/dCu36Twe5fazhJ4qGul1ucXTeAD9QhBQTT1ojIxpU
 CczhYh1YwK18sNEyXCfjSvrqp/iJDJyO4lJI72ofgpY0m/G/4/w3uxMslhA5mD3d/Uak
 he5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe5aeCMzOrF6KK6p3UtJoT7eoiW+Rxnynlq5PaN4ggekqu1/JjKzFmPdFytovJ6zmHU7sumfRAXao=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywk2L99ZaZX9y0iPlKUWTNY5JjnUMbK3Up+YNdbbF2oeryDaOGL
 QNrYzmzneaG9F45xuJc3guT0Ped2yYdp2wkEpYmJvIMLytRJkwNoywDy9DiX6zM=
X-Google-Smtp-Source: AGHT+IExbB1kKJ/xoX5oGe5FlVKfWYeM9QjPTp2scSPuxwYz/2DPr8V3dCucC36g4rRThGdPEYK1tw==
X-Received: by 2002:a05:6512:2395:b0:531:8f2f:8ae7 with SMTP id
 2adb3069b0e04-536ac2f5196mr4283336e87.25.1726906656592; 
 Sat, 21 Sep 2024 01:17:36 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870968d1sm2466380e87.175.2024.09.21.01.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 01:17:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/4] drm/msm/mdss: rework UBWC registers programming
Date: Sat, 21 Sep 2024 11:17:28 +0300
Message-Id: <20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABiB7mYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSyND3dziXN3clOJi3dKk8mRdQwNTUwvLVAPTNGNTJaCegqLUtMwKsHn
 RsbW1AI4EzJNfAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1666;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FWxmz7a337bopVTKsWHeJLal3kuOKwjodrDrKroH46g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm7oEeg8QXbKlz5YvCz4t/2udl84Z9xp0WLVCjr
 E0eBawUMEqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZu6BHgAKCRCLPIo+Aiko
 1dKnB/9i7/Ti1b9MR9d1Q+g5lv7IhMcVt+9dwlNHrbmi/iy9XyTh/1MVVbxvteN44VxZYgkpElh
 icJx0jJby8V/YsrxcxsQBsDxzAbvCRl27Fawt5WCYzug44R7yjOt9V5h7sxfFjKj12IyeQVmfxO
 hk6+Xx+ZWDNotIFPeowgRgjuUAQpDJMHKCBfAO0xqO3+6gRxnb7GXfhDMZ/8DlumwSFGGRucnoE
 vPIsYP37wcOIpGh33G5ZiFP4sEbcJ7Uq+YezDOkpfvkeBWycxujNpUEhyagl7eSLdKVTfEBD1Dn
 KH84lfQRyxA3uNLrLiwKUtTqscI57VydcmSZJdCMtOV/fUvg
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
Dmitry Baryshkov (4):
      drm/msm: move MDSS registers to separate header file
      drm/msm/mdss: use register definitions instead of hand-coding them
      drm/msm/mdss: define bitfields for the UBWC_STATIC register
      drm/msm/mdss: reuse defined bitfields for UBWC 2.0

 drivers/gpu/drm/msm/Makefile                   |  1 +
 drivers/gpu/drm/msm/msm_mdss.c                 | 86 ++++++++++++++------------
 drivers/gpu/drm/msm/msm_mdss.h                 |  4 +-
 drivers/gpu/drm/msm/registers/display/mdp5.xml | 16 -----
 drivers/gpu/drm/msm/registers/display/mdss.xml | 38 ++++++++++++
 5 files changed, 89 insertions(+), 56 deletions(-)
---
base-commit: 32ffa5373540a8d1c06619f52d019c6cdc948bb4
change-id: 20240921-msm-mdss-ubwc-105589e05f35

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

