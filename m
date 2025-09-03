Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7027CB41EAE
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 14:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F0610E078;
	Wed,  3 Sep 2025 12:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeKZUD+t";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95C210E078
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 12:18:15 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BFJJf010436
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 12:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AutDsvD16EOr0OTgbsZtdjV+hXDkbazkLSfLhhee5as=; b=WeKZUD+tSWL6z40p
 46t9ccDzdqNz9IhWmGqyqH5aDLYGYQJK+DPJ48xUKg32UdsD2jGpejoet7Uk2+gO
 ETQXNDwF2wohwDfUVpr8bqrlIga0Mzi9jSsdrVd5+w0jELoajzvf+WBwH5ryFxVT
 ZAulzIWcPAtqxA04EEEEavRIfla0Dc6VWQRH/iS3lLKm0McyXimvMwNvxH5YcSiW
 4kfq0vPZA3oT2AQA5BoqPbznZm0EC+QHym7j9Z6BxPlh6fJ02Jv3OdedoZPdp9es
 PKpP30WUABusKrKe9ilMVbWz9sixNw9MGVLNkikYqE6ZAPsvd7tPdoVQzp2NcGs5
 PSA+6A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8uhrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 12:18:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b2967fd196so19447381cf.3
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 05:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756901894; x=1757506694;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AutDsvD16EOr0OTgbsZtdjV+hXDkbazkLSfLhhee5as=;
 b=dsNGcr9pn3NNl2etQPlaEzY8Z2IsEqV4C+Ws9n2OcEfUPkxvx49P1c83BcZG31ml0B
 5G2x+TqzCCZHY4El0shCKHgaraOjio9wx1ddqlPyCpI7fb1VLwFtmL45IxVDcBlxnIDF
 FvJd/HHMPba64HWgWE+Des3Kz+H+4SNDglVOQnXbapzk8tQKRhDAKs37P/fEkwwGwG3N
 fE7M7O831dY/f3PK9hQf4qhgMzZXGFEQZuJF1yf3HQB8KqAynzRnKvLILbWLtFwxWw8M
 T/KaIdhxkneMHnmg2UWUMOXYnYlz3m9FQtx+Ys6BdyJ7sCdRMuKadrVXvylsxUCNWMjO
 JDFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw5wk6NNp8P8IexCqAMJ07erhl2GYaa+8u2r9rVRbCBKKOa2xZ+GcjrCYngNa6se4lU+fqtisC+gE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUqvcPMg0/HuAZgnmFf4HrXO4hQcN+sXCNXdad8cPkp99UYXNF
 Xqt+GuQgU37wahu1/0hzCp4UuyeAyDJUXoqsMGALgezz5J9o48el3GCjpZXG+lHFd4+r8M1Maui
 bGCpFdqzbQRyvXvoM2NS6vpmnsDWxYlX8o0IFCfSVGXINIPnA74rj6YLDHzl7INGCT7EfOuU=
X-Gm-Gg: ASbGncsp3Crr8D51CGUHeoy7lUobQ4gGz79rH67uUDaK8+pWla9QcrwV0oFmpDw2R6H
 I0oPNdSqgTX/8I+1w4rIY8ZoD16pgaOauCFpGVIaieO8AouxgtV00wk0RnEYqW06R0PoTj3H+Ng
 jPNz0lTp3YvAn+Mx/f73TbOqdnGHFnxEyK2uHanMpvID/H04BCzbU0siB4cLQ2e5GzyZZg5p6ax
 Nw2ZZpXdzOVTfrShUhBz16cRttbwEf7vkXB2gSO/KWn20/+SO7xz1Gg5oZnqmuDBpQciXeTGl0G
 hgqBjHDZrdEgo/W9eZl2qZ5+YGLt/H4tLe8Gs64GAfvBOZ5JHdKmr1YkAzn4z6lyU1kxQkqleK+
 XGv1Bnv3NIerDbR+wL5/PVA==
X-Received: by 2002:a05:622a:1789:b0:4ab:6d02:c061 with SMTP id
 d75a77b69052e-4b313e65205mr133752731cf.6.1756901893699; 
 Wed, 03 Sep 2025 05:18:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRf8S2c7HLcbCmImimNW5RYrayUocv/8HOkBFVTA7YGJOz+PpskH2Zk0DqGoAc387ucyJKuA==
X-Received: by 2002:a05:622a:1789:b0:4ab:6d02:c061 with SMTP id
 d75a77b69052e-4b313e65205mr133752031cf.6.1756901892843; 
 Wed, 03 Sep 2025 05:18:12 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b041f6fb232sm882398566b.87.2025.09.03.05.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 05:18:12 -0700 (PDT)
Message-ID: <4ac0ff3d-38db-44cc-9e36-44f9e819e96d@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 14:18:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: lemans: Add GPU cooling
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
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
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-4-97d26bb2144e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250822-a663-gpu-support-v4-4-97d26bb2144e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DIx0ScolG1uI5PCpxthn01IIww_D3wOa
X-Proofpoint-GUID: DIx0ScolG1uI5PCpxthn01IIww_D3wOa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX1voxoTUKYabC
 eLsgxcEX+ODDUFbnoghggX7gqJqA0PfFOIyVVle7BSJ706LEjyFJdQ/YxjjYVxg56p8ULq2LIgb
 cBDyLKm8MbrLF0aPaQx83BIEn6BhFRl4pPWwcIpGiyKhH3PVuj6YnaCHRBwuR/CZCdmT+skaQgj
 Y2+flZ9pTH3I2fPWM6ggBhaDroh5TSHf356cxsYLh+B4IbYLyQxXe7+NBFfp4lA0OgVpJWF5B8A
 ITTRxP8xJJPIo+VA7mBGi4qxoMtbtfnZRgvPrelG4fCEYUpFfe7pyqkVneV+t4w9pY7KzWhYKoz
 0kfNzg5BNHykyQ94+giAaB9SMQvLaPTy6UKSYcKJG5OEyzbSsQNXEomjg2Re/c0ew4sDafXEFE/
 WMo1SRbV
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b83206 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=R3Qjy7WId1ItUu-RO-4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020
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

On 8/21/25 8:55 PM, Akhil P Oommen wrote:
> From: Gaurav Kohli <quic_gkohli@quicinc.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed
> when reaching 105°C.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 67 +++++++++++++++++++++++++++++-------
>  1 file changed, 55 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 8eac8d4719db9230105ad93ac22287850b6b007c..b5d4d07b2fd9c14a6f1cc462c695e864394cade2 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -20,6 +20,7 @@
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -6816,13 +6817,20 @@ trip-point1 {
>  			};
>  		};
>  
> -		gpuss-0-thermal {
> +		gpuss0_thermal: gpuss-0-thermal {

You don't need labels for the thermal zones, just the trip points below

Konrad

