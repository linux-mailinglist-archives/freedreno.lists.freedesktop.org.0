Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAC5CA2FDD
	for <lists+freedreno@lfdr.de>; Thu, 04 Dec 2025 10:29:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF6D10E8E7;
	Thu,  4 Dec 2025 09:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETC6BYax";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j4h9vfMC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F9710E8E4
 for <freedreno@lists.freedesktop.org>; Thu,  4 Dec 2025 09:29:39 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B468sRC560341
 for <freedreno@lists.freedesktop.org>; Thu, 4 Dec 2025 09:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 unIHf2bLbiUgKgdZ9j/dH/WmTNgmy72TLalZZX9Pogw=; b=ETC6BYaxzg5F3HR8
 UiNhSQUFxDv9gBs4HiRRhPOtnbNxORAAfBaQa0dxYFCrrtv9gVTIc7VMH5H7+MKy
 O4OG2tB8AiYpn8YQu7BwplB+22Skx1faisvQtCP9mmdoW/ZbWB2sQsk8RVVM97/F
 sux6WgakNdhMHjVrCoFM4XLTbh9fmK83znckLlLAxxFvULHLkb2lYAZysXUmwGtR
 6fHrHAPWhtBxM0cUXsyn9rGnDnouPvdpP39AlRcvWZZP1Wy6zIHZs0rvuzh9kQ6S
 q2gkXLh0ndxkUJ79UifqnBpokgMmjX86YviFqH8UFXSVaL64AlI47rbpM3SuRbNF
 XrmvoA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4attmhaaf8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 09:29:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed5ff5e770so1296231cf.3
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 01:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764840578; x=1765445378;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=unIHf2bLbiUgKgdZ9j/dH/WmTNgmy72TLalZZX9Pogw=;
 b=j4h9vfMCDCO0YVe3uyyMXfYxvVjsSngI38AcWhrmOUjpbD+PiUPXaT5BURLO6PGLXe
 JMGQ/0L9IRaqUz8rBxTSC8RFWrzOK0seK1RqLtrI+yhZwe8uUbgrbFYFv7eyxPccpBcF
 rAcVpNIexrA0AZBNKQ5tpcEcCGRCjTePyLrigMMW9WVSwqR8jIyUtuU8fBZyPlCDSJjc
 grYhLBlqcl/+MMMQ45RfkD4cKXTVyTQqS//EtT6cY+iT5qfJmh40eeESlpT5AeurkbUT
 Bvym0+XiSFyQX+JpoASpRQwJl8f+dV7DVKkNJs5gcHeU/Kj8XEAUvJeMDAw781TQlxZ4
 isbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764840578; x=1765445378;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=unIHf2bLbiUgKgdZ9j/dH/WmTNgmy72TLalZZX9Pogw=;
 b=BecWWfb1uVVQyGowGqdzwQJh54z0F0BRwo8aIEP+8aDDlG70zdPpjQYX/Wmf8gaO7L
 TLdMoAmaFTPUJBeWJXWDXPJpKKS7AJhs/lcWJ++6zeCG28ckgzAqj/oL71JOirgDmJb6
 3cixGV/Nv+5JXzYdmuxQfTom1jjD/UREEZK8nc0ZcNUdhYLsJO/8+J8N2Ta4s1cJ+viO
 o1tshyqNuoGILadnT0m7miJn3a1ssQys8aIl+jt+O+jPbDkRKtrnXXHlv9OrQcy3estu
 m8HDZGoFWwZ1FBftXaArXpbyzxDCuZjxYliXAV9BoUvfq5dzo+SjpfSzm+6NyVNiG79x
 q4PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuNxWZr3Z512fCE4Zecy00Q52uBKJN9reyQOw2Fdd5L4ygimrKq+7GxR2EEce6/jIKI6TZZlNEvVA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3C/B7sczKvMDXI3g5alKtiaC6ayT9z8ddPFBwlyvdKCa5o3gE
 Cd9nwv0JB/Fp8JkYJvrWIFhWljMivXsHGhFoGeyhLCOFAml0t+URsF5x77/deGQtnRkGYzomhAV
 oamAtfc37TKms+IxVGrk6N/r5rxJMCHX+mvl9J9c9E2TOfe4bORgS81/bayA/lb5PrGwYcyY=
