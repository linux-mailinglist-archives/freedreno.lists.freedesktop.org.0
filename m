Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA644B5501
	for <lists+freedreno@lfdr.de>; Mon, 14 Feb 2022 16:39:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7845A10E1D0;
	Mon, 14 Feb 2022 15:39:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7D610E147
 for <freedreno@lists.freedesktop.org>; Mon, 14 Feb 2022 15:37:48 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id s10so13979822wrb.1
 for <freedreno@lists.freedesktop.org>; Mon, 14 Feb 2022 07:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aijvcWsy9YtZiV+n1WapUIg4+6ntUJUoIxFuyguMb7g=;
 b=d2smxsP4lY8EQU1zErCDeEd9cyKWYZkCDUktgBcZ/37aIGxUVMJloxXmmMGDuI1aNY
 XM7mbLgPCEpq3H4LSR4gD2zckDXLiKmzBw/rf96aiVcoHu7FmcnK+n1u5Gbt4oV+977F
 laGYHR4xHhM9E2Z048+Ww+9KIu3CBm08UxTvnyGz/iPAljcYepLLyAzah/4G9X+XZp/e
 886JNhKnUWCsb7vcSKDnXGGCEWQzXZnbh29alvExLBA0R4xGqiPRhybIZBNt1mXbun8N
 L1rfIQuhlzaQyxW6lPsuzJXQsiKZD71xStkMe5GS1sHEEV8vCGl+zswNmgzadtUA/mt6
 6DKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aijvcWsy9YtZiV+n1WapUIg4+6ntUJUoIxFuyguMb7g=;
 b=zcisUfrXB3ZsJGP3w87pi5TKZQQZmrzP7ap19AQwiss69WJtHBCDIcCkmY+qBgDKhp
 EKelD5PpJi2tUSav6O/py7nxiUmygT4KJlJPKMrbe/PM+JYX2nhrghCeGSVii/M1u5eJ
 pvjHvySHKBO0EFXAyj7X9C0sqid1OlUrwizpKgBpx7EVHTWNMImi3K4LDQlDyUzllh7C
 tB89b5sRVgsIfSPSEVfaWhYHSxVzYeEGdpepipuE211a+1R/d7QCAu5xDhe2wcOOwzNg
 ZOZs/HSHLL1++BcJJ6vqrYIoTrcTrkIUpQx+Nq1BxClqGiy95zWwjj6erApFWALpsvxH
 uJCg==
X-Gm-Message-State: AOAM531hgFb8n2IWi87324+kdnJibj+bBCqiz3YXAZ/IG7YqBviPh4v7
 IfS6yYpmyI5Q8W7M8mBwddJAPw==
X-Google-Smtp-Source: ABdhPJy1jNaE/Z+WGRu0Cij1dahEbDE8D710Pc2g3XwPeNMUzaKum51xN0xAPyB7Gve6/2IpMXoqEg==
X-Received: by 2002:a5d:53cd:: with SMTP id a13mr155713wrw.712.1644853066487; 
 Mon, 14 Feb 2022 07:37:46 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:682b:4712:4b40:6814])
 by smtp.gmail.com with ESMTPSA id
 l26sm12935850wms.24.2022.02.14.07.37.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Feb 2022 07:37:45 -0800 (PST)
From: Loic Poulain <loic.poulain@linaro.org>
To: dmitry.baryshkov@linaro.org,
	robdclark@gmail.com,
	robh+dt@kernel.org
Date: Mon, 14 Feb 2022 16:37:40 +0100
Message-Id: <1644853060-12222-3-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644853060-12222-1-git-send-email-loic.poulain@linaro.org>
References: <1644853060-12222-1-git-send-email-loic.poulain@linaro.org>
X-Mailman-Approved-At: Mon, 14 Feb 2022 15:39:46 +0000
Subject: [Freedreno] [PATCH v2 3/3] dt-bindings: msm/dsi: Add qcm2290 dsi
 controller binding
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
Cc: linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
 freedreno@lists.freedesktop.org, Loic Poulain <loic.poulain@linaro.org>,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add DSI block specific qcm2290 compatible string as valid
Qualcomm DSI controller.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: no change

 .../devicetree/bindings/display/msm/dsi-controller-main.yaml         | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 35426fd..7095ec3c8 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -14,8 +14,9 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - const: qcom,mdss-dsi-ctrl
+    enum:
+      - qcom,mdss-dsi-ctrl
+      - qcom,dsi-ctrl-6g-qcm2290
 
   reg:
     maxItems: 1
-- 
2.7.4

