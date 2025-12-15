Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A70CBCFA9
	for <lists+freedreno@lfdr.de>; Mon, 15 Dec 2025 09:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C865910E3A2;
	Mon, 15 Dec 2025 08:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e39neXgb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/7a0BPb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A03A10E39D
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:13 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BF00KLf2366429
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=OqlJLDbVw4T
 n78JJhjxStsJzAZqGZdEBuegjg/h0GSI=; b=e39neXgbZS2rDcxHUr4/HLOsedp
 sIzFQ/+TleNw6ZWsGQjK0ZVvJhE+3G3cDIUQx2U+5Onx1lWTp7eSpzjLHa+pRyW6
 Qv7jlWcmV3unqe5f7NS/+GJG4tsTHLfBmm6cOAMnNLRtdBoGlhiKhe3pi2uiL+f6
 sB7G6q50FVntmVe0x7K1fZbHH+hA07q2eNtPEhthhkoC3dZUc3Ervh0NXMVoCmi6
 TEBgpuHhzjU0C00i7wI1PgfRGzGm8+K5FcsMdoZJ1/iNRujpRJb1mMXD5UhITFNR
 9VoAvune1NlQKT9UZ/xXt1fMJRNYAO3IE+99Pii274o9q8m6xmy2W8CZDDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11afbtyy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2de6600c0so850368985a.1
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 00:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765788012; x=1766392812;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OqlJLDbVw4Tn78JJhjxStsJzAZqGZdEBuegjg/h0GSI=;
 b=e/7a0BPbr44xUKVYXndgxAokdl6KC9Nn9uJ4apYon8b4NHDEoOzyuovGFq9N+N70t5
 BoQIX+9PofvATsQHaS5fanUaS/37QGW6cDVOAzdd81emc8BDKRstGQ7A04rptTDFkLPc
 ElE5/Bf8uMSGHYJJTiG+KCzBeuzPq3rx6PlP8mMBLV37OYyoEPozX389Zm41lKK4AUDA
 SzFWCkqOclPo7c2kPBywZtkMV072MOddKOaomwWVkO1Vt3F4UGppTUcD0br4p9aAXmX0
 Z4AyXozpErC48ZxD0ThxHy+bpWyPMcZiV10VkcrrGNTEZAW7xeRWeQCbzZ2bw0aAB7wj
 X9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765788012; x=1766392812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OqlJLDbVw4Tn78JJhjxStsJzAZqGZdEBuegjg/h0GSI=;
 b=eb7PlHRgdoOOooPBrSF23ddCV5zAHgQ2UI6Ke+4agUqGn6J2N0qzJlbjl4nuOQ9V5K
 hqlDuTnOeLcmPVIk+My7z/DjUeVwiZ17wYJ9xMBGvFxyG+9cAeizssfymnmid5Ey4g5J
 gp3NH81L+YQfsdPhHRBie0Ck332TfkLuzqZnB5xmHAjK4U+z0im/zPGvyArN9q9w3/d6
 qhxzFF5/Z7fSMr6Rwo2uLHFDX5WT10R2puoCtudb0YcLwc/Us2iG6RTjDHrFDpA1KZDE
 iGgvSwuVHAU29pVgFE/lt+MldwtO7ZXoH7AkAW/H9m+lRzjC7uJcztyIc1LYsmkZa17s
 zoaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFY17gqxjrGcdp8U5krgPssfCHpxyNZdwdNNQ4W+8sNb/n7GdsiYS6iGrM/xiGOW7miRpyRFsYB9s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwuOtpssgajEFazyEzqJS6TASUmoE1c3eSbipDEVv5wB/31Qwl
 8Py7fcONGjBuQUBk4xQy1NhWe8eKjq2vEYli975iANf9VRz303sppY6xGLHEpFOxOh8u5IQzoQl
 eNjY0GFKA6oLcMQUEmBtLVqzzP0CYGFnuNHHVs7JIC5ZCsACnqLyatNg2iC63GLQenkzyOEI=
X-Gm-Gg: AY/fxX6Cuj6WKqzZYBgIW2j/HuPMaxb6WdiBDdOTjXsQHTT67Ij9ITFmTtCeDpP6lo7
 IHeIf/ih9tMYZsBgW0lpvbrHiBx3rJWE+jFXUxrIDjgTFmDvxPwOB0WSrqsqg2MdGeBfoiSXNGl
 EeMdu37IHP2BTVg6IhHXSt179S65Y2g37Q94HyMlwG3AE2qVst9JLy0k53n3p/ZSjxK2E2y+8wb
 868fVkGe75eNEM7PF34n7fJOonz9piDKZnQletwWU+QvqlH55IW5GRnGPt7dEAP5l7qDuKqJSCN
 9qA6jb8QvAFoE4Fxahnr0gRyT9dBi4BpkNKlJCl1BD22fSMtgY0h/OwK4EpZUVh+mr6xrUbroDN
 oDqrPNWo+nvPfM5Sqto9U+Sp8D94vzWEnJ78wEE0UaKmdOe4wZOSp8RbgqBQmRn5MrKs=
X-Received: by 2002:ac8:6a0c:0:b0:4f1:df6f:6399 with SMTP id
 d75a77b69052e-4f1df6f6fa6mr64921161cf.14.1765788011984; 
 Mon, 15 Dec 2025 00:40:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjq6cUNKx8n0oIPZ+dTibjwjdoBvKbVns0jWdiwucSy+EN2FmAkVrey2CIl/19EhkHEWqZXA==
X-Received: by 2002:ac8:6a0c:0:b0:4f1:df6f:6399 with SMTP id
 d75a77b69052e-4f1df6f6fa6mr64921031cf.14.1765788011576; 
 Mon, 15 Dec 2025 00:40:11 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 00:40:11 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: [PATCH v3 03/11] dt-bindings: display/msm: dsi-controller-main: Add
 Kaanapali
Date: Mon, 15 Dec 2025 16:38:46 +0800
Message-Id: <20251215083854.577-4-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TtDrRTXh c=1 sm=1 tr=0 ts=693fc96c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NRHHWUy0EX9jfUzwrTwA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MSBTYWx0ZWRfXwdnr1ydiSEJz
 ubE8zluLS0bom64nHvEsptzTv9zskfz4zenVE9HO1Udxp2tff15OSw4P8gEgBdGVOdcyWz3GbqA
 VQ9tTHNSXxMzc5z989rRDQyNmOb17VOVLwXzP7l+fDT6LIp54Q0RuSbkSmRCM6ttqIcGhv7tK3E
 fM0Elz0OQwOTkhnoMmpB6epcWiKRV+xygnZJk4DIwUIMCvSfvAYUYm1Fq2u+xBHeex7IngZuDo7
 kXLc1/Hv1q+8h4ZoIfD0HqzxK1xD+DAAeL1dcCQLH4+qFmbhooLs7JGvuqferz1fjDjrjEfaCe/
 PduKKw9yN9uXQBfvbHGZ50a0XSNBHGYagkMWs7Pnvr5NgGRAsl7zV8qMka+/cisdetITlRsUAhF
 oLyluxpSaKs7i/eATBGYruw5EdJ1zw==
X-Proofpoint-GUID: nMQExJNtLlS6mNWLSXrssO0W9M-T5ws7
X-Proofpoint-ORIG-GUID: nMQExJNtLlS6mNWLSXrssO0W9M-T5ws7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150071
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

The DSI registers on the Kaanapali platform differ from those on SM8750.
So add DSI for Kaanapali to compatible these changes.

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

