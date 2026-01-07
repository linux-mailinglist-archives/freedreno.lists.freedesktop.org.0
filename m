Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EFCCFDC11
	for <lists+freedreno@lfdr.de>; Wed, 07 Jan 2026 13:49:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F62410E06E;
	Wed,  7 Jan 2026 12:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jcfAFsKc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kql72EYe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA04210E06E
 for <freedreno@lists.freedesktop.org>; Wed,  7 Jan 2026 12:49:16 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 607BMgt33152996
 for <freedreno@lists.freedesktop.org>; Wed, 7 Jan 2026 12:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nInOSF8MGAzCwzQ22jk+RFxs4nryxY1hmu461jpHAeg=; b=jcfAFsKcheXeoXzU
 066N9rpN+E8RR/qykmPFU/xqWXJM4tc5Dbk7qu7qM8pBV8Nb+OWtLD1M0/Ra9mke
 ASkZVtNycrA41d7T8U+6Z8kPxrZHlGS6v2pqil0766IIRmtZBzO2P0hQnM8/10Us
 cVccd7xOvFXIUGoFH+iT9oWWU8Ec/liPvjipy2lodOhmmssxdvj0jVrXaPl6EN+8
 1cJxkISsGM86YLUGM5f+X9NoVi+X1tjOKXfSXC9S4JX62qFmQ33E89LX0qk2JJdi
 7wWf4SlJHlVS+52s7uJWRvGUL7e1yUKLpqSiRyTmn035f/AVz/jIKvmZtVbcYjj9
 afiywg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhpjar6tb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 07 Jan 2026 12:49:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ede0bd2154so5781571cf.1
 for <freedreno@lists.freedesktop.org>; Wed, 07 Jan 2026 04:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767790155; x=1768394955;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nInOSF8MGAzCwzQ22jk+RFxs4nryxY1hmu461jpHAeg=;
 b=Kql72EYeUJL58SHaiM2p9UgxURBOMgUeca1gi7h8gfMjdtmSWC2NsIUR9s3h/VkS/W
 Xwuo1VHlRHFQ6LyZTSgSsPrrmcizOFqhMKmgn+TI3SrzsuRw1vbKiQgRcQo9k1jbtNRD
 Bv5dm94o3JSF4iDeqW8ubPT7qCFvYlrzm6S1A3l/g67aN/Q3MognBqxgxXWB3NrYapos
 EmSdGgi6FmrrwFhKHW09QXBIdr232vqbWnI1DIAQ65EJjc6alJQuGTG1KSXF8NwSnoht
 3soLia9KlxYlWUgkIs/wBlRom/EUXjNL/r+cQWPoxwb2dqLDduNV2o4aSgFUinyKpg/C
 ciQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767790155; x=1768394955;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nInOSF8MGAzCwzQ22jk+RFxs4nryxY1hmu461jpHAeg=;
 b=O4gLvUr52dSuiLlCIEE95NsBT3fvaypdBZ1jyEKJgkgiIUvOIwttGxpK0P8JUWp9YX
 O9Ej6KYZIhmHRN8eSYWLZcQPKjDWAjBcWkW8VapXuKE9GR6P3W1M8OLNplJ+eVQliHYo
 eSGt63Uc4JZwr+AEOOeO2e1MatwKtXAZCenQ0fqvacnPSfRzjggcq1Oxenav7iNyhOSO
 Mh6JpmB/rqdCSZ4ik0hBIKX0+H6lLdkFds6UqaikQFPGOsBUb5IZZ0Bf2Yn6FrqwMCZI
 YUAZUAsnuJjzLi0Mts9M6BhP4HfTOiyvEAxJkqmAV8IE3QxmXQp8s8vyPaVuNihGr9Fg
 9UTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB//SEh+AxE8dNjkbVMJI0jieKdwpq3jTJv3rMtbHym2UV7nUfnHYBXDNj6XjLumRaXLIhCCwN5bI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHK6+rCm0aQfr7a450jroDG+/mc1LEh2n8+7hETwlvKBttSmnj
 jpq/dwdOgVrcI9erFLLI/FXWjiKR86QCtgpzzU6E52I0QCsTHdMqyrSHX06prft2S4HREsrY68P
 iWSR+SSBmfZvDTkw39VZRaLFLXOCBSvjWpLaU0Q2Eg0AVRzdcgUWegPdiERedJRS/1kPTgAs=
