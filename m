Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6CAA574EA
	for <lists+freedreno@lfdr.de>; Fri,  7 Mar 2025 23:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D911410EBBD;
	Fri,  7 Mar 2025 22:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lGGTuGf1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D37710EBBD
 for <freedreno@lists.freedesktop.org>; Fri,  7 Mar 2025 22:30:54 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5277avQV017916
 for <freedreno@lists.freedesktop.org>; Fri, 7 Mar 2025 22:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ak5fxQibEzWrpDH5Ilc3caDZL5F6Fyf98J8EyekNGds=; b=lGGTuGf1QBsFhqug
 y+AEq/fVLBCpxKJm3ESO4Rvq2CZtwXrkJuhtDQdP0pG5sS8ajLzMcRwILll9t9yg
 YoSWcjftY1G5rPqvIyCFWFVmHWwAq2GQXewt+gwjSrtKe03ehTw7LGxnw+YOzhV5
 DpDYXs4DaTqJH8EJPqbzUvsTWsNVxgt2uy+L2REzy9LZhdYN5W+o/42CcKxuRBX/
 1CIMD98qNhDLmvwELoICplAHgIIc8XEGTrUkBPPD/yyrynfAw2jIKwoaUd0b9AP7
 ZaelTsOEIe8u8wG9VI60tKaeb+cqTJktAZDh5E7GbF1CegKbFe7cbhvr5iLmovMO
 KsRB6g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45778tde8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 07 Mar 2025 22:30:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e8fd4ef023so4303596d6.2
 for <freedreno@lists.freedesktop.org>; Fri, 07 Mar 2025 14:30:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741386647; x=1741991447;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ak5fxQibEzWrpDH5Ilc3caDZL5F6Fyf98J8EyekNGds=;
 b=Zng/dy5LkfHmscRJEb09nWDNOoKo6whtZ6bgtKXEeAP+hFJeUB/zy8BSpcy1aF8UeM
 5U9X7Ff23D/LGMSPGeDp4Gupv4kf6TAHywHdNjRivkFDPZTecZTNgc6oYzk9CuBscq/t
 /wBa/BO3hAzPj3pXqPlzmmJjlHJc7OfZoiVII4rYrwo5jRY0ZxWSqLZvcE7E1Fhys2Wa
 W7a1a79hqa9Kx2Bx3UKHi/nw51ch4fvZvu2KsJM7fj3Y6tFPNNM0VCCaWkbq6Gk5Dniq
 lXR02OWmhHRqzfYdExOWxBr+OLzr/sEFeDT6+FC5g9eDtrc3RKFssdHZQZ37kSNkVzQ4
 eQBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOT9PtP08bEOCnaGf62jr+yqFyvbPZOD2aLjHl84HRwxBmY+CtuULSarcYgaFfXoMInbP+8w6YxAk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYuM8Y6ZRZBTewaK6wAIA8aIewwjK/xa8ghcY0PRzA3GGMC+wg
 gyxA0/vT75Tz7HPYeOwL3qOLtjVB40dnlsl8H7PFDg7b9g+cev2U2jQNVrJ8SRn811lagaKmgTB
 FzidjIfM8pi8NXYDVt7/B4v0jNkQCj+4Tcjjc0HCRuAd88wmWHz7KGQP1UjmZFPTETuU=
X-Gm-Gg: ASbGncv3kjpifu6UTKAWIwF2aOtnvymvpf1pmJ8IyQfqM9dWHGOXHwQEeVU5S+OGIFM
 pQUGMVOqfylq7Y7sne6SgcyJBfMdvwH/Pekb0M6IRN2Z8SlAPAF2qJGjz4rCdMuKklRY/ESnHZ9
 SSa+jf4ywdr+18nRVm0exxElX0V/femkkEoKgxDCjJOsJvUCLas60QRHKq351pa8FPovjiHXZF4
 h6H3ywKuh77J3yBN1uB5b6yF0jQnh21jTbSOgQjaHRoRE8cVw9LkUQOmnIjm0j2hw2gjlwyyeEV
 vGsUDuXRpu7CL1WXGODP/b80m8kSsoENy/jGZN2RW7i/OXsZXueYb1+9u1rLfOiAgDiuTA==
X-Received: by 2002:a05:6214:ac1:b0:6e8:f645:2639 with SMTP id
 6a1803df08f44-6e908cd150fmr4825336d6.5.1741386647158; 
 Fri, 07 Mar 2025 14:30:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiC4koxcJVdaUrklQtVOopVLiy0hknFp7oOAgVhzdT3gbIZwIK648n2T72jt6jEmVlQvFqKQ==
X-Received: by 2002:a05:6214:ac1:b0:6e8:f645:2639 with SMTP id
 6a1803df08f44-6e908cd150fmr4824846d6.5.1741386646742; 
 Fri, 07 Mar 2025 14:30:46 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c74a6af7sm3083132a12.33.2025.03.07.14.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 14:30:46 -0800 (PST)
Message-ID: <d0d6feb9-e89d-49c3-8569-91591eae6161@oss.qualcomm.com>
Date: Fri, 7 Mar 2025 23:30:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] dt-bindings: power: qcom,kpss-acc-v2: Add MSM8916
 compatible
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Foss <rfoss@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Rohit Agarwal <quic_rohiagar@quicinc.com>,
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-3-0c84aceb0ef9@oss.qualcomm.com>
 <Z8rTW3fQObiZ7del@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z8rTW3fQObiZ7del@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7hL_VfWhIc1MKeEkVszzing5xjLVVVFN
X-Authority-Analysis: v=2.4 cv=U5poDfru c=1 sm=1 tr=0 ts=67cb7398 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=2aLQLXHzPMxx44zPxJMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7hL_VfWhIc1MKeEkVszzing5xjLVVVFN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_08,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503070170
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

On 7.03.2025 12:07 PM, Stephan Gerhold wrote:
> On Thu, Mar 06, 2025 at 07:11:15PM +0100, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> MSM8916 seems to reuse the same hardware as MSM8974 and friends (for
>> whom this binding document was created). Add a new compatible for it.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml b/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
>> index 202a5d51ee88c7190805efe8f1bf493bdb69ec45..27dae49163fa0790ceb6fda8a5c674f739d4a41a 100644
>> --- a/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
>> +++ b/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
>> @@ -18,7 +18,9 @@ description:
>>  
>>  properties:
>>    compatible:
>> -    const: qcom,kpss-acc-v2
>> +    enum:
>> +      - qcom,msm8916-kpss-acc
> 
> Hm, MSM8916 doesn't have a *K*PSS (Krait Processor SubSystem), it has an
> *A*PSS (ARM Cortex – A53 SubSystem, or Application Processor SubSystem).

You would think that, but actually it's still called KPSS internally..

> 
> I think this should be either qcom,msm8916-apss-acc, or you just keep
> the qcom,msm8916-acc we already use. I'm guessing ACC stands for
> "Application Clock Controller", so it would be unique enough already.
> 
> There is actually a patch from Rayyan already with a R-b from Krzysztof.
> Maybe you, or whoever is responsible, can pick it up?
> 
> https://lore.kernel.org/linux-arm-msm/20240710155226.130086-1-rayyan.ansari@linaro.org/

I'm not opposed to this either

Looks like Sebastian Reichel and/or Ulf pick up power dt-bindings patches

Konrad
