Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506A58FB457
	for <lists+freedreno@lfdr.de>; Tue,  4 Jun 2024 15:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4AD10E495;
	Tue,  4 Jun 2024 13:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="TXvPhIy1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6073910E493
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jun 2024 13:50:54 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52b87e8ba1eso5840542e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jun 2024 06:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1717509052; x=1718113852;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DAxZmX6/vrF9fWzRMYvQiNF/0jN2EbEz/3Bo7MBhqt8=;
 b=TXvPhIy1VPnERj4eRg+m9PbNmhjK4m21P4YzxFFrXunxRclnaVnfaHRsStgX9v4wf/
 yUl99yjWkTYVmJWEpCSJvjFZvpkp0bT+RijBtQPi6qcRalkbRqO11P/BR5mmtVYWGMWb
 5Lqk5qJAPTujKAYJIoPrKPYBOl4HFpMz3QuYSeNxzqynubhVCKbMzLTN9k0c2Iu2cxP3
 UR4Zw5XbzFQWLbV+vTZ8jovwu01pHykMuOheC/YbK+Cu8ITcxbedydyJmkLgSfzFSnWp
 yb03ahyioK+Lqq7DXU/1HLuz3X68aJpRlVKPE0w7hlTdv2EqpkVnGmaVLdeZuX/W8ppq
 /ftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717509052; x=1718113852;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DAxZmX6/vrF9fWzRMYvQiNF/0jN2EbEz/3Bo7MBhqt8=;
 b=sC+jRaZJRFeeYwAJvxtHffGdH5YrtVS2YfqhaQVf6CxrKlMSMCE3z7F2b2Qa/AOw5T
 3FGCUgpxBWQVIbuxU7Rrf6PyppVjT8w8tDBizoxVE4Jziazz6j+UBsZLraktEAn+41MY
 VwIh2eu3rsaIYPo4XOfB3rSVbKlfE1Irve2az5fGr6JxGvpdFmaMq6poQaEFpVVotKWp
 ybnoo3J57K2t0myFIFbxiCo6aNUUm9U+coMG6VnHdfe9waeYCHxhxH0jLxMyjfJyZ2sL
 3AGL1pA7s/UYf7CPBQVz8WRBV08/k5UvsxqSeaU4PRb04T1Kfg2cxUQbjRxJ2LAO+qdP
 USfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFNs+q/jp8MgFnRBCNoGBTbhsPfXy5Zc66wEoBVxBp6E2+w1I6RkzZ4N2rGNw/ojGtsYxJwsNB6XZif2eZAWwBCq9PRVLWgkaEXxqMlwOQ
X-Gm-Message-State: AOJu0YznESXeXTI1lYHbsvT98mT3bX0V0tp2b6F4ZAbb8BUJdU80dgpF
 rxa77vs21EmtTZqGQ1xXCy5cW9ifG778cIvznYYHguv5NNk8jTNac0aLa34GF5Y=
X-Google-Smtp-Source: AGHT+IHMiuaN/QXE2W2FVQQlvPqF+jnsGtvfXm41KlLvHHQfKwwkQ7H70L30Pz3XUGcM7ni3Los60g==
X-Received: by 2002:a05:6512:54e:b0:52b:851d:4db6 with SMTP id
 2adb3069b0e04-52b8957b271mr8132955e87.26.1717509052405; 
 Tue, 04 Jun 2024 06:50:52 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42133227f8asm139569755e9.19.2024.06.04.06.50.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 06:50:52 -0700 (PDT)
Message-ID: <9d54a12a-ae66-491c-aa1e-96b7daa02201@freebox.fr>
Date: Tue, 4 Jun 2024 15:47:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/4] dt-bindings: display/msm: hdmi: add qcom,hdmi-tx-8998
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 MSM <linux-arm-msm@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>
Content-Language: en-US
In-Reply-To: <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

HDMI TX block embedded in the APQ8098.

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index 47e97669821c3..13199f1676f7c 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -19,14 +19,15 @@ properties:
       - qcom,hdmi-tx-8974
       - qcom,hdmi-tx-8994
       - qcom,hdmi-tx-8996
+      - qcom,hdmi-tx-8998
 
   clocks:
     minItems: 1
-    maxItems: 5
+    maxItems: 8
 
   clock-names:
     minItems: 1
-    maxItems: 5
+    maxItems: 8
 
   reg:
     minItems: 1
@@ -151,6 +152,27 @@ allOf:
             - const: extp
         hdmi-mux-supplies: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hdmi-tx-8998
+    then:
+      properties:
+        clocks:
+          minItems: 8
+        clock-names:
+          items:
+            - const: mdp_core
+            - const: mnoc
+            - const: iface
+            - const: bus
+            - const: iface_mmss
+            - const: core
+            - const: alt_iface
+            - const: extp
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

