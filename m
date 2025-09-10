Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A49B5158F
	for <lists+freedreno@lfdr.de>; Wed, 10 Sep 2025 13:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBA110E8E5;
	Wed, 10 Sep 2025 11:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nxhn8LaC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642DC10E8E5
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:44 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFK9O012751
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 itWnLUDQYz9rGMnzsBXBwWW0Rd78skgWmOLQTl9Qpc8=; b=nxhn8LaCEa3bDh7F
 fdAiO6mG+7bKEh3PMZQrDeC5ekneoK7d47r11mgCzXfvqBkOzUfBRSODtaIoHtEo
 yBmBDoHV02+lIuySvUlCm/vuNFwoMnP1/2a2DOKEPrr1g2D7HT/vLEi+LWM2TW2d
 vxHHOXM4d+uu8Ir5h0n21omr5DvW/f/4Ty03vQFfkMDsGa52qOH7131PQ0lTvlYj
 hVVE/fkCM2U6iYK+BF19DOOO3Wnydkpc7vb43Xco8SuF4M4pec4lMs9CVzUdr0Py
 nlo3oZ8iz0jVEkt02xoufBC5EpD6gr7qliSdKBkVVF9V5Nzm2eRtIFUrukqFwI22
 lt67nQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg3f19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7724bca103dso5775288b3a.3
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 04:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757503603; x=1758108403;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=itWnLUDQYz9rGMnzsBXBwWW0Rd78skgWmOLQTl9Qpc8=;
 b=mHGfepklbLTmAfp63lFI0JPcVhIxCpBMQF/IXRPtO/4oAchsQ6Bh+ZAzHTUk/U7jQ+
 lLKZBc2FTnRkxh0+AKs/6FcOjEiWT7kfUUNvYbrZhlNWoXfF45vE22icyeIxNiSZDDx4
 UR6jCuv8FXVxtzViBoac6AeEuynmQwdYJPtaM9ApSuEV/NA34XZMONyXaO68nEk1CPNn
 KuGt6InBz5jNa0NVbbBpluwWFzQqiZ/4og4QcJmt9gwA89+WMGKcbUNFe2dJQ/7XbgZY
 cm7Zl1OftdqVPUAUySil9cg3qRqxOeov5oCYIet6SpLc+sfuGuqPvxKjn8WiFgKbZxxQ
 xrig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXdg4Jfv1Yc3kPiC63G+xQJ+7qzHVsLamWLiAuEFRy0eIo4jpgFe5S+mjECO57BvN4nLebglKQ9GQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwX2gDFAzKLKUOmaSag9d3SuEvhjCdUwmI+i4fXNmcA5ADmTd1
 mkCBF8BXUacQJr/34uVW/xWtc6I+W03Us/r0V+qrhTeFdC2n+/8/8PM3SpxI8gq4/XPiMnUdq7E
 3vLbnrOXrjepnNEO6jAcK30TKVd7uL35G2Mg5UaDX3WK7MD0KQQzO9yDpiiOekkkJ9oD8gho=
X-Gm-Gg: ASbGncuS4h+eK4O0w11/hZ9/rmZHPIkVc+dqWMIn+gPgy7V/+agaSer7l6BdgkqSVzM
 pw+SUPTUToLMQkH8XWLkqK3sObNll/kxzZOQzlCFpqipTmh+WKZbUd/trCQ5s3jzfclgiHcNlyB
 oz75WELsqQKdy9pm5JVBEKmqP4rs7RFNJJqkKQQE4d5f+L1ZGN5Z1IX4V+UR6f+51pcCVD/M+Yc
 UUJe2iQ7UawcFL3Edu9txwoKkWspawNeIEdz+RPByTCZ8RaL5uCAWNeWfKAhBcSxu5FMP8zzXUa
 N5E0G6dDREJ7kkXgvcAxE7AXN4qtuZeVWnxMPMj/rTNj2aJNv1+hf0E9g70FRGeD
X-Received: by 2002:a05:6a00:1acb:b0:772:43a9:d587 with SMTP id
 d2e1a72fcca58-7742ddf13cfmr15993653b3a.20.1757503603017; 
 Wed, 10 Sep 2025 04:26:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfTJXsij5hahDr1ImNYphI7GxV4OZZqm++kxMfUWKVSn/3R0ZehMj0Y8qLLTvIRj+LObzBYA==
X-Received: by 2002:a05:6a00:1acb:b0:772:43a9:d587 with SMTP id
 d2e1a72fcca58-7742ddf13cfmr15993609b3a.20.1757503602566; 
 Wed, 10 Sep 2025 04:26:42 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-774662c7384sm4862260b3a.76.2025.09.10.04.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 04:26:42 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 16:55:26 +0530
Subject: [PATCH v6 6/6] arm64: dts: qcom: qcs9100-ride: Enable Adreno 663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-a663-gpu-support-v6-6-5da15827b249@oss.qualcomm.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757503556; l=879;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=9bfHDTw8kTerdOD9ddHzM0+SjSgjN/43Tp5eBUWS4yw=;
 b=XpUaKnoeyZk7w/FeU47t7sSg+CjlI3AMryk4mP+ujUW3bZO9QGZth0AXHtgh0Dlc6Hh2YTBlu
 mzbgNxKo85aDvADCC/lnhgr7fWtCz/LRvs6TZLlVAMNXi2DK4XDF7hw
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: bXr0DEVI-vVOk9JzZVV-L6jrUkwrEMxu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX3rzYFWXRBMws
 FfkO6b6R8W20V/D+5PJBWAGwMB0AUfwnlOiFvdeDdhPonVmLfs3q8TAdC3qiKn4nhyA8/QCj64M
 SlEpUTA89zbeeHnfR/idCGwiX6uYWwnt8sQzIaZuFr9h7ecUEDyHq0sN+W+Ni86Wo3eeVdk+8JE
 aAoQD8FwU+vDHCs/I1VWm8g4pcAlQvO8kGX1p0F8sQKeDDSeKjir3PoJStNvrtbgaRDSgg+5BvJ
 U4r4Ps6X4oUc42AUBshPGFtbuKK1cYJel242FCubT9Z2RyYvemfCHGQ3RMTbix6MiTMs+CpKfQ4
 GkFBrxG03umLdq5S0vxdkP/fEWMMEEQ+sfU9eYY+lhqIXP78JLx7qDMA8XPH9YW0ceU5o73pZL1
 bIh91PO5
X-Proofpoint-GUID: bXr0DEVI-vVOk9JzZVV-L6jrUkwrEMxu
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c16074 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
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

Enable GPU on both qcs9100-ride platforms and provide the path
for zap shader.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 25e756c141606fbe0876ed48a54809b372650903..e9540cbff78ee44d6d92de10464c660a05a68db9 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -436,6 +436,14 @@ vreg_l8e: ldo8 {
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
 &i2c11 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.50.1

