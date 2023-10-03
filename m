Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1A07B5E96
	for <lists+freedreno@lfdr.de>; Tue,  3 Oct 2023 03:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FDC10E19B;
	Tue,  3 Oct 2023 01:21:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B445F10E19A;
 Tue,  3 Oct 2023 01:21:43 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-77421a47db6so31194685a.0; 
 Mon, 02 Oct 2023 18:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696296103; x=1696900903; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PIKmGdB/3utN+fo5YOdVXRGf1bdkoiZsUcVvijZ0k1o=;
 b=CDUhV7X2fQ6fwjt+NvQzRWofdRFh6jkyURVlc4RyHDP2gAb5PFxvaDjRMWc06E8yYU
 2QaRMYvLqOxg7Afbf8yHH7qOtQ/Bo9UV0YHUOtG4tlPuAFN5P7KXUALKegiVw2mY1Edy
 UBKC3tZnCp734GrXRb0nNFAm8VIjRHvC14QALbHUPY7SvjAucOmtLgEVsXY4LOVokm8k
 IqNzuB4uJzD9GfSG6IoZDThN1bTOl8BofCmu7NS1f4Epu+Ku4EloJ7jo9rPz+/l7T9am
 HwMOm3FqcXHJxUwsO0SSB5DSAwpRtdcbXo3YhQm8aVXSERXqLsJYissnPJUZ5Ecsqliy
 aplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696296103; x=1696900903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PIKmGdB/3utN+fo5YOdVXRGf1bdkoiZsUcVvijZ0k1o=;
 b=UP/pQGGx1GJmdhdnw4Ptt9nwNmZAlfWUCcygXUT4V/DkXsv6csQIX04B+Y1FuwM7qR
 MjQW4oGT+Gj5XEONt8ZTRlBWP9a+1NuJOd2hT/RM68+IvWzX+ez7tCuX2Py5UIoojFZM
 4Xb8bUh4oZ/hyZ5PqiZBd/6m/n4E95KW61QuJMypyJd4FjfhFpfkDUg5luk0pnkmjCpV
 LvwQ6Y4eXtWnRGM/I6JRmWlIBoMGxVnl7vKwHg7KnSdM2hyUsBzUr7VFUa6QYYts4kpt
 VXKM7ddWrF+60kf847UXzKZxsW3splWbeYbbzWy5ICbXUjPdsN2YCLHdLpiHENApYCSb
 ymig==
X-Gm-Message-State: AOJu0Yx2P7FZYAGGFxTY/BWIaK5lwkFpk+/PRyu9tHWNookdeouB9qsj
 qelDQ8KwvWHMSX0zuLVCwkA=
X-Google-Smtp-Source: AGHT+IHNw8OGFUKkkjiEB8fAXFWK2G4+EKx2/dfUGfePzwxGu8lQ/VgsWBi879Zgmova1OXAa/z7Mg==
X-Received: by 2002:a05:620a:15b1:b0:775:7e16:2cdf with SMTP id
 f17-20020a05620a15b100b007757e162cdfmr11749871qkk.39.1696296102740; 
 Mon, 02 Oct 2023 18:21:42 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::efbe])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a05620a126700b00767d8e12ce3sm52577qkl.49.2023.10.02.18.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 18:21:42 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Ryan McCann <quic_rmccann@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Liu Shixin <liushixin2@huawei.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Date: Mon,  2 Oct 2023 21:21:23 -0400
Message-ID: <20231003012119.857198-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231003012119.857198-9-mailingradian@gmail.com>
References: <20231003012119.857198-9-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/6] dt-bindings: display/msm: sdm845-dpu:
 Describe SDM670
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
Cc: Richard Acayan <mailingradian@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The SDM670 display controller has the same requirements as the SDM845
display controller, despite having distinct properties as described in
the catalog. Add the compatible for SDM670 to the SDM845 controller.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
index b917064bdf33..dc11fd421a27 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
@@ -13,7 +13,9 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sdm845-dpu
+    enum:
+      - qcom,sdm670-dpu
+      - qcom,sdm845-dpu
 
   reg:
     items:
-- 
2.42.0

