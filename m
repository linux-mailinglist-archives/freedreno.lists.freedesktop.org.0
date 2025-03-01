Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48374A4A9ED
	for <lists+freedreno@lfdr.de>; Sat,  1 Mar 2025 10:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171B110E07A;
	Sat,  1 Mar 2025 09:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pBnxe+wx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169A310E07A
 for <freedreno@lists.freedesktop.org>; Sat,  1 Mar 2025 09:25:01 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-548878c6a5aso3174689e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 01 Mar 2025 01:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740821099; x=1741425899; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ypB915vJqmRaH63cKoFbSo3grjRFws/DTwU9I0cazvs=;
 b=pBnxe+wxv6ILj09Kg1bEifsHkdke3NfU7FciiXXKne3vrgm6gPpuLKYInSX9+N08eW
 cIrxFYjZ8h6y83yXi99Wj+CbphLmUN/7Jd9OVgigRkvGoVUMWd1jZFeuJE/3oQIsGVVt
 /k8g1fDOCaeKH/FQbegVfkg944sXLsdsOBsIg7Y6uCd921EMjzZ+Ws+2mqk/nqum/by/
 ZJe/1zmoCqfDxwZ2623vBOI+kqQaS5FIrh10fFgiEkrsh2DHFF6t94MQcRYjI0cqCN0X
 VB25+DWGpc70sC+q18eTO2esBH08ezhcjOTToA+o077KSATdXhw/kPcquJqD+IigRGOp
 9Y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740821099; x=1741425899;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ypB915vJqmRaH63cKoFbSo3grjRFws/DTwU9I0cazvs=;
 b=EyGqw6dOw/p45/zVtGOezdzU4J5NhXstcavIfFaELBQS42dBKm5aUXCSDvCHdvlAic
 jYqis1cRjAT/iE46qCQstT/A3cA893FdSp7eQeax3redvDENdT27uGNj7cMmkarC5fSt
 /w8B29L8kQE2FvhShDybWgrsDDiEQ6Xu2btSNlxGZ7QrH+989zkOQkjrbVgtXKKPjQo5
 1Hv/ZmvOyQenjprjm/MMtPN+b/Ht5DNCwty+WhbrwOusdBSVqTGAAkA0XBl5VhTdpIfK
 T5VmkMjdMPWleCG2EQYpfPnV5qn+UxIjTbnhh0LgWCHDSLCwWlFVp/8bgnaEA1L4Vi+B
 YXTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP4oFTfuB/oM1aoP/SqG92g8dpS9v4q2GQjbdmQ99HraJz1VbVoiYFLq526lcw4HJ7RrQomMoJMcg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyX4sMyRAKt8+Y5QeOmh6uHTexRDa80RZKw7l+JV/+AtEfyNwCJ
 7oRcsR/AJh2hZzfLOybAV4aPSrxqWp1uhgFmdQXBt5FCm9fPZsJLSlKsZKmFDoE=
X-Gm-Gg: ASbGncv3/FX3F19KqLz0Xz2xwjUzVBHmHA4H41Wdsgfp8Lv53PogobQLAh6LosULsO/
 jdPv2+ZaAb9uklZkQEpCI4rEfBXPJY7SlLRhG/GO/Dn/fozZpzM5fG6Q3m9dDrXpadKWTG/oIu6
 ZIQ4Duirj/rYqKDujdnBfMJu5zZ/rs65uiKBkkStBR4tQmHGhHnCAjB+2vpPCPG6PVp0RkcwrLu
 IKalLuMccdw8sNZ8H8ZG75t+ax/vbsBGUV547H1ge7bEI81bhUz5QhFm0vVut4NlMmEF5zuLqRx
 Bg3MS31rzF9d4KclfGiet2cBBwUhCkChgygGViMn73mNOLUidCJ1
X-Google-Smtp-Source: AGHT+IG/1AayJVp+qm5RXrxUhbjPYPpH8uNl8/6SF/4ZZfwJzrYVs2UolooqjFryoLYeJuDT1/fK0g==
X-Received: by 2002:a05:6512:3a90:b0:545:441:52d4 with SMTP id
 2adb3069b0e04-5494c33089emr2269458e87.26.1740821099342; 
 Sat, 01 Mar 2025 01:24:59 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494417432csm738406e87.52.2025.03.01.01.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 01:24:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/5] drm/msm/dpu: disable DSC on some of old DPU models
Date: Sat, 01 Mar 2025 11:24:53 +0200
Message-Id: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGXSwmcC/3WNzQqDMBCEX0X23C3JolJ76nsUD/lTFySRjZUW8
 d2beu/xm2G+2SEH4ZDhXu0gYePMKRagSwVuMnEMyL4wkKJGEd3QLy8c+I3OrGZOI7Z1560eHHW
 mhbJaJJT6ND77whPnNcnnPNj0L/3v2jQqtKrxRIN1ZOvHzNFIuiYZoT+O4wurkalurwAAAA==
X-Change-ID: 20250228-dpu-fix-catalog-649db1fc29a6
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1769;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GqOq9rkDu6v4PggutY2CL3RwcYuHkk2cBFFkYzV4MYY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwtJn2qMf0VS7G3JEN+uWvtBRgvvIOldnrQcYS
 k7crSZsssOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8LSZwAKCRCLPIo+Aiko
 1e0HB/sHdFdwVnCgI6jz4PMEGkIyskrbhGqY3Hqwu8/2I5ecn5HgHXqKgNxEmhAwseUs8bRMoym
 4fn8fkRTrsmTSihzFm8rom7vUKX8po4+Dh13YIGBfhBugH0Uvsb42HOAOq6bCOJ6YVJnl5u8SkM
 Yv9QaHmoQKWeLG+PsJck7cp5GRXF41+7G6rN02fpQ0QaP0lv/NjfbtSEUV3OEHUPv3HYSgVTqjz
 8M3RhzQQACJhts2u77bNT9Zm2N915NZFfph69mY6YiOYdtljBt5LCoftEdUaYtxZxW5+AlHG3eA
 1NwcGGLIHnLk/CndkDteu7KMYCaQ6G7oG3gfKRv8Ic01evLE
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

During one of the chats Abhinav pointed out that in the 1.x generation
most of the DPU/MDP5 instances didn't have DSC support. Also SDM630
didn't provide DSC support. Disable DSC on those platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Fixed commit messages (Konrad)
- Dropped TE2 bits and pieces, they are unused in the upstream driver.
- Link to v1: https://lore.kernel.org/r/20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org

---
Dmitry Baryshkov (5):
      drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8937
      drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8917
      drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8953
      drm/msm/dpu: drop TE2 definitions
      drm/msm/dpu: remove DSC feature bit for PINGPONG on SDM630

 .../gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h    |  2 --
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h    |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h  |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 17 -----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          |  6 +-----
 10 files changed, 20 insertions(+), 46 deletions(-)
---
base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
change-id: 20250228-dpu-fix-catalog-649db1fc29a6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

