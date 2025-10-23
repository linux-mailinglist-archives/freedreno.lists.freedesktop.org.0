Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6C1C014B1
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 15:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DAD10E0EA;
	Thu, 23 Oct 2025 13:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PkKKtOpI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE4810E8CC
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:47 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6iTK7026532
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=j1IIJSrPTfw
 ivQCAHihRszXwyf0kfSMjdUDkP6+21Yk=; b=PkKKtOpIyQLVTGsRai2jXSJzHkE
 8A0G2xLZ1PYKj4BRtH4q2geggWIOzrO0xWu2zGuWap83DvfuVBY5fZLedqNvlKUr
 RKHG5bvBTab2IwasBUJ+pt0ih5ovCCj2AP3uxEznB+rmzVZLSZl/NtrRIkr4AtPS
 x1sNWeVLLwGGshDDp+OP9WH6Nke+xFjS7AvrnqLACHbIpZXWp9Rkg/EhKRfe2s9X
 Evb5UbVFzxLsls84bApSHgfKtgX1V6AFRBbTTGMc8CV7v2i3AUG/mktp2jj92O2U
 rzmwR/gZU1fX6tGpRd06oe0s1e+6j2rmWvPFW9Tf7I7GBumY0avAC610HMw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kfcht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7a277277cb7so791706b3a.3
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 01:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761206866; x=1761811666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j1IIJSrPTfwivQCAHihRszXwyf0kfSMjdUDkP6+21Yk=;
 b=kKNJ4AsmL04qoXu2yLazvuHZlU4m8qQOGd6dUYlHcR9XS+INeV54W06Nd/Gh+U7Yki
 +8h5uuF5cFWTbd3rcTWCLHvBJw3tHlvNR3+zxErsCmmbxfpx5b3as229gqiJ/Pw3FHd+
 ekEonJw3fL7Zr64SWI97kzyT2x19JryXGWtQfbQOEy26obrWVbVtvsIDV7tJp4WNT/k3
 3DN99aS5aYkHchCHcOGFf/YmzrxdM1jm958AliYcM+dDtJggD8PWWAXYSwhpIKui56mn
 fof1BhNCjHL+la5lgCKQkB4IrodbH589rpJaeh2Gexu3g9fSDTUXbVapfwfhtrA4Cveh
 96OQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuwSl7Le2UXaA9+ngFGpxOVexsCAH3VfyBrboSxR3+T6hCMlhddX0hS6WpJ8UBbPaNIo0mlnx9EsQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXeEAfN56NWKs9hpl7mWyw2OQcV2zMqEqQo6EtOpW0F34CDIPc
 mJ5gP4ZjBtQI0iyD4bj3dy5wsH9ODvONaax6lUUpRlbnmD1HN60S0z5wRq0VtiYmqaxnqOONJdR
 H1BfLWFuLyBFooI6GhEz8CvXo6Xe4kbJv0pTRigzhBhe00pJQYt8YSub70ojmzo/Yp4lJ82U=
X-Gm-Gg: ASbGncv3YfKpqBSoidU/i5/fMwi/bu8sTDZMrtpau72AY68E1ZXB9lhoYPUHa02PRfz
 SImv+s7FkYiId6LO26/6aFuZ5i9ZoLO2A7BSEKxC5xRo+M2HItWv3afRhtlL47wR5gXcr8CAEOz
 hIziNydn3UUqE1Ws4Yc6iSg20Cm6Fc9l4ShQL4G+UslnFyhj6M4SxjaXQmEHfiAvWC+yTsQ2R62
 sh8X7wSF8eW8yKnESbN3dOlHed3uWYPuxiYcq/XnAv3xSCFniPeDg1GlRoSqywz1GstCXOnDTJZ
 tacoTN/gpQT2twe8xg57Qf16fNq+wObXKSJxyivKgnJBLb7QWwm4ms7EFZSEeNvtE6EELsCugWk
 JW+hpDTaPcn1O2l3i8lTQFt/2NgtZ07eUOukM540i5YykpE9OEw==
X-Received: by 2002:a05:6a00:1707:b0:7a2:7792:a47e with SMTP id
 d2e1a72fcca58-7a27792cff9mr1270479b3a.8.1761206866515; 
 Thu, 23 Oct 2025 01:07:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm29AEfViqZ/xwI8Z4NkviSg6rNCA4U/hY4ny+YB6ujwOOvByBjS3fyeNcsd8nDzK1JHj/mQ==
X-Received: by 2002:a05:6a00:1707:b0:7a2:7792:a47e with SMTP id
 d2e1a72fcca58-7a27792cff9mr1270451b3a.8.1761206866100; 
 Thu, 23 Oct 2025 01:07:46 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a274a9cec5sm1676410b3a.20.2025.10.23.01.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 01:07:45 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH 11/12] dt-bindings: display/msm: dsi-controller-main: Add
 Kaanapali
Date: Thu, 23 Oct 2025 16:06:08 +0800
Message-Id: <20251023080609.1212-6-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: G07ama1Lzmfpj88jAmRvvDqF7JB6ykmR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX9+2c8HBB61dd
 jo/5i7cjzXbut2G9q+Bmfxzb+YP4/w6WS1FtW1KuUy3alzYE1dSyge+LHGdbaVYbVFo/GM4ue6d
 bLH/dtley3NT8ci5Ps9vS9d4+V675+qNLO33Y1hbLH7zBB91uqk3z8N+M6Wbp48nkP8CtQJWRPI
 Zu6n/C0/Y/dpEmfLrLuswFLVRONRozQ8j4XiDhU+C+eQ6rMpqZqJfFZuUIExlWIFpAt8Zq+p94z
 YwdN9Gu+qsZT5Ho8Ma2E93vZYQDvAR/sMaPbc8upvwQGEQfor21Ovk/Ff9uhntVrb2YVfCLT5YZ
 UPvqjllnhL8qi8GLE+lsnnkTJ3vB9+2Xu13+f2OTdDXJUGXfSC1vx52Zfhsb6mj3tev/iFOH3+c
 d76zSAUYpXXmcixp1T9nmf1yOqqayQ==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f9e253 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=NRHHWUy0EX9jfUzwrTwA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: G07ama1Lzmfpj88jAmRvvDqF7JB6ykmR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031
X-Mailman-Approved-At: Thu, 23 Oct 2025 13:16:01 +0000
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DSI Controller for Kaanapali.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 4400d4cce072..536ebf331828 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - qcom,apq8064-dsi-ctrl
+              - qcom,kaanapali-dsi-ctrl
               - qcom,msm8226-dsi-ctrl
               - qcom,msm8916-dsi-ctrl
               - qcom,msm8953-dsi-ctrl
@@ -369,6 +370,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-dsi-ctrl
               - qcom,sm8750-dsi-ctrl
     then:
       properties:
-- 
2.34.1

