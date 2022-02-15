Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA43E4B6218
	for <lists+freedreno@lfdr.de>; Tue, 15 Feb 2022 05:31:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6982610E1B6;
	Tue, 15 Feb 2022 04:31:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F21110E193
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 04:31:43 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 t75-20020a4a3e4e000000b002e9c0821d78so21930372oot.4
 for <freedreno@lists.freedesktop.org>; Mon, 14 Feb 2022 20:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D7WsWCRqMLz25vENb3RcLmuP7khzK1rVK0lqIZnKd40=;
 b=qErQvLRHn4lNi32tmw38jEAFNYywB5rAnIRozMJp3Wu3QmiUz3kavqhSmwRx+OyGdY
 LtFC0T6uamzGnphHeZAlx2E1u/X08Qdv0rSQVmPBMCw/bxC7HPu1UmcuD1XhaM4JDvYX
 I4bDSc2FY1CS/fmpYAxzwSHegdZOpTn3+JHe4HYhGhAAJvYYWrMeR1jB2KswbOlvhXRY
 vcBCpFE2SKQZI0N3AJjoxA/7iO58Xne2M4Qub/qxrwYEplfa7J2L9DwvSjOrBF9h5Knq
 N7E5+9wOTrS8FWn7D59QuP6De+aGmzBjM7fKCSdus9AG6+5zH9nefOBQushQwXNqnQi9
 6HmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D7WsWCRqMLz25vENb3RcLmuP7khzK1rVK0lqIZnKd40=;
 b=WN1MyEApb5RyA5yxI5TA/YIEzpoNPGlA0MssfCitUcs7ndsoAGUlaNkpn0Nv42BMXN
 sM4Kk4XuZCN7jdqd5sHF7LXb1ppegvb91e9iPT2aBw8/3yeDk3iMVGtK1jAg7Z+DDHDq
 jrzDNZjYLxzGh3MDiRY6Nwv7ozL5mf4sYa16YfFt6DZOd4wnxdZCJRMlwq3Rnd4m3rml
 CxLQt7VbidJTVCG90IzthGK+3zCv8VSMaBdDVu94KvqbfH3pxlVzhIY3bztrq2Y+6ZxT
 Fv3cNcLUxSA/HjIhlxLqO7fCcc2j2URO5MKvkpj1hzS4wiY8ItnSVSg+vy+uVqcnDwvk
 G1fA==
X-Gm-Message-State: AOAM53272ZdLgfkPeb7AlYgIc6uyFBeRXOzNQTvn72OCwrMS2Ax8xpGX
 QR3ldadJGzgd8xT5qsS/Rl+qAg==
X-Google-Smtp-Source: ABdhPJxYZ98hSXj39qS4Lid82RoCU1bJQMN1rQR1NrXEQZ6QwcOrw3ie1V58t9SRMlck6xKqEZOWcw==
X-Received: by 2002:a05:6870:6296:: with SMTP id
 s22mr800654oan.338.1644899502683; 
 Mon, 14 Feb 2022 20:31:42 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id z4sm12926964otu.24.2022.02.14.20.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 20:31:42 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 14 Feb 2022 20:33:52 -0800
Message-Id: <20220215043353.1256754-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/2] drm/msm/dpu: Add INTF_5 interrupts
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

SC8180x has the eDP controller wired up to INTF_5, so add the interrupt
register block for this interface to the list.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index a77a5eaa78ad..dd2161e7bdb6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -23,6 +23,7 @@
 #define MDP_INTF_2_OFF			0x6B000
 #define MDP_INTF_3_OFF			0x6B800
 #define MDP_INTF_4_OFF			0x6C000
+#define MDP_INTF_5_OFF			0x6C800
 #define MDP_AD4_0_OFF			0x7C000
 #define MDP_AD4_1_OFF			0x7D000
 #define MDP_AD4_INTR_EN_OFF		0x41c
@@ -93,6 +94,11 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 		MDP_INTF_4_OFF+INTF_INTR_EN,
 		MDP_INTF_4_OFF+INTF_INTR_STATUS
 	},
+	{
+		MDP_INTF_5_OFF+INTF_INTR_CLEAR,
+		MDP_INTF_5_OFF+INTF_INTR_EN,
+		MDP_INTF_5_OFF+INTF_INTR_STATUS
+	},
 	{
 		MDP_AD4_0_OFF + MDP_AD4_INTR_CLEAR_OFF,
 		MDP_AD4_0_OFF + MDP_AD4_INTR_EN_OFF,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 1ab75cccd145..37379966d8ec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -22,6 +22,7 @@ enum dpu_hw_intr_reg {
 	MDP_INTF2_INTR,
 	MDP_INTF3_INTR,
 	MDP_INTF4_INTR,
+	MDP_INTF5_INTR,
 	MDP_AD4_0_INTR,
 	MDP_AD4_1_INTR,
 	MDP_INTF0_7xxx_INTR,
-- 
2.33.1

