Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73016C59E2A
	for <lists+freedreno@lfdr.de>; Thu, 13 Nov 2025 21:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4BB10E93A;
	Thu, 13 Nov 2025 20:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fuAxD8wc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NVFcZYMs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D65310E93A
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 20:00:14 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADFP5Wm482919
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 20:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OJ7w+mpX/9CJl+Orva8v96dQySUzco1O64PcH/xD3KI=; b=fuAxD8wcsAEwL5NV
 bh1wPbEpv+tKK62AaSEWu70KnScWrWuMyJUhri/6SUyYJmD2GISZk7hmQjrkZAIW
 bKcoENtov0aleRgOVMYAQ4JDtwgqewpHJ0XSY1NSKTu4HAPlNyjVCtjjguMSFGgx
 Dl+3aF/RDg6aysVhZW1VLTpk3CzGeybZYPnOit2k/Jd9mzdf84wifHdfltosinqb
 N8O4SuZaBpnlNEAa0SXtAkWRdqN9Ks65fzTVcjUmlyJRTdEDLF1yGAMAjWN+MnJ8
 YN+RVQZwBxSKx+YAXAlZcWkeG2oPDHRXnvJ05PBji5dMGfCYFjl1qjuG6Qx18FiK
 K9/mRQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adhy30v7h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 20:00:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7b8ed43cd00so1510836b3a.2
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 12:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763064012; x=1763668812;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OJ7w+mpX/9CJl+Orva8v96dQySUzco1O64PcH/xD3KI=;
 b=NVFcZYMsRxhW6yS3qLqWV3Zgd4H8cmL+C6Onv6M/j70u5zKL5k0iJovkK5j5vjMd51
 IUXbDhL+oRXIkNj/vbr7KTCn84UGOdkM/LjBh791a4iBFt0Op08KlyB0ieyh9PRuSKHI
 XmeGJi+Xi6W/18lPVbX7Lk0rrzZtk0JVcuVXwwRyCX6nDMaVrfha+nYM3ipfp//0mFkF
 FKoJTuRQGa2kbp9cEs2vhAR3M9q0CCu2/00LxR4VXzfJPItkdvTFjdDSUegHby9O2GSJ
 zE0I0XSWCXAwkCySsWiLw1sUKaFmo/cyD3etg2EOBnoMOGKaXHwFpVMr0MrlAVQQKo/M
 YKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763064012; x=1763668812;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OJ7w+mpX/9CJl+Orva8v96dQySUzco1O64PcH/xD3KI=;
 b=AAv+63SIeFOJ/dJQMIFvKZSnimMB76ysWx3LfMsGHSUXk1WNvMncEBe4Olh/DHci0t
 TKeDDqoW6fY5Kug0jY4rGUKNgfrlB+/5GH6lUoaacO2ECvdHLA4Lw+I1NHJCp3mIDy8P
 R85oC9U6Vjf7sUcg+QK4TMbp09p75UqoPDIX/H8bDtPstnJcqvZ+nyx9Yupq0VJ29vMb
 ByyKgmPnUY5IyiH6s5E0gZ3Kb6kYHguZtdNBo0pf2zVxI20yTpiECG9N+IWDvZbkOD2Z
 CPz9Vr571SUI/XVzLEcAKw9eOzpA98B8J1gSbkZNe9J0Ljf0cmZC25mxCAL9ar1WhHev
 MAdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZmbRhaQUf9LXMC8AYkXSqp4TNwexHrhzBHN45vttVHiaHGJTAgOeoIIHX0LkhVyk1Ote2VwNFr/E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCqGiF4ge1JnLq17PWIvBxsmeSrWL7zy8BvXFEVnp26a9CvBEJ
 +7zmdh9P1uX5xNFPIvj8bYMO1JhFcTFSi2VaUEeL12z8NLaLXu0OHR2hShkWYH9K9hxqAwG2D56
 AuBwt1nh1mdPnmN5yeD2St/eosLpbBGrA/0GFJGh8zyrQiINq1JgyyukGKZEjgRpxDxnqml8=
X-Gm-Gg: ASbGncuH+3+yVBwxUlUmUVGp6ptbu4oyIXWYgsz9D4ff6IKLqH8NTIrZQo5Ijbk1TRa
 wIZuVn5XDfMm8MHHQ9oI6dxSrJT5Dd5wYE+zfCpqVC1G/yBYY+ziPz94u2TdJVwW4h14DR6w7kq
 jlCCyydLrz8iT1epUoLvtmphk1OLWYA08ZNTMnJMBPD5EPX9RjMEOC2phoWTwA9jSzMseqUGXIg
 GXAX++X8IYdSBRzy5xHnvysW369pWsscYjGAWIqREADJnU1kociPWZkf7/3EEHzQm1H6xqGaAAZ
 yGg2n2WbnBi4Bttwe+MOXzxwUU3fOSmelweWpwTALiNXK/WMlIGpaRtYrH0XJi6lmthbLOMi7lJ
 LBLXOlR6PmtjsuRNuSm9vrA==
