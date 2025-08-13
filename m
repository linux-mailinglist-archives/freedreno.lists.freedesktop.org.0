Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88744B25379
	for <lists+freedreno@lfdr.de>; Wed, 13 Aug 2025 20:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C4410E0BB;
	Wed, 13 Aug 2025 18:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFEjAHz3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AF410E0BB
 for <freedreno@lists.freedesktop.org>; Wed, 13 Aug 2025 18:58:36 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLeS4012188
 for <freedreno@lists.freedesktop.org>; Wed, 13 Aug 2025 18:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +QJUUbiVzNJcnH/bipGMN08GPCP4aDShS4aNk4HTRcc=; b=DFEjAHz3mT5UXaKE
 g1jXU/JHSVoL1fyko7kVxmuxILen6yK3+RB7rBTdqEwV9OMCHSn9MTH+9uf6t1Dq
 q1/6EP+0MExN/p05QGe7QZgm7YriVgoS0IrDSGSanoPep1JgEiFh9q1zK9O3DQHh
 NnaKpZWqewjcB055sa/9OU5qacmKGf0N0KoPHS6N8mRFaggwk2GiXVpZcg+9ZkCG
 6LjLzSn/B0A2fv023p9Fdbalomu92whZfhDYJTOJK9RfFPsx38zhuT3dxb3CIfyv
 g+2lc6VfoWK4fQGuBRDUtAJ2+8Nz0uNai7byw+VwCpqVekmi0RuMMdUVrETFm7xU
 XAXAng==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxb3kc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 13 Aug 2025 18:58:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b471754bd26so39582a12.3
 for <freedreno@lists.freedesktop.org>; Wed, 13 Aug 2025 11:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755111514; x=1755716314;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+QJUUbiVzNJcnH/bipGMN08GPCP4aDShS4aNk4HTRcc=;
 b=ZrU2H5BdS1lqnhexMKHKCe56Awu/hkt9DG3kJ/geW3Db12k+7ZmKgcVGhgdx0OBcwD
 YN3w+wf8MxLIASM801Q1cLTcnlUbZaw+QvR2IUynA+Ygkw1vXqiobAmY3RA0v6cs65aX
 EWCz+iWCjUej4wlT8o6LRR3kAfWovMB1uX66dfaarfjTZijc2o4geylH15G8Q8zr++/5
 Tw2IjbIV6cggWJDMWqBEORkyROAwsN2yYLVSVAL3msuPBuGQncrmqjsx3nOfogURoykl
 NvXGPTf+AcRP8pFpgXDFL8c9Xch/4QNjb/A6XV3PdZu9l8khXaICPD+DJePQVLHVBVT7
 Inog==
X-Gm-Message-State: AOJu0Yxn77NSOBe9rrTi8mW9bHhekvIe1VkXDvQPLQB5PNulAkB9uzyx
 qg7mMda+xkiIJ7Px9aXLrNHWoNBm9tTvQdurywHyjWNBjgGeohMs9fAZIa94ZIXIWqxIBRPb6fx
 AnnbxD/Wl5ATCsN10Fo8rxUZTGC9F68NFndKwFHWG75vOwm2BuUHxP9AMdndTEfoXpfBHOSPYOg
 R3uNY=
X-Gm-Gg: ASbGncs6npMn3S1WrCwhG0isl+jfEFwk0Jy95/dgZ+dtx6ViDajRnDGUz1oIT764nkK
 fnnZikyyxDIC+eN5UDfjTv0yhLsUOxFsuX+VQ0NsFlNWoXUGyUpsrU+6f/B1gTj48iXsMCwrgo9
 qdrmMZdeXR2K+YtyLHQDs1ukBFI3f742ssFNXM3BcxpTRWjYJhEqPwAVyOoVzP5kPJ1B5Rt+pAF
 MjV/RusqDk5O+0R7T4m5AhSY6TXYpXzn/mpAyZBQbMqAcq4bTBH0YmfxCBXx2bCaNm6KAhy7zW9
 fi/bIQpZfp/+uG6IDX96WM5Pq0M4DIHkBEsUkwPIJtZYdQvC0YwrRqQn9ByogeQ=
X-Received: by 2002:a17:903:2b0f:b0:234:8ec1:4af6 with SMTP id
 d9443c01a7336-244586d5141mr2215935ad.45.1755111514511; 
 Wed, 13 Aug 2025 11:58:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqQz3FOqUUKIy3tpw4V8Krf1DP5+DVOyw/qS9U7w/w2Q37+PWx8bvSmB8kfJzTMyTFWA8ipA==
