Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90D4CDEE6A
	for <lists+freedreno@lfdr.de>; Fri, 26 Dec 2025 19:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6947113378;
	Fri, 26 Dec 2025 18:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZS2uxvuP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YySnCXvQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0718611B2CE
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:52 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BQ8baNl889861
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8RhnGzHB7RJ4bB614S9CKPMqT7/ALI4I5qiLyceTZ9Q=; b=ZS2uxvuP4f2qblcT
 irCe/kbwueqooKiyfXxyE+NnHEHCjERNh4OxYdv+9ngOmwjSzB997qvTuaw34mRP
 qBSfxq0cSfA+EFppmxvkYN+BUz72D/hGESnkqrgoWeXyABT6kNyFGEdoNEwRDhZ0
 5ahk20k2T8NOD5gRfYQ5X9yvCqdne7Tly9JQ4oBJjNHpU6XOmq1PoPelnFTX391t
 dBA43Kk8/acR+Hsfj3bXWQsRfel5BXqS2E1bGizkoIBrjgl4fznHGdWYuSO7vHSZ
 FNrlaQPRgPPgSVZMfQB/HMBL5jdLFwJTZWzGU8a14TxsI0LHvP+vVgllIo53w/K4
 K8Ykjg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8xvcbh64-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-34c66cb671fso10810468a91.3
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 10:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766773851; x=1767378651;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8RhnGzHB7RJ4bB614S9CKPMqT7/ALI4I5qiLyceTZ9Q=;
 b=YySnCXvQIrpHKFI2wMpAQFwTxWO9OfM+H/T+zk2wJUT2+NkTt3iFij7+cqIR8mjIod
 VqyTd+YHRzxM8XpPdQJMXb3w/j9SsId/dQaVb86Ta1NgXiiuDTE5lfxd74JcRChA00XP
 BTnjfBXHS3aF5TIPJ8YrDSun5ledr9lpHZdzgMOzsJRbp5+wdZms5zbsH33eaSQF7KHx
 V01ZcY22JTGvcKKvdbp+yYI3qLwALAiddpK84YE0C9YjGRi/naaTZNsoPq62dBDqg9uK
 k1CXbckjZ83aq4q3+32eqw4pMeGk3oaiOkh0a87dT9cahMxrj75j48K1h3rYT10i/JJU
 SFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766773851; x=1767378651;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8RhnGzHB7RJ4bB614S9CKPMqT7/ALI4I5qiLyceTZ9Q=;
 b=ogR5TfX7BwHFIrKiTqBYjqQBw4LH/7baubUhNoc/RGaOIkFOarmnBxl3ZMGHmj4stj
 +9VaYqWRJ3d4t/KXpEv0fjdkgaQlfBBQx1yDKTyyR2CsYfeBX8efgCr0lJK8DLOwUAzz
 fJLV2R4Pl1AnAvg6zRfBkrRKdxT7xbbeUMWblm6WG6JDID6wB7ZhlsFm2rMEP70RcM/5
 v7ZLeEqTsq6NnQbVLnho62btSM0M25r4gYstyE32Sv4BGTOvqCyLdiWMWe9khTN2OItr
 KJaj8tN4ff9lI8NuTF1KVHTu5ecwQXSce7OJyRE1bd1lkVGZQ42zd3yN2z8BFHwop4FZ
 e/xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFG6d+ZV3KKoLj0RIhRZvcFB5IAmzWpRGl5i/Txd+7EPQPrw3+O9KbmQEcqK80Y6M4QbKsRKACYrg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaWdzRdz7UgGiWOOWBFsqoKQTBAVh/eion279cRkPIgf2Pg/I/
 lhAkLqIakIGQG3zWCAYovxzmPSnNZLU7EmnuJyrbT0Ulf/xVtNETRuN15JT5RAaCiTiTpIcwz1G
 gt/p8YLSXKf6TC9QQWyTjRIYbLOTctp8epENZpmxdffsUHfs/mIb0PFdb/+i7sU+OIPKXz5M=
