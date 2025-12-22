Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721B8CD58D2
	for <lists+freedreno@lfdr.de>; Mon, 22 Dec 2025 11:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7C210E5B0;
	Mon, 22 Dec 2025 10:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pi+/en7J";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fF6mAE+E";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F309510E334
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:42 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM7rshG3678875
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=NRZ5PDF9RBE
 hUcKxfeiWyFu1TAhirkb+W51QleGLBP4=; b=Pi+/en7JmzqHEhtNNjN4BaO3fVI
 fe0veAIN+Mf3FEVvdd7rpOfCq/qVUbP3MdGY0b3Hyz3lqQ+ppELeEYScJ+N9Naem
 y8c035mmqrlzG0MO8q7aNze91Gdhl5USmnrENYJbtKMnGbzcXS7RvFJROYgIzLR5
 8+yKLZ/ddwBIaCjfaSTO7mkcCTqj1ol9UAozTCuJsGRsquJrTMjngJRHZ96udxwB
 zHk1GKiQk4xSBAi1EdPJtiwrugUI7V1sa7uFm//dFfkI0g5l8cyHmCpW19RI4JNr
 skhmE2l8ggVq4RLLJMCYQrXaBaYoWTwZm0FLU3rzz6/tmO4EBvTDdojdM/w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrtcnvn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8ba026720eeso949494885a.1
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 02:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766399081; x=1767003881;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRZ5PDF9RBEhUcKxfeiWyFu1TAhirkb+W51QleGLBP4=;
 b=fF6mAE+EoqeWVVNJqkB49tsD9dXUSQxsEHPO0SpuMVXReClD34+8/G5yHER3kyPp7F
 N003SN4Q2jWJKuL77DbhuP6imKWxDcJP91gvgP47FHjg0H60tXCXoFnYF2+RYWl2TQ+B
 UvivwrI9rYu4nvnCQgmO23+GFQy+a0om8Vx5u0umY5PzNLEE7Bs1z8y4+yQMCojNxzLc
 fcUxpXtgAmGBl2f8oPfyZY/iiZlSNH/LauwjDgwABVvqtjBZA88iZggwun7MmBxXxqGm
 5QSqjminy2y47L38DyCXWKEPoeSSJS4irxWYJ1p+pH2kKvh7t4W2IZa4psSuemLJJoNT
 t9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766399081; x=1767003881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NRZ5PDF9RBEhUcKxfeiWyFu1TAhirkb+W51QleGLBP4=;
 b=OItXhw5DttXr8L4QzRyQHs7MmmpVJ9qfdLGDlruhgKM2MqyAPhY7X61J7qbeV1fRcA
 utDsfzJp6lgjllvNvYWkW0js0QnU5dv1mclZty+moX6pqVnSwfVhvB00o9Z1xxxH9PzA
 LE6b+SADabSabrZ83nqMC2rs9Ds6cztUyd4BhDnIUHF8yBTqSOLpp31IauRHh0B3uyN1
 4pYSmVhRdCnp+LQdSSV50BTFW9lH93Gn6te0xvVnmDDuFqyn8NXdyTPyfGSSe7lmYH1a
 LneUqfL8wqEDoo6sKIuarfg/48Di8yAagynYgMx+WWY6OMbvrVF7BxjitT0VKrVGUFZC
 uL5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMnXVUb9Y68xIiPUkMJ/i7L4gD+w4tMAFprJZo6UOMyu3u5XY5LEQXayTqSiCdexLeoqPXUHK59xE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSgDkx6s+NXpmzMeHbg0Spq/C62GvItcln1nuyHgnMbn9fk3mL
 IuEPOpZjm8BOvsIXg/pSF3SxvBTVJhvFpM0OIGUn/LPp+V2AlW07+rGffV6stDr7bWxzRNwIVdn
 GEYRtEATFFpSFm0EcbjAz8HPX2fairwAcJ6souNnhzGcuHDoDgplK0EcLbUoygdx4+Ohm6sM=
X-Gm-Gg: AY/fxX7tpNPVsGK8uh5nUesJXNlnsJYJYdf2DbjKZswkuZHfWH2dG6iMeZsX9gVkcw1
 wtaVukjpY7RZg/Jkmx3wNr2IhGtyRz2J/2GFOWrOcYDPi/CWfpvQTl03gS2Oc89CUSNRawO07Qw
 gFFeHk/sVDU6sptiuYjUhB+lfcgZwmgXV/nGeSIvPjUxoXYgK9VaWHBL+KfA/FJhEm0ftzAqdSb
 nsxWcPPC3Qc+G/GAxbVhCTyHwcS0R42hf9Ne5BuLubINWxQ0TwIsHohnQ/v3GF5Bp6Z05w5im5i
 PxigEZCe/88LFKzpB+7ldNPwiFoTokFWYbLhrGAAe0+yrdypnbxBxU0UtnfirONE4tkRJcUAjdT
 x5S7vZBdrMhg4EFyqzqGpsqJHTBZMJ7fORdCdGUNnoF8dRAtRTTWzdLksckoPeC9y/mY=
X-Received: by 2002:a05:622a:652:b0:4ed:b94c:774a with SMTP id
 d75a77b69052e-4f4abcd2a19mr170343901cf.5.1766399081317; 
 Mon, 22 Dec 2025 02:24:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElR4leQwKpUsE2f94dJm6zAV38uLrNz/vxGBS2C6iTgg7iedIsxM/lTMmm2L260FRmeEi26Q==
X-Received: by 2002:a05:622a:652:b0:4ed:b94c:774a with SMTP id
 d75a77b69052e-4f4abcd2a19mr170343561cf.5.1766399080783; 
 Mon, 22 Dec 2025 02:24:40 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f4ac66a1aasm72500001cf.33.2025.12.22.02.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 02:24:40 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 03/11] dt-bindings: display/msm: dsi-controller-main: Add
 Kaanapali
Date: Mon, 22 Dec 2025 18:23:52 +0800
Message-Id: <20251222102400.1109-4-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 18oqbSfnm0q55DfxiVKDuAoLbUCqDkdK
X-Proofpoint-GUID: 18oqbSfnm0q55DfxiVKDuAoLbUCqDkdK
X-Authority-Analysis: v=2.4 cv=CeEFJbrl c=1 sm=1 tr=0 ts=69491c6a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NRHHWUy0EX9jfUzwrTwA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfXzbR4BeU/9A/5
 Uf7jA/J2bLgu1eizf9oSA9qxat6fu3hmGZSQYCTxo7ycZCqKTRYgOlkAR9/0dChnyHbK/XO+Axh
 NgydrhrqLCC4P8sty0DrhWgdL+Q6L9jTIyYo01YAS0Jwq+Uze6qAtF/jQ5Lu5fwx2PzsoOon8n4
 Q9PM0ManxiZEybkV8yh+MrfhMwL6u1wNRJZzHH5Dqx88Re7Luxz/HrJu6ElHGKPmO0KyOQWmxjm
 ZCb8Syy0t0f5OqrQdBEN8kIuVxxSmrEz8wwZZo0uFuU11cvfhF/nvpz9b7I2MG6litc7Hxrbjf/
 aIjzaqshGl4ByLwOOiGcB3RqtLgoERWPVapODTbXeuydJcRETYjUBhwK529TqaDftbPLaP+d3yM
 K3Owt0/A2L8LPE7OuAJkEkKic3dI/+p3QLcObss/wATOaqsecYAsWpyb9Ao5L7u1CRZ3nFzXc7p
 ZQbtHVCUwC2IoHGKBQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220094
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

