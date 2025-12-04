Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE32CA3CB0
	for <lists+freedreno@lfdr.de>; Thu, 04 Dec 2025 14:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCDD10E985;
	Thu,  4 Dec 2025 13:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YbcK/3jZ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PGGfeR8G";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75EC910E985
 for <freedreno@lists.freedesktop.org>; Thu,  4 Dec 2025 13:23:11 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4B0xig614237
 for <freedreno@lists.freedesktop.org>; Thu, 4 Dec 2025 13:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l4XGWR0+KNvc3ed5ArMjwMlC+KzNK0mXGZ2jEfsyOiY=; b=YbcK/3jZRpAbITpn
 N95hbaYlcEOYxiyETZHzMcjZVe50HDrtdTTYdVVxLbX/gHUtcQ/C0BcH8scfAQnd
 afwK4BXsYPM/DriBXkuXLDXQMG8sfJGCy6n1AC1xr9DmGoPIeJDsGeijjL5IsUUA
 1c4ql/ojdZPbu0BOzHryfD86mzQimF4FQY66RkiJLQt7eFYJ43QzxolulYejJquT
 rfTcCGvV5u3aa3U5uWsUfwPyZ4EiAoqA7pjnRVpMdBkFLe2cY/m3zzW83lK1tElm
 w8v+0KV5ILkp5BxVqcRGM6HwPxasd9W+8ujElLB+sKOMdvxYdwPzPICRQquvCVX5
 uxRXjA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au9298c1c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 13:23:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-34943cc3221so1761033a91.2
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 05:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764854590; x=1765459390;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=l4XGWR0+KNvc3ed5ArMjwMlC+KzNK0mXGZ2jEfsyOiY=;
 b=PGGfeR8GTWOAh2SMA5lDG9mSo4c3gucaeovTUumCHAEm2i6M1pDAwhciIW9IL3vSbB
 RZfhWL4W7QBm3XilBN1q3PRj37V0v6LA42rgvMunCndvuJ7d9BODVKp8ZYdlb99OrAwD
 +6jJkzh3/8s3MQJ82ZCBLkychTI9k3gX/o47QbRdyczCjUNUEurRzqY1oLEKW8C19a5Z
 1VbATjG0iJ6HbWYbt5x8T1v+mBCETdc/DEHk0v9eEu4Ywky55JlFjpMoaRu4PjVzb2rK
 jPxsyz53NSytW57UZ40AesL9lJDatJwXAwLoPxKjb6G77tEfd788TR9T7T+rkliZKRJp
 aRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764854590; x=1765459390;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=l4XGWR0+KNvc3ed5ArMjwMlC+KzNK0mXGZ2jEfsyOiY=;
 b=k2xi9/Qko7ELSG05aB5fWbxNShH7yxVMNmpHrZKzO75VqOU1QASLLHXZwpNS+pupEV
 CmTo8zPKO12gfynQTyrRh5GYVj3YH+PxYToDh7ofMTisKMyPpKr/Uu2KC++ocgXXyjML
 agmiO+OWrlShQo4EE87ctaVl7WjgjnWTVGBQeSaTDtnrXfXsCcPI3eNvSforg5DolMXt
 eWIzlVNbOeQnz950CUpl/xgu+aN1e5JIdv8kUnd0WDcrHxUMOdv1cV48VQ20Tiwhyn42
 IeBSkyDKDHKPP9zvDqoVu6XcbzNoIOSuxeUzxPmOATk49CeCk1Pu00iXGYmFGCU/2+73
 Gz8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkubhi7M9UqWtZ5U9XMiZtCsu8APLm4ZzZoVjVbqW/rwGAVbkmIlfS6ihaGoWqjE+DukvwAADJBEA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9b2ueMND9sLnCMoPEgA8uC82pz0LVEH09fU7Cotc12aplQRhW
 utI3nVbW07zPXsFjqGQm5Srot9gFeebiGy5sSq/WiyjanL8gJpkJYFYkalzTn9sGocU9s3ikoAE
 gPfDUuSLZL0WKRyqxzX4fMMluYLFgjWfQfiCgaCtJLtzdO8hoetNfJe8lnpVkSLgNDILqVwQ=
