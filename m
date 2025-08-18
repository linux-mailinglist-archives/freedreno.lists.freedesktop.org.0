Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D833B29AA5
	for <lists+freedreno@lfdr.de>; Mon, 18 Aug 2025 09:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6725F10E3D7;
	Mon, 18 Aug 2025 07:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2yIIDLh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D40610E3D9
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 07:17:26 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HMHDvH027109
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 07:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /qhnVhx2Ak6MmVxTVAge6g/u9xCi1sPaDT0gtIzKOTs=; b=i2yIIDLh60u3/pai
 iGEyQnRONS5vyvdznnmZ17Vjr8DHLxqUR1N7EJ6hPHyGbexWjXrpr7collEmvexA
 UK1xkUgQW7fh4QBbYauWbS+ljauo10SBwRlZjV42PtgglcZ1VqRzmI5bTmofvQ4i
 HMQExpzLy5lJXFwTAEXIF+8GGwRzAlbQslOhQDYdVGf3ZpkIzYgfzJnf9caY+RyN
 kgF6JlMYfDxp3xM+E8Li5D9RfwHzeaju+x3Thr3kPmaMNMQpYoTX7AL519FV8Ylg
 89AdsOLKi/+bxn8I7YRg5ZCS7PMOB/M4wBXQsktVcJExxqQYpHnf6XWirxmurj4v
 IzZw3A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjc7uqnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 07:17:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-24456ebed7bso44831525ad.0
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 00:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755501444; x=1756106244;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/qhnVhx2Ak6MmVxTVAge6g/u9xCi1sPaDT0gtIzKOTs=;
 b=khxpQ/NKuybIWbRCOhY+wMwJ05lOL3kOe4ODz/+9w81M7gOZMjYP38iFCpbPLcLZng
 uTpVddjaA/lkVa/3S2M9042uO2hhQm/XoN/lboHr6djXW9aJIt3OPs0z47CTyXys0YZb
 H/yb8JSBdn495jPjZ5bNVoUpD0uqNmd9Wa1K8Ax2S+2DQrql2EoCkmwrL+3QbM21ZPid
 EDm+nHlXGqHh9XnjzKJRE40OTVVmq3XGRPuXjBYmZiAixpdxbNMnwkubvo+VXv4dh+XZ
 ekPgSS2gxy4UX3Q3C7hNVBsaV3AOAiafTGIcpORlRXCcgBtPiQSxNJ8/Gvg0kYCO2w0I
 t8vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK/eF0kZ4B+z7K7nYrlDf3z2jt+VXvBtwqpD9EAodjwJ+v0n61wApXMcAjNKZoyeITCb/Lxm/9sRA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzj3hBPkA1CjBmIHimhhDb1FkZzGnn4aprFhLiOsFw+/4xLOw58
 uW2Inl28ltLSmQsR9FlrP1Ge5x32ppD9pSr0UVmWS4Ddra+PB+s2GZNBjqgEbM2ik4WwHqd8JEW
 9LlLUnst/rEGSg31xnuR0We7Oakd07SVDsZvrsLMZ2WV4EVhXXhXcoQ+ok98k3o6ip0cVOK0=
X-Gm-Gg: ASbGnctz9ofgIRjBGs1uPA4+V9bpkaijpobp6nswuKISA6Uaark+zlothdUefvBjCOW
 wB8UTPBb2ZyDvVzIn+APtxbjJLA8jnZ5ykrk60cMgr787ho3aYxBgnJ1uGEdmXHe7GreBRKsWDk
 Fkf8DvySgXh+pRKyiLyOnETA/tSxxV5K2AlH5NX9lkBVPdqLbcf1F86LTVBD47k7PdxfI6tT2gV
 X+0S9Ntpnu9aveR6FlstmHgRSaLtBAvUw1yaaKmZNii/LQbWGoPTxxG1qv2yzHrWGmhbqq2H2//
 sgvq/OYyIaFIrwQ6V06xpbJXQyVNxJtGLGojJyf8PspJOAtm6KN91rQ50c+yHex3
X-Received: by 2002:a17:902:f645:b0:240:86b2:ae9c with SMTP id
 d9443c01a7336-2446bdad87bmr122769665ad.14.1755501443896; 
 Mon, 18 Aug 2025 00:17:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQzDZnDrRPt9e9ar4NcGlKQx/v15yiS7nW8hWVOCiahtj0oNaVAIJtchO0QDQCqoEqEh/UUQ==
X-Received: by 2002:a17:902:f645:b0:240:86b2:ae9c with SMTP id
 d9443c01a7336-2446bdad87bmr122769485ad.14.1755501443427; 
 Mon, 18 Aug 2025 00:17:23 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.229.157])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446ca9dbfdsm71325165ad.19.2025.08.18.00.17.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 00:17:23 -0700 (PDT)
