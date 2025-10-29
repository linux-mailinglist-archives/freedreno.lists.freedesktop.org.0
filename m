Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C91C19322
	for <lists+freedreno@lfdr.de>; Wed, 29 Oct 2025 09:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BCC10E770;
	Wed, 29 Oct 2025 08:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3Tw5nHp";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6GK2wYy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF8E10E76F
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 08:51:57 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59T8TTQf4135357
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 08:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IzFssouc9mamtc9gsC/kHechOIc88AvDywUnbNXgus0=; b=C3Tw5nHpALgj+0qW
 tXRn0MptmjOfd3RmVrEqCgzgzBoe4shjTzPAABkERvD/tBs2I7IIEBbyyO3WqWzf
 sST6p5zwrzb5H/KRn6nhZzkSLRWgyWkahBJJGzWJPBZ+z0gntxqqF8lgRZMMU1kK
 8FVa+V/nnTgyFr3H+pGrs0jJPKPWggpqOlHp/b3ITCwKbx4Tm5Ixqy2m9fXFBQWv
 hm/U8bMH/6nBNh+ytPSBVHHI0OKJNKHW4IEwctOfXIymZ0XSMW6iNsy3TLYUz1v5
 VzxiLCUSnpAvXm0rYg+tcBJArV6EBbnSeNcsfUIP0/aJ8+dU9r9DaZd4POJBH2yC
 T5sXnQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ff9r297-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 08:51:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-89ee646359cso1561088885a.1
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 01:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761727916; x=1762332716;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IzFssouc9mamtc9gsC/kHechOIc88AvDywUnbNXgus0=;
 b=H6GK2wYyifxTpe+uhBYEBASv+DghKV4XOCLM+O0N+bUkapmkh4XMm9tIZNHEpjEdI/
 pTkQwsZK0CvgcxcK1+IxuUhnAfQ+Nn1M33KKl0tBDeKsBqcEfU0fpsnYnNqoctScfkTH
 gu/nTwF9vd+jJcd2R1GWcyGrT4h3VUbJg6tEIjQGvEXfF1ZzZ3p9oBFU0+a8h4RBfHbx
 stYykLngPAdpwBzaK5imI6Qa0qDHjR18cHCW/pwi7b0PG9M+LExRQvgT7vE7fSguF/Q2
 Z/l6df1MBP5NBvs8Lyd8UDWj+pd6/DbSBylfA3dCZoxgAtekO/k6LDJOz4HYSpz+tGxh
 Wznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761727916; x=1762332716;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IzFssouc9mamtc9gsC/kHechOIc88AvDywUnbNXgus0=;
 b=mhPgovQ4HTPPuB81ouVaI4743GC+mNpm3gJXk8k2AOglsJHm9c1V9Z2FjuHvIUphNd
 IOe3vWEBnoAJv54kQGVAgX1lPQE/RHjqzgf7ft5N3COBnlvwX1Aum3D7g3GTowVlcabV
 uJX6LPFock+/WYPtLYFCxX62ayoj0/+TTQ6/JsJlMIuoJnYt6j6bEQB2QdIUUHvIgiz8
 ZW/aYBi2lFxnrNKDq1YLqcV+2v6+qC/ZRLOL6AxP0y4YNcCxXptc1eo4I+SYMXOcgoOw
 mROckgFmmNGCcujbmXyZ+Q5HlYn1raHXgtnqI2EeSieSfHt2f+1dJ0m/9CwQSF4AcDhB
 G0Rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKWjqmfeSZ5Z3IjQU539m1ULjGh6tNqf7M43jUJRYVdP/JpxVl4Z++4cxVpwDZ3J5fFpLPTW/+8Hk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yys8QnPjg9DUElH6LKlkpWFXLvfE1NLvELEWPebgOVc/yGRgz85
 wk0JOlv8dfWAa1LbFnetfEZfc5s1X2lrCU0R97ncBh9JLYzxJvd/z3/LwH+ux1XdX6osCt3pNKu
 TH3cAczxQbqEYh69hfsCBjntFuHGVK0M5E+ZbR+r4OgY/UcWsyKQ3DwrGHkmDU0nNmEsh61E=
