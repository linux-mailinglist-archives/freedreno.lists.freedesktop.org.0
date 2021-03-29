Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C57134CF8F
	for <lists+freedreno@lfdr.de>; Mon, 29 Mar 2021 14:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFE66E40D;
	Mon, 29 Mar 2021 12:01:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3116E40D
 for <freedreno@lists.freedesktop.org>; Mon, 29 Mar 2021 12:01:01 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id v15so18021630lfq.5
 for <freedreno@lists.freedesktop.org>; Mon, 29 Mar 2021 05:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+8Q0oXrMBUUF8CE7R5pzSgMMnLMfJKLpBWJdMeU+Kvg=;
 b=ybO0/FULhnEnk5jpC9ukACgruWaHDTR/3rHmAizO7AhGugRK389MP30cORWXKeUYi2
 1hjj515agYgf3pHDPu5B8WSDZS2741SndfQqIPO7yb/7Yr3n/iEUNTTj7jz6K1SpFafp
 O+TVpO80XRUt0ocfidTLtI1DU/3kHfmplHnUs3EgGvj6jbGaLEkCkHUJaHZq1LtJX6ST
 NTz1yXSg1dnBakqhCIptoXiDM3e0be58I/2TndMFTjwSoEJhtEDBzVeQ6aEx7kPOoiqB
 L2/7yNLa/OBMgCANrB/pz2xMpits59r2h6DtiZlCsbOedAovb6MtYpEPuyHTMwMQioYI
 wKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+8Q0oXrMBUUF8CE7R5pzSgMMnLMfJKLpBWJdMeU+Kvg=;
 b=toMCPsXodPwpshSfQS1N2NT3e1cw2fjGVhC6FHrlQKa9c03MagW6acX+egCNHL56wm
 GEc3BU9lmQIpu7z6Y3/E0qZkhOpMmJd1nmAndXxJKwHEdA9FluRh4qQC9yqME1OgnjxF
 WZuAgxZ4F3zP7cHT6/n7tPhoGwMJCz6ngYJK3rJnCNeLWxyDIPOn9jkDqogsIQ2dlR1n
 NyaiRRIk5kFQ6HR+yMBv5ILDwebcBwHCkZZj5+NPhutaBuJCyslkg8OXi7q7Ffsx5Vat
 IzQ70JTSYlTOOY2pAPbyb1/14rCZd+Pn3LcOyPAeSM3DqQz+WmrE/JPvIlt5bkAnlBQm
 uwyg==
X-Gm-Message-State: AOAM530qNjLGmqE//eFacZgT7ks7JokDIFelx9IMKDQGpYpg82VY0U32
 bYC2nE/8DU7T9DloYVhE6u7YxA==
X-Google-Smtp-Source: ABdhPJxWupiJN7PDS7xB8mTiJz/syDuiuIqkK2JJW59ERweoBfkxm+NI/T7VPNHg+minbdRReJDZHw==
X-Received: by 2002:a19:520b:: with SMTP id m11mr15874260lfb.42.1617019260144; 
 Mon, 29 Mar 2021 05:01:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d8sm2415240ljc.129.2021.03.29.05.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 05:00:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>
Date: Mon, 29 Mar 2021 15:00:49 +0300
Message-Id: <20210329120051.3401567-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
References: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v4 2/4] dt-bindings: msm/disp: add compatibles
 for sm8150/sm8250 display
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 Rob Herring <robh@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Jonathan Marek <jonathan@marek.ca>

The driver already has support for sm8150/sm8250, but the compatibles were
never added.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Acked-by: Rob Herring <robh@kernel.org>
[DB: split dt-bindings into separate patch]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dpu.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
index 551ae26f60da..5763f43200a0 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
@@ -8,7 +8,7 @@ The DPU display controller is found in SDM845 SoC.
 
 MDSS:
 Required properties:
-- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
+- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss", "qcom,sm8150-mdss", "qcom,sm8250-mdss"
 - reg: physical base address and length of contoller's registers.
 - reg-names: register region names. The following region is required:
   * "mdss"
@@ -41,7 +41,7 @@ Optional properties:
 
 MDP:
 Required properties:
-- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu"
+- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu", "qcom,sm8150-dpu", "qcom,sm8250-dpu"
 - reg: physical base address and length of controller's registers.
 - reg-names : register region names. The following region is required:
   * "mdp"
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
