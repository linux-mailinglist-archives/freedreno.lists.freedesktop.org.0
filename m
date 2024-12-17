Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FF89F4B07
	for <lists+freedreno@lfdr.de>; Tue, 17 Dec 2024 13:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB64D10E965;
	Tue, 17 Dec 2024 12:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FgTeD6tq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DCE10E959
 for <freedreno@lists.freedesktop.org>; Tue, 17 Dec 2024 12:35:45 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53e399e3310so6152044e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 17 Dec 2024 04:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734438944; x=1735043744; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EqFVcsq/1P38IrP8o1pPFwny5Xr5j1nP95SEUyFOxg4=;
 b=FgTeD6tqrVLIwNvWD9me4yWcfXAFp+2O2wQGzuCrH3qUWqVrS6kRiGx+wHChjjfbb6
 fwcD3zjd2rUMCCwWvn7Ko32vPR24VoLDuJQBm5LZWfGfpuHIu0HgFc2FLg9JTkIN01Np
 ydFJgoVlpGjGQHbhOa518hIUPzkCw97nmlYwQ6pMx/Ns9gNnxGB5TTQ/39JR6aQLWcPr
 aXeHndp9z3XfCI7TD0BCD7M9/hDGjPCWYFI867wRD44EJYOepzk/S3aej5CmKRuxUCwq
 wmD+q38gqGcGJn6cGPcRugLdgZnEJLuX1VV4MscZ6QJa4kBTksS7qQq0VaIzouOGPTBt
 pQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734438944; x=1735043744;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EqFVcsq/1P38IrP8o1pPFwny5Xr5j1nP95SEUyFOxg4=;
 b=u6qvXhrJFAqFzXdyvx4bindamWRsDDH3+YnjMWjl62qYl45FCfirII0UOcckz8ndvW
 pdsi1pFWAPMr6hngTMAFjwcIoYfT9kLoTadwEmhYx1sw2wo/JYcNnxapw4tf819Yg0Iy
 AX4o/tZJE9ljwZ5Jbyv5FcTTk/tJeTaTKluUJi3TQ6uy0D7ObdDXeD69IbgulNODeQ9B
 eQnLakX9pk/vUcmcFmdN7UooI9HHgPTAmzHu3W+mjFTE4B/xP2etC0s5/Co78CWTdpVR
 3bjtJdAQqhsqPIxheTfN04Ds31AWDQlHFm2VB/x7RAcHXU9fbURHXEE/DpaMLqE6YgRe
 kaPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXikg/DOugnynifxnDDstGZIPNRg7Vfd6T+dJw32DH0Kt2i4BwbagMUE/p9/OaKmQDI35aYSXZ0hMM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWzHKC+84LC9uE2wAEaWLN0AkIpPRMX5J+Fz1y9fg/xZ0W2wbw
 U18mzGuru/hREBVGCNYkn3sEEfkCvw5Pe+xEJIUbsmYjnpLNHUFoK/9iRvTYjsQ=
X-Gm-Gg: ASbGncscAyT/JqGEqY14EjNPiXyd0u96J8AgA+VwzN4aCHxISNgg6m8WAD5H/9tecl3
 ycz+UrQq6XLFeDYY/UTt3oaVsjEe8M93xMa83RBfP+CpRCYMuI/br5OlGZYOf7eDNb8RG1Rhb0r
 4zrU4aBYPFCJ+58bawm6KcAH/d1cvsiex9xwW6XT72agj1Ws9Orxgf0YeYXppUkAddaT7rUiKXm
 j6+WOdFjvhuiNCgQkx+KRFSpcps/TVgX7tOC9UKvNaA7C6RDyVS2GCEOvTmYZ2n
X-Google-Smtp-Source: AGHT+IGwO6ExXNEcA0R2FoxKWS83ev2naGxk2+ZyD+jgIUG5jEqO7Ox1e2tGWV3q6r+L5CxjhdwD1g==
X-Received: by 2002:a05:6512:158e:b0:540:3566:5397 with SMTP id
 2adb3069b0e04-5409054f33fmr4655941e87.22.1734438943729; 
 Tue, 17 Dec 2024 04:35:43 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c164b1sm1137065e87.223.2024.12.17.04.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 04:35:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Dec 2024 14:35:40 +0200
Subject: [PATCH v2] drm/msm/dpu: correct LM pairing for SM6150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-dpu-fix-sm6150-v2-1-9acc8f5addf3@linaro.org>
X-B4-Tracking: v=1; b=H4sIABtwYWcC/3WMQQ6CMBBFr0Jm7ZhO1VZceQ/DgtAZmEQpaZVoC
 He3snf5/s97C2ROyhku1QKJZ80axwJ2V0E3tGPPqKEwWGOPZMlhmF4o+sb8cHQySF6MP9RyFjZ
 QpClxebfgrSk8aH7G9Nn6M/3Wv6mZkLCW4Du2Is64613HNsV9TD0067p+AYimqTetAAAA
X-Change-ID: 20241216-dpu-fix-sm6150-17f0739f8fe0
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Li Liu <quic_lliu6@quicinc.com>, Fange Zhang <quic_fangez@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1582;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=P72G89o/YCMWCzZLIM5D+qksevbQkKdaRlhBYiPrFaw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnYXAdGjNdaXabT0YqQhED4A+ccplPzuyiib3mB
 0PMvSkpahGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2FwHQAKCRCLPIo+Aiko
 1ePjCACAduQzUrmv2UvoKsCLEFcnmXD4PjXKpskER7W/cYTmm1XdZPXFmTk5RY0EqzMl5GaIMEW
 VRMx14YUs0iTTFUk9ihEWyZ+bg2+N9wownr+WOw57pwuHLR0/0BWQJ/9rK5oDGsIn0Vvj6ZnpGn
 X+ufNaMY5tVD6tGqy7oX5g7wD3VOQ6Z28aIYIW6bNu3dtC1VCIEs5mmqBsx2TJ2kfF/XHekHG94
 /CzLIy973QNfb2sk7/f4rwsq5LuyOOmMuTBrzu5L4VoPRVYj1CJcwCxjlyHBASAZviWPlTPBkQP
 b+cqywM+uIjO4zlF1MYJMPvdy47FqhyjBc7UFU7g0/8qTOaF
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

The SM6150 platform doesn't have 3DMux (MERGE_3D) block, so it can not
split the screen between two LMs. Drop lm_pair fields as they don't make
sense for this platform.

Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Fixes: cb2f9144693b ("drm/msm/dpu: Add SM6150 support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Dropped lm_pair field as recommended by Abhinav.
- Link to v1: https://lore.kernel.org/r/20241216-dpu-fix-sm6150-v1-1-9fd7ce2ff606@linaro.org
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index 621a2140f675fa28b3a7fcd8573e59b306cd6832..d761ed705bac30d9ffef3c0c9140e5e8a5e930ad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -116,14 +116,12 @@ static const struct dpu_lm_cfg sm6150_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
-		.lm_pair = LM_1,
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
 		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_1,
-		.lm_pair = LM_0,
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,

---
base-commit: a3d570eace66b4016f2692a6f1045742ee70c6b1
change-id: 20241216-dpu-fix-sm6150-17f0739f8fe0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

