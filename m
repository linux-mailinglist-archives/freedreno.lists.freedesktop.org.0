Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648219FA3DA
	for <lists+freedreno@lfdr.de>; Sun, 22 Dec 2024 06:00:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C78310E0FF;
	Sun, 22 Dec 2024 05:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KgUkBXAT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A8C10E1FD
 for <freedreno@lists.freedesktop.org>; Sun, 22 Dec 2024 05:00:48 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-303489e8775so33709841fa.3
 for <freedreno@lists.freedesktop.org>; Sat, 21 Dec 2024 21:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734843647; x=1735448447; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7ynmJbSQJ/vTvam/arHMNtuCjd4OwDdBr2+aikpRGxU=;
 b=KgUkBXAToRhr5x6totEkXm9ry+pvNrUjiHPuDGp9YzivKEigD/z6ioazjIdTJ5kvSg
 kyYagmr+7hzA9NZwrJ1uIP6i6zzFTnrqud+EShtaYUbQukXLIWJdXfBvvB6c4rqAim0n
 dDQkO5a4OYH6op0Iw6lxHTXSEwJhy2HMC9IMyfLFDtxNcYAmY9N1LiKx2RinRVCYk37e
 c3wq9GxVtDI78LMKKIqjpVNjtQdOKF+LqjNfgm1MbCGG3i+w8ahIKr3MPcZd47dI0FGO
 XPC5REVUhXT49ugYNBlSHaeZLN3frPr1nbuNqQwZOWJCDMdGA/vcSYmpbHvq+sNoMRfu
 m2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734843647; x=1735448447;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ynmJbSQJ/vTvam/arHMNtuCjd4OwDdBr2+aikpRGxU=;
 b=VHijBQaUJ3fJ2f/Qho8vlzQxegT3Zlu/7b4wyMe6/+UcoT4jDgdw2Z9F8Gq6UWRROb
 RXcGTsxmWceIitTM8inBIF74w9c2kggxe9Ps14r7W7mAcNm7TC/o811wD8pWPEg8MwWP
 7jBoXsabm1dz0tnfgkKsy1Du5DPmzdJG6biI0Y3uZ/w21GOcUjfS97cCo4eQpsiWUC5C
 W6nE5ZYoF1ZcpW+nh/8kjbbd+DpBS17HTgGqoetOblbAzaoNG+5/WZqggNcC0YbuNPB3
 15s02XjMZmoiAUlKvtNfS20SzYPOam56J6IiJSpOaWNUv3etbHPeOannJLzLjjihIEcd
 5U3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwkltbLLiBZNokazad2js7MKRf/UOTrGMge4PQ2fb/PZZniaqIe8A4BWgObXfm+DKNuJ4uGcZThF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yylk2KPqtnKnH6Fh/mZyC8r2DNZdleT66VDbdNlOTWz83t/Q7TY
 K8DO8LDr0YsiUuchlbCJtDNNkc8npqGr5h4q6WV+l4rSp2bz1zNnUOqKCg9Xe5Y=
X-Gm-Gg: ASbGncvYEvcCW2ZTu4a3Vb0JmM264w4ad4/lUIW4k08RFC/GoARGb0k79IfnIKU6OXD
 WYoHUJiYZhf9xeHYvHyWodOtfqpohQPdrtV7FKkvbGXv4ybNTuLbD6hSyWPHz8jxLh/NBs+853B
 bS/V0mk9RIma1ka55dEVge9/kaa0+i8gCE03Rk8IgzCHedW3XEwGweDANf29zCKQ5VlxIPekF8s
 uBobVYoQt1TS8meUk8YUMuWOH2O+sjzw5q+XkWBZerBuE9IFPUQDilgPPxOE88R
X-Google-Smtp-Source: AGHT+IGEtIN1HRZCkOhk1Tp0HXuUe5zoi5sLX29TjPa/TQ+C5QNKxvwhm4lSJfabOKQMJlXDnpqq4Q==
X-Received: by 2002:a05:6512:1110:b0:540:75d3:95c0 with SMTP id
 2adb3069b0e04-5422956b7cfmr2458832e87.47.1734843646780; 
 Sat, 21 Dec 2024 21:00:46 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832c05sm887145e87.276.2024.12.21.21.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2024 21:00:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/6] drm: enforce rules for drm_atomic_helper_check_modeset()
Date: Sun, 22 Dec 2024 07:00:40 +0200
Message-Id: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPicZ2cC/x3MTQ5AQAxA4atI15qYRvxdRSzQogtGOiJE3N3E8
 lu890AQUwnQJA+YnBrUbxEuTWBc+m0WVI4Gyih3RIRsK7LacePqWYIcWFVZWQ9MZS8FxG43mfT
 6n233vh8nIYnsYwAAAA==
X-Change-ID: 20241222-drm-dirty-modeset-88079bd27ae6
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1969;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=unP1mi0lDmVyY/G4o1Fv207l8KYkoozAQlq0PR4KOl0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZ5z7EyHx7YlQHa66O5+YOr64ki12FqQYJ18so
 weZKkJwspqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2ec+wAKCRCLPIo+Aiko
 1fsJB/wNUD18E43T1sVut1m8i5ugdFUtQ+pRvb0bmm4Vh+jqrEMoq1xbprDEFZ1QC9rfNAq8uuX
 1T90Ldfx51Ojq9nTw0MgdFMAjyJqKkJFSxn/Ny2MbAU24M+ypehqMXd1kBG2TZ/UEotxILVmi7p
 KIUPGwlQ8CgevHybIzAVCyfLsvVhzhhyUAxzQ+kUS2/CS01UeZB2dYpXkrC7uZDuq5OHqZIJPbD
 JpYFSKIeIrFHNL4HFQm+Ul5+jrtRvgTJE2PKxRKaDtxoSM0ADcXean1cp8h5QHU2jC59bYCOsXN
 PqgJlueC/k2KRVNZlCenU6kljQuBN/wdHtTuApU+n++uxAst
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

As pointed out by Simona, the drm_atomic_helper_check_modeset() and
drm_atomic_helper_check() require the former function is rerun if the
driver's callbacks modify crtc_state->mode_changed. MSM is one of the
drivers which failed to follow this requirement.

As suggested by Simona, implement generic code to verify that the
drivers abide to those requirement and rework MSM driver to follow that
restrictions.

There are no dependencies between core and MSM parts, so they can go
separately via corresponding trees.

Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
Link: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (6):
      drm/atomic-helper: document drm_atomic_helper_check() restrictions
      drm/atomic: prepare to check that drivers follow restrictions for needs_modeset
      drm/msm/dpu: don't use active in atomic_check()
      drm/msm/dpu: move needs_cdm setting to dpu_encoder_get_topology()
      drm/msm/dpu: simplify dpu_encoder_get_topology() interface
      drm/msm/dpu: don't set crtc_state->mode_changed from atomic_check()

 drivers/gpu/drm/drm_atomic.c                |  3 +
 drivers/gpu/drm/drm_atomic_helper.c         | 86 ++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 82 +++++++++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 +++++++++
 drivers/gpu/drm/msm/msm_atomic.c            | 13 ++++-
 drivers/gpu/drm/msm/msm_kms.h               |  7 +++
 include/drm/drm_atomic.h                    | 10 ++++
 9 files changed, 192 insertions(+), 43 deletions(-)
---
base-commit: b72747fdde637ebf52e181671bf6f41cd773b3e1
change-id: 20241222-drm-dirty-modeset-88079bd27ae6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

