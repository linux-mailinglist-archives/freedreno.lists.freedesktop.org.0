Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6160B4162B
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 09:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7327F10E0EE;
	Wed,  3 Sep 2025 07:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhP6YCn0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903E510E0EE
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 07:20:18 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832x62q010139
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 07:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PR6KqsPCNUM+EZNcWonweXt6CFzY44sPfHX2M7jwd74=; b=WhP6YCn0bkXXOkys
 EFEdGtm70REHJV1emT2YiqfAql4S28V40ku38wqrVS+fWnbF2Db1LAqThyrtw1nz
 dvkzSygM8E9XmT/TMc+mqjYY8q831hCkTv75Y6/NO+XWPVVBd6zK8Cc/wgp/Dd0Y
 lMs4cvXFdBb2texc9SxEz9RaB11usHC7hJHIKW+YH2Oa6cCYJLs5wHl7Yiti1OqB
 5G1rEC6bfwJBRN8D7O9NnJomdiWg6JkW+5DO6ky/byHqpm7lJtE503E2gHgtXF/Z
 EW5uOLbdh0JLGl3urfzT51ncIugEhqPmDlWlNgtqyVU/Np8frLrjhtR0Pov5x09D
 M1Yh1g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ejqm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 07:20:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-77250d676b0so815904b3a.0
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 00:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756884017; x=1757488817;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PR6KqsPCNUM+EZNcWonweXt6CFzY44sPfHX2M7jwd74=;
 b=ampYliI2nztpmgFW4LRKQihPZ8OBWlzqtb2FX+hH/Ia4TzG3wZ3cydKz9Qa8Cm94I6
 LEyEC1DzZbWgTFc0f/B3ZLdd/4wOXezCZtlgD31Lj+h8IuF9K7HtlwVvnRdH5dGCn8re
 /yH0eRCqwez3CSaHoyveEvha4kcD2C9c6rLIfxOkFkwMP31G37Nq2UuuGhbQWr+4pBU+
 ETuJ+kNG0lu5dp6H+q5d5yhbPqVWBlBoEIJpzmjShLMk+cHcJGYzsHI3aXAFqnkvk2qm
 MLE6/Zv0gnf1iPKx2+SKL3VAHuSUJGcYl4tXaCU72S6TdxOAutKybSuYo9m+hkYGoKp3
 cllA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJgeu77dqjz8l9PJi3x93qiV/2oh8xBGKXnADruqEmri9ZiPtnvUc+x+RVk6B0X1E07OJHtmSy+3E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0wNawavDrHaHuqeRXu7zQQto4i0P1Rs0BAgjLQxys79R5y0Lg
 uKV8HmxYaXZknfL0beM7On40dMdsVdSPE2Lca6nwT0eSSkQPnQy7PmeUnBU8iyF9ZLsgyXlKmpp
 jR8h7M95s1WdAHXfRrA2c+UKpOH7r9ITCmzRXJMjmCXnlI5ObExS7bVoYQnMTJL337T4Kds8=
X-Gm-Gg: ASbGncusqRBFezvEEIg84dJDcuc2qPGyhYR/Gt3zoTCrOo2TW5aAK2QgxpK3ae1C3R+
 75Mvg1PFfSZ7rzXgYxj4w6asUf6TYPKZPzOmQQ+5DCaF6mZ6J7KXBjhY6FYMENAaSniHbENHbw0
 tH2Bmy+B2AUSDXbONC1o1UeJGhag146tPBshdv4WJJItihF1sJB1r2uJYg2jyQ0TYh59yQRNNHt
 Jqjdj73Vi9AIpGFkhEx4h0ulnn/w9+9AngD1G60eeO8P3m+aAqbdfZErcgc1IMQkhdLq1VnTwrK
 JXqjTRanKo+Y+wbs/c84mKVxvrTTJJvhBj8Xlpgqn4MeAmOiCphOjRkCExHa9bqh
