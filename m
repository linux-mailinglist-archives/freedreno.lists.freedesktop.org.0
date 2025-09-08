Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 025A3B4953E
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 18:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DB310E56C;
	Mon,  8 Sep 2025 16:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8OUVLXO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7474610E56C
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 16:29:43 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588BI8er013554
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 16:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1/JrYL6eSgak4nQJFxzbTbTPiEgAtTyrBvDwY7/FkW8=; b=f8OUVLXOkN1IkvFW
 mfSJ3ZpfSOjczj4/jphBKPL74qCnrhFfv2xWEbDgj7/4DGZxSWhXYyxl+1XRFTXB
 qXamamEgsGs4k8YSnsyIxlkKhQkIUf7xa/o9smN80bHol5YbvaEqJCErpSvp45r0
 7HNbS8CXpUfR0gmVz/oLwjAe035aBq+ZfiCVUDkJOyOiiU+w4wA3X9MGhsf/5P1s
 VFBpb5ZNde66D6aH2t+Ljt9VRoLBwcUjYXSPq0NBiefUadvb/Xd4c4wVPtfdfOsa
 5hcv4HOUWtDkviK4vvx+AZ3SUgu88FVQfmryaB/CsTrGLbogVWFH99ZJUavQfHDx
 RnBrlQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdt2k6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 16:29:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-76e6e71f7c6so4630731b3a.0
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 09:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757348982; x=1757953782;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1/JrYL6eSgak4nQJFxzbTbTPiEgAtTyrBvDwY7/FkW8=;
 b=qYqVB9oxc59Dijm+UZ6xrf9aPIlEs+De56yizBA/YxR8fJeFd8Q2TLaS4h0lN7L/Hf
 ciTmrubxSjhL8OGJYltnwGl8Y194sqnMD10vEGtcUnzkmORNTiG3kq7OnQNfcJ1F+wbD
 3qderia5F6eK7kGXB4ZRNvlpKgxF4AD/vpdyTM3AsIpxIys7/G5g5uSFyFIe+DvatzZc
 7SI15YTQ2Z67K8KiK8LcqNB8o4VbHewYSRxelRJBEgKgFHollPi7qszxn0CklvsLJ9nK
 IO4L9KDVfwULXxgV9cmfkumKX4Wn4XTMIRDYbsP/XfI0dxOSR/Zixjb1+POr+VP6A5Hk
 S6eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW5T8z/KovAx5+qFgPrMham1W7dz3ZzGqZc6Uu/JBvz2RnTMdMB38V0rmSCbrsVLSyXP/CJOpEd0Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQvX7ls/7HbkyVYsJe52U8B0R+IR+zqD88nlTl5I21DU/NezsE
 e1ICFt413aAQsKSmsvoRD0nFTeKrTF2bMwg4U1Uu4HvDxD0nwsIRxLcp92pcxwS5ubP0rOFXP7y
 ztYzz4quV8hCTkXenInilFWFTvK+DpEYJQtfJ4SJ9/LzK8hQ1RBLItjvU+XzDfpS6+wkaT2E=
X-Gm-Gg: ASbGncuFU6jx16j5RP8Nx6UPslDQgufAuAQTqryioJRFhugni8L+AMGqBoHCyAJUTLF
 b3Mb/IfgEm8LInkpzqeF1ez2/LURykpcbAEIYuXzoay6Dti/hltPA6329H7FtR35k9GhIqB5lqF
 b96fKB2V1SoNgKWbY7RnSWjhMgPu8+rrQRc4PsdzElyesi/kQEGOqDcElkeFZqCu+VmpDZWz1l7
 LRWrLrLID7qdygKnux+w6rz/SszAOXjush9UVAKSfnZchpkWGHh7qYn0ml9xLpg9Hy2nx86aTNG
 ZRamFgWEjh7pD/WqYjYSFYqtm9DvgrOm9x8mm4sRraF8w/NS8YZ8fhmAHwkwRw==
X-Received: by 2002:a17:903:2b06:b0:24e:e5c9:ecf7 with SMTP id
 d9443c01a7336-25170c416ebmr108420685ad.34.1757348982042; 
 Mon, 08 Sep 2025 09:29:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8/ux+pl7ggDeP2V1/4IdQKuSpSB/3AQUQSSiAQ4GvrfZVtuHWRtKw2FqRwI/7hSQpSYGa7Q==
X-Received: by 2002:a17:903:2b06:b0:24e:e5c9:ecf7 with SMTP id
 d9443c01a7336-25170c416ebmr108420405ad.34.1757348981586; 
 Mon, 08 Sep 2025 09:29:41 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-329dcc0af56sm19952353a91.24.2025.09.08.09.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 09:29:41 -0700 (PDT)
