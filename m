Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC852561EFB
	for <lists+freedreno@lfdr.de>; Thu, 30 Jun 2022 17:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8132F10F5D5;
	Thu, 30 Jun 2022 15:17:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096278912F
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 12:08:51 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v14so26958340wra.5
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ep1P6XTEaNexZkYvrMILNzV0+nB7s8j8xxQKFiKCkDY=;
 b=S4AfW7peDmO0EaxFy5FO+eirXPDcekVZNcBYSKJovu4k6tn8S5q5i6LIEJCm1MqJTi
 kAPHski5fwgglMwM15fGoISZgEhnpQv2KWG+MUWwYq+6Y4wxnOaGlEZzsihmznkRofnY
 H2hv/iuskUHAdzB0vpWeCVL7SPPS/1XFA1A2DJQ2ozAyt7ZwbDwkWmPwTAEaD9H8Uyvw
 baf1CZBzY16C2nLwo/kuHVJvSuS+43jHLtsl6QCv8wATbaaFLuTprc2GwMiwuJVhT4Qh
 ialNz9wDnepcTnPQUugR4wtbw1Y56m3+d9VX+XmcNeSXkXSuOLobf1etTS579hldonbt
 P/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ep1P6XTEaNexZkYvrMILNzV0+nB7s8j8xxQKFiKCkDY=;
 b=07nBjDK3I821hkeHHNDtM77UMjNLFboP544+OzdW2bXCHKbxKhuX5GFaAlowgHw+bO
 Pm3O2vUARoWhfSmqDzhtFYeQ8sHaJDUVh5NY6Efsdso4H0JOYSGbWwg6BxeoW9BUI8zL
 h8Lb9czSfU9yGW8GzDGfgujpHsaZEQHr1qUsz5gKzhCv96/n/22/QJrcsIJFsOqlWg7J
 Sk4hUdxOibI2jgyoownP9cGO4CHvPzo1WxVei7R2TMbA0+F1QGnUfeTP239vpLeUp4x0
 DesRfvHIA9dJ6Ts5cj+uh5zuuadbe1KxhQYI6gimdpOaHcT6WdLgnjpshKrOZYEGyw/+
 MAfw==
X-Gm-Message-State: AJIora99XvakFwK4/Jvx2OBlLihKrIPk+sccSnVzdqqwUafJse+qB/hI
 DPGK6ABZgrQ3n2BUxycgorxIMQ==
X-Google-Smtp-Source: AGRyM1vDMAgZbp7JXmzOGvCCpcaX+CS9YGuecoWNWTHwFWjrmB4Ec+v67bqswhRJqQqPUfhb0pkp8Q==
X-Received: by 2002:a05:6000:1147:b0:21b:93db:701a with SMTP id
 d7-20020a056000114700b0021b93db701amr7868034wrx.447.1656590930621; 
 Thu, 30 Jun 2022 05:08:50 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 05:08:50 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Date: Thu, 30 Jun 2022 13:08:40 +0100
Message-Id: <20220630120845.3356144-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Jun 2022 15:17:39 +0000
Subject: [Freedreno] [PATCH 2/7] dt-bindings: msm: dsi: Fix
 operating-points-v2 constraint
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
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The existing msm8916.dtsi does not depend on nor require operating points.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 717a5d255ffe4..101adec8d9152 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -137,7 +137,6 @@ required:
   - assigned-clocks
   - assigned-clock-parents
   - power-domains
-  - operating-points-v2
   - ports
 
 additionalProperties: false
-- 
2.36.1

