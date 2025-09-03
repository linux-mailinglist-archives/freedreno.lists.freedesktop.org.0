Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17935B41DF7
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 13:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB34510E84A;
	Wed,  3 Sep 2025 11:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzIUovPG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F3310E7C7
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 11:58:38 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BF6SZ004755
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 11:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xQ0VgVzHDcE4uOAStGZ5b6EnRBy9KiNlbxxY6hsWIic=; b=bzIUovPG3BMXIJE3
 naUIFc+2DyPMw2h+LczbgGu1jclHsoN8VCUQ+yFZNrezB3UtBKPEMf04Hv9R5mIp
 O6hYIF4y547t/h1UcoLdQDldYBLANhwlyo1Xp3edIhG39G7ryBbi/YbNX1Dg9fGu
 Gigro37yurymbGug5g5wlU6/aiMSVr80teukh+T2EQO23Iz4dlDNrXfxwoecRO0k
 D+Ob/lLffUstSgWCW2FBgrRZ6CMO0f1DKLu/sj9umM745FVI1hbslap0o3oQTWaU
 WRuqOvkDMnyKrIvFRSVtTKt0r7UdfwP6iZFcvoneIPCiv/kg4g1O0ZbggEMWgUK0
 EQ91AA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpbpuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 11:58:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e870315c98so1920348785a.0
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 04:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756900717; x=1757505517;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xQ0VgVzHDcE4uOAStGZ5b6EnRBy9KiNlbxxY6hsWIic=;
 b=FFICrYm50vHbyjQFBHAiXgomVIZNhWBsPjtZleyO1SnmtPMDR7wu6qBLKaheGDnVBJ
 qJxhobYfi+KSe7WrPTMkcriv47VESsTwlaflGFa3gNixUvVhEnAfO4l8zvgTJruaMAJu
 ImaUVO4KD/t9zu6Eh9pQg5tRk6KgXGd6mKLhU6nqOFACCj/u92gY8TiqDFjL6f9zP49b
 CgRugl722OjVBZxAGjgrTsDxm1QbeXZZJt/YflJQ2au2ZMxy3qUxR5lsNIXJsNbRyWJq
 F/XoB2f5hkxxHdpKwlqH1FFMnk4CkaIpJp/TicE/gUAe1ODz5NCpyr5GNJZjhc0fjheT
 MHng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkrHdit45Z01ymJx7MuR+n2igLQ0q0AFcpY6aFVxYwl2Wl/WEsNFEltjOIEm32nlIQXxGf6Db+l2A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMLwZuk/ZTnFdMzGSCUjlCi8EdYwMSfcuciZ2ffGuzvCohTCfg
 mHnQdT9a8K6fG9tQDtHVImIHUv1JdtF4T3EbXX7CevsMjMk7hL6pKasCwkRy8DXYCQjR4tK9mIK
 VDWS26owIjFtqVDRfxafsNF49mMvrGV4Q5f25mZNfEIyk6xl/28XvhOn5Q0WYfQygNlFNO+Q=
X-Gm-Gg: ASbGncu3DxWmCcev0XWm6gIz93GqNQyv7o+e7OfwZ7YZDl/KmBpkaAd3arr0bVGZerx
 PuQfYb+u+PCcnBDiTe5zbCWHTOL/dfetkB+HYVJypzePMwyVL2n9jXfwhsEOdW8zCv0UNdNEWWL
 fDaxWUqd4zbb9HxQ9wsa2TxwBekSGS4xPedHlYeO5Id8noRvcAGnnTEIAHWqm2dNo64bYg7e7jW
 EHQA+xW2rD7tdG28WUzOPJ5MU5Oj01oxeAPC3XFOlvn5CK2BnontHSzPFFN5tJnxZ8QCwOKquvQ
 jRQ3oufFqFKgCiWfBq2qlCEOclMqX9rJFcwPsVqpPQrPQJHdNvxYx4ANmzVjCdfU8o+unhQLAGv
 o3/VvDI7bEwmc7q4mng5x7oqz20RkMyHrkOQf2UKrz2tKIRoiw9Fy
X-Received: by 2002:a05:6214:1247:b0:70d:adb1:bf55 with SMTP id
 6a1803df08f44-70fac8c859fmr134683486d6.49.1756900716958; 
 Wed, 03 Sep 2025 04:58:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/mtRqJfmERu7M9/61r/Pib5S1ya90D2+A5xz4iBPgz+esnd9B+FBxUWnhDBpOXm8CXSuJVg==
