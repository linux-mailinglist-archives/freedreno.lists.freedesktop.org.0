Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0595ECBCF8E
	for <lists+freedreno@lfdr.de>; Mon, 15 Dec 2025 09:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03CB10E39D;
	Mon, 15 Dec 2025 08:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OjWJaUnS";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4HVtvEt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A319810E39D
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:39:57 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BENhSES3413224
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Z3dXAwZWQrX
 iznkoQcO7REoUwgPXToMeXoe6XzLEAy4=; b=OjWJaUnSMoVHGmjEYa7k5SmdQNw
 GvXUPQBa1AhpGUJsO+WETgWYbb3W6Hd4/PDRnDiScIA4M02HAjWbz8sLFmCSexCH
 SBZG9MRWqWlH4v2JryvxiPcVB2quUXacP1CxCB/Ky40KCgYwMuP8mN1OHezYRgg+
 kHAc0ZJuInPOM+UpPAmXuVnF//LZF7S+yTAkREgUZyn1+LU1Fqitn6ZbgGre/pb1
 K3bF0FmlD+6ULIk3pCq2Nkbio7ACbjqfI9aaQ3UlfcuTY+6x5Yeyd7wGZ2mPESKj
 x7fcAR2jgJfreVCB2iPivPtwgFXcl2zpMoJP2ZvxKVSeNC0xfUa4Sl4fZBg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11dsbsn1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:39:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed74e6c468so45868711cf.3
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 00:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765787996; x=1766392796;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
 b=G4HVtvEtAzhxFJgRPpEsKCpKEAkekm/TQwOvIae2qwDFkKsLBXw9wid8NgYySow6Wa
 w21YgdIY4vcgG06yi/3cnAVN7uQN4WJTV6eRlRnplpwLUp7p+dvnr9QZlNDTkSNFCDDy
 ULhBPxsBTyQG1HMuISZmarkrIQ4uNbSkyrQ/tCYt3n3fafenVRCqRAf9e0wDe1bc5r0Q
 cTISt45nvw0DxN26nR9Ve3BlbSSn/Og/aSTlyoHVtr4fiYS8WPHQeMNidjehpfwAcYmj
 ZMMzedJL9YC2T916Q9FZn1uiI0mqZkZ9CPlPwmzyeWw+yzuvNgqTiWt+s0haGZXXk68y
 i3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765787996; x=1766392796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
 b=XTIYIQebhqY6htkOxJKDayvmhlDYKuKA90gwPdYDqu3L25ZBxmLC1JIy1K0HLjZM82
 9IDF6qfp/TV3N6tw+4ikgFIFZ5M1ajo3RFjuMEb1x0/xZauP3ohzciPCL992RJBQB8Mz
 oJNNTwfA9XJ6N+FHMNUpjqAD7qzH6y8+MnDo2wMsTO3vrioxjztGEgivZzC3t2sYKp78
 MvOGHbyElMvlvXVxPROyWRPfKvSzLLAGlIRTfWl3scnznF2iScZ2comYGmtj8NV02B+V
 dY6wcecdllkjQ3gpbHPUT0VvbgZrrPpFoE4Qf1PcAAB+YCeyt8Rsvkz4LhqV/BovKdB6
 4YTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6VDDlI0Z0TD3cIeC1yd3UGwbzxx8g9Dswlbuw/MP/FHjEZz0y3HuFU3x+dgmb8elJM2L/9SehrSY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFok1Ga/Vbd4SpxdTe+WpoDH66xthWTJo01JSsBTPzcz9JlKj/
 LJY0tGnTKxQZTDjHlAqCbHb3kNro2YxdTVOTjXvIV8k9P+CpHrg5T8rvEgYdU4G3BALC1JHU+gs
 cVIUZ2FgsqqYvvdgqDiIOLuk2aJx4K+3ANFrtajTE4cd6GJOtyR9TKPgyVZc/JOVt+51WeQU=
