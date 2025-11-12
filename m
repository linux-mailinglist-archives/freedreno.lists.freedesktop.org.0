Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1D6C54AF8
	for <lists+freedreno@lfdr.de>; Wed, 12 Nov 2025 23:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A3610E07C;
	Wed, 12 Nov 2025 22:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YaOQ2gMv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="InB+IHmV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A2910E07C
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 22:09:38 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ACE37KS1270581
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 22:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PKqNXD1DollfLI5h1J2Xseqpi/6Yas+Ng79HmXPNvu8=; b=YaOQ2gMvd3/T2S8/
 MFfA/GNKngL5oDoYFpGPtoDfaZtgNEd3XKI7mFuEDVr3AoHNMLQ1RveVof/P4K1C
 MBTr1vFrsSX3rd8CT/nDm0Cx7/HQSUMMxBkD2xD/pggoeQbc4UdQ0At17NM7gWW9
 5m2RJOwq74SAEruoLtIqCJDADeMt6FI2XMOwC3eITawkofhDN8nltztqtxQRHftW
 foR+RMjQpLY4n/Nag8BcHwprobmGjkMqulU/Feeqm5lHY85HMukVa2nwk57pu4Nv
 QPdO5BzUJ37cd+3xC7xlgxq0B5paVicxwtHp1lLFddI5EtFgX5NYPRo3fQUlSEkf
 j0E5tQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acunm1g0a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 22:09:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-297b35951b7so1380445ad.3
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 14:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762985378; x=1763590178;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PKqNXD1DollfLI5h1J2Xseqpi/6Yas+Ng79HmXPNvu8=;
 b=InB+IHmViIyvsMQUtku3MYBKC+0JuYk5FN9KaPC3xEC8JqCnRInKvS5dx2Ob1X8WbY
 6FwV7NJgZik7ESpW2y/GB4TLMlc7WQosvOnRTHk8NSmUn59AD0500jLfxlNH2HVKxpRQ
 qJFX+R47/4kshaP1njyI3xV7b78xWTEbH6rLzsRsNkcOKuHr/0ltJo5h8mu6njCG7Szw
 FQu+zR9OkVOpc0I7F6k1vZSKbJXkr1wwpJUO4Qmx/cB2dpdRiVR73Ji5Y38DJZoBkFIQ
 3FjD9laqweUhcfYPxtHyXai5ad4XQryIDpbJomceJwJ9KGfValWAu9cRYYMNmAw8NnQh
 kyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762985378; x=1763590178;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PKqNXD1DollfLI5h1J2Xseqpi/6Yas+Ng79HmXPNvu8=;
 b=jUIGNXR7H0e7a3jeJewr/2bQdGNWxY+CABWjMs5sbxFLaJx3mickK5fkOglwbgA98y
 cv1iOKyG/CYCfSHozhj67tM0VJ0RlkfZs5KbyKic9UhMAHWOiS6m0ek+hy2WPyOxGOBK
 tAOzFmhek2WFRPk1I2twBJxEaQeKiMSj/9lknuyj8ZRkRY3z3wvTvaOt5z8wsO5H1p+5
 ZKTilYIq9Znfh0UceCUlm0zPc3jh6HYY33WOnSBs1ocSNHuOc61ZWHzuOuND/tQt7Hak
 jeA+pPZRy6pynSCdrxIlgkl0uF7GaLIVCIsZgtT/ZodYsYGgT09HTYSKNH2hvYW/LZAV
 Dycg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm/uAajYLiapnqoM6ppbfDFsWUYj0iZMNbOSFu83hH3Q/y5g0Zq+NhwcU8rA05wGEYfMNCtPovAKk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPq0DRVQEz8dJR2Lpon5LOpL+PQRIjT1JlIra021m2UAEnqrqj
 f6ZMf8zW0ZbBuLO8QkxZFw+L3Fm3zntUTG/QsSNRi+otioMwBPiRfaqH0K7qGcQ7aXdpXpNkXH+
 HPFU/NWgF/a+5vMmlnXt1z/Osl04ECdDqyOWszomYgPjBhZMZlZN0Ds7YnEnLQHbx/KI3meQ=
