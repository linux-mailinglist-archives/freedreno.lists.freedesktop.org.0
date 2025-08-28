Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C244B3ADB3
	for <lists+freedreno@lfdr.de>; Fri, 29 Aug 2025 00:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF7010EAF0;
	Thu, 28 Aug 2025 22:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KOwXSvHF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7E810EAF0
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:28 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWiGQ006523
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9CzfHCqMGwSglqPBGTXjDnFh1Uf1qA700EaDFGkGlqQ=; b=KOwXSvHFq3Q+Sk3H
 wqB+Kx1iY6eREtTX+dCys026Z+kuLoItLwF20J+IUUAS+sgKyZuaMlRnv5ChnnsV
 rhhtsM1RYXNDX4PYtVZ9UzD0+fWa/TzwTjszfmmkirPJ1uK/5Bs9o8IZoN+uYQpu
 piCBnyHWj3wzdJa3I3aEg2ftc7b5dfS8Xqz0qvk2Who+gGPpKVMqAKNqoolLjJ9R
 3JVxKLQpHWFBcV5Y1hiSuRFkOutEFWxg7VN8BE3ch8OoUmMTVnhf1eF8B9Nmo5Q7
 xrzEkmwqOy7QALHn41Rn6xYpJj+a32J+uFSlMHsLOVS4hXtsGGcARM07N2CLGwPH
 IzLeXw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tbpgks58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b29a0b8a6aso35157051cf.0
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 15:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756421307; x=1757026107;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9CzfHCqMGwSglqPBGTXjDnFh1Uf1qA700EaDFGkGlqQ=;
 b=Kwt5ZKSzVLi/vWOF0LGSwvH2ot9LwqsSvXxQy5yKT/L8bY+yJYeOoAaCh1wKMJell6
 mM34QwhzFRHsV74SR/eToVTKXagSJErb5H3xWWB+LjS+Ynzw6cOn23s31DB0VHcfi88t
 rByzWE2/FOuIcOzf1s8KafkLNOGriurJmeyzpkz6nFUAitigRhxOWIHdE11VLwufsk1o
 SP7hUQ6HOi9h73MZt2PJAqmbwno7DByGZMfwweyMf36oHvak+5nK5ppauNrO/FRhVJkg
 EJvmnZsJVuUaPQacXZA7AQuAMOW+AVf1vcYfDYYSW/whuwtSNudBxH5BJJc6YXYeSE4h
 4Agg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvSJbITmiT1rwdzPONCUmf52y8Hv48CXjFDLuyHWACjs8ppCtQQdUouv+opwj/3m7TcBd4zauFW4g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2ddpmoA9m4iU6CYT/lkn/NZxoMchDsodc7GXl5Bay/PDeoWfN
 oJwXtrJ+Y5Ugn9pliRxKKOoe4WJS0zbwFBlZ8d1XAn5haKq6zR/3xsjxpkvc/D2EWImQW2XTmkj
 45zCA8Ks49w91VcajqbTlT2WSbAe0hdw9+40bfYobcUtH5p7waezHO5PBeMrhGZNPu7h++Zs=
X-Gm-Gg: ASbGnctRpRSeZeY1TsmeNLsnySz5jBxPMEyg+Enm061P4TCjkOwoCA0PuU1XzWylrCn
 GVOGAkb31zifIw30PCnbDhj+HXv806rP7dQK5FTGI3GdbnxGV/Gk3dnFzjIt4ZkzoL9wiMbVC8w
 15Xg5BJRYs8+HqUTr2ggql4PGcu3duvtGH8kJtghQeA6JGKOkCpMIfGwFUNmQdLSpf9+phoZev7
 KIZvihTBHBdvgpWlA8Wj9z+RqgPkh+QgyeahfWYqdBFzWo0iq41AD1Xswo/s64OKmnpz5ZrLPB8
 i4KXaQxJYOBA44RpGJFXyxaUQIz/cdOblEhN8qvFVhvYsUCdZQSJnX3iUNGeeqfOV7KpA6J7hBZ
 ceUliVrjuMbi6qmozwTT8tvQx9c55O6nH9VtWnTHkB5KxqSlrWqu9
X-Received: by 2002:a05:622a:1448:b0:4b2:d2e6:65c2 with SMTP id
 d75a77b69052e-4b2d2e668b9mr191806291cf.80.1756421306601; 
 Thu, 28 Aug 2025 15:48:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCdAdhID476E4FJAsgJd9Dlj9RXcXjRQlt01OfE2NZY0X5oYh9UoxCNApwcv9zL+zVkYW02A==