X-Received: by 2002:a05:6214:1247:b0:70d:adb1:bf55 with SMTP id
 6a1803df08f44-70fac8c859fmr134683066d6.49.1756900716415; 
 Wed, 03 Sep 2025 04:58:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50d30b0sm9891421fa.67.2025.09.03.04.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 04:58:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 14:58:19 +0300
Subject: [PATCH v8 8/9] arm64: dts: qcom: sm6350: correct DP compatibility
 strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-dp_mst_bindings-v8-8-7526f0311eaa@oss.qualcomm.com>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
In-Reply-To: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1329;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yuqF992JkLqD1kIJyjnt6Zn+nJH3RP1HSBd3vUxQH58=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouC1Z6lwJuo/b5AI8h777G/1hkQvXZ9IsEFm9k
 bhyfe5y3dWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgtWQAKCRCLPIo+Aiko
 1dYVCACUXNIiv7h7eyL5vYKr7mFPQgMkaSn7VDwtt0sBRf+f2in+SUE/FrMpVthcL/nSvFLbb8+
 7mkuNjq/wOhUXy+vGEMhzcyB0nU/L6BIFhJrNIikkKPqPLmAKzRnUkNKGDmSyvI2Wb5iWzzMi9k
 MYlRoNWHEoTCUhNV0pYhl/4smxY7U9xGhKarlcDcKgu4+Z3ufQPhzNp724HMk8YwkYuDDl2T3te
 k4KfUm98eINpKaB0FxMJiyMT1dfIzqQvZAYmYIq+lXIrP7RV0lZcUgPamnFUTXYff7Jm18uakkf
 ZEahvzkhOsHoHL97hCurVxOLYtYgAcdaGuUN4bgEeXOJhKB5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 4DtwrfhsvYC1TQase3S_kRj2b-frpr3U
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b82d6e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=llJQ5I4GozCAaw4gE5wA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 4DtwrfhsvYC1TQase3S_kRj2b-frpr3U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX2t9OyWvMnoAd
 y973UGWKp5zVmmjaT4LTNiVDr+H4EuZng7CJupk0lQwxMJs5zBBhmWa79CotTSBd1XNj+kvi4r2
 fux0slWzTVL5l5iKQAsD2T9AxmypH6YNx/+fEygN2X/3PoDb95rxKGSIEklX4W/rJ9Gd8K6Kh4q
 Lm6pk3Mkid4ljb9W2KNWQ1s4mo86wJ74BsUtknvITY72vaUMiNDmstRYmfFE1Ee0RtlqBf/IHWl
 sI5N/AF00AW7W4BPDSa1Ddl2pZXXGUR24ElC4i30Sde7BNzGmu6nLq/lPSsV3YLrfhvYXo8EiN+
 VFanQIQwkJiKbv1+mKWAiVpKAxkiJ9VHIEKI4GHDPGSw467nSZy8ZVQUQqwv95mqW5iZ9gUiqlh
 +0rLvd5u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
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

SM6350 doesn't have MST support, as such in DT schema it has been
switched to use SC7180 as a fallback compatible. Make DT file implement
this change. DisplayPort on SC7180 has been supported long ago (and long
before we added support for DP on SM8350). The driver will continue to
work with the old DTS (having qcom,sm8350-dp fallback compatible) as
even after adding MST support the driver will have to support old SM8350
DTS which didn't have MST clocks.

Fixes: 62f87a3cac4e ("arm64: dts: qcom: sm6350: Add DisplayPort controller")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 2493b9611dcb675f4c33794ecc0ee9e8823e24d4..8459b27cacc72a4827a2e289e669163ad6250059 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2249,7 +2249,7 @@ opp-560000000 {
 			};
 
 			mdss_dp: displayport-controller@ae90000 {
-				compatible = "qcom,sm6350-dp", "qcom,sm8350-dp";
+				compatible = "qcom,sm6350-dp", "qcom,sc7180-dp";
 				reg = <0x0 0xae90000 0x0 0x200>,
 				      <0x0 0xae90200 0x0 0x200>,
 				      <0x0 0xae90400 0x0 0x600>,

-- 
2.47.2

