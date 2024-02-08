Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E04CB84E3EA
	for <lists+freedreno@lfdr.de>; Thu,  8 Feb 2024 16:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7DC10E8DA;
	Thu,  8 Feb 2024 15:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KaEjEpb4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F4710E8CF
 for <freedreno@lists.freedesktop.org>; Thu,  8 Feb 2024 15:20:45 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2d0a0873404so20358811fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 08 Feb 2024 07:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707405643; x=1708010443; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wW3An6HrSaw0YhyE7xy8Z1CJLHiWZKPi691yAJpdg/o=;
 b=KaEjEpb4qB2NCwd3b5ZFgXkfAemkIfD1DZg2ZVqgaauoxvix5QLTM5g0MDWIJPVPzE
 g2BEGcQd3ANS3KgfP1pVVbH/fQTGbGMePo+e0e+Hi0TZPwIeKHey5T92P1TamqaXSP5T
 7D95BhHdWRNgzWQcy+5Ar9TGOf9dldfm8Bd56d3Ysj7uzk6TI4DCAn1bERjLA3Wy09Dm
 JPAb9oRY2w+Y6amopQSaMTqRRm4pUXYR9FCKJyRQGdUQE2QKqYU9jyn7CdE5oawEsz31
 TGr2BAgULbTT7MLdfEqs9OO/nIgMCeQHih7Khx4FSlCju2Pk5+Ax519iLY5uJqSDubBS
 p/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707405643; x=1708010443;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wW3An6HrSaw0YhyE7xy8Z1CJLHiWZKPi691yAJpdg/o=;
 b=XrN3cepui1KYYTMKUkCQ6vgcemCLvRh7ROdwI1CkIy/AFoARr/2v2HlPKViBbrtxQY
 yZ86ZIMrLacsXKaanAPCJyj6XlQmD1P+kNxKW7dZmDWwWeGuStYjMWpR4u6ObXrrKPr2
 kf9p9AsSEVQlnuYFZKfiwepBCjLuvStXbxjHlo0scJH7D8k6huobj3B7xxHK5/RMX714
 UX3LIWEikTUzuuKDTXCELAwIbI2/uJiitaRZU1PjEShW1CgT2CKgIewkjxSVuJmQOEgK
 OH77J3lEZE5JRQt/g6AkD9WImv1JaGe4PM8rUKpw9G+kn6gExkodqJbdohH30B5Ww3J6
 Y7jw==
X-Gm-Message-State: AOJu0YwkgG8To7ANY4e1XL41KYNSgshIVemhEPDD7icpPtewZEWWpYOI
 9mNOk4Pys5W3RwRMTh2de8IzXPW1d0//LPGUymSq5oUJV4pw+NqaPPJJ2z8oRN0=
X-Google-Smtp-Source: AGHT+IGmk7M8vXorynWP6aBSxtUG2/+mks+u8aKy+hPgTelbsRaZ0gZkQDPvVrZvlClgPgp+hamwnQ==
X-Received: by 2002:a2e:7d0d:0:b0:2d0:b291:d017 with SMTP id
 y13-20020a2e7d0d000000b002d0b291d017mr6155329ljc.15.1707405643140; 
 Thu, 08 Feb 2024 07:20:43 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWKV46Gypp9pGoMz0wPHepVZ9E7VlzEZgf4M/OQ2J3tLa8HY4B6xcPaBfaX0nGp0mDScpacIAHqi7wMiSYjjR0Zy0Yo2h78ieRJX3AvpguI42I2ksLjIEHRuQU0LpFRXpgvTi5LQaMUxf/yqx/zUjBZtF00r55Y6GaBoz7cD28BKg3SiFHaWxQqJgSMjz9PEsILd84CBgYJSvP2Dz/9i1kwE9u7kKqE6LTO0Cdh66FOS6oFZQZbf0dCZ88SvlF2cNt2fMSJ9doOXas5R7ykGdv7FygpIHM6Qb7oyQyeUbjEcHdvLBMmhqGXu4VKOtFgdDpyaYYMVVGSXsBjEGs=
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 y4-20020a2e9d44000000b002d0d1caf26bsm22116ljj.7.2024.02.08.07.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 07:20:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/5] drm/msm/dpu: remove
 dpu_encoder_phys_ops::atomic_mode_set callback
