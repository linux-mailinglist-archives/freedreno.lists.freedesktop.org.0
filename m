Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7945768B355
	for <lists+freedreno@lfdr.de>; Mon,  6 Feb 2023 01:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF1A10E2D5;
	Mon,  6 Feb 2023 00:27:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983F410E2BB
 for <freedreno@lists.freedesktop.org>; Mon,  6 Feb 2023 00:27:41 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id bk15so29824653ejb.9
 for <freedreno@lists.freedesktop.org>; Sun, 05 Feb 2023 16:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mxwl3YRJUzbo8fSMHrnnIcR0IoUl4vPzxhW6soDvfYM=;
 b=vX0pEk42BMOXZi1U7yMuHVsLP+TCD98KGj5FruNDMvJ48wK3QrQUC64gXIVk+NGyXp
 y92MbV8aoAKSP34WF9fXsGQZC/PciS0SCvuzjRRu58243vCXSCgw7Q1xm9jOryzEsSDM
 lvResgl0shZGh0zV2roQ0sl7HEzLPF6xa8mZ3Q7AfAusmP2IYhuneHIapSg3L+It29MM
 xGZMNnajHydvwRCuHMHidC52TwmZhSUtfaXOJ2W85xhP0RB6BB7AmBoQGqj6z70G7NiJ
 1UYZRJc2QfEQasEDs6CO+/DPfnq2gPUsZAsGr3lv7JefuzvkmQ1hn3d8CXy+L7ZReAdU
 mJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mxwl3YRJUzbo8fSMHrnnIcR0IoUl4vPzxhW6soDvfYM=;
 b=ktcIUG7wuLbFidtgvL9nSrT6CZtBmLuD05MSz5oB9TSfkl1jesPmCBL4U6zRR6qXM+
 EY6jPEnj+esMyWDCeIM0N3fufNE4S+NbCUjF1tKxK605N2SYamygX6KX6MQemJj/9/hV
 ywInzIa7r1c+RVL0eZlxb/QO/UjU/yjtioupuiqulDxqviB1osGllfpDoD0H4k4LNHDE
 PQh08/pFIX8f2BVmzxvnyeh/a2MikniVHRoIEVzUcyn2RAUv0/nW+Ady6FNUPg2qzM6d
 tl9c+E+AXmj4f/4PwHg2GX+iWXOBjBMNMacPwL1NScyyBrG5aLnrl9dy/IafOQbGhP2c
 CrBg==
X-Gm-Message-State: AO0yUKXHmwkdrnqM9Lb1koBKHRgFFdLF2Nmvn6HGB235JEveqg66H9Yz
 5gBImlY5MdikNY+MDpdHpW9PFg==
X-Google-Smtp-Source: AK7set99WYqIIHfjzNDlsnhre+kGIR2HyyMw/wlJRUBCyrDN084HeJKaHXsYzc8vBFdBjAqjToKFWA==
X-Received: by 2002:a17:907:9917:b0:88d:6de1:96bf with SMTP id
 ka23-20020a170907991700b0088d6de196bfmr20179478ejc.12.1675643260082; 
 Sun, 05 Feb 2023 16:27:40 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 y18-20020a1709063a9200b00878b89075adsm4716085ejd.51.2023.02.05.16.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 16:27:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
Date: Mon,  6 Feb 2023 02:27:28 +0200
Message-Id: <20230206002735.2736935-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/8] arm64: dts: qcom: sm8350: add
 RPMH_REGULATOR_LEVEL_LOW_SVS_L1
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add another power saving state used on SM8350.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/power/qcom-rpmpd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 4a30d10e6b7d..1bf8e87ecd7e 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -211,6 +211,7 @@
 #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
 #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1	56
 #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
+#define RPMH_REGULATOR_LEVEL_LOW_SVS_L1	80
 #define RPMH_REGULATOR_LEVEL_SVS	128
 #define RPMH_REGULATOR_LEVEL_SVS_L0	144
 #define RPMH_REGULATOR_LEVEL_SVS_L1	192
-- 
2.39.1