Message-ID: <dad0a37f-38b7-48b4-983d-fba265bc66f1@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 21:59:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <77db4861-4868-4110-8c31-eb2045ddbf4b@oss.qualcomm.com>
 <4fa44ec5-2792-45e3-af87-b3e4d2ed5d86@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4fa44ec5-2792-45e3-af87-b3e4d2ed5d86@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BuDwnRF6uYCh3gHNWLXSCDkOEloU9C5K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX7e+K1GkrVCW/
 hz47cRjg6kk7ub9gpa5GPGbaOW2oorr+BnBwvvLfnXRtA1hcTITpJG5fXnFFIMj2eVk57Jt/8Iq
 CAls5XXG2OXbQVnMWkApSzyE4hNz3Lvv6s6zb5xI3in/mRWO2WxstEOGP+MSUK505mO1ln6/xjA
 4DDTXlhosxD0jnX7B7ty8Kb9Yh0kLdB4reeV/g5Sg1eNn1Q4f5i1XayGqGn6YDWUCXfC5QrzBjE
 IEpP1z84x1vq0dTrGqqT7KUR1Q00oIPChfLaD8CkW3bs9kKCd14dMaTbkAKrjaL68UewidlWTwd
 P7tpWPHK09Hiw/jC+Tos9O8BYp5KWmsStidgQ5fV+xRUD5WxmZGj//UKTxFaVQxE4zvJiNZ5iBA
 W2CcFtXt
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68bf0477 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=PfGohb2nDGJMFqWtIAwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BuDwnRF6uYCh3gHNWLXSCDkOEloU9C5K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034
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

On 9/8/2025 9:52 PM, Konrad Dybcio wrote:
> On 8/18/25 9:17 AM, Akhil P Oommen wrote:
>> On 8/16/2025 3:45 AM, Dmitry Baryshkov wrote:
>>> On Thu, Aug 14, 2025 at 07:52:13PM +0200, Konrad Dybcio wrote:
>>>> On 8/14/25 6:38 PM, Akhil P Oommen wrote:
>>>>> On 8/14/2025 7:56 PM, Neil Armstrong wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 14/08/2025 13:22, Konrad Dybcio wrote:
>>>>>>> On 8/14/25 1:21 PM, Konrad Dybcio wrote:
>>>>>>>> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
>>>>>>>>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
>>>>>>>>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth
>>>>>>>>>> along
>>>>>>>>>> the Frequency and Power Domain level, but by default we leave the
>>>>>>>>>> OPP core scale the interconnect ddr path.
>>>>>>>>>>
>>>>>>>>>> Declare the Bus Control Modules (BCMs) and the corresponding
>>>>>>>>>> parameters
>>>>>>>>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>>>>>>>>>
>>>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>>>>> ---
>>>>>>>>>> Changes in v2:
>>>>>>>>>> - Used proper ACV perfmode bit/freq
>>>>>>>>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-
>>>>>>>>>> gpu-bwvote-v1-1-946619b0f73a@linaro.org
>>>>>>>>>> ---
>>>>>>>>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>>>>>>>>>   1 file changed, 11 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/
>>>>>>>>>> gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>>> index
>>>>>>>>>> 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>>>>>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>>>>>>>>>>               .gmu_chipid = 0x7050001,
>>>>>>>>>>               .gmu_cgc_mode = 0x00020202,
>>>>>>>>>> +            .bcms = (const struct a6xx_bcm[]) {
>>>>>>>>>> +                { .name = "SH0", .buswidth = 16 },
>>>>>>>>>> +                { .name = "MC0", .buswidth = 4 },
>>>>>>>>>> +                {
>>>>>>>>>> +                    .name = "ACV",
>>>>>>>>>> +                    .fixed = true,
>>>>>>>>>> +                    .perfmode = BIT(3),
>>>>>>>>>> +                    .perfmode_bw = 16500000,
>>>>>>>>>
>>>>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)
>>>>>
>>>>> You are right that BIT(2) is GPU specific, but that support was
>>>>> commercialized from A7XX_GEN3. Anyway, the Win KMD uses BIT(2), so lets
>>>>> use that in Linux too.
>>>>>
>>>>> I know some docs show BIT(2) support, but lets not bring in untested
>>>>> configurations.
>>>>
>>>> Eh, then let's get the docs fixed if you don't trust them because we can't
>>>> work like that..
>>>>
>>>> FWIW this is information from per-platform RPMh cmd-db data
>>>
>>> If it comes from cmd-db, then we should be requesting it from the cmd-db
>>> driver rather than hardcoding it here.
> 
> No, what I meant is that there is a piece of configuration that reflects
> what goes into cmd-db as its compiled and that's where I found that
> information
> 
>>
>> Not really. This should be under the control of GPU driver.
>> BIT(3) is correct for X1E.
> 
> BIT(3) is for APPS, see the interconnect driver which also uses it.
> This will create conflicts and may cause unvotes when some other
> driver requests perf_mode through the ICC API, but the GPU is sitting
> idle.

No. GPU vote goes via a different DRV. So it is independent. Anyway, I
checked this further earlier. X1E platform doesn't implement any
perfmode vote. So both BIT(3) and BIT(2) are no-op and are ignored by
AOSS. ICC driver's vote too should be no-op on X1E.

-Akhil.

> 
> Konrad