X-Gm-Gg: AY/fxX5vZfb5vSR+cNnHA0JJWFpTWdzhXqO35BctJtKvVCFUZZ1XxLXKxNgXX6HyZOh
 rnHaS4q6dKeH3tITrxmtenr/jC87rcfOZFa6zCQ2FoMTYNPyfFkYmGtxP+iR4EVx8JmU2ooNrHk
 NPoWr04uxIpD666NlIthsN/IS6Yqm19NQsyGSO0vAjN9b0pZX4r6Sr6X2Io7pqvuDg16lBtvzzf
 sP9qO/LrxNwNu4hSynyqn2EbdDMle+Waoj1brtOvPBFObdGOEUo5FaRhmBm7tpasWqo8yslRa6d
 b0SbbRVc4LrSWTUJH2iMBxf6ElAuRBdBYWjLf5tmEWf8/MHKcFjZ5zedkTSBHFcBvfStH+oZvN7
 hEblEbfkgFa7LCDVmx9/iA8RqVDEpUg2N1+l3yTfNhEGgEs5qzeJQ12JMB4oZTCuGJK8=
X-Received: by 2002:a05:622a:1890:b0:4ec:f9c2:c200 with SMTP id
 d75a77b69052e-4ffb4a6d91cmr21811091cf.11.1767790155174; 
 Wed, 07 Jan 2026 04:49:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2gokG8ME527N405gZ3vkY9wgXfUJzv7dIKmkJ1ntzHzFlAKqpRNurWr83hbFVa265biuiLg==
X-Received: by 2002:a05:622a:1890:b0:4ec:f9c2:c200 with SMTP id
 d75a77b69052e-4ffb4a6d91cmr21810881cf.11.1767790154661; 
 Wed, 07 Jan 2026 04:49:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a5187afsm494238966b.58.2026.01.07.04.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 04:49:14 -0800 (PST)
Message-ID: <fd801381-65d3-4d9b-aac4-5e5a80487619@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 13:49:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to
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
References: <20260104134442.732876-1-quic_amakhija@quicinc.com>
 <20260104134442.732876-6-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260104134442.732876-6-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=efMwvrEH c=1 sm=1 tr=0 ts=695e564c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=JTjpC66V-8W1Sjuwpv0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: e0svGgZasLwO7Y4kxXgmA-Rc6wCQv0WK
X-Proofpoint-GUID: e0svGgZasLwO7Y4kxXgmA-Rc6wCQv0WK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5NyBTYWx0ZWRfX6hr6BwZFASnq
 JVwok7ZaooqNfmvK9ggCBshEvPXmehVG9T2IqGOltlnrlN8AvAnPALSRv0FRLPDGIi5fnDg4xRC
 oY8zEwLwjOq2kgPDZX8QVBqkqKv2+w0zp/lLZoXaGtkIiGaTvcnuErI5j+xkNwImKKgNzxND2xO
 EnpHF91U79/HaigOd1UtKGTbmnzWG8ixz4LcNsaqh0QPgz3AOsT3kOEhbjgK0X1VCL+giwdPfEY
 74h5FeQ+JuhdnnW0ZB7KECZA2jfjlxQTpya/5SyGHmxAkN2FLla6EzQKzE6cGbdGQDPmfxHo9eV
 5cs4zh6eh6BMbMZUZPW02nRDLqyYuW1jYsZS2dlAQWa7VBf1q69kefiOWbnq6MgKAwiD8jlCRk/
 1yp0UXCrBWiVXPTqZTmrBqtLsSONr3+s85ermwHT+NbZyFnFIAk4qu2wPT+4HqvSdDWV9eSfe/6
 /agYKWQgCgdbG+mel8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070097
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

On 1/4/26 2:44 PM, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device node.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 177 ++++++++++++++++++++++
>  1 file changed, 177 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index 4a8ac26846c6..8d324bf85e4d 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -24,6 +24,69 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	vreg_12p0: regulator-vreg-12p0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_12P0";
> +
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vreg_5p0: regulator-vreg-5p0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_5P0";
> +
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +
> +		vin-supply = <&vreg_12p0>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vreg_1p8: regulator-vreg-1p8 {

The regulator entries seem to be sorted in a "wrong" order (alphabetical
wrt node name is preferred). Please note that you don't need to strictly
have the definition above a reference like you do in C.

[...]

> +					port@0 {
> +						reg = <0>;
> +						dsi2dp_bridge_in: endpoint {
> +
> +							remote-endpoint = <&mdss_dsi0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dsi2dp_bridge_out: endpoint {

A '\n' after both 'reg's would be perfect

Konrad
