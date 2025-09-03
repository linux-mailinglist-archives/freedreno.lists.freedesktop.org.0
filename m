Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B2DB4163A
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 09:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A0A10E1FB;
	Wed,  3 Sep 2025 07:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1CvYymg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF04B10E1FB
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 07:20:38 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832x62v010139
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 07:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 783y78yXmBJY5xRlP2M6Gp15FylMnhfNQmsntisnv7g=; b=k1CvYymgnAKcb2Mt
 qjO95wf0KQz6bNKOVJ/pPT6zeeRQ6XWYgfVEHCZ2B7cbyVQL9pmMhusZ1XVDG0JI
 gyO4pYx6rKXwmTSlunTcauykFhNQPOTwNYJQ5OxNJCBSQmz3mKKEPvbDh89HPrh7
 2ZXowxKtmqUfP3EVBTSY+lGOP9jLBuOyyUetOtKYUqvxiIHe8h+LimS6NWA217Rc
 B1C+q0TYkm93BTs++ULYi9B3MLCafMHdFqHFWRWQulPhVWwPWp/M3XK7C7ngleKE
 unsB7WBRWwt4L9sBuepUtWIF+qXnmkxZmZRiSUP+kJ3Y7AtKcpYhETs0Al7fdaZV
 Ac2yjg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ejqnp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 07:20:38 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b4e63a34f3fso2912268a12.1
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 00:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756884037; x=1757488837;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=783y78yXmBJY5xRlP2M6Gp15FylMnhfNQmsntisnv7g=;
 b=hWVzenhu4Ykn119I13f/fK6NCgZuAi0BjgiOLt58YaEgVa4OVxNbGmVOSOEUDbc0L8
 W7qqu5Fs0rxP+qb/V7yjUzCFwcHiPL2EktgTuGKv5LZFC6KbF8HHdzHXYfoZ9wBwFQDW
 zT/lNKKbllovwpxRhzEN4n+bLJ7tC2JfUWISQgoXA3p+oSBUYHggCFMXGs30W0nYTcbw
 DpKrm/ZKbgUh0UZHMZm19K8iNQPdPhCx8ttu/loTaBMP6EImGDTwGGnflTLFsr6VP3m2
 JC1a+0PaPKCWSaAZFk2Q9BWs/y/i7r2BLwDWhEK37owmqx6xi6KP3HMQ0IhGDSdwUdEU
 Wfug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgi/Vkuoo1Rlj/rRG87x3lfPPDp3dOMTSwIRRNJJpElaPnivN+yWgWV4kEkEs2+Glavy0yGDxWVSE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyp64eunDUm/dilpCX8nXBvc7J7supI0Vq9bq1H6jp9BgdS00gH
 KSX3Wq7zNRWbfV6nahLChIg/1UbiUUTUPN/KdiTX4Zg4f0A3MkOK8dFcjp1o+8Epa6QlXoR8Jlo
 XqH3eWIKJ55gXIPoPaaqfwNgdAiuaxCXjo60wC4+VI169mrx2kpx8jgdD10Bj3lS3fwWiKl0=
X-Gm-Gg: ASbGncuCfqmDwijQX9NU8GWa2ueJuLTAp81An0wlO3j6U97GqIM1SoWI+14DqGWvb19
 igfrKhizy9wd8pwluMVyututOiQi4WEzoTe2hLu09xLjzaQdNPtflgmkVUge4ffwShOcrZWIKNP
 xMXgUAZSAdi/YyvHc7q5m1FeC7K7K40z9CrISXSEUxU2noaFNhXod4YB/0YgH2W+XQ1s4jV65Nt
 CrPL2SYApq/BDI0nP17AVwBQv8sZqjFlmwJtqB4+slgNnYIKU5rJ7UxMnaCOr2+RzzLnWNEftr6
 f00BtmklKZFvTOPMJ3uKiVkLd6k6fjQemMBv3VmhFS23jVGZXvVvTjDa5xgXrGpt
X-Received: by 2002:a05:6a20:918f:b0:246:d43a:3856 with SMTP id
 adf61e73a8af0-246d449839amr2736688637.22.1756884037362; 
 Wed, 03 Sep 2025 00:20:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0ffvTpbw9jwjShL+IZyl85/Z8YDW9Xu3u0FzQcQbXXtMwKarzlqKyNTe2+dQNLNFvdlmQaQ==
X-Received: by 2002:a05:6a20:918f:b0:246:d43a:3856 with SMTP id
 adf61e73a8af0-246d449839amr2736633637.22.1756884036835; 
 Wed, 03 Sep 2025 00:20:36 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a2b78d7sm15816191b3a.30.2025.09.03.00.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 00:20:36 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 12:49:55 +0530
Subject: [PATCH v5 4/5] arm64: dts: qcom: qcs8300: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-a623-gpu-support-v5-4-5398585e2981@oss.qualcomm.com>
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
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756884002; l=2002;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=UGkqh+jUsBw9mlPVt984D/vluR2NHRDxt6PvxoK841A=;
 b=NDEzUe2YZLbW04zC7rx7sOBjGheYbp3vZkta1FEKZ4HGbqBSid2Hgn6oXufkMZhSIhcl0n6wu
 IcawBTpY5wAANJYwEG1Iqja1oZ25m7RDZbr3a7ucqz1yPUkHx7KBJg0
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: TU_oW4ttGuya39eCy54kwAez3DtShfT5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX2mz7HKkTepf8
 LPnwnUa8VfEUWI8Tq588RqUity+u9nhViuDyG5lmKDdGQJB3tIvxBwsGjMzdaMcXiViAyYWzqT7
 3jeYTD1Y33NCEbWBQUpA6hVGxo4Z7e0igZLmTgYyTKj/1o0udYBI9yvrjVFoD7dHhxt86PfWoiY
 6Vs83kMgiwmOLn9t9uhx+8Q8UWl0SEe1f/p5CB+b9ADXwJKK2tDMUuyjew46lozjOr6r+szWcX0
 zkKJjqAyzWsF6lm4uGV73hpre9FAEcLITh+xmhGKDFifgv+J9eLNf796/cuOeeW7zzo+07AXLQc
 hxVr2BZqxVelN+BosLx56QJVuZgDaDUXySaKeJkDdrFbVOm7kwGBNIj0SwQowt3it6yXRL2YIu9
 kbNolFEP
X-Proofpoint-ORIG-GUID: TU_oW4ttGuya39eCy54kwAez3DtShfT5
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b7ec46 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=deFBR-s-QiaC76FCe2MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
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

From: Gaurav Kohli <quic_gkohli@quicinc.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures.

Set up GPU cooling by throttling the GPU speed
when reaching 115°C.

Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 00e6131e6b24def4ff9566c14398aaa86efe557c..57b8bd6a089ce8b9a1a63be3fa778a633b4025a6 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -5846,12 +5847,25 @@ gpuss-0-thermal {
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
+				gpuss0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss0-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		audio-thermal {
@@ -5966,12 +5980,25 @@ gpuss-1-thermal {
 			thermal-sensors = <&tsens1 5>;
 
 			trips {
+				gpuss1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss1-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		video-thermal {

-- 
2.50.1

