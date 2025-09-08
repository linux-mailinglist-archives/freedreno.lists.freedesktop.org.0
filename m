Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF24B49612
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 18:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B15710E578;
	Mon,  8 Sep 2025 16:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWoo2BWm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7E710E578
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 16:49:21 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588Fg3qI029434
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 16:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TOMlKuJgvjAl2wbNgrUtIbyGV3gXkbep4YDrso3Os/g=; b=OWoo2BWmjx+yIUc3
 MO5SzcHPNtwZdQIA8PCIKO31LNgsMDkQ1hdhc78d0xge96cYO4rpl5obdVFtZkAW
 tkeicnfjZetwGtMsSCHOGYPADaK07E3uVm4olike16TqV6tDnmwb8Z0H29+ioEeU
 uoWRbO20+wV2U4243ZCYAVaqgVQBvcJaQlKENVRioPNRJUD49vixeQ5ITQlLZXdv
 F72Mq4WYV3ZIi2vMZqZV7EDF287CTKcqIWpni+jE+vzrdyFxQdi33i2tFLy+M+tC
 b5sxGIy2Rytfr0cIVI/Sp2G6oxTlv1yeVcdX+VDYLnlMSc8dQXF/XqtKjLNA6Z0O
 zUEeQQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapdkff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 16:49:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-77278d3789cso10119090b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 09:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757350159; x=1757954959;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TOMlKuJgvjAl2wbNgrUtIbyGV3gXkbep4YDrso3Os/g=;
 b=R3jHwq9XR5FribSBYr5BrIquMck7neQhay3tqTx1IN9eb17DiuaLDBJLZUwv0P8fJF
 OkYg+ig1xaXjPLeAzVX7gzCtIYdcKabR0Lfv/wlPSfmnSgfFM6Ho3BlqP4I6n0pgiD7W
 2tEPFa6VPKk/C6v/8fu7YJ10yY6rfv1qckpbwo7y4h8uQYNFhdntyJwQXjcQARL7sOag
 g16dJ/Krw3NUNa1uNwNYE5gzTlALERAzOHa9G/8PjZtoDzul4a5z4DGYryNFpgQFbRqz
 dUiqutAMrceW2zs38RM6fEMvnBDQ9UKnflGW1nS0ua809wirPKDXxRJ6ceY7UQv+HvG3
 W9dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEWTcTftDr7QswpPBJ+Ue3L0qRJhbmfhhwr5zVGKhZvaIdxacmR8/xQEClEfXCApgRjPfDfJzu0d8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEYVv+vrFBui8V8Nvm/58cw2qbZO35weXhG0/psJvW0vK+x/DQ
 2d1YMneOcRdL74bBKZ+VzMlKH5s1hc3CdMmQUO85mQLtMN6+AzLZBVSprMVtrWlRlIWi7wGQYJQ
 k7slROvS+/3CH981/lmNRkwDpbvbrsQv/hx9D2zFvoTIIDbtFnTGu8lH37yulOnQAH31UbKU=
X-Gm-Gg: ASbGnct7138YEG5Z5jlqQR20CJJ0PenAOb8kk5xSEBFFlyvwFvX+O0GWytzJONf/8XV
 H/tOgBRvyyoLmd/Djx62UZSUJqVFtYv46nF/pQx/mQoDNCwGXC8JSi3anzsM11Cii+jK04LPrnw
 I3MjBvP02jACTVI0ljVQD/kZQ08jk8uR5Mzy9qEAUV2bsOj5GswkqZIOsa7lk1hZvAZ0vpvWrDs
 pwRgivZy4Xszypuvopi1zLPsHsmfxlPjTgCfF9+sh1aqmzX9mYxSOveyQMOCx7AL/14hxQLH2+a
 PDHnd4HYeQEn8tbkdf8XrjTDuqJCDh2ygVHV/Yl8cFBsOw2MxO2DX9X3cOJCuw==
X-Received: by 2002:a05:6a20:72a2:b0:243:d1bd:fbbb with SMTP id
 adf61e73a8af0-2534775a1e6mr13236797637.59.1757350159285; 
 Mon, 08 Sep 2025 09:49:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1It0dv5BR9m68fGngu0EK/yeg+C603sZAq9ZhSJtilPcPbfpfhlLXJ7uaZ1TlMyG2wUj1rw==
X-Received: by 2002:a05:6a20:72a2:b0:243:d1bd:fbbb with SMTP id
 adf61e73a8af0-2534775a1e6mr13236761637.59.1757350158859; 
 Mon, 08 Sep 2025 09:49:18 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a4e5b44sm29578565b3a.88.2025.09.08.09.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 09:49:18 -0700 (PDT)
Message-ID: <dc2ce606-52e3-4ffa-87f3-ce4c42b055c4@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 22:19:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] drm/msm/a6xx: Poll additional DRV status
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-3-631b1080bf91@oss.qualcomm.com>
 <77cfd9d7-c3f1-4e0b-8cf4-8567611c3a9d@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <77cfd9d7-c3f1-4e0b-8cf4-8567611c3a9d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68bf0910 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MmCsC9iFmiawHEAYgzAA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: ghUVWLVzzXFiueG2NqQfuKWYpdbRg3EX
X-Proofpoint-ORIG-GUID: ghUVWLVzzXFiueG2NqQfuKWYpdbRg3EX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX4JlbXfVG+FUc
 GZ1v1fqxjoaJWIcp/WqYGxwkbXfv4DGKh4nqUCB9cjh4hXSnCW8am1im4kjyYshobbC02Jdc1dd
 rGg2OfzdWIggutsJpysXIoPhYNzGfzGZuk6jvToaEAIMopurjTgWaSr1GSaG7DErr5UYkCZHxit
 jACdhL0OumJVwlOFqnqBADqVScFtdZGNDRSXf+YWWdEJ9b9jWTPkMJB2IwIL3KddiEnsZ0Wdxwe
 29piJl4pus5vGO/PGNNFc4Bd0GpGHs+sCzZiy0tsyF+4f3RlWTdG8AKq7l2NWH4xhxVyVRei2ZJ
 tiFhmHsxg6zMbamdm+9BmdL/OFTc8CUOQqoWLHjmX6l07+o57nkpyH02VG2OSnPYqhEnCm8zUKi
 fbOOyB+e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

On 9/8/2025 8:48 PM, Konrad Dybcio wrote:
> On 9/8/25 10:26 AM, Akhil P Oommen wrote:
>> A7XX_GEN2 generation has additional TCS slots. Poll the respective
>> DRV status registers before pm suspend.
>>
>> Fixes: 1f8c29e80066 ("drm/msm/a6xx: Add A740 support")
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index bb30b11175737e04d4bfd6bfa5470d6365c520fa..06870f6596a7cb045deecaff3c95fba32ee84d52 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -987,6 +987,22 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>>  		val, (val & 1), 100, 10000);
>>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>>  		val, (val & 1), 100, 1000);
>> +
>> +	if (!adreno_is_a740_family(adreno_gpu))
>> +		return;
>> +
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS4_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS5_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS6_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS7_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 1000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS8_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS9_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 1000);
> 
> https://lore.kernel.org/linux-arm-msm/002eb889-87cb-4b8c-98fb-6826c6977868@oss.qualcomm.com/

I missed the timeout value update. It is not bad since we already have
the same value for TCS3 above. Will fix them all separately.

-Akhil.

> 
> Konrad

