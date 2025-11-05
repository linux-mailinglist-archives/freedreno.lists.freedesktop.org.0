Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20125C37069
	for <lists+freedreno@lfdr.de>; Wed, 05 Nov 2025 18:19:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B410F10E1ED;
	Wed,  5 Nov 2025 17:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5e2Bclc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eanlEWJ5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3196510E1ED
 for <freedreno@lists.freedesktop.org>; Wed,  5 Nov 2025 17:19:18 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A599iFW356694
 for <freedreno@lists.freedesktop.org>; Wed, 5 Nov 2025 17:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 d2jzqV8oJZ4plosAL5G1y0RTbjdNLT/7KsDqWwEv4zM=; b=R5e2BclcGpupn+E6
 eJr6HC4KPCNehHfO+/Xi04jG6UhWi77hYWRyBXtfApIR5iGblyE+8gQ+nt/jEvbL
 mhsU7wOdW/vXfopUc1TbT3Iqsqdv8LGkR4d/ECyg6lhi6hoqRDx0jJrymhRCgUbN
 eE5sI2hl1QWubnFQt6y5c6BnyfchNIb04uHICuEbLWMtW3oqI/C5EIu+K5QVgqXk
 qME0RkgcJjwQpByK8H5cS28W/DgJdXlQa5CEL0iLKK5AV8PLMwK9MS544hZG/7Pp
 YzG1GUl9O7tczvX5rvXW3fIGfLcVfCkTmYUfDDyUDO07Ki5UfcQLpYANF7iMzKHO
 DLl+AQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a83q5hcwh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 05 Nov 2025 17:19:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-33d75897745so527678a91.0
 for <freedreno@lists.freedesktop.org>; Wed, 05 Nov 2025 09:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762363157; x=1762967957;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d2jzqV8oJZ4plosAL5G1y0RTbjdNLT/7KsDqWwEv4zM=;
 b=eanlEWJ5B8Ic0eL+ME+5EfxRoyZ6RUabmLvd0LHd5GXycMaxVpTIqn+h90e3dFdavO
 q2MSLBoifVSUinIp6YpFotTJBpNtIjqNejrMvP46g/jpsaz0T2qMvsAu+ZRY4cvye+7z
 NiqSiCoZzHPD412i3mEpMufkAST3TveIjQDoBf/U8dTUkh/ATSneSxVzm3IllAYmeNd1
 MuvO9KDyk74mLjRSvpcc/hNTQg2z4htZs8CogZLVjGTsG1WWBGjXY1KyLQFWrFym48+y
 bpuR4Jpv11kxUZs4fvMYHWzsjTj4wE0a8xe26d3mS/2n6QpgXPMta5R2nBR/NtMmDdzr
 o9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762363157; x=1762967957;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d2jzqV8oJZ4plosAL5G1y0RTbjdNLT/7KsDqWwEv4zM=;
 b=S5bMNj4a5nZc6FuYNQEgLRuRJ6yTe0eBDEHcgyc/CfmH5Uf6AKFFAWEY7GNwjsF3Hp
 VroZYu3fqmPGw+SgUde2YYftFDQ5Y24NjcTpJlpoiAo/2/z+Lxs/LPRDfk0CKma0TAPK
 /iSN7pqmh7Vr0dZE7qgYfXdUeLfGYe12iRWzRo25Vs9mqZ6LvE9rMRU/R6NpDGwj2/8W
 KFOstVLAZvx7I1BDPxxdKsQSvCSHlFjHElKs4R+58O3AiH/cLWdBYv1hwcaPf9f1G3TW
 dhHoVRRzGAbEEz2k/O9ESoH/f0FY38v3IvRRoGlmJe0qaO1q7vGBr7aOteaCO9wZk61K
 q3dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJU0O1JpNU2HFAIlhRe7whbLFTQ/1VsT4IC0OUs2tsHaILGkT00EkStq40oP6DAuZS7P3ViQbhEpQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx07KRu6kzgWxABYCAbHgZC9gr9lkLzPDnDchDqhG3BYZ4mGxyJ
 RoGnk4lH5hrXJw/qyj4k/67xlrCNdNVYs8FkxqMUFAg6pHOBx7zVl9s+tJxrlh4+uqNRlhqQcsf
 I3EM2W6XY7GVNw0XaIpaUyPRbaU/8B+BEVd+jCAKz9PtM8tkojcJZo6cDPraCnOVBmqJWBNo=
X-Gm-Gg: ASbGncvbomyrpl/WwT560VLzNqV31h426NDxOLunVyUq9U5AHUjT9mt2th1bg5FihxM
 ZCfK9us9bRZMgcnfmVN7BomiAOyWHgAhMJZ2M2cjbO8pBi7if8oFDcXE1AraW5m4FeqEYVJnPkH
 OnnEEQHYHbrrH0eB+34dYRc4iNkEPsqAVgzDs7QY9rpZibzGDyGSXtTvEfqHXIE3UyvDaJCgueo
 Ei6bAFVddIIoCOPNpeiVDeRqlya3GLcjJXNamdDHrchUql9EKbIkY5SLsQAEtFVr+6s827m1Ve+
 fP3YbR5lMdoc19O+6Q8sLCIzThMc85mZTSECpA4hn/8JuisBV34NCl0IecNgDcFDTD3bTYn5hiP
 lKfTLb3LQj9s4nZXmq+O0yQ==
