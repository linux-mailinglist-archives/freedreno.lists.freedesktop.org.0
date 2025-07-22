Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CD6B0E45D
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 21:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC8210E09C;
	Tue, 22 Jul 2025 19:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hCA7xZXi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD3A10E09C
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 19:47:53 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MCHOEB005532
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 19:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EEzrFntqUpXwmzhEbd6zxsSsOyDtSlkzdmerHqu6YxE=; b=hCA7xZXiYFhwYDKW
 tpltNKSTlmbynKdXCm9Cms+9Wvjo3RSWdQb87B5oNmAVIdJa2k2TPl86UQyhNww7
 JKu66usKv+bpAcrQOi4rhN1xGsnNNV2YGg6PB5/kcs6dMEts5f5WUGIahGWD5b9h
 n9GGNqUT3L4O7wqXQuVszdzA8KwrnGsnNEf3tT5raA0oGqN892TwGQ6mNCD5MzwJ
 4egw2x2BrDZLxomnpL/rxrkjeiAOjn/c59mBVjc688algM4UcKsOiBlzeYyUDPIU
 2dZ9CQfKc60eMSrRxeQ5eCUbeSXe2H9G9GllYR7Yf9P0DVFbYC0U9wQYWCRStsnQ
 Cn57vg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qar0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 19:47:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-237f8d64263so56413745ad.1
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 12:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753213671; x=1753818471;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EEzrFntqUpXwmzhEbd6zxsSsOyDtSlkzdmerHqu6YxE=;
 b=m3PacHDKrQnG5QTx+ysan1QclqHPiZ3qd1NF2I/OO5cPReh4lZBfN8m72gwA7T1Thb
 dy/lvVCaIX1blN9euMaVZ9aBHHA1Kp64wsR42nwvrpvQH1Ozi6PSa3O/D+o1h8FMSjyA
 DsBlhBcaECpJWYAFjaps7YmSkeksVJ3qjVOUjTNvrTXjfBfRVxOoDP2F7JGBOV7Wg/eZ
 aFlj+qxHIaXioacx0acGYXZu+IA7wVNQ3w14TPxEHDwIfaqJiiAH7Im5ihqm7wPLAoQW
 iqDXQ+jEvKUrIOiVUtfE7ytgwYBQcL3Gk3KOpixM6m6c4AUTyY73w0WN0CBOMcTEH+Cj
 CMCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXthE+4FL0HsHIN+PLCMaeCKXePHczXOeCranjeuIy3gw4B9JrdMJpU/VnlS4mL+nT7UJ2fCX3lR4M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5Sqv9kfccd3x407aoOhZPw7MoIN0NDlEsOFcC1jD8g6vMZMwa
 +RrBcROmYEVHF0dcBpjUW3w2x4VaFo5xKNZ3hHYDjGUHMCroIsPXC45N+81idMLoskw6HTkLM27
 ltGQKH+aYFeUHvUjTmtyVmCiwt3jAReNjWZAJSjPVVTTIFbqzOYOToQY5GEGshyXt3wPjoxs=
X-Gm-Gg: ASbGncsJzl7BikVJEsKpZ8cqehlsx6HUMM/BtHkfANr4nl6xjOD47cD+sdknBsMYoeE
 oFaJmOaZsahMc/WCJcalpAXyxdCKujIMqwZjgGyjCfqk5+MQesrh6KSKxwSxyfTG9UtADBuqw19
 ZcjiE9ZT2ocXiFsU6zvk2N+NwZsD5vQSilkYSsmlH1agzZgYotbCpD/H3rbXViYZCwiO7Es951b
 rRZbSDbIKKoNgkaNMPIhIGkEtd7HB7QY4a5TxFoT7FE2nsGrUaIH4fZzKlNycNWx5OGbLZf4Vsz
 1smSH4/xqoExCON5yMORSAR/M+Mt1RxVM1D8os9ZFZwoOprTXMiyCs5HZsSBa/sw
X-Received: by 2002:a17:902:ce8e:b0:23e:3164:2bef with SMTP id
 d9443c01a7336-23f98172240mr3021195ad.13.1753213671271; 
 Tue, 22 Jul 2025 12:47:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU1qOtwmPdcPsJGIhheRiktlJaDiPc1l+Av8pvaEKyMToOna2BedvGFYD8Q4SL4rfvukJv/Q==
X-Received: by 2002:a17:902:ce8e:b0:23e:3164:2bef with SMTP id
 d9443c01a7336-23f98172240mr3020925ad.13.1753213670851; 
 Tue, 22 Jul 2025 12:47:50 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6cfbaesm82160665ad.151.2025.07.22.12.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 12:47:50 -0700 (PDT)
Message-ID: <4832a160-344a-4140-a115-d4742f95825b@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 01:17:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] drm/msm: a6xx: Refactor a6xx_sptprac_enable()
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
 <20250720-ifpc-support-v1-2-9347aa5bcbd6@oss.qualcomm.com>
 <d4b46652-c4d0-44b4-aef5-e8bcf606de06@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d4b46652-c4d0-44b4-aef5-e8bcf606de06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE3MCBTYWx0ZWRfX+cRZ97CumN+E
 39FmehpmdsvRkEWPh9kgGTJXuV0b6vZ8zrQV1KJo28cF+1f9a8T5Xgv10zbSnaAFFJzzW3e1I9W
 jsTlgvFefP46XMp1MljMQALVGWpTgeC8KloJkg9ojW/e5ofwEhjgBzqWyjwzL3v4v63D2pnklxy
 hmMLA5M1a8BKqK7x5qo6jbk5RxC0prSTMIH/AIzzZ+7+xyNK53QtwJOE6VUGDCMrdj7+/CWxiSK
 38XX+6CQp6NGLdTBwhZGdT3BBpBD06qhauGSw84JMirsDQ3ClqlBp46oP8r9iOJrRmrtlgIVVRk
 lqHFG0DuVPORvwa4KQCJfXMcUR9wLfosV0D4Qv5bYJd34Vg/ytNqhiuumQhcHcll/ktq0Gjnntv
 lFKWkteWTy1Irz0VfpbLoTCLWiBxvvVI185WhM5t9k0lluWTJdsczD4IYFmZLVrtfHJcBOgh
X-Proofpoint-ORIG-GUID: h8cj7Oia7wXG7UQcL6cnj9PM1G1_jwme
X-Proofpoint-GUID: h8cj7Oia7wXG7UQcL6cnj9PM1G1_jwme
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687feae8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=1Zk-24FEoXaHOanE9kEA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=963 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220170
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

On 7/22/2025 8:00 PM, Konrad Dybcio wrote:
> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>> A minor refactor to combine the subroutines for legacy a6xx GMUs under
>> a single check. This helps to avoid an unnecessary check and return
>> early from the subroutine for majority of a6xx gpus.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 38c0f8ef85c3d260864541d83abe43e49c772c52..41129692d127b70e9293b82bea5ccb6b911b0bfb 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -403,7 +403,10 @@ int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
>>  	int ret;
>>  	u32 val;
>>  
>> -	if (!gmu->legacy)
>> +	WARN_ON(!gmu->legacy);
>> +
>> +	/* Nothing to do if GMU does the power management */
>> +	if (gmu->idle_level > GMU_IDLE_STATE_ACTIVE)
> 
> This isn't quite a no-op, but I can't seem to find what the '1' value
> would map to, even in 845 kernel sources. Do we have to worry about it?

This is fine. '1' seems to be a low power state that was removed very
early in the gmu firmware development stage. We can ignore that.

-Akhil.

> 
> Konrad

