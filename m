Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B464CDEE7C
	for <lists+freedreno@lfdr.de>; Fri, 26 Dec 2025 19:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4358711B150;
	Fri, 26 Dec 2025 18:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D8pc3kO8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bi4mR1CR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A2F11B150
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 18:31:00 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BQ8bahK1011827
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l4XGWR0+KNvc3ed5ArMjwMlC+KzNK0mXGZ2jEfsyOiY=; b=D8pc3kO8GCjjvm8/
 Qfq9GTjdv2cFMFM98PAyKmDBNqElyY3uyRSyWFdy6T3X2nIwgRvPJVYlglFFkis+
 Der36k3jGegfD8cJ7OgI5J+j+DhCmoSYGK2V/oEGXTEN2nBuxV13xr/pRY2CerWv
 vosC+Vlrr4rYq6LLayf4LJJiZvqQbG45X0l6wb8S57ie8j06JC4iGuIfhseplquj
 AT4qJUK9qzAqLODlIqDvJOvXyA+4/vtUG5H0p7rzFQSSdtyQKlqHgZC7Tqm7cWEH
 AC+sfsrJSzqIxTb8lfnxxnEy66m6X1+OniKWoTNhg1MUo4g33pZAcEadPtFKWL+o
 FdBzzg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8kywmf18-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-34cc88eca7eso13443689a91.2
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 10:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766773859; x=1767378659;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=l4XGWR0+KNvc3ed5ArMjwMlC+KzNK0mXGZ2jEfsyOiY=;
 b=Bi4mR1CRzEhS8txzzs7DzZ+CBnxq9Ei4n7PU80MA/Y0q7tIdnTcBmBjCWj6pYMaeu2
 K/f5tpp7IIMpKm26/H+0uxzATd1NNJFIvoegKjQiBwkh4PsNpcFboxLN8Ze6qJ3pllco
 q0v4KgyBxefwdbbJZWnm/R3bWADTrcco3CyBXlTn4tjITOyRIwdjIH3VZ516O3QcZDXC
 ybzwnbmomtPq4BPGd0DINNDQJoUpnfZKTE5yzJZAlMo5rUHTSxPecQTf8QCb6/HX1JbE
 UZ9b1/p+rWfui0XtOiFAN90eqeK5IXX1Y4YAgLwVmT0ilpI7GJbqhd12o4DbRQ0F4tvj
 SNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766773859; x=1767378659;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=l4XGWR0+KNvc3ed5ArMjwMlC+KzNK0mXGZ2jEfsyOiY=;
 b=fht9gJOX0E3/sZsa2qI67uz35BLy6KRnh4k/ZcJEBZxmSO48rcTal42vhNfh7l9Gm2
 fWILnGxxitK++x3guxgijWXq7tgWcPmX1Z+h199qIyyBnqSSEqAUgGPQ75hin6n235vu
 wPMXjNkWqsmgziKDFIadRVuvhg9jnjImN1VSOxXaNvyEfnDZUw/74uCFEHmwF+mmsDGa
 t9xU98gu3cKmgbWEtCrBm48rKK9e3a7ngz+6JJldAo9QFPEcQylnVzKR9bxFW0Yfb8Fl
 2bgUDTVdG6bSdYbk6uYU9cfew50pneBOUN5NyIB7A9YZAHMeyDP6LUdi4IE35wQ/S5jH
 EwbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAuvi7sx+NygGlDxxaMp6gQutsPq1WWbqecqrldsyM2fY7FrFrX8PnQo7rxWMEiQOF6IzC3GRxhGY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfZoY3ezag7wFefAkVqxs57lf+bj5EfJz9RmALRQm9NnHprNNG
 tNmoz1glp5Lm3h7I0br/RXPiALGWDpp5lxTl9F7OrCxnv1YzT5Ko5ATHPDERPDN6SJvjXAqAPwb
 IkHy7OIflvJLWWwd8pNxzF4tNyu6A3/Ou7mMBfZR6BSt259sxWK3eIfv9eiZLckQhOmG262s=