Message-ID: <77db4861-4868-4110-8c31-eb2045ddbf4b@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 12:47:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
 <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
 <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
 <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
 <269506b6-f51b-45cc-b7cc-7ad0e5ceea47@linaro.org>
 <1727374d-0461-4442-ab35-9acb8ef7f666@oss.qualcomm.com>
 <df007b41-5c3d-4c69-81b9-27155485ccf9@oss.qualcomm.com>
 <pxigrjxtizcrhn4l25ph4yh4runebintfp4swqfiewfq5hqceo@g5cy3mdgjir5>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <pxigrjxtizcrhn4l25ph4yh4runebintfp4swqfiewfq5hqceo@g5cy3mdgjir5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX5zBw2gGAwF53
 V1PDCUmEPhGay/bJeffCD+/TPYKNxB+Tj5utMIlNzzJH3Ru6/H44CpkxmfZMuuPLCNzabUay3+U
 4A7QbmnhmjhWKnn+fCwgJPXT8wfc/eubckN1oDPWI4Yl+os+cvv9H1QEMB9+R0bFOqmDOD399Ge
 QxerTXEqbSoFv8M4/XinqjTzFS8T/aQij9XNbe7iqng6SqZUD/kuAz7Qv3PJnXgTxHpfotSGrFU
 e6IkF2JOB/K6GS0fE3iq3fCixx1z4H5r2cLjBeDp/WneMlevmD5FwqwuitlKYWDku05eOqE7Gcq
 8W28UCrF2JUc/w8rkKL9c0W2fapiUpyBpvkuRrMTsxsV0Ic3JFpxNOkT9+3/39ok8qE+i7YYTq9
 qUX9gZdu
X-Authority-Analysis: v=2.4 cv=c4mrQQ9l c=1 sm=1 tr=0 ts=68a2d385 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=9Q8gPALlkHEzzDxkdHlyxw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=tT0-4YtFDMztOtjXKeIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 3Dd-jIfRzc_W4lcPKupd-gSVizUqP9E0
X-Proofpoint-ORIG-GUID: 3Dd-jIfRzc_W4lcPKupd-gSVizUqP9E0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160033
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

On 8/16/2025 3:45 AM, Dmitry Baryshkov wrote:
> On Thu, Aug 14, 2025 at 07:52:13PM +0200, Konrad Dybcio wrote:
>> On 8/14/25 6:38 PM, Akhil P Oommen wrote:
>>> On 8/14/2025 7:56 PM, Neil Armstrong wrote:
>>>> Hi,
>>>>
>>>> On 14/08/2025 13:22, Konrad Dybcio wrote:
>>>>> On 8/14/25 1:21 PM, Konrad Dybcio wrote:
>>>>>> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
>>>>>>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
>>>>>>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth
>>>>>>>> along
>>>>>>>> the Frequency and Power Domain level, but by default we leave the
>>>>>>>> OPP core scale the interconnect ddr path.
>>>>>>>>
>>>>>>>> Declare the Bus Control Modules (BCMs) and the corresponding
>>>>>>>> parameters
>>>>>>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>>>>>>>
>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>>> ---
>>>>>>>> Changes in v2:
>>>>>>>> - Used proper ACV perfmode bit/freq
>>>>>>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-
>>>>>>>> gpu-bwvote-v1-1-946619b0f73a@linaro.org
>>>>>>>> ---
>>>>>>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>>>>>>>   1 file changed, 11 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/
>>>>>>>> gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>> index
>>>>>>>> 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>>>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>>>>>>>>               .gmu_chipid = 0x7050001,
>>>>>>>>               .gmu_cgc_mode = 0x00020202,
>>>>>>>> +            .bcms = (const struct a6xx_bcm[]) {
>>>>>>>> +                { .name = "SH0", .buswidth = 16 },
>>>>>>>> +                { .name = "MC0", .buswidth = 4 },
>>>>>>>> +                {
>>>>>>>> +                    .name = "ACV",
>>>>>>>> +                    .fixed = true,
>>>>>>>> +                    .perfmode = BIT(3),
>>>>>>>> +                    .perfmode_bw = 16500000,
>>>>>>>
>>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>
>>>>>> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)
>>>
>>> You are right that BIT(2) is GPU specific, but that support was
>>> commercialized from A7XX_GEN3. Anyway, the Win KMD uses BIT(2), so lets
>>> use that in Linux too.
>>>
>>> I know some docs show BIT(2) support, but lets not bring in untested
>>> configurations.
>>
>> Eh, then let's get the docs fixed if you don't trust them because we can't
>> work like that..
>>
>> FWIW this is information from per-platform RPMh cmd-db data
> 
> If it comes from cmd-db, then we should be requesting it from the cmd-db
> driver rather than hardcoding it here.

Not really. This should be under the control of GPU driver.
BIT(3) is correct for X1E.

-Akhil.

> 

