Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C26D654AD3
	for <lists+freedreno@lfdr.de>; Fri, 23 Dec 2022 03:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF4010E5F7;
	Fri, 23 Dec 2022 02:10:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CBE10E5EF
 for <freedreno@lists.freedesktop.org>; Fri, 23 Dec 2022 02:10:45 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso5246713wme.5
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 18:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kKVEXvGef5P9tA5LLEzuk1hrh35Tg71vyheIdv7ZSrI=;
 b=tl9KeKXDtyZBmFoIjWWO4pU3vMAb7NzRUyBRhgrOfWOeeapmVdeGHdRrX7fZUdSHxR
 Og7tG5CagfAi4OKn0z43uFPbk6gmaY+S30lkzrm2jEEK1ccCB0g+ArgufKid7kwlPPsm
 08FX5IFJztnPbA1plV90Xu5PjEKOOtOhC9LKM1fyxOtCgFzaMnvKEtS3GAKzJ0tlt2Oy
 AaJMeLuEOnGx3cK5EXdFUx0EOKICI5IW6u/Lut0XVpgj5fAR7/cs7FR1oI9v5AGsiO5q
 WCKoxug+HlqYguv6UG9gaMIsxyFlvy1jaTJoXc9htdmfhnFhDeUoochJzSbxAfPlRH+W
 Lxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kKVEXvGef5P9tA5LLEzuk1hrh35Tg71vyheIdv7ZSrI=;
 b=mcBhI2gGKl3U811nKZIWxeIh7qdBfMBcZq/h4nYenx2/4RHExndgnJKJkFhv7sm1k0
 khirW9acKAELR+gmmDTzABG0kczsaLXV6s+0QgBwIPSgCwER94ycQDhhn35Kr5MEX+OO
 5zQXg5rpWIyl5E8zR1G6WmdWMeYc/1XBfQA/4/kjIxScrEOeULX4c7f8ZHULdmDrtfGe
 Br1XjnJu2yw1sVzs01qeFmyXQaxs53az4HRkFgC+D+Q+uFsOh7KLS7lQvUB3rW3bi8AJ
 ajeht3ftEjqEeehhVooScxo7jI2jvrxKTd1Q5m7s2cs55xWZxOWTlWWD3nxXkyg8UgGk
 tWow==
X-Gm-Message-State: AFqh2kqYWvq5BEjQgwP3VzRojkSd+acl+IJztTDbezpwK4lW5FDqCKun
 C9rkiutCXJRtVxmKnhdnPxNs/w==
X-Google-Smtp-Source: AMrXdXtapK6lO/YsS+pE/BacOLARlYbBOVA7De78mBLUQGZr++WDdon0BQAcfGSQFfr8EKqD06kL4g==
X-Received: by 2002:a7b:ce8e:0:b0:3d7:1b84:e377 with SMTP id
 q14-20020a7bce8e000000b003d71b84e377mr5787454wmj.27.1671761445427; 
 Thu, 22 Dec 2022 18:10:45 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 18:10:45 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Fri, 23 Dec 2022 02:10:23 +0000
Message-Id: <20221223021025.1646636-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 16/18] arm64: dts: qcom: sdm660: Add compat
 qcom, sdm660-dsi-ctrl
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 airlied@gmail.com, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add silicon specific compatible qcom,sdm660-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sdm660 against the yaml documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index d52123cb5cd31..e8a15b9cee18f 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -154,7 +154,8 @@ mdp5_intf2_out: endpoint {
 
 &mdss {
 	dsi1: dsi@c996000 {
-		compatible = "qcom,mdss-dsi-ctrl";
+		compatible = "qcom,sdm660-dsi-ctrl",
+			     "qcom,mdss-dsi-ctrl";
 		reg = <0x0c996000 0x400>;
 		reg-names = "dsi_ctrl";
 
-- 
2.38.1

