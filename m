Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADD26C64CF
	for <lists+freedreno@lfdr.de>; Thu, 23 Mar 2023 11:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47EE410EA6C;
	Thu, 23 Mar 2023 10:25:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E119B10EA66
 for <freedreno@lists.freedesktop.org>; Thu, 23 Mar 2023 10:25:29 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j24so10967785wrd.0
 for <freedreno@lists.freedesktop.org>; Thu, 23 Mar 2023 03:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679567128;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MbMpIW2XeTgOIuij0DvAphORXQYIJr8R5bBmK3u0n4s=;
 b=OiM1Yacj+a6ZH6zyF+4WbfsKHoee7NXm2MM9OOs2n5bJzfOLIGXc12cwtoMMbg5V3G
 3E7MUGqH2EfT+LLrFi30N1TD5vnz9MtKSQJ7qwGhKdoghrG2YNuKlZpFNEbNpPfb+JNC
 For/VV8QIang/A28V7HMQQzpxwmJI796xxhu2taDRIfLRuuphtt55iNSeSB1TPRM88kr
 MbeZOoHUYvYqUSMsB/kCZa2vQ1FUlEiDJMmqJPeIQn3BXlnkPEmWDHVnFESQ6FJvikYa
 cSWdtPSS6SLsNYVNt6bjg783EluGuECjGfV2WXUqqcBqC1eByii9qGUXoZ2JXGQ/O6yJ
 vBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679567128;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MbMpIW2XeTgOIuij0DvAphORXQYIJr8R5bBmK3u0n4s=;
 b=ftb7Pv7alt+4QP/VzXR2h73v2z+yBiVXmH+kbr7yguAKACrDDde5NMFXJH6jWI6YJw
 gepTBzuYuEw8Qb+izc94WKtYldngt/FguHwNS86KBx7nrJn3ce2lrLRVAI8bpDBkbEZ7
 9uckjptZNMK0GuPVrSiT/nIkwx7i1Ofle7j8fAy7aP6ggcFeYBSKzhRZUAZvTD49WxgC
 vDCdAfcmPVZ9otoC/OTFot05FXudh6WEyobqE1czPfuMp5m6LEi9JBLh2xvjCedMD/8q
 sSarv0XBiCmYn8nnUBh9T73IA3vrZFK1pwZ7omHA3Kgtl8SMwfDMf/K7CmCfZVCJMNO5
 B8tw==
X-Gm-Message-State: AAQBX9d+ZrjNXacpkTaUfRR0aBFaVbhcKDLZUjFd6DRPjVypNZAqaCDu
 pKsrcn6MrpqKYvEFJ6QmxiR46A==
X-Google-Smtp-Source: AKy350YnpJ9aARdt0vtWcfFYEivcldCh8Vl38PKNmqoJ8yqlx/THGzhpYzjoV1hW1Xn0hKBSv96fHw==
X-Received: by 2002:adf:ed43:0:b0:2ce:a8d5:4a89 with SMTP id
 u3-20020adfed43000000b002cea8d54a89mr2146384wro.37.1679567128111; 
 Thu, 23 Mar 2023 03:25:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a5d5957000000b002cfefa50a8esm15753530wri.98.2023.03.23.03.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 03:25:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 23 Mar 2023 11:25:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-2-3ead1e418fe4@linaro.org>
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
Subject: [Freedreno] [PATCH 2/8] dt-bindings: mfd: qcom,
 spmi-pmic: document pm8450 pmic
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

Add a compatible for PM8450, commonly found with SM8450.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 975c30aad23c..15deeff2d447 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -57,6 +57,7 @@ properties:
           - qcom,pm8350
           - qcom,pm8350b
           - qcom,pm8350c
+          - qcom,pm8450
           - qcom,pm8550
           - qcom,pm8550b
           - qcom,pm8550ve

-- 
2.34.1