X-Gm-Gg: AY/fxX4dnz/GIcx9nT6IIEuEtt1KZ9eObSsrIXvYa50FFO/CUOpHa09KufgKAEq/JXH
 sJ+QjTlvNFSH4hxN7TWHc6L2d/8VkA/YJfnY3ShKZtpK/OJMGo99FCG0520cH5JOKCpC9bhRK4T
 JR67XLsbzvnkCsiLC2oOiaoEGgwYuHXIZEskc5ccQ3djn/xCsIrMTDBIomUU1EDnluwXzhDLoI+
 16yifIuA4QUReA1ilazBp3XwmR2rt0zGjtOpFH/AtAbp3YOH2mfxu7TYzwuTh+aFvy6mGi0WrN1
 m473ZHjltiqUoNagpUoYXjj1rRfGyrjMSTneUDzj5bD5whXoGY/tgvTfYJJlsLJPpA1dxT7g/AN
 KqJViKPyxLdw4eOuKdqK7fSEwa3Ruq3qdkg==
X-Received: by 2002:a17:90b:134d:b0:34c:ab9b:76d6 with SMTP id
 98e67ed59e1d1-34e921b9fb1mr19395539a91.25.1766773858180; 
 Fri, 26 Dec 2025 10:30:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3cB0r3VF84oECQbOBHaUHDcFCfAqqe4vcXRfkQ8idCGmHLWTD3venrh6qLQpSG+LSK5JShQ==
X-Received: by 2002:a17:90b:134d:b0:34c:ab9b:76d6 with SMTP id
 98e67ed59e1d1-34e921b9fb1mr19395472a91.25.1766773856989; 
 Fri, 26 Dec 2025 10:30:56 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e70d65653sm23808883a91.5.2025.12.26.10.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 10:30:56 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:59:41 +0530
Subject: [PATCH v5 8/8] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-qcs615-spin-2-v5-8-354d86460ccb@oss.qualcomm.com>
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
 Jie Zhang <quic_jiezh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766773796; l=1566;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=0wHTfSWxkpfoiE0HDndY5tE5UXZgiygEg/pFzVW0/Yo=;
 b=7NYLN0NLICnqtnhMSXKEIZo1luiDJXgB6Id6mOqyxkwcLkGqEmCDvSzZ09RxWzPo91OdrMaLl
 eRg+kWNr+1CBK2CNmzfooccSkUtX3Uu6cA8v8tXeGTHNNi7yTPbMm8w
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE3MyBTYWx0ZWRfX03u3dBEVN7I6
 G5HfSxO8IRn5VzlSsr9f1r3rjHObdt1dzV9151Kyv9fQDg4AkN7yC0tGqeRA0UydtYIop3kgl59
 vBgESV8iSRocm1F/FCTLb/iyb/HpvQFXZPXU9CeuAcm2BOkpG8/bwzpnhfSaXA42Yyxwx5AFDhu
 Z3jFGYDUP0uHHny6GUmf8wNVHma63crg8oRRGqFXcZlPbgbYIdcuH7GdV5mIupJA7s16GswWpPQ
 uRqq8Q2i7iB/Omj+5JGKFQTYVEPTqdoMUW3y5ZSFSAEiP7dWHLmDDTe4IFM650GIYGeosMuZlSN
 JPwEuqY6Dqch40gIDdnVpjSYmPI2VHb9qG6i1OM7BFsAGy+EjKqnL7nnkElvoOvKev/oa5JYKXS
 KRjKIAnv3P91Vsg6f5NaNU34ai1dyISM2S0BJEaZI5xbns+Q3os4T+RzgeTZynNaj5MjNVLsIhm
 EtDRpIx+Qv8ygfzSF/Q==
X-Proofpoint-GUID: vBoC2wq3voA14jIUiqg-7LRX7kYKJOZm
X-Authority-Analysis: v=2.4 cv=MKVtWcZl c=1 sm=1 tr=0 ts=694ed463 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=zVnKP5-pAmSyy1jt-DsA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vBoC2wq3voA14jIUiqg-7LRX7kYKJOZm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260173
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

Enable GPU for qcs615-ride platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/talos.dtsi      | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index be67eb173046f9e4ac58157f282c3af41e53d374..33e33aa54691d38f96e5c76596719691e2596eb5 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -358,6 +358,14 @@ vreg_l17a: ldo17 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs615/a612_zap.mbn";
+};
+
 &i2c2 {
 	clock-frequency = <400000>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 7c2866122f9a13b8572fd9e6fa9d336176765000..606f5e234e4a02caaa03f1084336e137768dba1f 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1902,7 +1902,7 @@ opp-435000000 {
 
 		gmu: gmu@506a000 {
 			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
-			reg = <0x0 0x0506a000 0x0 0x34000>;
+			reg = <0x0 0x0506d000 0x0 0x2c000>;
 
 			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
 				 <&gpucc GPU_CC_CXO_CLK>,

-- 
2.51.0