X-Received: by 2002:a17:90b:3c09:b0:335:2eef:4ca8 with SMTP id
 98e67ed59e1d1-341a7012182mr5029882a91.33.1762363156975; 
 Wed, 05 Nov 2025 09:19:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvzSRF+BBkWYVbOkPymWtRFgJ+GZ8PkUlrRHN+0DizYbOyTJnzSCGFEoQNIQNhQoPoiHhIfg==
X-Received: by 2002:a17:90b:3c09:b0:335:2eef:4ca8 with SMTP id
 98e67ed59e1d1-341a7012182mr5029841a91.33.1762363156531; 
 Wed, 05 Nov 2025 09:19:16 -0800 (PST)
Received: from [10.204.104.20] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ba1e7983986sm6231090a12.0.2025.11.05.09.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 09:19:16 -0800 (PST)
Message-ID: <e67bc77e-77f0-4744-a86e-73fc23dfa705@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 22:49:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] dt-bindings: nvmem: qfprom: Add sa8775p compatible
To: Bjorn Andersson <andersson@kernel.org>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>,
 Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
 <20250910-a663-gpu-support-v6-2-5da15827b249@oss.qualcomm.com>
 <8ff537c9-efa0-4aeb-987d-150bef8b7c00@oss.qualcomm.com>
 <bkhjgw4mtfmkatxjl7enn4fqqjbutealhaqgxihdmcvhekyyd4@lsosso5ta74z>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <bkhjgw4mtfmkatxjl7enn4fqqjbutealhaqgxihdmcvhekyyd4@lsosso5ta74z>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dBhsWuZarJsMHjBJK8LmVlc_a6n8rv1a
X-Proofpoint-GUID: dBhsWuZarJsMHjBJK8LmVlc_a6n8rv1a
X-Authority-Analysis: v=2.4 cv=YZKwJgRf c=1 sm=1 tr=0 ts=690b8715 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=kynJYrAj6unHVJukPU4A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEzNCBTYWx0ZWRfX0kIjp4fzLNam
 TI+mnpLlwmvtq/uPjuKbuKP3Zji/CoydwrvitN0pOk7869gwf/4IavtIY1YHzyXAj5b26E2A5MU
 hcAvWfu0tnZnBU0B5QJReSn1r2z3YMqB9i0v9t52ABiUB1SCBYL3rqPsemldOM+MIZHSUokeeFw
 2JgkNoldlSpbVNHeBpdeZUuEKLWUvICusw/llM5eoId77T8O6dVORsep2Elraa5gZCewnB9u5Hr
 90D1GHDPclfZhTNxzuc5HXfaoHSXJ5wzwVRUOXi/UODWcY+R4XONSbb6Ab/jD0ouSpccsRqNct5
 pMbuQ8Ea8s8uVenQTt0psN9PyL4QL37g+DE9qCMon+IaWuIvurk6sFDJL3ecZmtJbUdWRL17hqS
 qCGfc/fITfSuOsV5KW/cw+vGN1hdAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050134
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

On 11/4/2025 8:32 AM, Bjorn Andersson wrote:
> On Mon, Sep 22, 2025 at 12:55:36PM +0100, Srinivas Kandagatla wrote:
>> Hi Bjorn,
>>
>> On 9/10/25 12:25 PM, Akhil P Oommen wrote:
>>> Document compatible string for the QFPROM on Lemans platform.
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>
>> In case you plan to pick this up.
>>
>>
>> Acked-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
> 
> Thanks, it seems though that I missed your reply earlier.
> 
> Please pick the binding through the driver branch if you can, then I'll
> pick the dts changes.

Bjorn, Srini has picked up this patch today. So it should show up in
linux-next tomorrow. And I have posted a rebased version of this series
for you here:

https://lore.kernel.org/lkml/20251105-a663-gpu-support-v8-0-62a7aaa551e3@oss.qualcomm.com/

-Akhil

> 
> Regards,
> Bjorn
> 
>> --srini
>>
>>>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>>> index 3f6dc6a3a9f1adc582a28cf71414b0e9d08629ed..7d1612acca48d24c3b54c4d25fa8a210176d3bb5 100644
>>> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>>> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>>> @@ -39,6 +39,7 @@ properties:
>>>            - qcom,qcs404-qfprom
>>>            - qcom,qcs615-qfprom
>>>            - qcom,qcs8300-qfprom
>>> +          - qcom,sa8775p-qfprom 
>>>            - qcom,sar2130p-qfprom
>>>            - qcom,sc7180-qfprom
>>>            - qcom,sc7280-qfprom
>>>
>>
