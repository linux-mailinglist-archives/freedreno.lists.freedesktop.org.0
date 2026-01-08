Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E77EBD01AFB
	for <lists+freedreno@lfdr.de>; Thu, 08 Jan 2026 09:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20BA10E6AF;
	Thu,  8 Jan 2026 08:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="V/NgMbHG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhsSnfa/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F411210E6B3
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jan 2026 08:57:50 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6084e2943751241
 for <freedreno@lists.freedesktop.org>; Thu, 8 Jan 2026 08:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=NRZ5PDF9RBE
 hUcKxfeiWyFu1TAhirkb+W51QleGLBP4=; b=V/NgMbHGwytnHcwRH+OIQIbn5sb
 g1pDt8phGBBmNuweA9cE5zhRdgAEOLbiKoBpoAFK3N4pFhjJAQh9+WuCgaqPQr8H
 ePDxx+Lfl8/v1CMv6dKFJU//sbNaGu/uE0St/HIRBgaro9CpLvnholPbJ80UZNBe
 tcx+PAS6r8voI/Lliaq0fLXGSuV4oMn+QRneWqVaA73yQ8/5zPTt/EpNffygC0Ue
 ux2Z4ubAz7Tlri/6eYKHaq3ELsR+Zes/mt/dFDMoTu2ArCc9eFg+PKdG43BImoAS
 39JJ+TL+9euaH/H894Uf6awGPsPRQL1aKM1O+94JqXrma1qalJ8SvgZcazg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuxctjh2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 08:57:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2217a9c60so521903685a.3
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 00:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767862669; x=1768467469;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRZ5PDF9RBEhUcKxfeiWyFu1TAhirkb+W51QleGLBP4=;
 b=EhsSnfa/BWQQK4gjuA5HOD2u7Duqojd1RNKC742epoWavQhcawgyGfPAy1eQ/ELjOx
 YGPDqyny/+Oa8V0fct5Gffi+j05GQXYDDNf1TZcA5edRDZpT9wGSFyULPQT/yEwjlhJJ
 WaQaICIFWrDC2fMBZKjbY+UbZZ1MNow/cBLUlleNILloOIACIYi5SbNC8W3HUxo9zBaX
 DISVgY1VeLtlAPwPtPrikLpAlP3D/8yMKQccS9DSNC52BrM6/M+YO+T4rofaDmAZnjiS
 eZC2Fk1VnkDwu7zurhVC5AYfVtVvxecB+LJlhtpfEbIp9q9AgpP3Du/IbbYkt74/VaIN
 mEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767862669; x=1768467469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NRZ5PDF9RBEhUcKxfeiWyFu1TAhirkb+W51QleGLBP4=;
 b=uL/BpHZpHWNojnj6KHZWHVOrvMN1kpIr+UsJp3ax6eDggLMBQIXkIOOR3QdglaoEHI
 FdArBxBzzIZfDyhYTlDOsvCdXp2c2l+rDEU8qKX3vegL0Ghf5V40ed4NEx5SkXDmu/uh
 P4A6TLfqkgbVja9lyKLLfzinTSSrnw7kl6ViBhnoO4kCGC7wV1hI0PdPHNF/TustwX+2
 mgMGd0h/EqLcDmOTbBrHdP3rePH6xjiGdy/lTH8TSy03oUexNXOAj8bM+1aCj5wwiZJ+
 YHtQUALmoXZFxvmHSAJrIVzCvzOcoOClLlEl/bS+FlMoyioTrFaz7WO7zCAHGKu7GYaY
 MA6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHUAZcw5h2Y6ecWRtvQNEACB8VZzrP/y5xRObnEAO617gq440YNscxyf3oS7aXZvww1nUOcY8ShNI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmzqgebfPRXoxTBpt/SCmXpcdMUb44n4y74N53Teat9zZDiHy8
 rnlXbFQ9CUrHDRzRG1/f8KG3gkwjm6omuKQyR8lNqFoeAkts7LahKmQfn5h4nTjhkP0EZfEgURA
 dmJ7f5cnzQEjjP15+E6d27J9oCb3Jn1Hj0DWN+QjuAFiE+vrMyExOZUAEM2s9H8QSApnhPzI=