X-Gm-Gg: ASbGncvE5eJSqi71OJc7tL/QIzraRiYEtbidp2hBFKKpxx4I6vtV7z9LA2/DJ2rhO7l
 R/b0lx+r1HTlflZAIla+iQdXy6pF+BQwdZgCtz7N+2oecCz+hw9XluE3OV4lmLBWkh9mDFGz4m6
 Ct+gOi1G8Ga5PbRzLSnVLq05jdAc0w7s/eAzpS8lFel4vspAr7MnLHGzsMuk3vk55ugN8CjJWdM
 BtKcAWJT/dyB9TY06u5MRVIuAmvL7urIMD91UTGsJ9nDYDygVdJkH3eNTL0ACg81ujf3OxywggP
 B7UWtZNSf/hNP8gTGNHvVkkcwAe4+krOaepNdzA7rO0OFMNGT4X4OyNixsiwWAMKHCrgmC1Qf8G
 ES/jA4DkWP1/G9A2TqtOr3A==
X-Received: by 2002:a17:903:1b6b:b0:295:4d97:84dd with SMTP id
 d9443c01a7336-2984edd59fdmr58284575ad.51.1762985377579; 
 Wed, 12 Nov 2025 14:09:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbDPQwjbxvdgWkQp34t9iHfLbIFLfFbNnosXkOr7CJTuwb5+1HxivTIaNHyQXba3NQUZhkaQ==
X-Received: by 2002:a17:903:1b6b:b0:295:4d97:84dd with SMTP id
 d9443c01a7336-2984edd59fdmr58284135ad.51.1762985377049; 
 Wed, 12 Nov 2025 14:09:37 -0800 (PST)
Received: from [192.168.1.5] ([106.222.234.47])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2b0c9dsm1704455ad.67.2025.11.12.14.09.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 14:09:36 -0800 (PST)
Message-ID: <d4753c6b-b3cc-423b-912e-61f8b7bc3c1a@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 03:39:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/21] drm/msm/a6xx: Fix the gemnoc workaround
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-2-bef18acd5e94@oss.qualcomm.com>
 <a1273bdf-d926-48b4-877e-48d5ff45e7d9@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <a1273bdf-d926-48b4-877e-48d5ff45e7d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE3OSBTYWx0ZWRfX2208Vcr93+ew
 Sqns7uk3pvMbwTK1U15HQvDnJbF4oObfPKwo6sXhVW03svJhrAUwYL4me1zWkCzY1q8m4tfcBqg
 K9WWGBXRGpGPrZWhr+DC8cRPedXrZboshubL9ihZJjv583mTXBa3+cAHEBYaUAGhG075ulaw7J1
 Pk1P9XZxM0fgaeVD3J0QkjLUgUYFVxCwDdlESq2TDFN7uPiOWOAecjEpz2ZuD4X2OlZkc3saVwO
 /JsFMkCAdPjsaREqb7MvWBZZLsMmrZWB3QCi2aNGA1+0/ZOMr/9BrRa/hCyb/51EACRqqjnDQ9M
 hQJi4xsvqP4n4bNWkBUSnPhE5wOf1IMKTDhKHiaREiFoPt1FaIP+RKrGE6DJhWWKXW13/KENtts
 aajIoJmhhy8oW2su2FzuxHwkOflURw==
X-Authority-Analysis: v=2.4 cv=aLv9aL9m c=1 sm=1 tr=0 ts=691505a2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=2IP1oaZ8+KUWsYovLW0HHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vAHTylR2Z3b6qOykXHEA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Xa9raTpsZn13wVezrPm02rmEsr31ryIH
X-Proofpoint-GUID: Xa9raTpsZn13wVezrPm02rmEsr31ryIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120179
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

On 11/12/2025 3:48 PM, Konrad Dybcio wrote:
> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>> Correct the register offset and enable this workaround for all A7x
>> and newer GPUs to match the recommendation. Also, downstream does this
>> w/a after moving the fence to allow mode. So do the same.
> 
> It does so for _notify_slumber(), but not for _pwrctl_suspend() in kgsl,
> but in my understanding, making sure the bus arbiter doesn't gate access
> first makes more sense

Yes. I didn't change the order in a6xx_gmu_force_off() (equivalent of
kgsl_pwrctl_suspend)

-Akhil

> 
>>
>> Fixes: dbfbb376b50c ("drm/msm/a6xx: Add A621 support")
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 4e6dc16e4a4c..605bb55de8d5 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -485,8 +485,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
>>  	 * in the power down sequence not being fully executed. That in turn can
>>  	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
>>  	 */
>> -	if (adreno_is_a621(adreno_gpu) || adreno_is_7c3(adreno_gpu))
>> -		gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, BIT(0));
>> +	if (adreno_is_a7xx(adreno_gpu) || (adreno_is_a621(adreno_gpu) ||
>> +				adreno_is_7c3(adreno_gpu)))
>> +		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, BIT(0));
> 
> Arghhh copypasta, thanks for catching this!
> 
> Konrad

