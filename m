Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81225B2641B
	for <lists+freedreno@lfdr.de>; Thu, 14 Aug 2025 13:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F7F10E86A;
	Thu, 14 Aug 2025 11:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="euaRl9WN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C330B10E852
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 11:21:44 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E95d81002966
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 11:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BLzSrsvlz1k7U0IApR8xjk7JKOJ6PPWdleXZ1uW1ptM=; b=euaRl9WNX9NsW8OO
 /OnDGUTHnSJqOcIpM+ERPAffH9ircd+a1aV16KBhMT4nLYU3IUTZYcFK2Ba5wX3X
 JiGFsECAxEv2/+2SMItlzqgRzBVwLMjhLmjSTkal6gbFNc4CQADVf6ROuggcLd8H
 C95uH1jq3v48osVuu4V/eFVQ7KRqdQS3IRkJOSiu8sZkSKEPQ3b4IyWbAWYYYaHc
 3p8+495wNoO9fTXi3CLZX0xvipyJunroaaSz5rtcqhL2p+WCYNhHV1eMTHJdxMGn
 oR35uXiO0w/6UjeYURysgxKlSVUY70W6bUJMChqPC93F+cdmTYBpOjzewNWysabv
 bSnDWQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv7fqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 11:21:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b109cb7ca0so2563331cf.3
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 04:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755170503; x=1755775303;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BLzSrsvlz1k7U0IApR8xjk7JKOJ6PPWdleXZ1uW1ptM=;
 b=niHU7Unx9rxaRfRWO/dlxe83fX+UBNlNrnGal0sKyX41K98wY/K/lX3Y5avetYPKoG
 9dGJyvO4lor6Jxc5hjCxrM7rt+w70veJG4hW+C/AV72gix9oenyDFDvV9CNnk4cDZbWT
 NH/xjyQMRdunmN7glHiVZPU3EwJhXv8YVEFCrvIO3tvp6qrSMZVa+mDdKJTyrknIV/LG
 gVcfOtWnCoRjgc1fdqJiF+SUjUX+dGq3DHXkVUY5Gjowz8PKXHg9chJk7Gc2Hc6iYDZT
 iqeyaeCGeAM3wXnvqzqhKa9nWzST+h7jaq3lWInDEI13h8XUYvQfRWRLvPFEK3Snq79R
 l7ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8gFwaP8fLqsXXUdOnlFAupx8ZmSSE/aI4L3lJBJJ4ewJHVCLJJwrsX0dmGOw0gFgkvQ+plm4z7sI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQhKe2CVs6bdCk/1iqLzrFoVVGd06+Owz9kjwBG77tyvPU56UN
 BwWATeMKYKfzzPk0DgS30XfYtj83DiRi1XOSeIBKb3AlLHvCztR6K/aRcabEjmXa/ZDEt01BCFv
 mofuVC7VZ9wzfjJe8PyI9wwXwKh7j8vP/TucHfpsL+EHiZcUxEHFfM1TxuP6/eL/8HdEzp58=
X-Gm-Gg: ASbGncv9lV5xiPnTxtwgeRwM9PKye/RrOfpCMO7/pXdVROkq7UdOWt5BaHSft+KPquF
 lXSao3s9ClVc39mGOf7kJPtuqAuJsTGslwbXV6P2JulF4xObcjvCOwLldbuvzzXagZjtAfNHnXU
 ODXBoXxCGk5OX+gJkYovzlkcMWNJv4JmuflVTdfYREkZQ+L0uWKR4bMLCeen9pte/gk6o6b4Li3
 CgB+vPVcoUcoNb2Rr4GfsV308a1dYj1EvMQHDMwOreGNFUACg2F1BBWrAKc51PvCccvLcPcpr6q
 o/QlPKULaO5gJpzgp55TxwfIcvifD3w5xPE6hz2jIduORHd85VYa/QBPRwmD4qeXC1THiwhMVNR
 tUC4rX9QzeuA/ubyBMA==
X-Received: by 2002:ac8:5a0d:0:b0:4ab:723e:fba7 with SMTP id
 d75a77b69052e-4b10aa82b70mr16850431cf.7.1755170502747; 
 Thu, 14 Aug 2025 04:21:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGvtOWlrpuz/iNQTwiGREwfxnYm+3vQJfqpP9BRWhj2V2vfmiGGO6FJVbo4wdvgDfBPNzUHQ==
X-Received: by 2002:ac8:5a0d:0:b0:4ab:723e:fba7 with SMTP id
 d75a77b69052e-4b10aa82b70mr16850081cf.7.1755170502199; 
 Thu, 14 Aug 2025 04:21:42 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a1e6cecsm2578916266b.70.2025.08.14.04.21.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 04:21:41 -0700 (PDT)
Message-ID: <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 13:21:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
 <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689dc6c7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=vBWWQJBIfp5UPC7yhvoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8O_GOk_d4Lodz8HYzReffv1NlrmS_Kmm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX52q8lLhd8J+U
 sioVU8+1FIj9+cXoSZTf14wtGbczxzayOguFLts8KNlCClmbaSIBL0f3AnnT2TmF8EKGILhemQt
 9ThJdlOE/DNZLND4WEMFFQnwGItcD7MxCAx1atjHZ/sJvXAtNUnskdbJ1qt6dB1/tyggnq9sQmh
 UALgk87bOu1Q7ag7oVKd0iNdtmRhA2IgZnSFvuCTcs2J4GcRfIvrfEEu7LtdPi41n54ACVBZi6f
 VF2NfaC4bqQ4dhrEHpT1a2ANXEwkK8fiLKZFkokSn6fN4hqSW8GbJCTcgTnknp8XjGZbG+FBfuI
 ChWxBOd1pFkBdTzI5pTCCh8o6c8sxVKmslhMRYywROmJP1UK7PnQAuWsV1ahvv/D7U5wFkzywop
 d1As2BqR
X-Proofpoint-GUID: 8O_GOk_d4Lodz8HYzReffv1NlrmS_Kmm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025
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

On 7/31/25 12:19 PM, Konrad Dybcio wrote:
> On 7/25/25 10:35 AM, Neil Armstrong wrote:
>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
>> the Frequency and Power Domain level, but by default we leave the
>> OPP core scale the interconnect ddr path.
>>
>> Declare the Bus Control Modules (BCMs) and the corresponding parameters
>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>> Changes in v2:
>> - Used proper ACV perfmode bit/freq
>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>  			.pwrup_reglist = &a7xx_pwrup_reglist,
>>  			.gmu_chipid = 0x7050001,
>>  			.gmu_cgc_mode = 0x00020202,
>> +			.bcms = (const struct a6xx_bcm[]) {
>> +				{ .name = "SH0", .buswidth = 16 },
>> +				{ .name = "MC0", .buswidth = 4 },
>> +				{
>> +					.name = "ACV",
>> +					.fixed = true,
>> +					.perfmode = BIT(3),
>> +					.perfmode_bw = 16500000,
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)

Konrad