Date: Thu, 08 Feb 2024 17:20:40 +0200
Message-Id: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEjxxGUC/zXNSwqDMBSF4a1Ixo3EJD7aUfdRSojmqqGNV26CV
 MS9NxQKZ/JN/nOwCOQhsltxMILNR49Lhr4UbJjtMgH3LptJIbWQouOjMwQBNzDrvEeDazQ2YfC
 DCejAREjc9q1o8nrVapZDK8HoP7+TxzN7JAw8zQT2n1aVlHWlRFerUjX1VUvNK+6CT7SXvaU9z
 i/c7m+/WMISaWLn+QVB9SC2uwAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3017;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JFIWmCDMQIynCPGMnsCsVOkJ33fjcDa/Z/yzyhFjNKo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlxPFJk7hoNuAjC8N4mFHXpO0lvew4h7DwMeM9y
 u6wOqYNnCWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcTxSQAKCRCLPIo+Aiko
 1dM/CACdL8cSSa/oxFXhj0dyM08P+pNscinu1eikDS58R6FzEGaLhzywX+94TETxWC8dY+nvEqC
 DzJkXtAdSpf3CswHskdBjB1ly+bXdjmyRhbz9SeQQpd67ymszvw2QrAbSOhL8RXIGyxaZWgrYcs
 BVd4SImYKOPNh6Plwx53YOsX+nu3c2y8Y/SBV1tLSXsMtxanPnOVMHV1169pJRzIy8nqF2r88MZ
 7btPOba4qiUsKM/5g3Sz6PtInY/2JeWDc/TtatjYeRjTR/2vkEQcPrc2h0YGsALMCWUKSPu/61z
 bHN8MyVZQ84JJm6hIRRCvJ2JpnWUZSm+BNIk3jeDmXR7fkJK
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

The dpu_encoder_phys_ops::atomic_mode_set() callback is mostly
redundant. Implementations only set the IRQ indices there. Move
statically allocated IRQs to dpu_encoder_phys_*_init() and set
dynamically allocated IRQs in the irq_enable() callback.

The writeback backend of the dpu_encoder is the only user of the
dpu_encoder_phys_ops::atomic_check() callback. Move corresponding code
to the DPU's drm_writeback_connector implementation (dpu_writeback.c)
and drop corresponding callback code.

Changes since v3:
- Fixed the crash in dpu_wb_conn_atomic_check (Abhinav)

Changes since v2:
- Rebase on top of linux-next
- Also incorporate the dpu_encoder_phys::atomic_check series

Changes since v1:
- Split trace events into enable/disable pairs (Abhinav).

Dmitry Baryshkov (5):
  drm/msm/dpu: split irq_control into irq_enable and _disable
  drm/msm/dpu: split _dpu_encoder_resource_control_helper()
  drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set
  drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c
  drm/msm/dpu: drop dpu_encoder_phys_ops::atomic_check()

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 94 ++++++++++--------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 15 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 95 +++++++++----------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 59 ++++++------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 88 ++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     | 74 +++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 57 ++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  3 +-
 9 files changed, 270 insertions(+), 224 deletions(-)

--
2.39.2

---
Dmitry Baryshkov (5):
      drm/msm/dpu: split irq_control into irq_enable and _disable
      drm/msm/dpu: split _dpu_encoder_resource_control_helper()
      drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set
      drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c
      drm/msm/dpu: drop dpu_encoder_phys_ops::atomic_check()

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 94 ++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   | 15 +---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 95 +++++++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 59 ++++++--------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 88 ++++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          | 74 +++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      | 61 +++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h      |  3 +-
 9 files changed, 274 insertions(+), 224 deletions(-)
---
base-commit: b1d3a0e70c3881d2f8cf6692ccf7c2a4fb2d030d
change-id: 20240208-fd_remove_phys_ops_atomic_mode_set-ab706706b374

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