X-Received: by 2002:a05:6a20:5483:b0:353:1edd:f7a with SMTP id
 adf61e73a8af0-35ba30634a3mr896583637.59.1763064011767; 
 Thu, 13 Nov 2025 12:00:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZ3uM6rWYFMlAKzZmNJ84R9H/A3/jUV3dWp4GW6Y6VWrqLNpi1YOXm3417OaJPss+ncsmlsA==
X-Received: by 2002:a05:6a20:5483:b0:353:1edd:f7a with SMTP id
 adf61e73a8af0-35ba30634a3mr896525637.59.1763064011030; 
 Thu, 13 Nov 2025 12:00:11 -0800 (PST)
Received: from [10.204.104.20] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc37507fc7bsm2929570a12.23.2025.11.13.12.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 12:00:10 -0800 (PST)
Message-ID: <fcd703e5-d483-4369-8149-a25cc733bc2e@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 01:30:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/21] drm/msm/a8xx: Add support for A8x GMU
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
 <20251110-kaana-gpu-support-v2-10-bef18acd5e94@oss.qualcomm.com>
 <f7e204ac-28b6-46a7-903d-30b7f31dff8b@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <f7e204ac-28b6-46a7-903d-30b7f31dff8b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PpVsM37V2DMpNAC0XjS-NbHAs0CYkx09
X-Proofpoint-ORIG-GUID: PpVsM37V2DMpNAC0XjS-NbHAs0CYkx09
X-Authority-Analysis: v=2.4 cv=JuT8bc4C c=1 sm=1 tr=0 ts=691638cd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tMg4Ou186bfY0pTZoTsA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE1NiBTYWx0ZWRfXxm4RsGXH8DYo
 IkXPThsQeR8QNJjX2wMIMDJ9YYAnEVVz99gWu7At9WL0/PQUvyTQObpVtqAiPQprxMQimu66D+v
 PhSZ8DfVmRLjtGWas53B/yorhYPTVtoYVdJryy80mFLLJnoc3CLAEnbjzSDiCGRSSEI7DWq6+g7
 oz0JTDSrJBwdsMfd6jy9n9tN9NSbjOU+K18DrYzSBmLTyo+fpSshkTaU4oVVTRoIqfiRc227lY+
 G68KWIoBhb5Dwg7xHkHmzZqyZS6XXFuhVinR61Zibpzxjf2EQu0/Z+ngZOw0b7cVpB4DvBTGt6h
 oy3TxnYCKfyecuqYZZRGpskQbnRTvgPKP+maD2ay/RxLBGp6d6N9cNffOk9DiiWJM3xQoCOdJzz
 mT4PwejO3yBvVwjltf5P6DXNtHBsQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130156
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

On 11/13/2025 6:40 PM, Konrad Dybcio wrote:
> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>> A8x GMU configuration are very similar to A7x. Unfortunately, there are
>> minor shuffling in the register offsets in the GMU CX register region.
>> Apart from that, there is a new HFI message support to pass table like
>> data. This patch adds support for  perf table using this new HFI
>> message.
>>
>> Apart from that, there is a minor rework in a6xx_gmu_rpmh_arc_votes_init()
>> to simplify handling of MxG to MxA fallback along with the additional
>> calculations for the new dependency vote.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>  	/* Make sure there are no outstanding RPMh votes */
>> @@ -990,7 +1022,8 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>>  		val, (val & 1), 100, 1000);
>>  
>> -	if (!adreno_is_a740_family(adreno_gpu))
>> +
>> +	if (!adreno_is_a740_family(adreno_gpu) && !adreno_is_a8xx(adreno_gpu))
> 
> stray double \n above

Ack

> 
> [...]
> 
>>  	/* Check to see if we are doing a cold or warm boot */
>> -	if (adreno_is_a7xx(adreno_gpu)) {
>> +	if (adreno_is_a7xx(adreno_gpu) || adreno_is_a8xx(adreno_gpu)) {
>>  		status = a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC_TCM_RET_CNTL) == 1 ?
> 
> You skipped writing to this register above - can we count on it
> always being in the right state?

Warmboot is done differently in A8x. We can explore that later. This
fine for now.

> 
> Do we need to map VRB, or is that a topic for the future?

Yes.

-Akhil

> 
> Konrad