X-Gm-Gg: AY/fxX41WXwJp6uO+kr7Pnpjv70OsKC77nQu7TpYuLbfc0RJgPAKfRjpbCBmSgw0HGe
 X9KYeRYw6/51y4+A2LGC3hOK4iZtdPiiku+nxkuiKagnMrhsBA/b7gM6vDtUKYhF844r5l5g3Tm
 +ZmBpFp+l1+txR7iKf9l5NAOcXNGI3sN9gHYJD1iKvODi2Oj7maccnSsoqn6TlSlxl5P9MArBBj
 O2aV6LicMsYY40MXEBZuJl1cWQGuI//dyR2/n/1Mp1Nq6D0Kyta8udVexotT//FTS10cKQvCg0+
 0jE6hHwYzjGcQ5/PIdwUg9pv2m2YvYLQ7nQrJ3qo857C/GDSTpJ4eWv+S9A3gbWWF4x+5D8rLJs
 PB6G8ncCyB0Qx3BjvJz1JnTWGh8gVGH0mgA==
X-Received: by 2002:a17:90b:580e:b0:340:c179:365a with SMTP id
 98e67ed59e1d1-34e91f6c085mr19801656a91.0.1766773850787; 
 Fri, 26 Dec 2025 10:30:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuwjIqyDWuI+r2WlpfAbbgG2oxlpEzL73qXhhMKw/l97gOTuAUXO09Ln29/6XAmvuB+4ilaA==
X-Received: by 2002:a17:90b:580e:b0:340:c179:365a with SMTP id
 98e67ed59e1d1-34e91f6c085mr19801617a91.0.1766773850138; 
 Fri, 26 Dec 2025 10:30:50 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e70d65653sm23808883a91.5.2025.12.26.10.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 10:30:49 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:59:40 +0530
Subject: [PATCH v5 7/8] arm64: dts: qcom: talos: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251226-qcs615-spin-2-v5-7-354d86460ccb@oss.qualcomm.com>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
In-Reply-To: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766773796; l=1502;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=isrCbYef/6HFfpXGHUTvGk7T72MJmXAEG9GHusZsKeY=;
 b=LAosJ33LUhMphFS/+u4ua5QWG/JDH0yjTyYB4Gu6cM8FE/UtAWqcsub05PaeFqq2Jr45a0p+r
 WEStuAZ7EHeCIkBFaLtoV2akoBfgfX9BsdSbUHrJONUd5WK0vovJIaJ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: cOsbFYjIkyWIyPnph8smjyeBS3fEixQi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE3MyBTYWx0ZWRfX8j48D3W0/GBv
 +f6vL5VHcI7prp97zK5Fm8PzWn01+0tdLlMlsfFCJMqbk6BS9qx9tO/mPmM5X1wtPvWNRUujg4C
 C79nJRAFb4RZm/yfFHo7qSMs2G+Zle8P3QXGfwL6dssYTFaqkYO2vZzLSM0W/dmHp0axA9XYur6
 GhH5UR+7LznSFIBeBapcKLUWpMkwJTPNhHvrRjNUNbHDT7/HoA/LaK9sK4a7NYjj+X8AgEHRfr+
 D0EvEjuANqZOgFzxVy+CjVhdAZdTe+lXjYd7KcS30IrFBnPqFFHGVLsCil+fU/hSEEr4uoHylZX
 v8M7ErV/3beCxOPzPlYup00gnaMdbKNSjNAgZ4+/V/AHwaJJhCYLODnZicWpNPGE60vOdz/n87T
 +elUzRzdor61cWaM8lqWjiLqw9aGsDEExf4V3TA+Rr9I94a6woRwIJxj5ZM++yXB15zP85Q8VSm
 1js2C+cuIZDYwQSMDaw==
X-Proofpoint-ORIG-GUID: cOsbFYjIkyWIyPnph8smjyeBS3fEixQi
X-Authority-Analysis: v=2.4 cv=M4xA6iws c=1 sm=1 tr=0 ts=694ed45b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=doS3iEISOceegCkkCwMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512260173
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

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures.

Set up GPU cooling by throttling the GPU speed when it reaches 105°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index effaff88df83d5e6a0aab45a2732a00cae11e83e..7c2866122f9a13b8572fd9e6fa9d336176765000 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -4844,12 +4845,25 @@ gpu-thermal {
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
+				gpu_alert0: trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		q6-hvx-thermal {

-- 
2.51.0