X-Received: by 2002:a17:903:2b0f:b0:234:8ec1:4af6 with SMTP id
 d9443c01a7336-244586d5141mr2215725ad.45.1755111514030; 
 Wed, 13 Aug 2025 11:58:34 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899a8cdsm332263865ad.121.2025.08.13.11.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 11:58:33 -0700 (PDT)
Message-ID: <cdd4757f-9433-4c80-b5b2-003d42038a87@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 00:28:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] drm/msm/adreno: Add support for ACD
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: freedreno@lists.freedesktop.org
References: <aJTL87hBAEtJb3VT@stanley.mountain>
 <2d54964b-1f60-4a58-8064-567611a3a126@oss.qualcomm.com>
 <aJwnNqfxZHfiVHZB@stanley.mountain>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <aJwnNqfxZHfiVHZB@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX272vPBbZ4NFR
 50Q7n2BF/Df1yzQ/LNNKtoCT7I1+/lXuIhDsfMbsxXx4uKQNXliEQNyN2VLGXhp8ApA5CZUMeUr
 6MZaYIz0e9qnOo997ayjIzJDnKBigO6W2qeMhl9mWEAt5+zMIeNV4xa9ms/FCWMCfOy5VRJQe/4
 nW0Kl+TEzSjMzOy5WJzS/AC2cQccUaszvU44jpt+zD7QrXwh2hBxzR1sObxwuVNgzAbs4DsL8E7
 +JBG4JUTnqcpBj12Lqy0pLTKkuLQamQuYj9o5Jq6TskiVMlga7pFa7r+RJyiMGtqv2DLIj+qS+Q
 JNQlNDqCjXycJBFsN4N270IBvUpGsB71JBs410upNItTspFxHjegZXLZFxkmjLuJmNaJbJOm0gk
 RElmSyRh
X-Proofpoint-GUID: VKRw5lsr-X_qSC6g61DdKXHyGq0BByyN
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689ce05c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=geSN8yY6MFID4zSGlH7RRw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=hUEC3-M51WLkc8_fCi8A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: VKRw5lsr-X_qSC6g61DdKXHyGq0BByyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057
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

On 8/13/2025 11:18 AM, Dan Carpenter wrote:
> On Fri, Aug 08, 2025 at 10:28:38PM +0530, Akhil P Oommen wrote:
>> On 8/7/2025 9:23 PM, Dan Carpenter wrote:
>>> Hello Akhil P Oommen,
>>>
>>> Commit b733fe7bff8b ("drm/msm/adreno: Add support for ACD") from Apr
>>> 19, 2025 (linux-next), leads to the following Smatch static checker
>>> warning:
>>>
>>> 	drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1700 a6xx_gmu_acd_probe()
>>> 	error: 'opp' dereferencing possible ERR_PTR()
>>>
>>> drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>     1668 static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
>>>     1669 {
>>>     1670         struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>>     1671         struct a6xx_hfi_acd_table *cmd = &gmu->acd_table;
>>>     1672         struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>>>     1673         struct msm_gpu *gpu = &adreno_gpu->base;
>>>     1674         int ret, i, cmd_idx = 0;
>>>     1675         extern bool disable_acd;
>>>     1676 
>>>     1677         /* Skip ACD probe if requested via module param */
>>>     1678         if (disable_acd) {
>>>     1679                 DRM_DEV_ERROR(gmu->dev, "Skipping GPU ACD probe\n");
>>>     1680                 return 0;
>>>     1681         }
>>>     1682 
>>>     1683         cmd->version = 1;
>>>     1684         cmd->stride = 1;
>>>     1685         cmd->enable_by_level = 0;
>>>     1686 
>>>     1687         /* Skip freq = 0 and parse acd-level for rest of the OPPs */
>>>     1688         for (i = 1; i < gmu->nr_gpu_freqs; i++) {
>>>     1689                 struct dev_pm_opp *opp;
>>>     1690                 struct device_node *np;
>>>     1691                 unsigned long freq;
>>>     1692                 u32 val;
>>>     1693 
>>>     1694                 freq = gmu->gpu_freqs[i];
>>>     1695                 opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, freq, true);
>>>                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>> No error checking.
>>
>> We are passing back a freq which we pulled out from the opp_table a few
>> lines before this. So it is unlikely that this call would fail.
>>
>> But it is okay to add a check here if that would make Smatch checker happy.
>>
> 
> No, no, just ignore it, if it can't fail.
> 
> Or I can add dev_pm_opp_find_freq_exact() to the "no need to check" list.
> That's easy to do.

Would that make Smatch ignore usage of "dev_pm_opp_find_freq_exact()" in
other code/drivers? If yes, we may not want that.

-Akhil

> 
> regards,
> dan carpenter
> 
> 

