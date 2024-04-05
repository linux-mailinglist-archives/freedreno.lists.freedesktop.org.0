Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9011D89925E
	for <lists+freedreno@lfdr.de>; Fri,  5 Apr 2024 02:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84F51136AF;
	Fri,  5 Apr 2024 00:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="N6sr4g73";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B5E1136B0
 for <freedreno@lists.freedesktop.org>; Fri,  5 Apr 2024 00:01:15 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1e0878b76f3so13892945ad.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Apr 2024 17:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1712275275; x=1712880075;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BubB/ZTZXGyOlYIo5JvJ2GYL9k/6VJ0RRIgGr3QHUG4=;
 b=N6sr4g73aXokEpSRGF+7dPDd3XEt54aThfuP5CaXMRrpDNJj2GQLV19MuWvO2SMPta
 7anDLzRv6oYK8pWZsKgagRrAByJv7Y+wRq1Fr1A9k4LxBsE8h50HSSPdkBa4rYMBYp7T
 lqBD9EJaAntNz4urgxTKOpdZQZZJYagpW4iVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712275275; x=1712880075;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BubB/ZTZXGyOlYIo5JvJ2GYL9k/6VJ0RRIgGr3QHUG4=;
 b=MgMEBVmhvLIABa8Y2yo+yoS5UEEmBdPo04kmPhtTHF6apPwGxbftHTnkbJSQSfcbM4
 OLm2RWWjgoae/9XO0mltFuCiT8pDqPorzI7w3HUnqC2VhfFB/SoJ70ztNI7AqBB9nLk1
 qLFLEX5X+qDB3wYGMUuxjkFVOuN9embcmPJn9sI8qlHbZZpDYjYcqfNk1toGgwKOHHLR
 g1pHSqHtPzS+AWNl68oTjLJCpQkvesu+qj4IOpcrTY7gey4aL86/xsoHoHhc1pO9olgu
 DuQRXfEzicF1EWwLHBOmpeCnInfBWfQEXqU761cPi7ItkvVvcIe6WVZ3pGcvV9dJmKsx
 YCJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8/3SkDKyXVNiWjzqZKn+KAT1kifTDDPd/kKPjgSdh0UZp1XpUeRLjdzbuDx9aXzlY+dv6DCJqyFCV3eRrxyLDZ1Hd6r8hHTV09Ej9c6vT
X-Gm-Message-State: AOJu0YwLcNDgi9Lo0vJ8Ov81Kg1zDRL8nNcnNbsMYmcEVLFsfC/zgAxU
 TujShXDICkoFjeoICKQ70gSqj4TpxiqW3bSq3iXRGS+YGAp7VWidg9elOoLQgw==
X-Google-Smtp-Source: AGHT+IHHeoBPsIh9g3n+aMvqQ0ly90tm+3kUGSMVbGHLtLA2CIsxae6F593S7l6qGq8fl7xOPFRfEw==
X-Received: by 2002:a17:902:e747:b0:1e0:30ca:62c with SMTP id
 p7-20020a170902e74700b001e030ca062cmr1469256plf.1.1712275274803; 
 Thu, 04 Apr 2024 17:01:14 -0700 (PDT)
Received: from localhost (4.198.125.34.bc.googleusercontent.com.
 [34.125.198.4]) by smtp.gmail.com with UTF8SMTPSA id
 f7-20020a170902ce8700b001e26e1e62f9sm213048plg.176.2024.04.04.17.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 17:01:13 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-phy@lists.infradead.org, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Steev Klimaszewski <steev@kali.org>,
 Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: [PATCH] phy: qcom: qmp-combo: Fix register base for
 QSERDES_DP_PHY_MODE
Date: Thu,  4 Apr 2024 17:01:03 -0700
Message-ID: <20240405000111.1450598-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The register base that was used to write to the QSERDES_DP_PHY_MODE
register was 'dp_dp_phy' before commit 815891eee668 ("phy:
qcom-qmp-combo: Introduce orientation variable"). There isn't any
explanation in the commit why this is changed, so I suspect it was an
oversight or happened while being extracted from some other series.
Oddly the value being 0x4c or 0x5c doesn't seem to matter for me, so I
suspect this is dead code, but that can be fixed in another patch. It's
not good to write to the wrong register space, and maybe some other
version of this phy relies on this.

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abel Vesa <abel.vesa@linaro.org>
Cc: Steev Klimaszewski <steev@kali.org>
Cc: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>
Fixes: 815891eee668 ("phy: qcom-qmp-combo: Introduce orientation variable")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 7d585a4bbbba..746d009d702b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2150,9 +2150,9 @@ static bool qmp_combo_configure_dp_mode(struct qmp_combo *qmp)
 	writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
 
 	if (reverse)
-		writel(0x4c, qmp->pcs + QSERDES_DP_PHY_MODE);
+		writel(0x4c, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
 	else
-		writel(0x5c, qmp->pcs + QSERDES_DP_PHY_MODE);
+		writel(0x5c, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
 
 	return reverse;
 }

base-commit: 4cece764965020c22cff7665b18a012006359095
-- 
https://chromeos.dev

