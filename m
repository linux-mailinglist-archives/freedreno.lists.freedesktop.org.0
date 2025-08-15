Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 577D1B281BD
	for <lists+freedreno@lfdr.de>; Fri, 15 Aug 2025 16:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AF310E970;
	Fri, 15 Aug 2025 14:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bPOu+Iiw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F1C10E060
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:41 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJSPU032292
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7m1HwxzI8G7RL+o2tt5C5+jDIvVaSDVT2O8wP58iCTY=; b=bPOu+IiwDjR9ymdP
 FCWKD8+hJeyFmM9yhn7JopBQPmbzuGNIw/ntcZrnpqVTbdcOvwHdRvU33iJO+D8U
 EnUBL3UqKG7Jg21avuVTdbFv7TSq+P29tfXwSFFXli7zWXmYkiuyfAVlB6vTtP3v
 +0oUohe9Y65RQ0aoHW6O8fE4RYB8/ubrTnFHsVGTQZsROip2nFARPa65WcQaz+i+
 8gC6vKQ+wA1lJ7wRxZ5NAp6+WkBtHQyBPavdhszVhLxXEA8aXOoda1rNSlBftpsE
 Mlqi41x0231Rr91JXaGk2iH/xlMIx/nDhISvRvpdAolDTWZwuvCsktk3PvADtNmi
 5rxtqQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9qa2arb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70a88dae248so41046356d6.0
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 07:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755268239; x=1755873039;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7m1HwxzI8G7RL+o2tt5C5+jDIvVaSDVT2O8wP58iCTY=;
 b=Wuzb6G7YXZoNnJL9NsJ5Q6gXNuKz6af1LwS9NvcVpowXqJNF6SMY1aSYneLOK3FpRf
 h0tKwJXGABHGWSjlQbCF0ijdakTc3bCkqhuS1VQ+S/5SWdZSKW7t1FHkdCdB/A/B1AZB
 0Y4FBZZaP3HxIOsfwYDN3SC8+aOhR7pAVkMP4w/D9+MfOxoKS+/oHR2MTbBPKzmHui6Y
 rlHpZduoLmT5AAqYTNHAWwuKFjYc/EFk2Bkt94CUUCfxgggpzOx6cJQwj481OTU7qiHI
 YMmSl70xUdaIYnuQ744kONDdGwebFZvJLPJmGLtv8PvTI+eJLb3FMGOBKYtUWx9Bw0pu
 qkSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsFGSWL3uOiRwKp40njZTAb6zXuIgGnP8CxM/OwDtQjDYo5ZtbQNv33i61RqiSzdO8bFXveyd21HE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWPj/dWnt3kHlTlWFNzFPnrqBq5Bup1xXau588DQ3a15MPgMlj
 acGCGWu/RvzYnD9bWruRkkLjtJ8nHTCwNIl0PT+3j7kdwNr7fnGMwv1W5WF05hmHeTBqeErCvSt
 dqTN+9qv5tXFEKS5t4hYi8cBPGV/AcoinC55o5k9RDfhvsDPXmHmEkYAlM8sG5G8dNDjMf/Y=
X-Gm-Gg: ASbGncuKkRByngHoaw5PtEJnzJZddQfAh0A8Hah72P78gOyit3Yl84C7oc2AgmjhC2v
 G4+4hcAOqMQmIpvlx3+YXi+CLDpfWZWOn5BEIaLe7XP+eHttFG7O8Ra3cAp8lH41Oj4fZpo3Kix
 QEIxeRPU6ilfJsFTsTAEedUgA4fncopB20ndE4jZ5g5ONUzQu7wc/Zpn+GmY4/tmgjRMwVQCXZi
 FK/bb1urS5RbLjRx0f5TKe7+9deJooPbWSVHwcvChSnnOqQMc7Zixtlq5TSj57YixiILronOj0O
 PEzUe2oqFMMZISdeuUpmv7ygHSsfgPRCKgnZubKRR3+u3HuozPCmbsrINY0gPETpE6Rj82p4BTm
 YD+KERujdQYUo/ESBWFPr2WTY9NgBC+GxNNNBY5+6nBXGrU/wmIog
