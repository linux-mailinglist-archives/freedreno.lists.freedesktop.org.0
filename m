Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE6CB49A32
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 21:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A14810E5BF;
	Mon,  8 Sep 2025 19:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDEelVb5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876BE10E5C2
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 19:40:48 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GRe7C023845
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 19:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 itWnLUDQYz9rGMnzsBXBwWW0Rd78skgWmOLQTl9Qpc8=; b=EDEelVb5QOzbOCtY
 x59I1bFXpz8wZOSNVjit2YR8zEXrOvhG4AP7cPiAqCWidY1AZX2gP62OOHA2Kjrt
 HENFFz5XBpfBDcJXPW64sFPgJR1Daiu4IA/0h6v2mFwViQ0jzpgdJS75krpFBQJd
 +IXRDRKK+6nr/W0JCZgE30ViUU6PApFyMsqLsAcG2ts8aoEsl9hD0bn7wRdL2adU
 7HIoq3msOSHaHq/VsEzTEwCivP/lbFR4yivjbZsAAuO1wPPl+HDVLuzJma9RZ/Vu
 ti4ID6BdzdvhKZ6UDlu+MZJ3fWnthZjrNPlhKe8X2TRRQswEvpwMv5lfvvn4BAF9
 IU0MwA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0ns1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 19:40:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24caf28cce0so117017085ad.0
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 12:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757360446; x=1757965246;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=itWnLUDQYz9rGMnzsBXBwWW0Rd78skgWmOLQTl9Qpc8=;
 b=NU64KC7zRBNmcWT9A8MlpvJNUc63FsUpQi9D9HgVUUWABQNEPnIbbiQ7/ioyij2MZs
 9E1gFVFMu3KCwxtLtQdS8/qyW0ej2r8y4gWFgVbadJcZNOMHsVTRELFqnh42TbWn+CLS
 Yg5A1xsPwasnW0sfK1i5eeEKs2BadHAP0rau3r6Kg3hggJqdC+uDzWAh34ryqvIYFqmY
 dGl5eD/PSgUPKNr6ds7bDuwfSRVOYve2QHMGmCKhTT+J4xr+qjCNOMvrCgW3WHVhyezz
 WrFHxcGxt1MH67U4wCNCvauuYbdqu6qPoWd05xIdy9nSR3vjzJHsjZgUe7C90yyLPS4A
 D9eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJNqZjW3fydE4We4Nmuhw/gZA23genBd4hxKEmo8HiKK8RdpKorxXG7voYatzSwigB+UVRaeABY8I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2BDndhTuMlonFfqV5im8CSHgCaL794zyxisNr4UPavhxJQU5p
 OVDHKPJ2FL4/jclqVnIeRiLNdYjF5Ua9Zw8xmA4Wv+0JImILkaZ6VGRkPawyppWoFDGICNQFUj/
 NhSqwq8DrxVXniOqB5ssdL397moPIQQS0CrU/lJDc1yCelZbCzDpiOg2+THL/jkT3Z3uWCQk=
X-Gm-Gg: ASbGncu2rYKF2QSh6WzEjR8FfPBzY4VA+5/b2ULtBqWvPLezfIOi/CO/0xLtY4QQIpj
 xy53MWek1Wv92I7OhFy9okejYrKm1TR+ZxgWXacSWs0y3k/hLN5NYaUxM7VZCX5ousXvCv28l7c
 cWF48446Yx4fjTWsaUkfsHCxvQlFxbrPIR5dIl6dW1q7+UNDdYfh6pLSQ7yxQqsIHH5xA1+5/xK
 jAOb7qzI1qs9kFQzSWNBKlokKZFVeWeKiB3KiU2F6be3FYFST7e84HqRuHs+B9tybqei8TdUAOW
 vwU4GPqd/JsI0xDJoHZL53mS+4gOg2LqxNlpG+A7sy4fzIWwjzQhWnNqHu3SPqSx
X-Received: by 2002:a17:902:ea0e:b0:24e:bdfa:112b with SMTP id
 d9443c01a7336-251761616c1mr100018135ad.61.1757360446335; 
 Mon, 08 Sep 2025 12:40:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+9JOK8BMb3sXLnKBC+xc+bC3hh8II9OXtGKKTgCzvM+sstpMkCgxC9RzDwJ1IJu9Z0f7IRA==
X-Received: by 2002:a17:902:ea0e:b0:24e:bdfa:112b with SMTP id
 d9443c01a7336-251761616c1mr100017755ad.61.1757360445770; 
 Mon, 08 Sep 2025 12:40:45 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24ced7ea5e8sm104008475ad.104.2025.09.08.12.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 12:40:45 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 01:09:41 +0530
Subject: [PATCH v5 6/6] arm64: dts: qcom: qcs9100-ride: Enable Adreno 663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-a663-gpu-support-v5-6-761fa0a876bf@oss.qualcomm.com>
References: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
In-Reply-To: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757360399; l=879;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=9bfHDTw8kTerdOD9ddHzM0+SjSgjN/43Tp5eBUWS4yw=;
 b=ipTZYtF2nW644chXYPKQvMmaRxyK67TXes3EoDWwCmqC0y+G+acBzHYQk8Zq8DjgOEkmPZRFG
 YeSNaDji+duCoUv05rfDBL8ZXrVvNvt5yi8+ocBBT1XDvOeaIWoSyp+
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: FMzRLtlz17IR93qDSxhnbZDzeNpTenBL
X-Proofpoint-GUID: FMzRLtlz17IR93qDSxhnbZDzeNpTenBL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX3+jx1rSMy6Tt
 Yv1FkQuGtLm/1OfPyJpSWsO6kNm/rnUk0Z4fgtynjx/gvztLaJSUhevZEbgHcakToTve7wmsFZE
 ujeYtmM+M1TfLLjSi/gKNBYVpY/CqoNogacRLdORvU14q4Ttn0kfIWRo7NsRRD+OAdm95CQGUy9
 9eZUdJmUFbvbe/d5iW9GwS88ufa6zpdOJc9mGkzMjBdqMl6HMG+vHB7QKwXmWGwKcFjs3hdfFkm
 8wYhCPssdmaCn2ek86IxlNRBmVjTrSZPZbkzdD/MA/RN6fl0hKwk5tYLAo/laBfFHGvM+PPvRAQ
 J5NA7u+ebuuxS8tpdCkL1/7b3U5RNXAuJ/VE38J1mevB6uTVxlEkSRfGg2mmCp3cNcGnulSSNPY
 qpKTUTGa
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68bf313f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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

