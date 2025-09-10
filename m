Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 516B9B51584
	for <lists+freedreno@lfdr.de>; Wed, 10 Sep 2025 13:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D06210E8E5;
	Wed, 10 Sep 2025 11:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AhMdYRrB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF9310E8EA
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:18 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFLGM032155
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8xCz4z0Bi/57zqJUn/Mu/aLwfF4knJr/ZgFBZ7thB9k=; b=AhMdYRrBoiwiY/1V
 xEChmpMDD1v90QbkJStq44JDSMtwAiIA8errZSW444pOjGSTp0lDVRqIkqamX+bB
 h2Rfolu5xm5Wk1E/5WAGlQ/VJzODA+7N6oXEb0OazwdyXgkJcmqOrBmr2EQzJw8K
 fMb01O+kLFpyePaRS6JFxPiVZ1rHWia8be550csJqrGqC9S+DUc6+PQz0PoYCOfL
 L+L2cUtWUuso3UfRfYUk1itKgJe8LfReBn3ak0aSvSRrdvIl+CMn64gY2sprwcx2
 aGfNPxwDPr3r7y0sxKWQOUOeeoJNW/hU1xi6LceifgOWbbbu1zFLNziy25vqZ5Xu
 AzgqJw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m3h5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7725b4273acso13597391b3a.1
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 04:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757503577; x=1758108377;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8xCz4z0Bi/57zqJUn/Mu/aLwfF4knJr/ZgFBZ7thB9k=;
 b=F+M+F/uLZ5tlXuqopEduuqvX3wROhO6KpKxgNb14hv85kLbYCJwsy//QxXvkVNXHgr
 HAdb2Br8oGp9pOWZddHCM8WN5ya2/gzWaJpmL+pNRQYIwNjqslH5BVErxYS/qlLUxVd7
 kNwaNNPw90ETfr0qP0KfZLIACP6DglvzpH70S0mEFvBANM181jXfLpaOSK6YtTvqTuVR
 GYq76Jr3vB+aqAYjKT/VOXqqK72VY8QdH+/vx2CZTDX2LKAXmssjJrv5ncjKoRZ2LDuj
 OD+MsHi8v2VnUcgyfRe/qgCIfEaQUOfkPuI8QoJgdb/znPIpQZszlHGMkqKeVQqjZxKT
 A8CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFiaFVvmFZsrCnphZnH3gNSP3xqU9wR0k8JZbDUBBndzJWs7JELpq5dIhOkA5gxyR22iCn4exhrnA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfuYnLszUlfEhlLzCoUXhT7jcVn+6/39FZG9YzWICwr06EezDP
 mYbzwEIS8Y0aMX/Ywxt7s4GNJcterSLOT5t0VTB4lUt7GtLMuq0cKodw2n/gylCJ3HVnj9EZYXI
 rZBqr71Yiiw5C+9JY+mGZ+rGEXvvYEaGQHJQK6+lMfXaVay6R0y7xUWByydW+I5/b564QD+8=
X-Gm-Gg: ASbGncumb129dTmqC4wkwd+UQoxHahc6sRRZyfnc98fEbGiOn87bngwwUhZKLtri33x
 TvM7njthdombmTEsFK4Yt8cXmD7rjR9J4FRaQnLZLyUFkQ79VHOnikpztRUbDHZV7dzSafWyHc2
 7JyHloT1zJraKsli+L9XgZkYNILcXoCcQof4L1VThE95GK5Bv1Irzdrr7ROWlxHAJM9iFavZjfN
 F5+pwHMfX9YfGJTclocbPguEHCTRg91Pu3XZd7UGI1yok6IxdSir/bBjyZzIWmvulp6uQIBBgMh
 8JJ2/neLyPok8HJO5nhl1Afw4io+NmE/184EZK+lY6xiwIJxb3w+OCLLmA/ux4Xu
X-Received: by 2002:a05:6a00:4b01:b0:770:4b1c:8155 with SMTP id
 d2e1a72fcca58-7742df2f3bamr20536947b3a.31.1757503577292; 
 Wed, 10 Sep 2025 04:26:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+QDB9UfSTw2dpK6r9PESzhtTxePgwetKm4/3FAkoGJBYT+EgDiwgz5uRPw9lAa0ANlB5rGQ==
X-Received: by 2002:a05:6a00:4b01:b0:770:4b1c:8155 with SMTP id
 d2e1a72fcca58-7742df2f3bamr20536906b3a.31.1757503576750; 
 Wed, 10 Sep 2025 04:26:16 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-774662c7384sm4862260b3a.76.2025.09.10.04.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 04:26:16 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 16:55:22 +0530
Subject: [PATCH v6 2/6] dt-bindings: nvmem: qfprom: Add sa8775p compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-a663-gpu-support-v6-2-5da15827b249@oss.qualcomm.com>
References: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
In-Reply-To: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757503556; l=928;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=PL01mJ0RQboPDnIbyuTFQL2+JjE45/PjCXjxeBASbKU=;
 b=jbHbZpOfOJnlTpNnSBL+ndOzzQcLInmZVQoFwGPwAfCej3VR+/xoFNWKsr/YC7aCrzP97N+4w
 KVWvC5iBnK9AOH+xqLminNazLWF26SM4yGMZR3CsuW/pcOFkMFDYIvJ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX+sCV1mUKBzcD
 Btnxs9FJps9J9crW2qQaDthqUi1OkvJQKXaRyjrhDvyxyMOwQFAgVk/ybcgv+CepgeGkYjnzaxc
 vDkVLrN2TkhA7cec0eZIacZAcpX4F7hR/7R8hCgT8goHVcENuTAuv9YPaApENwjGZlo/XnFys75
 A6uoBeHS2oTK87iygncG9JZrrYBFdz5nyulYXzghVZkGErEpWgFqMLaF3h1QPVpN55R+Bin4zKc
 bIEg9T4je+mQdnUmhADuidsMNq46xCtW5fHUhpT21QSx9aC/gT3bcMhYTabsJRXcVKINApmwMZY
 aHMPa/zvA12ftY2OLoJ7d6tym0VmM6axoW6m5ttWwoPwcdv8Bnyp28yMwrhSDxNV2HwiNH6lG33
 GeXm/FGY
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c1605a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=TNpnUgr77EDisZP18eEA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: erZoqYPgU3xASUhvm3uSahbm-BgS8zeQ
X-Proofpoint-ORIG-GUID: erZoqYPgU3xASUhvm3uSahbm-BgS8zeQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

Document compatible string for the QFPROM on Lemans platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 3f6dc6a3a9f1adc582a28cf71414b0e9d08629ed..7d1612acca48d24c3b54c4d25fa8a210176d3bb5 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,qcs404-qfprom
           - qcom,qcs615-qfprom
           - qcom,qcs8300-qfprom
+          - qcom,sa8775p-qfprom
           - qcom,sar2130p-qfprom
           - qcom,sc7180-qfprom
           - qcom,sc7280-qfprom

-- 
2.50.1