X-Received: by 2002:a05:6a00:138e:b0:76e:7ab9:a239 with SMTP id
 d2e1a72fcca58-7723c5c841bmr19009904b3a.16.1756884017221; 
 Wed, 03 Sep 2025 00:20:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoCKD0QFh/hM1sUteZfm2odrN6P+2cM9K5e1ZRXWq6q8tcAxq9HE3dI/77BQtbZrh4URINKA==
X-Received: by 2002:a05:6a00:138e:b0:76e:7ab9:a239 with SMTP id
 d2e1a72fcca58-7723c5c841bmr19009871b3a.16.1756884016695; 
 Wed, 03 Sep 2025 00:20:16 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a2b78d7sm15816191b3a.30.2025.09.03.00.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 00:20:16 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 12:49:52 +0530
Subject: [PATCH v5 1/5] dt-bindings: display/msm/gmu: Update Adreno 623
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-a623-gpu-support-v5-1-5398585e2981@oss.qualcomm.com>
References: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
In-Reply-To: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756884002; l=1928;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=u87CzBgcXsITaBIhArlZrl9vUsN6j2cKpyp8cwIsM1o=;
 b=CiL9c+CxrSxF6MC52aVaGcpBg9TQe2gy4Y8Jxg1eWT61ioWHIbVTfgmwHGthgwBy6xFhNGIuo
 MlZS8xehYqdC431+l2BX2XaNWR5GpZOMBdClLX1Okkx4eDs3yvXlzfR
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: Ee-8NbX4pBP9exLDdtggIhiGqqxIGrg4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX3z0zA2XoZBd6
 Cq9RE0KVIp8hBzK+0KlM6WJz5X6vkHKo+TKBJxMp1TT9/z7YvpH3DD3S4WzxgO7SF1YKhOtrezf
 BbOlArT4RE35mL3iHCBITEdZnUdWzRzge16rqRQW5WoCYtYx/gCzwtz4RJNyZS88owmb9Id6Q1/
 3OUNkRjTKvFxIipVXPwxb5DvygtZG8MYRT/riIkk/Q36wgtAZq8SwntnJYEYJRaGPhV1d3tT45N
 +YDhHEUQlfcNxV9oE5yKHjxo/JdcjXMzI8G+/yKjgrkGSjPgfW/d7jxiJJlhEGUXe8G2hMa/C/K
 G3Z9i1HeWb22GkPPwWwEcbE2SP3je2BETwcWWinHk61wkFs+W0RQfZif39Raf20EPTsZCB6yHxJ
 VXuPRfBP
X-Proofpoint-ORIG-GUID: Ee-8NbX4pBP9exLDdtggIhiGqqxIGrg4
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b7ec32 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=Z2Up3Oz-XkvUWgdIv6MA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
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

From: Jie Zhang <quic_jiezh@quicinc.com>

Update Adreno 623's dt-binding to remove smmu_clk which is not required
for this GMU.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 4392aa7a4ffe2492d69a21e067be1f42e00016d8..afc1879357440c137cadeb2d9a74ae8459570a25 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -124,6 +124,40 @@ allOf:
           contains:
             enum:
               - qcom,adreno-gmu-623.0
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+            - description: Resource controller registers
+            - description: GMU PDC registers
+        reg-names:
+          items:
+            - const: gmu
+            - const: rscc
+            - const: gmu_pdc
+        clocks:
+          items:
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU AXI clock
+            - description: GPU MEMNOC clock
+            - description: GPU AHB clock
+            - description: GPU HUB CX clock
+        clock-names:
+          items:
+            - const: gmu
+            - const: cxo
+            - const: axi
+            - const: memnoc
+            - const: ahb
+            - const: hub
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
               - qcom,adreno-gmu-635.0
               - qcom,adreno-gmu-660.1
               - qcom,adreno-gmu-663.0

-- 
2.50.1

