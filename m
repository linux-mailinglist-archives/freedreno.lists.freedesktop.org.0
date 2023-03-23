Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B11C6C64D2
	for <lists+freedreno@lfdr.de>; Thu, 23 Mar 2023 11:25:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E6910EA77;
	Thu, 23 Mar 2023 10:25:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8054510EA6B
 for <freedreno@lists.freedesktop.org>; Thu, 23 Mar 2023 10:25:33 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m2so19870948wrh.6
 for <freedreno@lists.freedesktop.org>; Thu, 23 Mar 2023 03:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679567133;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JLUTPlE00BSnjiP+YKOutfDTs6tTX6QAssulhGKRHLM=;
 b=R48HHx1wdjnhsHgZ4ALbYG0+8j5SMxooMuHnduChZHWwZ0OZgwykIJ+MkPtslt7r0N
 /wF/FuDu1ONXfoH65B19fv9bddghDB7pFtm3bKCiTIXM5bFO67PiNTUphoTFh78n+Aji
 st7CqyEQ014AMyKaW2V7iBNOgL/BDbCnnVnsZU3MnLSQct4Y6WEN8uVBA35bnY87IGV3
 A1ZmLm3Z5MbuNfateEye6dFjAf1p2Sg1hZ/TOJ8hhZ418TCTE77tCkNqeKRG9SNih5HO
 6QRbR6dIRE8+jVvZqg7fVfRpp5XmJqLydMorfJTPnBYb5h8y9L18rlhp2WLeKvgHr02z
 Ho7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679567133;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JLUTPlE00BSnjiP+YKOutfDTs6tTX6QAssulhGKRHLM=;
 b=l6cTOJAEcU6BWXBqAEpQFyfRkkgq7m1tUAgA/RbBDWjGQYWZfhtkHpqnpUWnNmQ9iU
 XpSlxTa83Ebb5wNMlqyiacEVISxgTc2bMNi4xaLQBH+Xy5c/BIqF79AALjho8IYHa9Kg
 qQKrM26iwk52rrK/nh6y9988XH7h7jKYEsrasaCTU1GlELsML2S69aZFguCNU6827pxK
 zm7+ZZRhepbVEK/tQ8+MHYGVf1xaAdrRGLW0ELoVH4arS/+NsqipqiiUexjSjfMFK4+Y
 uqcm+TBhrUs2YwqOWLUlkCFZ1HIBOQh1g+6zAWUG4qS+8I6+iXPp31iWtoj8nfoUsa4q
 PNDw==
X-Gm-Message-State: AAQBX9d4TAj0P3a6OnxV5kTw9QCFWbdN3UMhBjrknRoEdGHMJo4UlSld
 IcHRhugjwZwb39ddnNtUY+LSMw==
X-Google-Smtp-Source: AKy350ZmFe/sap13zmBOBFD0LzVyhIlb1i6EkPaP2YxaME1R9IuEZr2IyS123FR1V2zVbBWgDAb8MQ==
X-Received: by 2002:a5d:6709:0:b0:2cf:e449:1a9e with SMTP id
 o9-20020a5d6709000000b002cfe4491a9emr1930821wru.30.1679567132966; 
 Thu, 23 Mar 2023 03:25:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a5d5957000000b002cfefa50a8esm15753530wri.98.2023.03.23.03.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 03:25:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 23 Mar 2023 11:25:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-6-3ead1e418fe4@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>
X-Mailer: b4 0.12.1
Subject: [Freedreno] [PATCH 6/8] arm64: dts: qcom: sm8450: remove invalid
 npl clock in vamacro node
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
Cc: Rob Herring <robh@kernel.org>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fixes the following DT bindings check error:
codec@33f0000: clocks: [[137, 57, 1], [137, 102, 1], [137, 103, 1], [137, 70, 1]] is too long
codec@33f0000: clock-names: 'oneOf' conditional failed, one must be fixed:
	        ['mclk', 'macro', 'dcodec', 'npl'] is too long

The implementation was checked and this npl clock isn't used for the VA macro.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index bcb51e612261..ef9bae2e6acc 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2321,9 +2321,8 @@ vamacro: codec@33f0000 {
 			reg = <0 0x033f0000 0 0x1000>;
 			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				 <&q6prmcc LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
-			clock-names = "mclk", "macro", "dcodec", "npl";
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk", "macro", "dcodec";
 			assigned-clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
 			assigned-clock-rates = <19200000>;
 

-- 
2.34.1

