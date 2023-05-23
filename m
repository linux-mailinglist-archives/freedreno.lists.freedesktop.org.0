Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCB070DC1A
	for <lists+freedreno@lfdr.de>; Tue, 23 May 2023 14:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C2510E433;
	Tue, 23 May 2023 12:15:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FB910E42D
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 12:15:01 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f3edc05aa5so3038113e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 05:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684844097; x=1687436097;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=enXMayXRzHH3oByKOYNfSsDWlN3ph9R0cvur3PtJ7ms=;
 b=GgOuR/mBHkSar7s0Nq/XxGnf14MrxbwcDNTCNamb0kCxl6mw7on0TwmCUUcd5yvDEZ
 xkdovIonZ6mLa8iqAurAuOdW3v6I00EoT0PP0HuqTGCJ1oEMsEwzZxnhUv5gX0gsoZoq
 nN5cUlV5NpjXrVg3HaTQthzV9XPF/h+gGjspwMbRcW03qPEajJg1BygcKK+Q9VdYVgPI
 k7k4wRunYgMWFD+h0OjzE1pRerv3SSAGrHur2dbQzGlD2k5+MGI/RUuRDiEKse1YEn0g
 pRoMum/gT2lrfjOuAs3i+ZRguXVD2TzbLbLv6bVvuKi/sOvsE3zqQI6xXGr5msLsuSbF
 cXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684844097; x=1687436097;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=enXMayXRzHH3oByKOYNfSsDWlN3ph9R0cvur3PtJ7ms=;
 b=eDtdQC61XsEq6GPayleci3M/FEfq1kSkKpGLhBScJjEuzcyl9T5odj7NktrzY1CoE1
 8Kpn7UCpkCF1294IB8hgtTSSwOZPhRIJ7zS+ntx+JkMV2DEgkdfsNIM3yk62/ZhfA2bD
 dQOS56g4B3x0dCX3EkG44XObjdyIlp3ToF8fUSsm6LNV6A8qyYwYo9gHklVOw86k3Nou
 BF32OIcUrzzb6H9wlA/xiKw1SUifXfvH8ktiTBK5EC1Cq6M36ZdAgp5/Vm0Qvvbqxtd8
 KzmFycoPEh8WzjlT6MPLn6q4K9B3yB6OQFl7QCMF+kMwKzntAvLLAhTjZLskL3tl2/8u
 VF2w==
X-Gm-Message-State: AC+VfDyNtvtjza9GKssnI/LxXucj28wNYM9SqrvlRStouMSGMVPpkaMS
 FEH80r4S4glRjrza67JVAaHYvA==
X-Google-Smtp-Source: ACHHUZ4vMMeapHmDZhf0XR9q/6ZhAQ2GX3q8enToq80E9pn+2TNU+/BW9JtkjjWBEAiAkysxIU6lHQ==
X-Received: by 2002:ac2:5925:0:b0:4f3:7a01:f0d6 with SMTP id
 v5-20020ac25925000000b004f37a01f0d6mr3942481lfi.67.1684844097087; 
 Tue, 23 May 2023 05:14:57 -0700 (PDT)
Received: from eriador.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 c26-20020ac2531a000000b004f160559d4asm1319616lfh.183.2023.05.23.05.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 05:14:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Date: Tue, 23 May 2023 15:14:40 +0300
Message-Id: <20230523121454.3460634-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
References: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 01/15] phy: Add HDMI configuration options
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
Cc: freedreno@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sandor Yu <Sandor.yu@nxp.com>, linux-phy@lists.infradead.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Sandor Yu <Sandor.yu@nxp.com>

Allow HDMI PHYs to be configured through the generic
functions through a custom structure added to the generic union.

The parameters added here are based on HDMI PHY
implementation practices.  The current set of parameters
should cover the potential users.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/linux/phy/phy-hdmi.h | 33 +++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h      |  7 ++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/phy/phy-hdmi.h

diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
new file mode 100644
index 000000000000..73a32eb535b0
--- /dev/null
+++ b/include/linux/phy/phy-hdmi.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2022 NXP
+ */
+
+#ifndef __PHY_HDMI_H_
+#define __PHY_HDMI_H_
+
+enum hdmi_phy_colorspace {
+	HDMI_PHY_COLORSPACE_RGB,
+	HDMI_PHY_COLORSPACE_YUV422,
+	HDMI_PHY_COLORSPACE_YUV444,
+	HDMI_PHY_COLORSPACE_YUV420,
+	HDMI_PHY_COLORSPACE_RESERVED4,
+	HDMI_PHY_COLORSPACE_RESERVED5,
+	HDMI_PHY_COLORSPACE_RESERVED6,
+};
+
+/**
+ * struct phy_configure_opts_hdmi - HDMI configuration set
+ * @pixel_clk_rate:	Pixel clock of video modes in KHz.
+ * @bpc: Maximum bits per color channel.
+ * @color_space: Colorspace in enum hdmi_phy_colorspace.
+ *
+ * This structure is used to represent the configuration state of a HDMI phy.
+ */
+struct phy_configure_opts_hdmi {
+	unsigned int pixel_clk_rate;
+	unsigned int bpc;
+	enum hdmi_phy_colorspace color_space;
+};
+
+#endif /* __PHY_HDMI_H_ */
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 3a570bc59fc7..93d77d45b1d4 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -17,6 +17,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <linux/phy/phy-dp.h>
+#include <linux/phy/phy-hdmi.h>
 #include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
 
@@ -42,7 +43,8 @@ enum phy_mode {
 	PHY_MODE_MIPI_DPHY,
 	PHY_MODE_SATA,
 	PHY_MODE_LVDS,
-	PHY_MODE_DP
+	PHY_MODE_DP,
+	PHY_MODE_HDMI,
 };
 
 enum phy_media {
@@ -60,11 +62,14 @@ enum phy_media {
  *		the DisplayPort protocol.
  * @lvds:	Configuration set applicable for phys supporting
  *		the LVDS phy mode.
+ * @hdmi:	Configuration set applicable for phys supporting
+ *		the HDMI phy mode.
  */
 union phy_configure_opts {
 	struct phy_configure_opts_mipi_dphy	mipi_dphy;
 	struct phy_configure_opts_dp		dp;
 	struct phy_configure_opts_lvds		lvds;
+	struct phy_configure_opts_hdmi		hdmi;
 };
 
 /**
-- 
2.39.2