X-Received: by 2002:a05:6214:500a:b0:707:6409:d001 with SMTP id
 6a1803df08f44-70b97e3bb48mr87498926d6.21.1755268238477; 
 Fri, 15 Aug 2025 07:30:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8ovjWbOs+92uJ739mohecs8VJyDODcJr3savSKli3vBqXpsZ7ifXXVkzwoE/LbA7woPJTKA==
X-Received: by 2002:a05:6214:500a:b0:707:6409:d001 with SMTP id
 6a1803df08f44-70b97e3bb48mr87497976d6.21.1755268237808; 
 Fri, 15 Aug 2025 07:30:37 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3f358bsm305661e87.110.2025.08.15.07.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 07:30:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 17:30:28 +0300
Subject: [PATCH v6 1/6] dt-bindings: display/msm: dp-controller: allow eDP
 for SA8775P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-dp_mst_bindings-v6-1-e715bbbb5386@oss.qualcomm.com>
References: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
In-Reply-To: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1543;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Mg8cF8dtHa8FBVVXmu7mhjOEv6I2lafX52Q7aTfQdic=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBon0SHXLVyiyAWAnY+ykHy2ruSRC8nKRZgnP/Bn
 xINi6OKiNKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ9EhwAKCRCLPIo+Aiko
 1etFB/4oS7mGdVAc837H48kHj1jUJBhQYGWrSf1sRZ/FqGtBZdkV/0jyuAAoP2duffnj+icLPyl
 2cjqsaEIA+4jfjhEfIw2ZWPXdfrMUPu+vG0TNsohOGDIqFuT6NcSt5CX0sES+CZTig9vE+1AqlC
 SSo+BAHxWcXSxA2l2qhQtL+5g12gn199onkgcpBhUbVKIng9zMMkXwWgYqjXO6WFazboZ+xL3U8
 p/RzfBIlbZVh1npczR4Gc6udiMtTKIrcKHjbGy+S7UHf+UyqT0c13hVw0Gw4clDnvX4Vc8Itxoe
 3Mlwe1IUQDGFmbDtvqHg8r8VNR2ViQlQu23rwrDpPEYDIlP5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689f4490 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iBDq5nSyD7x731avtJAA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: KtbfqvITERhif8t_ZTh7V22c6eRy-sD3
X-Proofpoint-ORIG-GUID: KtbfqvITERhif8t_ZTh7V22c6eRy-sD3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX2yWzHpv7WLnj
 BcdidsC5i0bjcn4TzFfH42ytHZ+hgaE+biFx9uh23GX3HcGwxaX27WAqzGebxadqvX8bdAFTJOC
 a7PTUDak2ocTfaVo2lGJPfP+fRwUb6ToXqD3s6o0/NlgSu91L/DinyZLWRn+pASm5YeaIjJ2FDC
 R5Wd0Jx/oevx+j/TgKWgJSVBBwHYCTSiHpUipWv7a6Fj/oqrf74ItMabph/+WD0Zzl4Cn0Jufal
 iohqksLxqnV+NvEZQsWHnGx3Yu77lFtb9EVF5UZ0JfNJsu1BImwEaRAVdMI9ZU6gajMnvOtaB1K
 pcQbUjD3a2HpJuGqZxcO/ev5efDRbB1w63OnPj9qb2DY6fq+PO+Uc7qQpXKvIDsMp+mM2OFnmPt
 6q/JAL11
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164
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

On Qualcomm SA8775P the DP controller might be driving either a
DisplayPort or a eDP sink (depending on the PHY that is tied to the
controller). Reflect that in the schema.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml        | 25 ++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 9923b065323bbab99de5079b674a0317f3074373..aed3bafa67e3c24d2a876acd29660378b367603a 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -174,12 +174,25 @@ allOf:
       properties:
         "#sound-dai-cells": false
     else:
-      properties:
-        aux-bus: false
-        reg:
-          minItems: 5
-      required:
-        - "#sound-dai-cells"
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,sa8775p-dp
+      then:
+        oneOf:
+          - required:
+              - aux-bus
+          - required:
+              - "#sound-dai-cells"
+      else:
+        properties:
+          aux-bus: false
+          reg:
+            minItems: 5
+        required:
+          - "#sound-dai-cells"
 
 additionalProperties: false
 

-- 
2.47.2

