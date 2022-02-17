Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 079A24B9559
	for <lists+freedreno@lfdr.de>; Thu, 17 Feb 2022 02:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A92710E6DD;
	Thu, 17 Feb 2022 01:19:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664CE10E6DF
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 01:19:48 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id x193so4406364oix.0
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 17:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HRx8T4zgpY2IuuhghOcb/JTF1D7VMe7Nw9viYbE3X18=;
 b=v2UobaC4GMeY+ccR+REFy6YKl7AYAKAaCuO8ahX4AxZXnRH3rvcAM4gwUtIXRWonpa
 8GKUVv0gBBq5EFnnNr9Dcd4yPeSKQqpXdrY9WmRfYZB1LTiqL4pnY3w6jT9o1usOqVHz
 5SPJ4AW7Sfc6rTjTJxn3BBdSeEzAvW3/YxmNqdCoGhXv1fJKaOlfAO9eWT+I2NHTC2p9
 DQxYmE3cQc/n56Xfe4bWbXK65XPOuCxTBzoEKbT8dtQIqU52EB/JEA5PJjtIq7UQld6X
 CPfeZylGmD4tDh5FU/IriqB/cGNDpkN9UztOEyZKDS3tQWXsWpLz7hYYYtJjFrTMqs/n
 Egfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HRx8T4zgpY2IuuhghOcb/JTF1D7VMe7Nw9viYbE3X18=;
 b=o6g7ap5A5i/hfiJRIACNMAikFMdVmCx7J8CVFv5ROxW8bxckOSrREr7sX+N3r9oEHN
 Tv/f55sZoiOoepCx6U43KlBDuCoU2ASIqPg6iMW9hc7CXoaazWuq+pmizRyokczEqyc6
 Kmw4jphv+QKhjEBkLOMQHVJecEpzEkWJ10H4/wGVXCy55ZC4ZY1/TGXGxdVGbuBiT7PG
 JO2WqT5rboWo0Q+u+VUw+41KcyZsTZsc/sPyVJsks7KeB3pQF9yAPD5zNoZcIMJ2Ojm9
 35WKOucyyWRUJHDVg6UpZ8jFwj8uStvHSkYQ6rT13+ljUgVMOkDi5MEwmH8PDG2cfBIh
 Ms8w==
X-Gm-Message-State: AOAM531L9eryRULU0euJRNURdqorsck0rif8hAJJ/xgAz6m4gWskaVqq
 7M1ZQU4OudrPtrz8TQkmTHh4Pg==
X-Google-Smtp-Source: ABdhPJzFKV8F1Qszo2LP+Rfa4K3QqRtxV7RkYbAa3hv/J2IVrKtru8oTym09tqhA0ntDsTa9UOHl0g==
X-Received: by 2002:a54:438f:0:b0:2d4:4348:d58b with SMTP id
 u15-20020a54438f000000b002d44348d58bmr187510oiv.102.1645060787279; 
 Wed, 16 Feb 2022 17:19:47 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id h27sm15665329ote.57.2022.02.16.17.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 17:19:46 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 16 Feb 2022 17:21:54 -0800
Message-Id: <20220217012155.1717511-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 1/2] drm/msm/dpu: Add INTF_5 interrupts
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

Changes since v2:
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