X-Gm-Gg: ASbGncv6NUBZheuI9gO5j/1r00O6R22DkKcNJX2UV6YtLynD+cBoK2Ej9fHRf/Uc6WK
 dpETCJ8jnmC7ZJtiy4FCreg8e4pZMzEtLPGVo1/5LC9cQrWYTsD4sc3zf0ZHdfS3mFQuu1eZAwY
 K/TxmpgJdf685/1mrEvu0QvD8agk/yxwV4fijbuRd5107ez3qsRGSPzNpz5mCo+erNVSUZ5f0hs
 w0bV4XH6lm1ETchPcpedgXkrmRIkNosylLSNun4qEJJ47PVniOsl3wxTILUokm2lyUkfCn4JBkO
 iXMGDEm55lb5XlxvEjPt4aoHYDGQqxNKebG+5lkxMP/xRB8VfmmqdV3ZjoreIv9m8hvVACyLsjT
 nZOApXuKXkDouWr7RV7Nk1a0=
X-Received: by 2002:a05:620a:40d4:b0:891:a480:ee92 with SMTP id
 af79cd13be357-8a8e8f4b236mr263533485a.5.1761727916293; 
 Wed, 29 Oct 2025 01:51:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFI2PPKXtce5YNBSyc9dJxl21ePvANeElFkhe5Zdk44ZWE7owVm6fkHwQ2Bv7PW0DPT8yoJzw==
X-Received: by 2002:a05:620a:40d4:b0:891:a480:ee92 with SMTP id
 af79cd13be357-8a8e8f4b236mr263531985a.5.1761727915839; 
 Wed, 29 Oct 2025 01:51:55 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ed0817602dsm36760171cf.18.2025.10.29.01.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 01:51:55 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 16:51:34 +0800
Subject: [PATCH v13 1/5] dt-bindings: display/msm: Document the DPU for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-qcs8300_mdss-v13-1-e8c8c4f82da2@oss.qualcomm.com>
References: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
In-Reply-To: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
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
 Konrad Dybcio <konradybcio@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761727898; l=1242;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=fxALVBYM7qYW96U/dSw79twk6v0y6XKjhtJ/F/CsPC8=;
 b=/VZVTs/VCe7bEotB+iOg1SXvQxgcLXB73EUedAC6ofipNZxQMOrmecv2X3OIP4zJJRWiOZ1v/
 sgCB+hAwthmDkZ9K/e9+jc+Sq+3GbOhUuqoe+dIa3hA7sgc7TMZb42I
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: MvT3vbdQeVyUxJuZgM_5OA0kgQXH83kX
X-Proofpoint-GUID: MvT3vbdQeVyUxJuZgM_5OA0kgQXH83kX
X-Authority-Analysis: v=2.4 cv=Cf4FJbrl c=1 sm=1 tr=0 ts=6901d5ad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=0ru3Ub4c0dYyKLRCKckA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2NSBTYWx0ZWRfX0oZC2mb3vfqE
 3f8S8Rn41c/RNzMn28dFUAB3quEh0NljWQv8dh4vSHvGEyXhKS3jsSqYN86NDV0A/24DCzgklH1
 G2wo0lmnvOTJivuO0TWzCHsd6P5AGbIytzc+K3hcmSATleeJIW+wQ/nUg01hCMZVp+QVtOw3RSe
 1CcJccqOCbiKURyWN5l/ayfRTawLGdpMEuHLjfYcTjeaG2el0DvRKvzf4uwNofb/yD22xul6EXK
 TYFe8z9tlzIJdrK/v7187CdpoTHeg+RFGzXtUNQry0xnRTvzJN3sCgNY4crg4qswSlXbcrSyGkM
 men2KjqdYlbCmJAKC0iZIke3FoIlzz3e3MUNGZ3bgXSvuI/gCtCmTtfixdNZ2GFqHBiBZhb5+hO
 v8Tji4bxN1brCND8tYB0lC6zKdAvOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290065
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
index 0a46120dd868..d9b980a89722 100644
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
2.43.0

