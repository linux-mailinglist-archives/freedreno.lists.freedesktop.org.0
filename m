Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D053A3D687
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2025 11:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A4F10E91A;
	Thu, 20 Feb 2025 10:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CylNF4Ja";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8607610E917
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 10:26:29 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-54605bfcc72so2155153e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 02:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740047187; x=1740651987; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wJNAJ9S8ZhpIeOStYgLD52jkOeAB/llU9h9KOXd2yuE=;
 b=CylNF4Ja9yZiIUrJYy3FuP7xlE7DXPReX3L2N7byuMTP480IoNCmRC77Mh96HWVdVT
 w5jUhI6nj8BWy/3SSQq3pkdRK2TBqqI/qxevnlhQtbGXJQc3uVKQ/1mYTv3TP9ZK0Wcd
 ZdzsjLo0aBwCnlzXcFlQca/fK4ZHyAD96zLuVEX2uc8fZRoU/0Rue+CuQZAQWwwp4gUT
 fHKoaxr9WcnAlE37RCSynnSjhA+WlAEtwXEQq/cXZX89dhJKdTiLQT5B9wXi4ai98iXT
 eo33vyThVwSCh3jrn0yKRqEu2fBkCqREDkjVV2glSNNTvx9tE797FyW6Yj3rocmoBN2o
 ugmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740047187; x=1740651987;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wJNAJ9S8ZhpIeOStYgLD52jkOeAB/llU9h9KOXd2yuE=;
 b=uQBFSHj+e2exPDmgaHac89Qjy4hdKDQprB1tDhg0UlgQAmsdpIrsquNKQ4Nrc8241W
 h0WeLq4zFWUKIVOdHNxN8Xr6bLWYqUnfFULEx0YY4CrUssklMsNVhE4K6/ROnOy3yHkS
 oRoDizmsuqkOMjqS5up14tiXv2SH8jduusaof/851WOD6eyZ/Lu3DFLrbA5F5L0xnQVU
 +tMiNfHyRq8pbSezW24MjDLUPLwodADM7Faryt17oERArBg4SCvW1slNxO+wXgFincIt
 VApqlnvTw4eZIxWavF/48l2JkZ1QfuVVPuQnqN9uqLUwydMUEW4yiq1A+6x/oEqzauzi
 BdaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD47IFWbfySIXp70HYAdx+kod7XizawqVPbRccD4esA4aQi7ocSUnXEsrm4BMffHR7Z0Ow5iYAmvM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywv6faOsMoRCvtvk+PtjYlP+3VVwW648b96Xp/zan6iiXLDIsAd
 L/94pl1amWsPOLK328OFbDbkGnbZgYuyn6Ghg4bljnF34mz3WM8FPHdpmfeeaa2UPr64gqAIjr5
 v
X-Gm-Gg: ASbGncubhdBXd7Yg+dkmRPuJox7ZLcR8Z0FWNjv3/nrx1gyQ85ptD/kPkrrdUKqoH6h
 zhM9L6hlBxIg109JLqUJRnIa/+Bx8Z8XeowG8SFv0ztPxMGzZdA90/Www0OEp+YLOAUKB7oRK2t
 J6kFJ6BZZ4coNsHfI1drSNsAFuzxOPz3GsvgjPcCECqmi/foZjAHPGEane7X8yARjkS/5DHN/Yd
 YfsxX951t9pJyCAsjEoFTIKG0RbCQND7WjXAZOCjfPxdnzFpbspAIoQK2oOTR85uaYQl/fQbR9I
 i/ZNi8hYZjFuiYHlqF0SIps=
X-Google-Smtp-Source: AGHT+IF331MiMfKkOmnrNILcorNZpHZK9yLwRpgvYJ7WEviZijKR1lVKHGb4C+1ru/+g/xzWTNOJhg==
X-Received: by 2002:a05:6512:2399:b0:546:2109:1efb with SMTP id
 2adb3069b0e04-546e4662c70mr1044724e87.11.1740047187568; 
 Thu, 20 Feb 2025 02:26:27 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545e939224esm1588052e87.135.2025.02.20.02.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 02:26:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 12:26:20 +0200
Subject: [PATCH 3/7] drm/msm/dpu: pass master interface to CTL
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dpu-active-ctl-v1-3-71ca67a564f8@linaro.org>
References: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
In-Reply-To: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/O+unDh5T1VFusnWXWTP7rs8hDxFqzKuCi3hJ4pCKbA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntwNKBFIT3AwoFKTScXTNMjZQ2C302xc/Ih6ae
 /0vg1jl0m6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cDSgAKCRCLPIo+Aiko
 1S44B/wIvkjQwHjwie/PsatFKnwZx+EoYi3i/LW0hl9ylAvK2w6DmmfzL+Bmj4+LW93FtBaWvII
 tP8iTCLrVfaXjq+uWjGpkkQydL4uIwTggZex6YpzVf2VqUBrbJEFDrx8alY+FsZY7qA8WG5yn6p
 gWQo603hoUZhG/GxzpU9Yd5HC/ubu7x33LFa9EplSqI7Dm6UKWyUXeUaz7NDZC9hgu7pNRM2jJb
 Si+E5E2Gln050Ey0XAONMApWO8p+x2JtqMef+yI6aqeJfMhK5rjvaizXgvyGGVGKh7U1GtByGwc
 qp2uKF8QeV0QGDWzBjhDSFAet+8SMpKhy7tBdjtITtGsOYkJ
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

Active controls require setup of the master interface. Pass the selected
interface to CTL configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index e9bbccc44dad8b391cd51daf902307105b2598fc..d1e16da00529de35cf4e205077c4264bdb70de16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -59,6 +59,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 		return;
 
 	intf_cfg.intf = phys_enc->hw_intf->idx;
+	if (phys_enc->split_role == ENC_ROLE_MASTER)
+		intf_cfg.intf_master = phys_enc->hw_intf->idx;
 	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
 	intf_cfg.stream_sel = cmd_enc->stream_sel;
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index abd6600046cb3a91bf88ca240fd9b9c306b0ea2e..232055473ba55998b79dd2e8c752c129bbffbff4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -298,6 +298,8 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	if (phys_enc->hw_cdm)
 		intf_cfg.cdm = phys_enc->hw_cdm->idx;
 	intf_cfg.intf = phys_enc->hw_intf->idx;
+	if (phys_enc->split_role == ENC_ROLE_MASTER)
+		intf_cfg.intf_master = phys_enc->hw_intf->idx;
 	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_VID;
 	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);

-- 
2.39.5