X-Gm-Gg: ASbGncsCLR77a5lOp3sTwESZ4OmJq9y7WOMbuSV2jZGwygmNZ0S+NA51GZGDRbNfevo
 mPTtR1RE/s3pRSr/E9Lo6+R2t2io9DjvGgw1L3z2/y/IFVawC8TXKqlgiIJ4AyaB9uE91GvvszK
 128l4D3/Z29+WlIbD3MTsDVba9gSmai/1vSe0X9zQsZ6B0c6f9ogmkicKheMMt8DmVdlYpyLItc
 9DjP8iZ2oKxjSe4Is9dUQ0dUg5ZZW9wr5Cyn64cW+nNJHjOAhfd8qU6hoLaCnlh22NDjkYvCpT+
 8I26mtHie2Z3zehcLD2LnPYNPAxQmcZdaxzZHUDNOGjKu0+QAluKyjwHOH2xnFXv3aJnWkH5ZWT
 TfUgTUaBgAFH6JMS4n52ZVKhaXzZliS6Naw==
X-Received: by 2002:a17:90b:6c5:b0:349:1597:5938 with SMTP id
 98e67ed59e1d1-349159759cbmr5564607a91.23.1764854590254; 
 Thu, 04 Dec 2025 05:23:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKzX3dOZ2Hed+4VMOvlHYme2ZNasP8l1XGATI6EHYuBs9xYFVOc2YLttTn9Lh/jO8gK1QmSw==
X-Received: by 2002:a17:90b:6c5:b0:349:1597:5938 with SMTP id
 98e67ed59e1d1-349159759cbmr5564563a91.23.1764854589700; 
 Thu, 04 Dec 2025 05:23:09 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3494f38a18csm1914740a91.1.2025.12.04.05.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 05:23:09 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 04 Dec 2025 18:52:00 +0530
Subject: [PATCH v4 8/8] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-qcs615-spin-2-v4-8-f5a00c5b663f@oss.qualcomm.com>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
In-Reply-To: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764854530; l=1566;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=0wHTfSWxkpfoiE0HDndY5tE5UXZgiygEg/pFzVW0/Yo=;
 b=BT9DxCp3kv924ILRfxcKowJzBmBolBokUx75jKxcl5PUPI5A13T9PpRfwo13VB5Ouhk+XVvSd
 gegMdNlntBmAZUZ8Jh6VosyxPJd5d6yzxVmXY+6J7IZzJeGaejvpP3D
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: i3RMtfTCoTiy18piDKAtwu0qUmE0RdO2
X-Proofpoint-GUID: i3RMtfTCoTiy18piDKAtwu0qUmE0RdO2
X-Authority-Analysis: v=2.4 cv=UddciaSN c=1 sm=1 tr=0 ts=69318b3e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=zVnKP5-pAmSyy1jt-DsA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwOCBTYWx0ZWRfX/Br1CRjWKBsT
 NSTpsFibvTJmqZqkNe6/NnNbPCK8Hn3sTjSc1Kf/Z688hih5GN9AQpNnZvdIoWVK7arKAVuj2h+
 PyiRXufnNFb3kTYFVSDJ+NzMVqCmtIgEQuEm1Ff7GObML9rNMZ9FgpN8cHil9uohLi3+MmA7rYQ
 ciolAAy6NrCwMZGW6fuIGdFAT/bUi1XOItLYnbvy5t55LkTYfTjmZEkNJrk53swza7Ntj8qW5xh
 Qlc0t22vJOZTtOLIKzIwNZBfu+lSYXulYOOulbzbjOxGW2DlS+N32FMGSZouXDZdEN/1rLDsPrN
 +yCNDYnQrUy3x1sRrJuOkiCii3hOfMVuZRgEEb/tBJzprrs0Mr9PJaz4kxlzQRbMVwK35v2sRRJ
 0N3dtTWJdm7s5Sr6w8IamSeou/lnlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040108
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

