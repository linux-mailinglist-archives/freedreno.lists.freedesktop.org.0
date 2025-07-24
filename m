Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52814B10FDA
	for <lists+freedreno@lfdr.de>; Thu, 24 Jul 2025 18:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2464410E12A;
	Thu, 24 Jul 2025 16:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DJrqaO4N";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACCF10E12A
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 16:45:32 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9VegM015228
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 16:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VaRb9zpC453+UAqZ78fHrEC7c8i38sw8zSJ4myj40SY=; b=DJrqaO4N52X51pv3
 sIf/AZ0g8O9a9g3sWh9QteNUucHQYbDp159CRn0BmNmlwIvEO9kVBPhQnrEPEX0A
 rtAxBfKwGPAdzkkk7qqSk7e4qEMVmgWDPMdRdgGvPJ++bgDYktprHKPyk8ONEefg
 gkLXDm9watwyPB+WR86btA9vb6WOPzFXkBhw6Tio3lbZoCCTbOA+BtH2esyD93fw
 VRv9Zs07Imu8ukGf//I8a1h/2S7wJSvlcd/p76mnADzcm17lXnlJg1mXqRfBUY2J
 cfqXsVDRv4now9TNMCzZCNsvoeEA7v7lqKfhM8THFjjicddUxFMyFlPWmTqoaSnt
 +mLydw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483379umww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 16:45:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-235e1d66fa6so12020785ad.0
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 09:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753375531; x=1753980331;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VaRb9zpC453+UAqZ78fHrEC7c8i38sw8zSJ4myj40SY=;
 b=LaslPibEjOP1wWEnsU6u/G1Zc9nhCoIStYEhuDW3BsXhC10OzoF3NRsamIj+Gkf2mS
 p6VMesn+USZF9A/XyVENRDfQwMJfrpSwjXp2O/1h3ITKezZZAUbEqlCbLmjlxaA2DFvg
 /BJFFJ0ALN5NTj0/LafDU75aL+2jlQhgEvQMm/KFJXVUDyMyeHzcI5R44rjNPLi5ZtFV
 fhS9ZCJOOr2TzAN9AIgXspab+rs3/jRkPGaQCzSEvONJ5asfHnNwyft4jCMaiAkTfkvF
 vCfsn2Xchn2qVVySzTkGe+vX6Fe4SVW6rAFwIoiKi1J+rNI6SOlurQHW0x+UixkXw0wB
 l2jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHDmBgnBoucN4cOGnPO4serWWJu6yrUdgKoDw7qDTqUO3zkKaOSM7TsrB8erQEOG7ZDtt/iqSp6vM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5ttLBuY61wWU0vkTdasA2eskUda6u6tn8JyHGm/ny1wYp0th0
 n7qYPyBhgqXigtSElKkJd0j2lk7GP0gvVsG3jZ0a70pNgQppN/xMo1dKqwRHknTxLucZ/qu/Q3D
 s6/ZCJxRtMhlYfajdua8DiJP+waSB6XmvreB2ImKJfkU3dlNZs8YzY46Opn9s4+Y2nlLBUE0=
X-Gm-Gg: ASbGncuvEXxl3gu1de0vRLpwapkbf+NMuu9dNbSFusmA71zC+SQ6HBQvRS7IC8ty6tC
 0JABFeWQotmalOtatkiT/ExfZd2RCXHDI9mq5B7Q+5ok50uC+wZM3tlkwzf0Ev3kKB225jgYAA/
 T7JHsVLFqut80Ym6ARBfrARCuI5Rfvfc1FE6fGsHU0OJqliLQJ+1hhCUSNi4us0u7nB/smMAAV9
 4AA7z+ETrZ9R1FyaKXA8ckfx0fwx0Co2juSPU7brRMFbfHcTw3LuyQEfmhXhGmz8f1xocrOf7dt
 yBxw6Iubho03zRKlFgQDrA6cvzQ1KqfYK3RC6GFvtvgAd13y3KZZzq5T22AUtA==
X-Received: by 2002:a17:902:db06:b0:231:e331:b7df with SMTP id
 d9443c01a7336-23f98204677mr132438705ad.29.1753375530640; 
 Thu, 24 Jul 2025 09:45:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpvYX2jYW1U/FwxOyFgTM+kx5Cd2w9I9tAzBvo64AFEnqPhhsH7VtWSVH5081qu+meM2GojA==