X-Gm-Gg: AY/fxX68SSRWg+TK4n4vPMg5kwuAntbt04aR8MieuO8Z4mDF9xX6fL1BYXPx9mcJPin
 KW3SCbPruol2AHT/raiI91sdB9cn1L1ZxPaa4byQC6OKY/cxhJBEgmzcb38j90elIwbF/VW+0EZ
 hTGz7PDVaYviDlFnW78c5Dv59yC/tS+WmwAdfUUrhXj70sVHKJXa6qQi9xugUnfHQdAQXO9yDiO
 9g/dsVRVgrg4OHXoB2Su1uXRydmnAPWkRp60kcks4qCnCtXMrF1R3NwCx3bs2EFHy6uakpaSlvI
 tkhR4kJm+KtTIIDyepRqvmzae5Xe7Db3auSgxgguzHLtnFgMiIY6KK/93etKRjFxfRbineCL8mm
 DzbDORStLnSLwTeE7Fv3Wx8f1liLbP/NPIXKxooS1bh5lYlffN0YIF2yr+Xyp5Fho6ac=
X-Received: by 2002:a05:622a:60f:b0:4ee:2984:7d95 with SMTP id
 d75a77b69052e-4f1d04ac58cmr145353841cf.13.1765787996231; 
 Mon, 15 Dec 2025 00:39:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoFWVPMAV6JlXUuSiLN649BtOiFD1OzCUudJcet20PnZk/76ESO1U7JtloETSwBkU1CL9nCw==
X-Received: by 2002:a05:622a:60f:b0:4ee:2984:7d95 with SMTP id
 d75a77b69052e-4f1d04ac58cmr145353601cf.13.1765787995655; 
 Mon, 15 Dec 2025 00:39:55 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 00:39:55 -0800 (PST)
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
Subject: [PATCH v3 01/11] dt-bindings: display/msm: qcom,
 kaanapali-dpu: Add Kaanapali
Date: Mon, 15 Dec 2025 16:38:44 +0800
Message-Id: <20251215083854.577-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: h_gLcVegK90NqFkB4lZpG_mQsr491FwY
X-Proofpoint-ORIG-GUID: h_gLcVegK90NqFkB4lZpG_mQsr491FwY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MSBTYWx0ZWRfX3qWRSiLtPBfI
 WVPMGK+QvxBthtzm23z5BiSbUxcjjZo3AF5L2uoJ3dmvMS7c4tI+0dmJs3tNiBf6Z/0Go0RDYow
 uadtxXsoQdlDyRmMzK6iIDPqfmzgpMG4AptQfUl4jrGLFwobn7cmKU+YH3LVrxQSgOfihvy5JBi
 DBzLpe827XJIKGCvszqIkRfzpGpuPHvO+kEKRuDfoPErbukg0rrAIAwvg+X0+nwtWm6yvOJ2Pcr
 zm0z4gZpBjuaUX/q2o/9JKr/Eaz6fsbPqHsfLNGPQsFivvwjrLWUxdHkR8a1AjJF4nMbESLzWNv
 0UZ+Mhk2Ug/sCX4W6flvkuFbckPyeCQy5oF76kpWzKShaXqZNvanXQT91593OgzkE4WlrsRcK+t
 4PZuRw2EtgtDtKL4Xs+MlKO8eJJGOQ==
X-Authority-Analysis: v=2.4 cv=cfLfb3DM c=1 sm=1 tr=0 ts=693fc95c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=LEfPF28z9Y6gGZEU5FYA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
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

Add DPU version 13.0 for Qualcomm Kaanapali Soc. The Kaanapali
DPU and SM8750 have significant differences, including additions
and removals of registers, as well as changes in register addresses.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index fe296e3186d0..e29c4687c3a2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -16,6 +16,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dpu
+          - qcom,kaanapali-dpu
           - qcom,sa8775p-dpu
           - qcom,sm8650-dpu
           - qcom,sm8750-dpu
-- 
2.34.1