X-Received: by 2002:a05:622a:1448:b0:4b2:d2e6:65c2 with SMTP id
 d75a77b69052e-4b2d2e668b9mr191806001cf.80.1756421306131; 
 Thu, 28 Aug 2025 15:48:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f678452e1sm143807e87.85.2025.08.28.15.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 15:48:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 01:48:17 +0300
Subject: [PATCH v7 4/9] dt-bindings: display/msm: qcom,x1e80100-mdss:
 correct DP addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-dp_mst_bindings-v7-4-2b268a43917b@oss.qualcomm.com>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
In-Reply-To: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jGBROFXef1Ek+8wHh+Y3Ci+prYLBgIDZTxGb8ga6KTM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBosNyw/ResXLlslDfwBRdxj/Br6oQIkGV9nwqWN
 G2EP6JxFBmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLDcsAAKCRCLPIo+Aiko
 1Z2YB/4pMQvDDG5j4PigCLCfVpG/aqvA10fBcLpnjQZin+TrGjbiVbyaanCFF0bOzmLTy9U/XFP
 w0eocswluxidVH3/VuavvWJZPsTJLgvSlLm828Dwuy4iXwi49S/yYtrVv4nzQtIBPWZyO/mjdQC
 cXy9ekuZHQ3gUXTbOZYdV2ceKluEniDwCSwsghhKvmAb7NvwrMwWIu+20OiSKhPc1Erjk5xooNe
 KlHIG7x+yKff2WlskCbxjIbztAiLvGHYRIS2HcVAZOBeXvzaB3UKiFVJZf4ZyVwnEKXT8nLqdVK
 eeKd8mXeg81XaOPvubEnlUKfO2etkVGN+SEXRcuScEUxhT9i
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: mQoEEy2cmJMluYfHKxKCmpv2rnRQ0Q21
X-Proofpoint-ORIG-GUID: mQoEEy2cmJMluYfHKxKCmpv2rnRQ0Q21
X-Authority-Analysis: v=2.4 cv=G7gcE8k5 c=1 sm=1 tr=0 ts=68b0dcbb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fvGZ3mk3BhhUN7shqj8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDE5OSBTYWx0ZWRfX4i8rZpFSsGI8
 w2el9bac/HGeZPU3fVm2YyF873Hvjwn7Fce1nHNhziyVSJkaifl/9hEGmjofc80mWcB6j/Gjcj6
 7FmX45smtkd+2GhZxfSyTDPcLO8CTA7+3/6YOCxkkpQlbfzng4w876IAalgnucqyV7R5frpptu0
 sHV24/GNeg5ru2zXKlXK1MhQF18d2X/N+0EDnnKBYoilHnKgDGY5xk1BnKZ8tS/TH2qRaX4XwQY
 7viZG9pWfEQYYS4VGnlv7amKexEW0jk8TdViSRD/WAodZlxv2aMVCvjUcTtQ312phM2T94EP8Hc
 7iWNU1QcIv73FcwfsBcfK1bKtftY+vortVmK93veez6/FVOW5elIG62IPIs/HIeXJ15ETUBS+hE
 nO0KS+O+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508270199
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Fix c&p error and correct example to use 32-bit addressing (as the rest
of the example DT does) instead of 64-bit (as the platform does).  It
got unnoticed before since DP controller node wasn't validated against
DT schema because of the missing compatible.

Fixes: 81de267367d4 ("dt-bindings: display/msm: Document MDSS on X1E80100")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
index 3b01a0e473332c331be36f7983fb8012652a8412..e35230a864379c195600ff67820d6a39b6f73ef4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -170,11 +170,11 @@ examples:
 
         displayport-controller@ae90000 {
             compatible = "qcom,x1e80100-dp";
-            reg = <0 0xae90000 0 0x200>,
-                  <0 0xae90200 0 0x200>,
-                  <0 0xae90400 0 0x600>,
-                  <0 0xae91000 0 0x400>,
-                  <0 0xae91400 0 0x400>;
+            reg = <0xae90000 0x200>,
+                  <0xae90200 0x200>,
+                  <0xae90400 0x600>,
+                  <0xae91000 0x400>,
+                  <0xae91400 0x400>;
 
             interrupt-parent = <&mdss>;
             interrupts = <12>;

-- 
2.47.2

