Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14801654AE0
	for <lists+freedreno@lfdr.de>; Fri, 23 Dec 2022 03:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FFF10E5FA;
	Fri, 23 Dec 2022 02:10:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC9D10E5B9
 for <freedreno@lists.freedesktop.org>; Fri, 23 Dec 2022 02:10:39 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id bs20so1289460wrb.3
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 18:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qZdjxc2y9QTXw1oO8jfVxT9zUH2M6g93k1qq74sNBIo=;
 b=CiW1w0oCZHCXgJsT8R3B2c1vyZI4zlQfpLkGHE2GzyCyMWoTTOxCBRGtT+RmnlOR6O
 NZFGvyKwnMdqXPjvmKPeTVkSvMotx43T9psSkpa6BlKvbgd4GSTqs3Q+sbls5KdIhsOT
 tUv4Iv9JzeE5BV8pIy06G1N7tHJR/eEf8FbIuR2ZDeJHGrsTLZJ7/fIOj7gL+8zDGqP5
 aGBad1khwIkRzSAcbiJxy43+LycN1vS0AdkzbZFL7vr2tbMWNp3RIbMnSEBP0pCrvHXf
 z+J77eyPXzJdOu1IrZOTn+dlWJ8LvXqGfEZ9/AK3EuWqFymgn72svLnxMJfC33rGPSUE
 NcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qZdjxc2y9QTXw1oO8jfVxT9zUH2M6g93k1qq74sNBIo=;
 b=FI2PBN7WV/8odrZ/SeqwM5l1HT5McBCxAtC7Tpsf6nYWfiqlfshSuPGX4U1EpKQ4Lo
 8gX5XbasBxbG+eF3WgHAUSVE1T+cTjLeGhasWeXdEHwnnve990kkTF64cF1UuEUxozfg
 8ql+hYqC/3tSYfCUiOU4ixRVwbScWz0+OgsaYM54Z6Q7+useBjyVRNMYc2r7Rh3dJyqP
 tGWGrcAjwOcLDnVMs6dCnXz66DkxaB7i7cg0mVMELZ/vtCgykowP/htNl8TfRKpzmKat
 Ic8kpdj1vFWq5GOpD7uTaHUIy+A0mtkqcmUAlAYmqJphbx02Fu7VyOvJXy4RxRdBn1Ni
 M86g==
X-Gm-Message-State: AFqh2koRvL/rxLH4veJ3X6isAgh+UhwuPVwviXll8nSxDFBHXzIX9LQD
 S1/4LEQAHi+9uV3eNjwNLM1fGg==
X-Google-Smtp-Source: AMrXdXtwc9SVrhYtFVOUn5bx/CPe1cbdMJyu51vy4h6ZyOByTQzyyyc/SQ8PT6md8GTVTHTNTzlqAA==
X-Received: by 2002:adf:f74e:0:b0:22e:6227:34e4 with SMTP id
 z14-20020adff74e000000b0022e622734e4mr5078206wrp.0.1671761438317; 
 Thu, 22 Dec 2022 18:10:38 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 18:10:38 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Fri, 23 Dec 2022 02:10:16 +0000
Message-Id: <20221223021025.1646636-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 09/18] ARM: dts: qcom: msm8974: Add compat
 qcom, msm8974-dsi-ctrl
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

Add silicon specific compatible qcom,msm8974-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for msm8974 against the yaml documentation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 8d216a3c08511..3ab3665b28aaa 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1579,7 +1579,8 @@ mdp5_intf1_out: endpoint {
 			};
 
 			dsi0: dsi@fd922800 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8974-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0xfd922800 0x1f8>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