X-Gm-Gg: AY/fxX5VKhbEzXdxtuP/KpwFgHwXiTW0S0DkiCKxQZSPTbGO7RBfOuytHgskZUI25Pv
 EmAAQZq5TT9vT+/MQ505F2RvZAYkCqJe3o6NUzGyK8hvG1eYdHeQkcyPt74VvjqtQMOWG0sBXsp
 yxFsUHWAeIy3mi/i7mjmr4++HTr6yZ5dwju5JagvPbQkyeycnH1p8SloY/XeAldaSF4gvrmm7v+
 Feza8NEfaMf5ylwqYBrUTYE+3dgr2XEyEVx/88CmESXDEZrx6SmMTYcPO+0QQSaEGNXUxZRoI0A
 Y3QiTkI5sPUtrZdNzZL8BWHVU3C3abooZPx0qlxXpnu1nP35TsEmYXjsCiuvmXA7A3mh//S6h26
 L5xYWu8BfGTZOyiaGYaZMG5kUH5uM5ost/lDEgZ3zdkF9mDnXWbqGOiIW1yAALiIpIG4=
X-Received: by 2002:a05:620a:298c:b0:8b2:e4f0:74c4 with SMTP id
 af79cd13be357-8c389425fadmr683908285a.84.1767862669514; 
 Thu, 08 Jan 2026 00:57:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLLiQ2dezWmxrUQBvh6EJdewjfDR82QVVpGRNZoYXLCqohZhvAtKpz5cj7Yjy4V79SxksFKQ==
X-Received: by 2002:a05:620a:298c:b0:8b2:e4f0:74c4 with SMTP id
 af79cd13be357-8c389425fadmr683906985a.84.1767862669125; 
 Thu, 08 Jan 2026 00:57:49 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:57:48 -0800 (PST)
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
Subject: [PATCH v5 03/12] dt-bindings: display/msm: dsi-controller-main: Add
 Kaanapali
Date: Thu,  8 Jan 2026 16:56:50 +0800
Message-Id: <20260108085659.790-4-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX9+fNG4Y/IZvd
 1K4XXLZCsoKTop1ZyZZaXxXGoM+AS/cOnEgUy2WNfLOMcCgqJhUrcOYB4qA6IZbX3VWGjUySBH6
 X6uFrwb7a7mua8ZTfy0YsoxT3J3Db4Ys+24UtIDYFbXawwNqjmmDpd8W79PNwVvrZRB2UWfb9Cl
 Qg1H+oplSxrRouPUeNToIXdjNcn4iHlES/9xv4LxZlKBIJgeIVHl+EiDzZJ/VrO1HotK8pCFnM7
 JouUaxjeBon5yEgUbpK0+9YoiK9EBNSha7hTiaAq8xcdHAPi86YJ7d6cKpybyuhzUhQI8uEmTLi
 Rw6h4+ECI/gXUWMlGXVCL6YJAQSiMsSHbFFm0R4Ymu97zmDIL0sU0eyOm1XMhDVzpidtSOGaICr
 toxp8WMsYZkVU6fwE4pQ87f98FEQCq2eWbgYHwnUpSwLOGRSOhp2xgq6dRipMr/lEf2RCSVXzh8
 pGeuFF9uNd8TTFMAP8Q==
X-Proofpoint-ORIG-GUID: RWDvMO-l3B81rGBszgG4105a-ZBHpxt7
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=695f718e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NRHHWUy0EX9jfUzwrTwA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: RWDvMO-l3B81rGBszgG4105a-ZBHpxt7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080059
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

