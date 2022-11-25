Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9463F638A2A
	for <lists+freedreno@lfdr.de>; Fri, 25 Nov 2022 13:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA28410E763;
	Fri, 25 Nov 2022 12:37:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECBC10E752
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 12:37:00 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id x5so6585242wrt.7
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 04:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m6CoppLmCTxX9uttSJKGwFNEqGwRPNJKx/ekxUEKy2g=;
 b=QhbOYxb24tTuaJPbVyoyscVgvUQklvpSVDXsx9WjqI2r5xzEhHybpTSzd8awQZbxIV
 4D23eXP1EvTW49UIDC/e//hFc4Tap4xKpms/VtfLCYeU9rNO5O5D91EvbdYnr+6BfcFm
 xZrUzQ/ZnqmWeu/xSJZkJmgvJzp1MxzNbVyHC3MfLdcQFgIOZ2bPsMv/co/l0UTQfvJV
 KON9mzH2i4u/Wf7rBcFz41QcHqpgsWUoUGE4xHmx1yLFFo1jzIfWdnGGGdKN1G/Co7kr
 XqWcVxBatWu5jp4IYcFCKzprgcGywsq0ODeRAfKbAyuAKjMu9cK3FJMbk0JYbKpgHQXE
 Lkng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m6CoppLmCTxX9uttSJKGwFNEqGwRPNJKx/ekxUEKy2g=;
 b=X0Mw6H9KvDykgasILs+6pOn+bm6J1b4xjdY16R4oMbifp59/YDgVK5u+Gj0VvYxaO1
 lftwZS06b+Y4b9rEcBfWzh/EDY/554r/hWUJLqOA44nGuhqqs6GquSaH3ebl4SQD6/Vj
 QWAulHCOJbZKe4SiHWxTaQt3ZnoI7N6UU558SbLrRRyFLBIs41KpQhw+H2MVu4vr/BYz
 6PtBYkczIkYMI4C+28dOYVH6HpKcxO/vkB4nc8bpbMGbQ3sf2QIyfVYjeHyvMMVZKebM
 m0Xn/MM55ezwbMHYNRHsTJKFXCTX+JMZGbvlK/Pw8QYEkLN/iKIEqbNH+U8hPoJ/kDfp
 UOpw==
X-Gm-Message-State: ANoB5pnpyi0RPW+1c7Id0W6b0pvcFcUsmpFNtc03ewYSdyv2/6MOxE7l
 w47UFywtNxcNBtm63Z1+nSGMAQ==
X-Google-Smtp-Source: AA0mqf55hAMSzFjdkZQ4JxF9PUCqhQHWHHpTkmkzfVRF9q8V26H+eq8i5T1OqxBEyWaUd0YhBfMTMA==
X-Received: by 2002:a5d:6e56:0:b0:241:d8e7:2b18 with SMTP id
 j22-20020a5d6e56000000b00241d8e72b18mr14541843wrz.388.1669379820342; 
 Fri, 25 Nov 2022 04:37:00 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:36:59 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Fri, 25 Nov 2022 12:36:35 +0000
Message-Id: <20221125123638.823261-16-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 15/18] arm64: dts: qcom: sdm630: Add compat
 qcom, sdm630-dsi-ctrl
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

Add silicon specific compatible qcom,sdm630-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sdm630 against the yaml documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 0e7764f66b104..905ddb57318dd 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1581,7 +1581,8 @@ opp-412500000 {
 			};
 
 			dsi0: dsi@c994000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm630-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x0c994000 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