X-Gm-Gg: ASbGncshbXj6huYFgMmffw3w69glMWkzsnRgJ6ehVja1Mlo2c3qj3hwZ+p1TKUa4swY
 +8ryXTSRI0m9wZ0JKhDAnHhEnlUB6sr3XVU+TkZOuw4tS5tGW+KSeLD8O+KHKE0rEkhTHGFTv5/
 kh71w1Qe9JJc+PgHJatlgvjb+y7bVwVm6HjvgImbh1+MCpwF43lmonjQQmwdFu+hjPHDr+zU25d
 yLe2F+6pRLvAnb1OYUaMhhTTFKhKll6P1+uqIpIPjnAQBpKpwr6FwyUsr/PqA8roX5b8830F7hO
 ppVP/rLIyIpAj/1bEFnFYxAAhJVWmCSC4VRuz4zHbp0aOCMEk3a8Y3VPKHxtd1OjV0vkiEeYV68
 EN9vXSN9dcrhgwlyYWgPHXB3+qJeg+pnXtONbu2ZNBkBveGUjp6DM6fq9m3RuM2J0KQ==
X-Received: by 2002:ac8:5793:0:b0:4ee:1924:c6fc with SMTP id
 d75a77b69052e-4f01b0b0959mr46305761cf.1.1764840578490; 
 Thu, 04 Dec 2025 01:29:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFmWJJcCfG7Cy5tFaCOZPMPZvEVSgfUyJYtupxfO2ZUtQKd8azbDaBAGnvDPz39Cxu2XF9rA==
X-Received: by 2002:ac8:5793:0:b0:4ee:1924:c6fc with SMTP id
 d75a77b69052e-4f01b0b0959mr46305491cf.1.1764840577963; 
 Thu, 04 Dec 2025 01:29:37 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f4975c88sm78004266b.35.2025.12.04.01.29.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 01:29:37 -0800 (PST)
Message-ID: <71366611-980f-4991-b7e4-f3713b70be6c@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:29:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to
 DP bridge node
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
References: <20251125013302.3835909-1-quic_amakhija@quicinc.com>
 <20251125013302.3835909-6-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125013302.3835909-6-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: blKIyqCKkTTCzEp1XkgvJ0tfzILJ6VGB
X-Authority-Analysis: v=2.4 cv=NcTrFmD4 c=1 sm=1 tr=0 ts=69315483 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=rm2exvCS1sBdD0tWXWIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3NiBTYWx0ZWRfX+ri/4O5ylpEP
 jhglzdV6sCsgA3R50CCO3/4mOLATy3eTcc7l5yDo9xbzGBuHt7gtAFUe6AIHks/mORAVlNX9gdK
 IuESWrHrwdoik1+GCMDR7c2qqpAbn37genpGm60HMcgOFSUz5uGoO6nrLk/6tiQcI7KLCCvTAnU
 a2HhX2DAoRfkU+s8wHb4vjWi5ZhnQCw74DPGo5m1x3QyhNLlVVx6Bc/tyvUMdhlw1kabarexotv
 eukden+AqLwaThLNg+Jq56bk82R2bmzfpxVTNe6FepM6gjs3SjyDZzlEj4+a/J6VQSZDr7rNOPp
 SLZQ3scPGOjPYMr6gfKMjfJd0Td73B+zRb23xjzOdeQsVDC8jyxuiFxh/tVc58bYpzXbtHD4aGY
 Vbj8bEcxG8z6G4H0I9inSp+4NS9v3w==
X-Proofpoint-ORIG-GUID: blKIyqCKkTTCzEp1XkgvJ0tfzILJ6VGB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040076
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

On 11/25/25 2:33 AM, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device node.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Couple of nits

[...]

> +	vreg_12p0: regulator-vreg-12p0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_12P0";
> +
> +		regulator-always-on;
> +		regulator-boot-on;

These properties usually go at the end of the node (e.g. x1-crd.dtsi)

[...]

> +&i2c8 {
> +	clock-frequency = <400000>;
> +	status = "okay";

A \n before 'status' is customary

[...]

> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dsi2dp_bridge_in: endpoint {

Also before the last property and each following subnode

[...]

>  &remoteproc_adsp {
>  	firmware-name = "qcom/qcs8300/adsp.mbn";
>  	status = "okay";
> @@ -419,6 +574,21 @@ dp_hot_plug_det: dp-hot-plug-det-state {
>  		function = "edp0_hot";
>  		bias-disable;
>  	};
> +
> +	io_expander_intr_active: io-expander-intr-active-state {
> +		pins = "gpio93";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	io_expander_reset_active: io-expander-reset-active-state {
> +		pins = "gpio66";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;

This conflicts with the ACTIVE_LOW definition, plus it's generally
handled by the code via GPIO APIs => please drop output-high

Please also keep the entries sorted by the GPIO pin index

Konrad
