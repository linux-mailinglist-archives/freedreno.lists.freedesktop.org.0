Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9077FD9F0
	for <lists+freedreno@lfdr.de>; Wed, 29 Nov 2023 15:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A7D10E576;
	Wed, 29 Nov 2023 14:44:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD14A10E5D8
 for <freedreno@lists.freedesktop.org>; Wed, 29 Nov 2023 14:44:22 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a03a900956dso189303166b.1
 for <freedreno@lists.freedesktop.org>; Wed, 29 Nov 2023 06:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701269061; x=1701873861; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Dsjff4lo1TEsrq1gFW/fhWlByzdhetZPF5yWDTWUZEA=;
 b=HPzhMGgcJlXO8zUuYdkxlHg4z8VUdUUYEYIcJcQTBstVGsCR0FWT/FCKIyBBMOyY+1
 Uc+nHV1W6kfG63125cs5/S4OY856g4h12lKmgdhKI93SIT2RjDEE+VC8Rka1iEfOqPi+
 0Ol7MXMXcYWLEaDceJnAh4fdNYsORGvX/Zk4LeVyUakS+V3Ej0CaJFMbTYanr/lJMIjD
 CEz4OMTCPBdG7KXbGdCMAFnll/asamFKUCELEC1rl7FowWdy0OJS34BJ/e13JpqAt7io
 72nmLg+blrjSrFfLIsEKjCqa3Nnmem0LQRZiWOkxoctE4iOBCFEIfzk66vGkL8XwghB3
 rwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701269061; x=1701873861;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dsjff4lo1TEsrq1gFW/fhWlByzdhetZPF5yWDTWUZEA=;
 b=bZ2O94qhMkPwfrb9EEbhtv58cLvVH1tbFveXGI1fRJiu2+qA0dTt9UiRsxHVHQSqCk
 WC3TTEkMMWnkfzVM+s7Xdp0yee9JPBgengOtt6BR38nzVFUv/UQmBnBruEYBfZApiVlx
 8vwoUsYm0O3espswKeufitpH2by/mvx85nYaC9JaH3tdtvqDwTzx9VbbRTCTfoyowVRk
 9TXNMsBHukhaVCE1ohEyDA0/kgqV83i2uqS+9+EksZN5Nm8zFEqBvc7y5hIw1OYi6+lw
 tyQr+V4NMlaN4yjuuTVK0P2WOVNyetrr0MWi8BqvJd1DZx6ZVKuVbulbxA//CwMmpdU/
 koBg==
X-Gm-Message-State: AOJu0YxnVmdzVKU3TwawDWc0u9VY5grOMFt6xC6faHeidMIittMab+Wk
 B7xo95XTWfa5kv8PnSvh6xOAtg==
X-Google-Smtp-Source: AGHT+IHImPQ0Kwr3vcyT4G4Q+oZKLib09Ofr5KqKmrosaTuVEe7JUhtFqqgVl+qKUMGIXXd3C0/kEQ==
X-Received: by 2002:a17:906:2c0f:b0:a04:837e:87ad with SMTP id
 e15-20020a1709062c0f00b00a04837e87admr19485534ejh.16.1701269061261; 
 Wed, 29 Nov 2023 06:44:21 -0800 (PST)
Received: from [10.167.154.1]
 (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
 by smtp.gmail.com with ESMTPSA id
 e27-20020a1709062c1b00b009fda627abd9sm7913738ejh.79.2023.11.29.06.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 06:44:20 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 29 Nov 2023 15:44:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v3-4-4cbb567743bb@linaro.org>
References: <20231125-topic-rb1_feat-v3-0-4cbb567743bb@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v3-0-4cbb567743bb@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701269042; l=1156;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ATWzTDawV1rfiW1Rmh2AEVyFtBtlEoO5VeMvQ1CdaLU=;
 b=gCLbtSj3IXRE7+/if0uqlBv010cshUZDoa+DZ7Wgb9Nh9NbRTbzIuCXjHUUX/zxf3B95x8WDA
 mNJxa3PkIHpBoWKs0PxWFtCyzT3RZAqByn3YHBkdxhtCsWXsnLGEY7l
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 04/12] dt-bindings: firmware: qcom,
 scm: Allow interconnect for everyone
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Every Qualcomm SoC physically has a "CRYPTO0<->DDR" interconnect lane.
Allow this property to be present, no matter the SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 0613a37a851a..f3a87a8426d0 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -178,21 +178,6 @@ allOf:
           minItems: 3
           maxItems: 3
 
-  # Interconnects
-  - if:
-      not:
-        properties:
-          compatible:
-            contains:
-              enum:
-                - qcom,scm-qdu1000
-                - qcom,scm-sc8280xp
-                - qcom,scm-sm8450
-                - qcom,scm-sm8550
-    then:
-      properties:
-        interconnects: false
-
   # Interrupts
   - if:
       not:

-- 
2.43.0

