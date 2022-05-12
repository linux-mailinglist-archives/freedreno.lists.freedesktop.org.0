Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9FA525865
	for <lists+freedreno@lfdr.de>; Fri, 13 May 2022 01:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C419010ED24;
	Thu, 12 May 2022 23:36:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C1A10ED07
 for <freedreno@lists.freedesktop.org>; Thu, 12 May 2022 23:36:51 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id s27so8389526ljd.2
 for <freedreno@lists.freedesktop.org>; Thu, 12 May 2022 16:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=azPGR+vZJiRZ8wrc365ZR8Nim5+sjCT0QCeZdqg0Fso=;
 b=l5nombBMfLAuoochQ9oKZQKmL4OlVXimRrMej51XNpCjFbI+7UJi97jWbuDOSquEoU
 8Xns6m6Xc2aRVdzBcLMxBJ7A48uyOpqfwq5CTKT+O/DUBTfNBzIaJ9ocYIXvw7N8HKKh
 wZKDdQ6VtJCQfaOvOw+A8Ph1ZlZtbHtxdAaoDIMy7SB7hIs92PDWqfdtQxUMGB+pLxmt
 RlVyJTHg3L2wK56nSPk13WlmcUb4Eppn/TvKfXbdgo4U03FFOj+Cwl2U9OaPPxg2wIdr
 syXry3wLBnBGqGV3z+0lxjuMYfsfga1fN/9KnUv+wO/bqM3ji5wYesLAM4c7HOUXnrpM
 rQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=azPGR+vZJiRZ8wrc365ZR8Nim5+sjCT0QCeZdqg0Fso=;
 b=b1T2eSokw4q+kCOYQLqI2/cyk0YI4SFESDgWy4XyO1d7rs7zpb4+PzPWeX99ssW1cC
 3F79TQXBo6GXHV6AEVCukguuiSmz3IpjofoxG3fO6ZkLCpDkmaDRTUQ+dvsGWl5GRgo1
 ORBSUlBQ8ORI3VhghTWg260XQdQz8lGSJIwvTapbTSRASsy+nT2PEHXdeC4QFVWjGvQ8
 ryRt8txFOsPmLgUxIYyPh7hyvjy3fTRfS/EAYc6fCNQR6whg8fVL4RyTf0BAQH0JSc6c
 v5bBxTNSII9beM120rOnzZy6txbuwkR0WtWXR0eEVpANxQc12AHoN37hcMx1vR2nqi15
 Y6Gw==
X-Gm-Message-State: AOAM533bihg1wzDlHbvuveFzRNeiKvIMTrG82BDqIlEkoQq5vrVFe3+r
 AG+UttxxsrevmnQouv4HvYKK5Q==
X-Google-Smtp-Source: ABdhPJxgCHMnJ4LEek1kUdhz+O1bKDx5YuEx6gHj4DQBPerUjDefkT8WWBp7JYFactZEmVCxE/WRtw==
X-Received: by 2002:a2e:8902:0:b0:24f:1446:3101 with SMTP id
 d2-20020a2e8902000000b0024f14463101mr1437014lji.266.1652398609807; 
 Thu, 12 May 2022 16:36:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 p13-20020a19f00d000000b0047255d211c1sm127937lfc.240.2022.05.12.16.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 16:36:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 13 May 2022 02:36:41 +0300
Message-Id: <20220512233647.2672813-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
References: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/8] arm64: dts: qcom: sdm630: disable
 dsi1/dsi1_phy by default
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Follow the typical practice and keep DSI0/DSI0 PHY disabled by default.
They should be enabled in the board DT files. No existing boards use
them at this moment.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 240293592ef9..8697d40e9b74 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1559,6 +1559,8 @@ dsi0: dsi@c994000 {
 				phys = <&dsi0_phy>;
 				phy-names = "dsi";
 
+				status = "disabled";
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -1592,6 +1594,7 @@ dsi0_phy: dsi-phy@c994400 {
 
 				clocks = <&mmcc MDSS_AHB_CLK>, <&xo_board>;
 				clock-names = "iface", "ref";
+				status = "disabled";
 			};
 		};
 
-- 
2.35.1

