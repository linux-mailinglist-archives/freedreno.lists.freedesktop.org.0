Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D12A65B2A
	for <lists+freedreno@lfdr.de>; Mon, 17 Mar 2025 18:44:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C2910E2A2;
	Mon, 17 Mar 2025 17:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pof6fHhQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0540B10E145
 for <freedreno@lists.freedesktop.org>; Mon, 17 Mar 2025 17:44:48 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HAMvL5024976
 for <freedreno@lists.freedesktop.org>; Mon, 17 Mar 2025 17:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 j5AhBtS2Vmk9tVlC84l/9eOTIRqJEcsajn1eqDXBo5I=; b=Pof6fHhQoFZBhks2
 qKgZwUqsdkZYD1Lbm9OqalOrwX8wgWg/FtIFRRBYaY8AF8qYYYc5QgSWmdPbzRAI
 klwrwWxIbYDV0kkl49pZO1O7McS9SoFyLP6WN9hUVXcJIWy7xP627uFk04PYdqGb
 4lSWPERjrHSBko0eIl4OaE6MeW6HR2HhF9n1n2RKZnjOOPVtNaEqJw11xPfyxQxR
 Jbo+mhuhqRyspkTZ9H1op9kYLkyzWdRB/ha8nqmB75vBO+roc4kdEriW5YgkJvPz
 Znpa1I/O19NihIo5QIEoyKFRV3fxoIEw+LWijju6FfWLWUsJLbypWYJ9FhCGM/Bo
 imsU1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1utwg0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 17 Mar 2025 17:44:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c548e16909so473826085a.2
 for <freedreno@lists.freedesktop.org>; Mon, 17 Mar 2025 10:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742233487; x=1742838287;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j5AhBtS2Vmk9tVlC84l/9eOTIRqJEcsajn1eqDXBo5I=;
 b=StAHJhHmC4jC/nidX6uMoJuRSgY0CdX9QgTRqesBmRwmD+3vgIiGgA5QeYEkbnMHbr
 wkhaEgnBJypkUdAuz+fXbS/CcdZ1TLHuHg8AjcQDwiMfyiltnRVMigGJusdCZgwGXwPx
 mk7lRlkuvJtM3yxCSB2JQe9S2Wu/Y8uYZORe+jCvaeltxdhZLBzuzqDHTJ1Chqk1VETb
 BqcjNzOANl4yR9T4sx1We9AvPjUF9opAPfUIMpOiHY/+0WgRySJzU+ZrKTdpemRQc/kh
 m6Lw3PqXleIiEEcG5irGKW35twjo92O2MuH0WNy/7vt/7wFlBNMPOZUvxFGnQGC3AaDU
 ksEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGiZedMGlx7F4qlERTp7uJYZDNGll+ITUee0y9AjgQtu756zdnyvmuYfd1xKxcfm7y6tKo238jwX8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzLYFD8Hs17A5PtgvT/a270zelzbVERIU0fLRP/cZGnh+HOMGE
 EP44VWeSWRebDP+wvo3tWv7Qzh0vk9+/fnEjD9+KPx/VxQluan8BQCKDXOFWRKUfTktWKY5krsW
 q5XXSKw/Cdbabm4B1NLpSG6jp6WYLdfo9KYJi2Frc38Y5Z1Ly3S19oKbjqgnCZRTbg+k=
X-Gm-Gg: ASbGncuXea+vWpxhMp7KlIyf9tJmexriSznEOD+d65HiuApYtSXAzpKlY6pmeBHYNU8
 5kmIqs7w5dIB5Dvtwa33+KGX3BApTwJ/7/K/EF2iSiIh52odXzrBtWqgSn9m9MzGTOesgMAv33f
 r59Yyf2BDZPFVuelJZZYtBKv7hO7vksjUsC1QrdeW5jCpDTGrgLkg4H1AcTfvJS2McDZfBwRNUF
 fEob1rMQq35EkMftLPv2dIuotqgnNz89qddLHxoooIN5f/HeyD4ypmGKEf4fDA3fW1RaO9BuwTM
 hOcACHDQrdTFUPTgIsIBVTqcLtaukTCv4iSht0f/jvB0bu1OggJE8vH5aGWlq1xGL3bsRrblzqz
 SotfVmiq3wO2QxfDLrDt9aK3csQ8V
X-Received: by 2002:a05:620a:470e:b0:7c5:59a6:bae6 with SMTP id
 af79cd13be357-7c57c73d882mr1684574085a.3.1742233487111; 
 Mon, 17 Mar 2025 10:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBxYIzksBGnChS/AovmHUHeN2e5lmyChYe4xYLbphU3GfTQPEwubfYg38kAyG5wmIS15rzkw==
X-Received: by 2002:a05:620a:470e:b0:7c5:59a6:bae6 with SMTP id
 af79cd13be357-7c57c73d882mr1684569985a.3.1742233486764; 
 Mon, 17 Mar 2025 10:44:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 10:44:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 19:44:36 +0200
Subject: [PATCH 1/9] dt-bindings: soc: qcom,rpm: add missing
 clock-controller node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-fix-nexus-4-v1-1-655c52e2ad97@oss.qualcomm.com>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
 Andy Gross <agross@codeaurora.org>,
 "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
 Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8nULrIfJrBwoVzJEZHCD0NA8+LCu25kRS1unw7M1muU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/qN+LY9vVJvvG4ptU0UP+XAEbBBkuv81pfWVQtnCtYn8
 HaJzWXqZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEHvxg/82uqB/ctvpQ4b6c
 83NYnGQkyqb+n36xhzFCP/kYx89ch/jIla4+v5L8ldoUHVIjRSUWB6jk2KQdKnhz7GtObPC67t1
 pVd4/LV39cgs+bDlwYkPxb9ONtmc/dUfda+7bELRWz1wl5c+sjQ/dE9KfbeBcy6V8ujKFl3u5VO
 yCr/d2br7l7ZafaHksyNzDXHy//7MtYv805qnuEffaon9BnEPTQP9uTPyEBpYUwQvffkewHhBkt
 T2rffSG+Bkey8/KdcFiaft3p3ea14rxCcuWc++9zPf0g+Uqt9Osvftfz+oqLj099/XRWYpBnfXL
 P0vJxtvwZre+evbh0lH2mkl75ygb/J13/0Qb/wWDnHu7AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67d85f8f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=-Z_mRg2wFor0aBS9cE8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: F_buNcCcKMftmTQQpbVZKF55_hyvSVop
X-Proofpoint-ORIG-GUID: F_buNcCcKMftmTQQpbVZKF55_hyvSVop
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170128
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

On Qualcomm platforms in addition to regulators the RPM also provides
clocks via the child clock-controller node. Describe it properly in the
schema.

Fixes: 6b42133d2189 ("dt-bindings: soc: qcom: convert non-smd RPM bindings to dt-schema")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
index b00be9e01206d1c61802dee9f9ec777c4b946b7b..10956240df0856a4241d6032d3aff7d447af9ce6 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
@@ -46,6 +46,14 @@ properties:
     description:
       Three entries specifying the outgoing ipc bit used for signaling the RPM.
 
+  clock-controller:
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,rpmcc
+
 patternProperties:
   "^regulators(-[01])?$":
     type: object

-- 
2.39.5

