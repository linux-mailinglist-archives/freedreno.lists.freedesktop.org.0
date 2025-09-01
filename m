Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD269B3DF2C
	for <lists+freedreno@lfdr.de>; Mon,  1 Sep 2025 11:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D9F10E3F2;
	Mon,  1 Sep 2025 09:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="faIWkcy1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37F910E3F3
 for <freedreno@lists.freedesktop.org>; Mon,  1 Sep 2025 09:58:05 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5819eOW6004996
 for <freedreno@lists.freedesktop.org>; Mon, 1 Sep 2025 09:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9GVW1gIOHT36zGHHStOfqVFIcMi+JiFxcWbVSTpf52g=; b=faIWkcy1HtyDoZDL
 Q+EnDMusWVAaJfPBS/QRBb2VqGA5BVVd0WcOzUKKWC27bte2bt3aEc1opygywiHx
 BtnfEZRV1r6O4TXysWRIMcXbf0EtG9ZzYkUKk7psVcHFx0aE7Vug75YaFXudx/Pz
 wizoUE5HzJgyHzhJsnBnFlXfNONZXCDfUB7XMfVUEqVMEOfPzfeaGntt8EARPUR9
 GSSo1dCBJMT8v6el16fwtWSO8CCoXlI1J4lrRznu2uZ69HpOib3NUITQs1OrVMZU
 WPTOOAu8cdFhTRk+iiNipAHxaCGFnr9oBRDlmKbbBoroFDpQYUibvnnR5rQzm3Am
 bH4bbQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ecg2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 01 Sep 2025 09:58:05 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-76e395107e2so4139061b3a.3
 for <freedreno@lists.freedesktop.org>; Mon, 01 Sep 2025 02:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756720684; x=1757325484;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9GVW1gIOHT36zGHHStOfqVFIcMi+JiFxcWbVSTpf52g=;
 b=r4r8oLmts5DtcVAJINnSaTRejJyVWne45yp0Z0YJ0YhJOkqlY5lZqBpH8jGbZSle73
 QhfHJ9W3got/dobeUFC+R/l/+Y43cuuMuuzqPgnPggfKsozZTs6Be2mQ6sxvNV1L5RbY
 ovKssGKAZphy15d2asbbBXnPeMNLkvoPGKcP6Rzp19c3fek1PR/71qvot07vXc8LVUy6
 8qYYHG/Gwt8ELEYn2TAsoVRqz6qsXLJFL8bL/lR+8vgF56XeJr+E8BNM5VWOVbeaaxqZ
 K5FbrAWUTYqt0gGKZ97pHFEMekEBZoYBvJFRn7F7yM7QRxweHt5v3CvkyzcghiLEEw5o
 4sZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaU9niGwQsaRwFfrQwTWl0lrXEuv4F1Tqws3H1AGmRgleAwgxXemy/P7R17sf8brIB8+wmO8GikCs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy09rE570mYU6rWliaHu/fZ1A/aAXtumMsPNMPI0sbv2f519jnD
 Qj6vjLxqdGhU3UqWAsdP0+NNhUzhJymoZmiwOT4FPX1foGnYs3+KQ6yhs4xfLGze0wEgegvwihE
 2hRUZMWiZwtcFYuwH8vMBUkM42OaAcLdt6NIli1sRX5RbQfNH16mpSTfJrClMUN0MKZuqKX8=
X-Gm-Gg: ASbGncvLd3wl4LpNkDA5mkRhxE5CGitFMnVHnQI/lbmKDemQJDI+uDXi5OVf+kWKq4E
 h2JscICcSeji6VoM+30tNL2jTCpQGHWMXd5wyqlFvM43H+WI2o37YJqnNBJCmHLOrk8Rmb0xSib
 i6HnsTxAZaCvrClgZm5JD9zXjQU9uQRB3yNzdDoQkW5OoPaOdyhEetwJ4Wl8+6QljqUGQmOpPLe
 29wvpda/sKeJvfUd6vOTOaWWbvbzIMvQ+PLedifcDva3CjFKREduUobNPKdeMHzwIVU3J8tckC2
 GgFrHvU4BMxErVnckxF9EHFBtu6jNLEoV+6vcNWzesDndN4nyKr6hVBRx0ZqWUky/lUcTrs=
