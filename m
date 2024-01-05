Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD58D825D3A
	for <lists+freedreno@lfdr.de>; Sat,  6 Jan 2024 00:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CBD10E6C8;
	Fri,  5 Jan 2024 23:50:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C15910E6C8
 for <freedreno@lists.freedesktop.org>; Fri,  5 Jan 2024 23:50:14 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ccbf8cbf3aso666581fa.3
 for <freedreno@lists.freedesktop.org>; Fri, 05 Jan 2024 15:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704498613; x=1705103413; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zgIr5KjeQ801ktUcvEq9tOSFsZbUarwYEDM+BV8WLFA=;
 b=c6L4pEluiiIFVKFxhp2nMsKjKtq24qVzS84BJDJwhw5ihAruD+eQUeIi/j8bA6YGiE
 iiupiUbF9by8AraAmqNVu9XAqo2t0PvvkgURGSlcEo6AO3yb2c/lAAtUaMV7/yCWy7Bj
 j61R7yDkkRBowUfaZHJE1Lx3QQF7+NqGiVtYQwVU32CNwFMOtw2d3CWzOotC/1aJ4HiI
 2BHypvl/ux10G6TLnAU8+OZLIDm4WdTa8Uadc6cdJ3despFX3+nVA1dqnPVCQfEM+bqE
 FMLi5s3995bvP+doSOXaUZF1SfOjnKyE6um4oWiY9Nw6Qnw6opgSdBg3UmEfN/ZF71Yq
 DLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704498613; x=1705103413;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zgIr5KjeQ801ktUcvEq9tOSFsZbUarwYEDM+BV8WLFA=;
 b=UgxLO988SoOlMr8ikbHfvrbm5owjsdbWH0tqmdLMtDHKOvsQladT42s8zHIkf1IM6i
 PE0D3BwoUS6FODb/Iq8bEi7EzbXoVUEJOyw+wq35RvCO9OfU6cs+5xg782JzDCDeQTjG
 UoI3c+idWu2MRU5Ru8ELEdxJGGGATnIaRaddBY21h58/Yumoc0YBqWyZg5OgMQBpvndc
 k7qE3QBgAs+brxZXp8IAi9YVrL1WN8QRlIPhBCVUFSVhkjvrHJog2Sk5j+qJNbx2p/iR
 cbPbO4dCBF8cbmo1uNN5cz0sv+NRNsB1dc/MxcZ6w9p5yNwpEesi4IdvBby5beJB+fd+
 uTIA==
X-Gm-Message-State: AOJu0YzVZbE6aab6wCvPLS/LPSGv3I9Hf3Kse2wck56gBXOZpc2oi+oa
 Xg0nDqKd43YLAgAVsIrnMfCl47lkRwMccg==
X-Google-Smtp-Source: AGHT+IEeBbWCgqwqpQYOR/iZ1DVjP4wiVNLe6VxZxGScfvx35vnY4HypTMhHt3kImH3vRzo4e9Vr8g==
X-Received: by 2002:a2e:9ed4:0:b0:2cc:675a:10ee with SMTP id
 h20-20020a2e9ed4000000b002cc675a10eemr50853ljk.78.1704498612830; 
 Fri, 05 Jan 2024 15:50:12 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 x26-20020a2ea99a000000b002cceac0fdacsm465056ljq.126.2024.01.05.15.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 15:50:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 06 Jan 2024 01:50:11 +0200
Subject: [PATCH] drm/msm/dpu: make "vblank timeout" more useful
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240106-fd-dpu-debug-timeout-v1-1-6d9762884641@linaro.org>
X-B4-Tracking: v=1; b=H4sIALKVmGUC/x3MSQqAMAxA0atI1gZSlTpcRVyoTWsWDrRWBPHuF
 pdv8f8Dgb1wgC57wPMlQfYtQeUZzMu4OUYxyVBQUZEijdagOSIanqLDU1be44ncqtrSNDekS0j
 p4dnK/W/74X0/OpMcKGYAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1232;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=YlE6Y0Xns3P31n5Refq7dS9qQ/5BgtlDWj7ZX0gAmHE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlmJW0SyaFLLT16qHzBkNy9w9VfQQTtHjumXc8G
 ehTggFWw26JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZiVtAAKCRCLPIo+Aiko
 1Y/XCACauqkupaBDpfAh57h+imFyIUuQC+PVqXl/Xj6YmYMMfhgQSaWUbh+a7qObFJKzI/rc+Sm
 Tzqf9gSWXcgGZCbsHKj9K0f0eapMiGVOWCzYncRwOrSvDfZJ34Q5j42eRkpsFdl+iM0uFbOV9Mq
 6e2RRnhEhHBxMgge7rkFNXZhjhAjI4PL/wVtAB/3M82FFy125DUo0nmUb3RNfomh+UXLJCPS377
 ahwF4ewfR+2orJ0zHbYWIaxd+5d7dqF2sD4fbUdHMmq6P5z0BqGg8Cw4/ptyTstV3Zx9lMoPPCm
 mAEvZOMyhdjwZwssqGYGHpggNu8Nnn04tznaNUy+aAcQkWCp
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

We have several reports of vblank timeout messages. However after some
debugging it was found that there might be different causes to that.
Include the actual CTL_FLUSH value into the timeout message. This allows
us to identify the DPU block that gets stuck.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index d0f56c5c4cce..fb34067ab6af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -489,7 +489,7 @@ static int dpu_encoder_phys_vid_wait_for_commit_done(
 		(hw_ctl->ops.get_flush_register(hw_ctl) == 0),
 		msecs_to_jiffies(50));
 	if (ret <= 0) {
-		DPU_ERROR("vblank timeout\n");
+		DPU_ERROR("vblank timeout: %x\n", hw_ctl->ops.get_flush_register(hw_ctl));
 		return -ETIMEDOUT;
 	}
 

---
base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
change-id: 20240106-fd-dpu-debug-timeout-e917f0bc8063

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