X-Received: by 2002:a17:902:db06:b0:231:e331:b7df with SMTP id
 d9443c01a7336-23f98204677mr132438245ad.29.1753375530206; 
 Thu, 24 Jul 2025 09:45:30 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fa475f3bcsm19431635ad.10.2025.07.24.09.45.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 09:45:29 -0700 (PDT)
Message-ID: <2820a69c-6ea2-4740-9264-7413ae5be70d@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 22:15:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org>
 <ac476949-d0e7-4058-ad76-c3cc45691092@oss.qualcomm.com>
 <53e0ae24-c32a-4b6b-a0ea-b056540c2f3d@linaro.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <53e0ae24-c32a-4b6b-a0ea-b056540c2f3d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TULQetVcIbpWie4c9xZ70kTnmgrLL1XP
X-Authority-Analysis: v=2.4 cv=btxMBFai c=1 sm=1 tr=0 ts=6882632b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=bFu9_hsFAaDUiof9l7EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEyNyBTYWx0ZWRfX8nX+xtwNHwqW
 RJD60loEOR8Z4Q4SAbJNjWeH3/XgYPkvEiBEowsKhaN4h85jyLccYvXDlC/f+EbLCh1+z4NgPf5
 RElO1nv9+NLqEQJsiRNgNOQaQBDwWXkojQvx7AyFz1flSb5jL4WUWLUiAPXm+snUw9jRa3RhcNu
 meAzWZ1IA/213ILdSPH/K/g1ZS60BrZh3SBTlj9fvjiqC7bDsDWmGUFRll9/kmld+0J/JyBPBEX
 Z0zMdhL6dK9CTySxbeQOUhdApL64dZT0S4bK+yGFd/mh2tqPjYcMq1/PMHIylMNZNJ/e9R+GM01
 51wOBZKH2t0d2h+Lg32Ra8gFx7JrsEyUVzaD+8BtRVKzZvDFhZWkaIyHIZbMGtzuPKZso8Apf7g
 R80mjMlDrHqT9OmZvpnxck/op3nGY6/0h3O8M6NhRXeiEGmeXwAhicZaQJCTI225CL6wCjQ5
X-Proofpoint-ORIG-GUID: TULQetVcIbpWie4c9xZ70kTnmgrLL1XP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240127
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

On 7/24/2025 8:14 PM, Neil Armstrong wrote:
> On 24/07/2025 16:35, Akhil P Oommen wrote:
>> On 7/21/2025 6:05 PM, Neil Armstrong wrote:
>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
>>> the Frequency and Power Domain level, but by default we leave the
>>> OPP core scale the interconnect ddr path.
>>>
>>> Declare the Bus Control Modules (BCMs) and the corresponding parameters
>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/
>>> drm/msm/adreno/a6xx_catalog.c
>>> index
>>> 00e1afd46b81546eec03e22cda9e9a604f6f3b60..b313505e665ba50e46f2c2b7c34925b929a94c31 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>>>               .gmu_chipid = 0x7050001,
>>>               .gmu_cgc_mode = 0x00020202,
>>> +            .bcms = (const struct a6xx_bcm[]) {
>>> +                { .name = "SH0", .buswidth = 16 },
>>> +                { .name = "MC0", .buswidth = 4 },
>>> +                {
>>> +                    .name = "ACV",
>>> +                    .fixed = true,
>>> +                    .perfmode = BIT(2),
>>> +                    .perfmode_bw = 10687500,
>>
>> This configurations should be similar to X1-45.
> 
> Including the perfmode bit ?
> 
> +                    .perfmode = BIT(3),
> +                    .perfmode_bw = 16500000,
> 

Yes, both.

-Akhil

> 
> Neil
> 
>>
>> -Akhil
>>
>>> +                },
>>> +                { /* sentinel */ },
>>> +            },
>>>           },
>>>           .preempt_record_size = 4192 * SZ_1K,
>>>           .speedbins = ADRENO_SPEEDBINS(
>>>
>>> ---
>>> base-commit: 97987520025658f30bb787a99ffbd9bbff9ffc9d
>>> change-id: 20250721-topic-x1e80100-gpu-bwvote-9fc4690fe5e3
>>>
>>> Best regards,
>>
> 

