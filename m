Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55459AD3B4E
	for <lists+freedreno@lfdr.de>; Tue, 10 Jun 2025 16:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE35C10E571;
	Tue, 10 Jun 2025 14:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tvc5Ue1N";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C18110E570
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 14:39:11 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AAD9Lk011076
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 14:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4pw5nq7+Bj/Ac4lWh78WSk34rnPTAijZmCV+DGEjR6Q=; b=Tvc5Ue1NTVvtqo8o
 yOpjgjwsKLep1BvG8wafzxNyght58u8GSohG6CRMXmhuL6zYsGegs7ft2BRQLHBU
 UAzcFNwkHxgCJGGe+KthukAfiuV8P15a/s1QHRKMirw0DtBGx6AJHONUhAcr2Fze
 awtmYShBqwXz8Ekn+iMnF0qhg7q3kP89FywP1GiBClsMTNm5Htw1aOQCnyFDh/oW
 Jzg/LIGAB49aCDdo4TcpT2dTJ2TPMufCIIxtWsyVGBScKTJmrhqHsW92e9/K0c79
 djQdNBuSJBtTjwQH7mbPSftwrWqO7mn4BsVMrgVSLlc9+7Gb91jI9kcR5V9XnDoN
 WlBQTg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrh8rcn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 14:39:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4a5a9791fa9so15089241cf.1
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 07:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749566350; x=1750171150;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4pw5nq7+Bj/Ac4lWh78WSk34rnPTAijZmCV+DGEjR6Q=;
 b=EWwGt7gSfXl7wCzjJDE6ea5Vfb9YCKLQskcY4LSPBKwN4sXZaPBNwtaruK8r+R0R2/
 vYym+L8aWv9Wlnaq2pCfgVQqP+0Nq6IJ6xWbiWoa/PUFDlEMmadcitSBeMVLicXZw8b5
 Ct1IQ6p24lgESIAQz4XL3d6h6B1MARpNtL+YjF/cINKR3KOj0CQTaIQpScLG7WtsPdRr
 LmaMl+ynAbQuYgvLWFugeLpK9mjWD76kqay3QsvqrHlPxfvlv0YsravC1GdbiDsknNG8
 mVivT6mfm19abo9E3wjr9bDpufskV1HCEKcockOUpgZe7Ob1pOeR8t0h5wsG2UnFCYxj
 2mgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs9rspMNG37oOdnvZJezYHnaLx4cD0mKsJnXmh7osXLS6JuFZCy2IIELOhNIBZKJKx9M4sH/vP7Vg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6rnFWkNDg8IqWdK5alp0Vm9SLgTW8T4HIRCXtPXIse7pu4AtC
 fE0c/rr87TRuEMIZH+tc4E9EaEagLS7uzmlIJpwt+7qFgOrauWyrrgu7tHZ0AsoUvn/FQJkVqSi
 LMRBKZVYm98ZnCGq5VkbQxx+JcRnQTrrMpCRJdOSkN+InblaLd7FFIL9gh2+j+muZ+LTJeZw=
X-Gm-Gg: ASbGncsUH0ERncpWeVvWIeHDcX/L8WpKro/o+Nrkblp/V3h9C6iEs8h97dXsfnLG1qh
 sLHUGwutxqVdtJZmAyrJRoannzUmcVcNRnT/h7u1686TAF3zReciJlSXX9QclslITXO9E/2pIZB
 Hsdqv1IL/4Y+MB5bH03B2zb/M55hmdDg91Dmep2XTzBRBd9d3znELkHL7wuSGn2CBkPfxg+CQs0
 BB68j+2d5RVizu5aZ4pIUDuxwL9PbYTAI2rQbCV8LoX+8TMKLZ+j+lVIsl7jfy10qtx3JQGHUlV
 dcfiO8WbeX3YTFAoSOJc9MFxHV0jSihw2sXH8z3H12UhTM9czn/ili7wx2LfAhtUgvlGze6Aqiq
 J
X-Received: by 2002:ac8:5a0d:0:b0:494:5984:1022 with SMTP id
 d75a77b69052e-4a6690a28dfmr95786471cf.11.1749566349762; 
 Tue, 10 Jun 2025 07:39:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGouqX7qoKwblwHdCsP8sXYcazh4DdthTicdnTn7xgesyInCIp3oCS88Mi1046CwU/GY9svig==
X-Received: by 2002:ac8:5a0d:0:b0:494:5984:1022 with SMTP id
 d75a77b69052e-4a6690a28dfmr95786261cf.11.1749566349310; 
 Tue, 10 Jun 2025 07:39:09 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1db55b68sm738346266b.59.2025.06.10.07.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 07:39:08 -0700 (PDT)
Message-ID: <1b26fd75-f316-4cbd-b60b-6b3496551314@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 16:39:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add GPU support to X1P42100 SoC
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=6848438e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=nNJ8jBrhinZ9UXkNAM4A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: z_VM186M6qwXv1KjNlCNT90GIJ1VzGnj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDExNiBTYWx0ZWRfX35pGSIAzh8A5
 +aU8Vky6U5FyL/elJD1DSKzfAzFHl4FDRmgkNuF2ihB2fNvg0S9CM2hkOKiXux2fFJNPA5l7yfe
 AFKdhUEZ6OCHmym/QcUVgrtUWzMBRe1uNZ/URfNG2p9t0puPeGDUnCVdEYPO8GRxCv3/RAhmRwC
 RXOC4IkxDJHWfMEE4/HwQi1M8UQmOF4eL2+zdHoy80tecFORyaT2pwDwlq7H+Jp/4heTXJ63UT0
 UhRhnfptR5QV/DQZv0/+stS1pHjIGBXD8f4279Af95AlTCPTcxBZMbZMLSW/z9X5BNr0tsqNEgr
 LYSNNYLKHHhm/IWW9kRHCeXObrD/wAdjHYMrsdXrTfDb49YtAcb/u4DbNz7Ma0N7zl92eoCb+XD
 1+b7aLffRMIoU2FnHDp9qCU66XW0GHNliXDPMZp9VI6g7jkJ1nPDUx1VzfThc0ymO62PIdDD
X-Proofpoint-GUID: z_VM186M6qwXv1KjNlCNT90GIJ1VzGnj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=851
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100116
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

On 6/7/25 4:15 PM, Akhil P Oommen wrote:
> X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
> version of Adreno X1-85 GPU. Describe this new GPU and also add
> the secure gpu firmware path that should used for X1P42100 CRD.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> -/* The GPU is physically different and will be brought up later */
> +&gmu {
> +	/delete-property/ compatible;
> +	compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
> +};
> +
> +&qfprom {
> +	gpu_speed_bin: gpu_speed_bin@119 {
> +		reg = <0x119 0x2>;
> +		bits = <7 9>;
> +	};
> +};

Please sort the label references alpabetically

> +
>  &gpu {

Konrad