X-Received: by 2002:a05:6a00:114b:b0:771:d7b0:6944 with SMTP id
 d2e1a72fcca58-7723e21ed20mr7659583b3a.3.1756720684324; 
 Mon, 01 Sep 2025 02:58:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJ4t0f/6dn3YuGE5Wx0MO+C+CC91j1Fu+2H7Lm7vL9NLa+L4y4wVquOSVTbCTnxjl+phdOyg==
X-Received: by 2002:a05:6a00:114b:b0:771:d7b0:6944 with SMTP id
 d2e1a72fcca58-7723e21ed20mr7659552b3a.3.1756720683837; 
 Mon, 01 Sep 2025 02:58:03 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bfe2sm10305656b3a.14.2025.09.01.02.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:58:03 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 17:57:29 +0800
Subject: [PATCH v10 1/6] dt-bindings: display/msm: Document the DPU for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcs8300_mdss-v10-1-87cab7e48479@oss.qualcomm.com>
References: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
In-Reply-To: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756720667; l=1298;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=gB7HmGiD8GjEmuy7612J5648tP6/6MkBhyVIM4ydbsE=;
 b=QZLcbjlZXSWETLypy0qkDZdYxYFXq1VwXGtpQNUqWZ6Rqjs7x+mz2AEfwgjCQAvWn+9sXu9j8
 kU7/WR51wGCBNNK6QPhPdB2/aQBCRXrjH8W/5Tz2m80nZ2bzYCP+3sT
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-GUID: akld-P98zqWMhtGf91Z6pZUTMkhPosfr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX5/PFVqzilfOd
 a4oWf08QKoVPhAy8TQLxY+Yge0cOHaO22uBB/Z03YvMgCOc9yGAP9y9eitZozU9WlTJhfN4h2+N
 uc44tITs2m2AbmG4fUxYdCwim+jjYp4E4GfvYmww7c+xvMgMLHFHppTP1UqxQz5je+ZoYpZtOmd
 GeztGz1jjGY81fphAQqaV3MuJuJsSB4kR9d0S5iYluwJJqWaosllU3L5fsMQUDNtm3xoUV/VeId
 HZABXajPF79sQ57cMlKTxOHrD90SjYDy4Mb80xjuHP6/RJ6pbS4L7gwsiMDiFuEMKPaRyfJg9NB
 3ZltrLg5vKxpdHvNcp615psJlOrsXpv4Us4mIX8yHVxfpAFN04uOp0cm9lfRQBI8sw0OhrnIlTc
 hqp5L7WB
X-Proofpoint-ORIG-GUID: akld-P98zqWMhtGf91Z6pZUTMkhPosfr
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b56e2d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=5ixSZjX4nqodb9qzXsEA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
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

Document the DPU for Qualcomm QCS8300 platform. It use the same DPU
hardware with SA8775P and reuse it's driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml  | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd8680371ed031f7773859716f49c3aa1..d9b980a897229860dae76f25bd947405e3910925 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -13,11 +13,16 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-dpu
-      - qcom,sm8650-dpu
-      - qcom,sm8750-dpu
-      - qcom,x1e80100-dpu
+    oneOf:
+      - enum:
+          - qcom,sa8775p-dpu
+          - qcom,sm8650-dpu
+          - qcom,sm8750-dpu
+          - qcom,x1e80100-dpu
+      - items:
+          - enum:
+              - qcom,qcs8300-dpu
+          - const: qcom,sa8775p-dpu
 
   reg:
     items:

-- 
2.34.1

