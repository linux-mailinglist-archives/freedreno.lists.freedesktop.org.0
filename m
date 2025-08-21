Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0169CB3026B
	for <lists+freedreno@lfdr.de>; Thu, 21 Aug 2025 20:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B633310E177;
	Thu, 21 Aug 2025 18:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XTc9V3v/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E2010E39A
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:45 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI92pG008421
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Eyjmrtt67i/hSgA8ZAsqicrziXjRyLeDwvFEX9xKzs4=; b=XTc9V3v/xDZMNumq
 p5UbMbUr3Ey8ZhRVv5Z+a6mul442zRqvNs3CcT4ELBh5rmpl71dIRShNMtEKUgd+
 rYfJGQmuPqPFruhCYPTTmUZ5PrgNGFH0P4D+RjjeNpGPqjgc0M0cT383CVE4TSz/
 k6YoIcyM+Dm0/gtVSN9zBZQ8rRbkov/8z3qvM22WmkDL4SDaFTQI9oX7mA/keeez
 I294uWhwdq5dCiwcpUvzStDy+ndmwS0/oRxMd000GcbKra5PkWL+jIRLlpQbn+HF
 k2Uj70oTpsrks6m6qOlpgr+F1atUVMO1xs4E2Ak+QZxccrykdeMbuPnJHQ6mTz8g
 J8CXlQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5296g05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-76e2eb787f2so1513614b3a.3
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 11:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755802604; x=1756407404;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eyjmrtt67i/hSgA8ZAsqicrziXjRyLeDwvFEX9xKzs4=;
 b=Fcc+SS2GyXKxO+UckJjyxHuqRPGWwEWL4w/2X5AAT5wZXf1R3P0dOEG1rkQ1vt1nt7
 lJqPDkYadg1xojtEDjDxp1QQ1l4AGTuQaezjzhXy4/k1uIStxFW/zvi57gPIAWi/hdem
 B3xMXGmLbeYu3c31O4efIrKzQbnXhOoiQcz0JUBxq6QPhTeTDyMaMOvTz502Gdz9lMO+
 g66PgYCMjAWSJSkbl4fAzVINu4xICcYOoXmqmG3Z2f9KtkN1dxbK8ve9l6gfPo9NAFHy
 cVitkU1Rda8U+3ERBPSPox2fs/MzSJFvb4qorcU6lsjnI0H5slAZ86hkrLz/nJ4ezWiY
 xjEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQMoeaClcyP+vxeOidwBdLxti0vhRpJr9kkibu2EWRRwdKE9JnrF0ytgHnTTr6pJRzfd2EAtYL4fY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOq3a0HhWor7Cz6fBNa4hOU48sgpWBiGIN1XfekR3ct32C+2ic
 9gT4SwG/TG7n69S2SYHAzBk1z+VTAwIyNYjKpEh27SGwJXBqKRFFHHdr0rXLOb1VPYZ0zWmVZEy
 LOezg1040xxBWHAIBzQl8hdvblkqswoW77dYBzyBjjkVA2ZRRkFjbHnnoocMQ0r1KtEFpuzbrz6
 E9aU0=
X-Gm-Gg: ASbGncsXYX8GUWYJHU2vNSwKpy/akrxgfkAM4oIjPiO5NzJvVut8aaR6XTQ9ePjc636
 rategaTyyttsi8/nP/1SPcooblSzx059yVTKLIrVaU1x2ZJPcwjUA9UL49iTR3nDJKdVxs5OlnY
 bQyL1+BHNMlxAZvsam48RMOd0gzFd0KMx7+2witNP1MyZVPyyy0Wh7ySfQKNjN4DwfyYTKwxE/v
 MDKDR1RcL6KhFLZXu05CPD6DPN1ZGnvSyXIIRp4H47YV/eiCK1Mqt0rOSznU9rjj8nngqZuH8zb
 nNtqNxhLSwevy2iU27gFuyUxqHZGX6kUxLc8Ny7qU5wYV8w7PEHsos7nCj5ZKagB
X-Received: by 2002:a05:6a20:394a:b0:206:a9bd:a3a3 with SMTP id
 adf61e73a8af0-24340c3a714mr325112637.24.1755802603755; 
 Thu, 21 Aug 2025 11:56:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLnv9zIkKigFMRZ5cTavEVxl0hH0Mk1mEGvhZ0Z3VQ/d704GnW1rvvfgCrrEv2z/W1xLZk2A==
X-Received: by 2002:a05:6a20:394a:b0:206:a9bd:a3a3 with SMTP id
 adf61e73a8af0-24340c3a714mr325089637.24.1755802603354; 
 Thu, 21 Aug 2025 11:56:43 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4764090b0esm2106977a12.37.2025.08.21.11.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 11:56:43 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 00:25:30 +0530
Subject: [PATCH v4 5/6] arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-a663-gpu-support-v4-5-97d26bb2144e@oss.qualcomm.com>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
In-Reply-To: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755802565; l=735;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=X5/b2wPl0B5JtiyqdyVNBvFH6QvvW/Oc2oH1DyatOms=;
 b=mTcyCQXosL3wdwNsliBAQNXiroFwDZJGSaZ/bRV17fNt6HD7Zn9Y93qTXO6bpukLNK3gl2S2/
 L5jxBVtbKV6DM+Sf2O9Nz/+8Zr39EA/mNiV4RlT0T38+vpD8UVxN4B5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a76bed cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=jbU5qkt2-FsioPMlu34A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: --uwN_GpJr3iaVzcacCwn__-6eYbcMyW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXwS32eZ8uNCqV
 /I1G560h+hmrsWxdtjmoFqFR+g/u5BgfgzacbuJ50Lc8CsFZBqYXhuMNntQ7/l5+TXwFsmmfqD2
 2734v86S2eLKKX+6vV7wvCz022hYDwRZ/CJqiTF1A558MJzgG0tGse+m9l5BiNGheShnctAUIvG
 2XTaoWXlHXu+pxXR+PGFTwMQJiR7TKp+5aYuUypgj85WS1ca4SO+W7Mtg1130VU3Os9+T6eaq87
 c9ar/5+t76xnnK37VTwoBSEV07JtJdUPph6afV5DRI8KAxN0rGyYYb5RMdKkpA9SoqCaxFYfnpC
 OZBwVtuNImZ61/UrgNi7pn+Ap5323ylHy0Le9BQ7szI14ECZuu1w6UbjuLSQtsObM7HKWvsLzdN
 BGE+7b24lE5kclG3UiQsDZPwLnpdpg==
X-Proofpoint-GUID: --uwN_GpJr3iaVzcacCwn__-6eYbcMyW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013
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

Enable GPU for lemans-evk platform and provide path for zap
shader.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 669ac52f4cf6aece72141416068268531fd9f79a..876f43d761870b968e43ea1ecc360b4403f19fef 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -253,6 +253,14 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };

-- 
2.50.1

