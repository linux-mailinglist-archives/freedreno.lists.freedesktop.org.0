Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD65645101
	for <lists+freedreno@lfdr.de>; Wed,  7 Dec 2022 02:23:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C14810E169;
	Wed,  7 Dec 2022 01:22:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988CF10E166
 for <freedreno@lists.freedesktop.org>; Wed,  7 Dec 2022 01:22:38 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id f20so6048849lja.4
 for <freedreno@lists.freedesktop.org>; Tue, 06 Dec 2022 17:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JzVHcmxorROJCIoZd11bHlIHsRKO6twZzQN8g754tbQ=;
 b=rppgqtvroVysk12yUykyeXuujps8u2NLR36dj0h3BDjwc8N3JRjDZkKUomqO8M3jNU
 LCuZ7wIM42zsCvb3MvYYAPj2gI6feufVN8PxpsE21lKubOIFN1D96vNXGHcQdW7Rf0+9
 lIiZcLrGzSiBYzJazuiI10190k4aEjJSnWZqzRIZqFZkHHbST7WKJQtyVdAyLdbRbeuv
 enHzNhSQxNMfnADgMLCqfU2OEW7w6Ybqao+BcTsrypzVK6AwJzAyhUcQUpr3NiYUhoAn
 OzRVso4Nnj87QnCZcvAi6SO+ndj/c6oUgs8oTw4p8O4/JD+HAySp440FixJi0tCGwqy+
 tcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JzVHcmxorROJCIoZd11bHlIHsRKO6twZzQN8g754tbQ=;
 b=GWbUdVpCL/6ap03nFylZDWTybgMh9Zh6nfKNQk/6hOPUeSumYvWi9Ke5HHFM1Wz2Ti
 czDqlYtaktywftNMgKsNiJIPO0O88S6if/sVb+dZKJ6JJ0z36MsHR6tMD2dBV2oIh+qs
 +LbUkVXbsCcbD1n/teKotM99HNzpIrmufmGg9fbLU2Fl9jG5sXE91EBHp3qMwt5DxtOn
 b3HScBygDpbeHPoZxS1OK2fKJu13OYfZkZOsQLjmyDfq1hyTOgsSKr1JDGT3ZF6KfL/G
 MW4LXBIC7Zl6MycfWTZQRhg2jkX2MfcMDIn6LbhklWXySphYQp3ToD7TUKzX3QEuW5ou
 /UYA==
X-Gm-Message-State: ANoB5pmFxCy+Mgn2IL3hi8ClAoRdFGv1xbUFzKFWFw/1Itpkjcl2vWsE
 cb9aiZADKbXiUsAcs1zD9Ht8DQ==
X-Google-Smtp-Source: AA0mqf57pCYrgTBoXwcRKVwfNAqUrXTO2A1omPT38r8S092StXXU2pztaoqRusFXJyFXOuSMhWC1zw==
X-Received: by 2002:a2e:9155:0:b0:279:e6de:5c31 with SMTP id
 q21-20020a2e9155000000b00279e6de5c31mr5251648ljg.340.1670376156505; 
 Tue, 06 Dec 2022 17:22:36 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 a11-20020ac25e6b000000b0048a9e899693sm2678916lfr.16.2022.12.06.17.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 17:22:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed,  7 Dec 2022 03:22:25 +0200
Message-Id: <20221207012231.112059-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
References: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 05/11] drm/msm/dsi/phy: rework register
 setting for 7nm PHY
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

In preparation to adding the sm8350 and sm8450 PHYs support, rearrange
register values calculations in dsi_7nm_phy_enable(). This change bears
no functional changes itself, it is merely a preparation for the next
patch.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 26 +++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 9e7fa7d88ead..0b780f9d3d0a 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -858,23 +858,34 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	/* Alter PHY configurations if data rate less than 1.5GHZ*/
 	less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
 
+	if (phy->cphy_mode) {
+		vreg_ctrl_0 = 0x51;
+		vreg_ctrl_1 = 0x55;
+		glbl_pemph_ctrl_0 = 0x11;
+		lane_ctrl0 = 0x17;
+	} else {
+		vreg_ctrl_1 = 0x5c;
+		glbl_pemph_ctrl_0 = 0x00;
+		lane_ctrl0 = 0x1f;
+	}
+
 	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
-		vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
 		if (phy->cphy_mode) {
 			glbl_rescode_top_ctrl = 0x00;
 			glbl_rescode_bot_ctrl = 0x3c;
 		} else {
+			vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
 			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
 			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x39 :  0x3c;
 		}
 		glbl_str_swi_cal_sel_ctrl = 0x00;
 		glbl_hstx_str_ctrl_0 = 0x88;
 	} else {
-		vreg_ctrl_0 = less_than_1500_mhz ? 0x5B : 0x59;
 		if (phy->cphy_mode) {
 			glbl_str_swi_cal_sel_ctrl = 0x03;
 			glbl_hstx_str_ctrl_0 = 0x66;
 		} else {
+			vreg_ctrl_0 = less_than_1500_mhz ? 0x5B : 0x59;
 			glbl_str_swi_cal_sel_ctrl = less_than_1500_mhz ? 0x03 : 0x00;
 			glbl_hstx_str_ctrl_0 = less_than_1500_mhz ? 0x66 : 0x88;
 		}
@@ -882,17 +893,6 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 		glbl_rescode_bot_ctrl = 0x3c;
 	}
 
-	if (phy->cphy_mode) {
-		vreg_ctrl_0 = 0x51;
-		vreg_ctrl_1 = 0x55;
-		glbl_pemph_ctrl_0 = 0x11;
-		lane_ctrl0 = 0x17;
-	} else {
-		vreg_ctrl_1 = 0x5c;
-		glbl_pemph_ctrl_0 = 0x00;
-		lane_ctrl0 = 0x1f;
-	}
-
 	/* de-assert digital and pll power down */
 	data = BIT(6) | BIT(5);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_0, data);
-- 
2.35.1

