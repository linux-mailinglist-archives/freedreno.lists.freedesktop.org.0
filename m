Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ACB6D6225
	for <lists+freedreno@lfdr.de>; Tue,  4 Apr 2023 15:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4CB10E6A3;
	Tue,  4 Apr 2023 13:09:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B5E10E6A4
 for <freedreno@lists.freedesktop.org>; Tue,  4 Apr 2023 13:09:20 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id o20so30834208ljp.3
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 06:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f+EzYqiIalSQD23Js2NYf/t5OTCj8dNqn/Jckbi0SmI=;
 b=r3Ng/IWuFKwnbrD6P9osaPJFmNRsRrR7crNFdWLyiVlb4ZzC3pfzMup2axPNqudSfF
 kk1Pna3ENXd2DE6C25I7nUwvaLDwKsaDPVt12NaAbKXycAed6PFoqauvGsgxOOf/ZMoa
 GDvFx9dleugwyWX7pv6fi0hgSe3VSi1z7n6Eevy17j+JSEAD/rvHB2Hx7JCjH+KB3xK6
 cJK+ZdvXHIO5NVqO2j91vdW0zI5lv/LeFEHbGYACLpcQTs+Bc3nJs8RkHZR9T6VuWIGC
 NFC8qAzK/rSyBSZwn5N3C+2eITJRwTFcL7a9IzYri0u1+oCxArOeXqLnuL2EPzQe0T3F
 Xr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f+EzYqiIalSQD23Js2NYf/t5OTCj8dNqn/Jckbi0SmI=;
 b=pb3hiJBSsJ3nw5CUHV3zojJuNPAL58YDct8ARR4JuiyXagMMoN7fE+S2ld5NR03dKZ
 tiVAL5mPyNIG5O+Y3FGP+ZKf/pV6FwrOk4VuF5ZzIevb3yrSDyVb+dnCpQAYa0LzVuWE
 osPMvNO3Xp+d/af3jIVRNxYPJbUPVWTHXPf5/yPLwHp50M7Q31DvxW6BYDhyK6huAIXR
 AH6rjufdcYDysi1lXEJxc7b7J8LlPBlEeSIPlpBj56MVUaIPphZXAOJcPWnFRHjTA56z
 KWDm/ZkygI91msRcodFYpxyGrz7XqBvO31THE/sky6aDBS0Ku7OAOzAVtOg1c5Wux+lb
 Ac/Q==
X-Gm-Message-State: AAQBX9fnys72eO2B2txPFpMV0phRqM4kv88jnwb7QVu1dxv0HKIElg6o
 AfDZl5v8YJ1DtOVd1tmUiw3X9A==
X-Google-Smtp-Source: AKy350aypGDYtegI39U/t7bdAJVpy4pZFqNz1N57iUaOkN5fnKoSe2vZ4TNWwNPzg4IlbHwNMSFPQg==
X-Received: by 2002:a2e:8455:0:b0:298:a7c3:c26a with SMTP id
 u21-20020a2e8455000000b00298a7c3c26amr770476ljh.25.1680613760409; 
 Tue, 04 Apr 2023 06:09:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:09:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue,  4 Apr 2023 16:06:06 +0300
Message-Id: <20230404130622.509628-27-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 26/42] drm/msm/dpu: expand sc7180 catalog
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Duplicate sm8250 catalog entries to sc7180 to remove dependencies
between DPU instances.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 2326be2900ea..433f7b259f7b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -89,6 +89,11 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
 	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
 };
 
+static const struct dpu_wb_cfg sc7180_wb[] = {
+	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
+			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
+};
+
 static const struct dpu_perf_cfg sc7180_perf_data = {
 	.max_bw_low = 6800000,
 	.max_bw_high = 6800000,
@@ -134,8 +139,8 @@ static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
 	.pingpong = sc7180_pp,
 	.intf_count = ARRAY_SIZE(sc7180_intf),
 	.intf = sc7180_intf,
-	.wb_count = ARRAY_SIZE(sm8250_wb),
-	.wb = sm8250_wb,
+	.wb_count = ARRAY_SIZE(sc7180_wb),
+	.wb = sc7180_wb,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.reg_dma_count = 1,
-- 
2.39.2

