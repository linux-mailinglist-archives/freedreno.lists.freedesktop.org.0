Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 632D9B0FAEB
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 21:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E82810E010;
	Wed, 23 Jul 2025 19:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="elUwVCTn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B17D10E186
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 19:28:17 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NGxAW6011406
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 19:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dEPpLzKeqJu3UReNaIbyKoLWpwho+WecEv4aP5Gr93U=; b=elUwVCTnep5AeAwR
 IfdVXJzHyJ2j2YgDwvf1rBvHu/pxSLcxLziXZCTqqiJ9dI/AT6ToBgaOshOrpn+L
 txNNOcZj3Y3xqR7XHI7Pahh2yCvF9jgxjw1i1SoNbHBXMsy7SFFjaeyXAn6k4BKN
 Su2tXNx9Nw4tyrJmd1mNtBbILBr41h+t8Z99oUwGFeANTHrhxnytVFqduPV5eVZ5
 2o2odGpxZb7gDxdBDTp4Q8RGJewtZNPx27ZxxQmQ4an6kXeN65b2TB2i/t5N3OlV
 8AJxOh+HLUTcgLhF53DVLiOa6Y/JsbFPT3hYNkcHTc98NDBkrx1dwLuY+Sw1hgGx
 xhibXw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hvbk8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 19:28:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-748e1e474f8so369460b3a.2
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 12:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753298895; x=1753903695;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dEPpLzKeqJu3UReNaIbyKoLWpwho+WecEv4aP5Gr93U=;
 b=Y1ZnMlyI6MQI108g3BEFr7CiDFOwa4xsgjJUoPtS4NnV+ZuP0E032pgxYNWWZZ3adY
 uDHw0Ku3L53dBK4QkeqiLazalOTM4tGxv7LklADVBxzXxoG+ez2FBfMfrwdclYIB1S/z
 NT1K+aoKbhFIeZZjC76aG+IppLsXF4frouFC3xWUW0DEt/mQNWuinfjliBqcZfqvMtfj
 aB5LMXeXFTpzRrWIZPk2YXXVwehWCm1s3rOvuFYzND4Of0caZeBspbkwuntD5ZmBpIJO
 gB7JTZPjl87fdkWfgeIWAldYMvTZFwyhV4H64HWlcQ85u/6v1+TBzLo8R8NyWHnbPm3x
 ADYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcV6BlPsZRQJP6zn6svOGUSo62zIt0MAVnr1Qm8ogW9NMorpqqidenHNc8pKDjYlx+Z24Hekhh2+c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTZEkN/ielDSABxKd3U3pRcIzhVtqhIQqv+UY0TR6TfG3A2bMs
 RJX97WFObHyaX6Lg8NkYklDitzbzWSuX+pYQN5bxa06UjNX7BgRWhwQont/buQkTha96O9iapAU
 1zzGKtcClvjlOy8pAs0s8V1lbf9fJD8lKYTBlWAqVZZMMsdFvdJJMOBqMEpjHsEIclqfdeZM=
X-Gm-Gg: ASbGncvT084aCnMkGo69IzGTXd+q50AiuSbS+8/fVZqy3CxXqnFB5vuMJdS/gQ0LoHm
 tTZyU+fqkAD7aQWpd0UUue6TsUgBxH1GMntorn0MWe5sE8pwfdUoGTv3q8AxW4gKDSzQ1No+09n
 QkIis5NHGKPNesw8PBkGrafYzV+fA9DvIOyZMH/ASGFrwnnPURxOlmcBpxywGikUigExGOPC5l9
 azNjsTes3jqEvm7va6fHYmwyIW8aZNyoD8DYJPeKLILy/J36hPIiAjxjH068oU9N8TkEU1/dwgl
 rMuqQPYCTs+/o9Jr6keidK88IjsuZSA3V8f0kmvw2tBFv/j6CxPVN0X7FuUsqsMw
X-Received: by 2002:a05:6a00:92a7:b0:736:31cf:2590 with SMTP id
 d2e1a72fcca58-760353f2759mr5979859b3a.16.1753298894793; 
 Wed, 23 Jul 2025 12:28:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1De95jDWxBiK1YfH4dGSVrP8HoJa9rCXrriSg+jAMFq+zrcKp1RL82O1tROQaZFGCKLlpkQ==
X-Received: by 2002:a05:6a00:92a7:b0:736:31cf:2590 with SMTP id
 d2e1a72fcca58-760353f2759mr5979825b3a.16.1753298894278; 
 Wed, 23 Jul 2025 12:28:14 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb974ca5sm9973140b3a.131.2025.07.23.12.28.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 12:28:13 -0700 (PDT)
Message-ID: <002eb889-87cb-4b8c-98fb-6826c6977868@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 00:58:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] drm/msm/a6xx: Poll additional DRV status
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-4-9347aa5bcbd6@oss.qualcomm.com>
 <9778efad-e9a8-4934-9b70-b0429bcfe63e@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9778efad-e9a8-4934-9b70-b0429bcfe63e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=688137d0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=f35hG6qQLWE-6-FZ_2MA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE2NSBTYWx0ZWRfX2kwEcCUUENWc
 LeMP2RInqPiU8udnAmftUPrSIywKubUa5pHO5Pj0UtVNTCSMSESO9UbVptCIxLlZZAyoidc/ZCI
 X+c4gYbwV/znIqxvpUVbbmpUvXallY3CTNtXxjLy3kplAtcksubjPMQtHewbmxyAutn1+WtjCgR
 RCrA+0x2gnMDhGFXMHDyvo0t+AHG4kLMCA3hg6JalXFPvXFTY5+ZuLqQhhhmjxyQ2RpmI9t+hE6
 goZK5hXsy/ZVl9/bP4k0HqU9xvl0qLoS4YgTwfgW4e+jplkDEZoHCStDJdhP0fNvhRShdrstV13
 vYgKH4oxzwpMdLnxcUtd0LQOEGCHP+ebzDqkejkD/K4DOWSl0mF9gyeMVykLRLfuNBV/Lg6++2A
 vU0+EDQdl5rLTMVkg0gKIWG2zyOK0UIRSOywE5RZQUiVYgKaN/5aBbw9BCyC8yTj1Qr+Sc8d
X-Proofpoint-GUID: CG4v9ObHa_VzSGjWu01z7ks29So4fNzZ
X-Proofpoint-ORIG-GUID: CG4v9ObHa_VzSGjWu01z7ks29So4fNzZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230165
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

On 7/23/2025 3:31 PM, Konrad Dybcio wrote:
> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>> A7XX_GEN2 generation has additional TCS slots. Poll the respective
>> DRV status registers before pm suspend.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 790ef2f94a0b0cd40433d7edb6a89e4f04408bf5..3bebb6dd7059782ceca29f2efd2acee24d3fc930 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -987,6 +987,22 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>>  		val, (val & 1), 100, 10000);
>>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>>  		val, (val & 1), 100, 1000);

1000us here is a typo and I copied the same mistake below. I will update
all of these timeout values to a common 10000us in the next revision.

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
> FWIW there are places downstream where it polls for 1 ms
> (gen7_gmu_pwrctrl_suspend) / 2 ms (gen7_gmu_power_off) ms (as opposed
> to 1 or 10 ms here), but the timeouts are all the same across registers
> (unlike TCS3 and TCS9 above)
> 
> Ultimately it's a timeout, so a value too big shouldn't matter, but
> let's make sure the other threshold is ok

They are fine. We can try to reduce the timeout 2ms in a separate patch
outside of this series.

-Akhil.

> 
> Konrad

