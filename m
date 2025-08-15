Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FB4B2883C
	for <lists+freedreno@lfdr.de>; Sat, 16 Aug 2025 00:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D2210E9BC;
	Fri, 15 Aug 2025 22:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lOhzRUtl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C08010E9BC
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 22:16:01 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJN0q003367
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 22:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 631U00JIllQ5tGvCHGj0/QsARpjFKQvULVL11clEJhU=; b=lOhzRUtlVpiuF5Lj
 Xoc4WEktY2rI/DiKazbdoFtRso9wMfABqnORdUvwqR/9oUoAeUopTVtWFIXGF4D/
 O0IGZUGV8yBJ7bATJitdNMHASgFmytur6+QBzDClIcH15o3pC2WL59axLmWzIwZg
 CypSH/xuI03Uo8RSYFjQGoXvWW3juRRpqLNABODkwB0JwoyQXglNRhwLysg82reb
 NVdNKM7fsTQIiJ0nGb9OoEX3MFBNENcNpjnhEw+IJXextFuDlF1HYHJw2xw5Uesv
 LG9K/G7gWKD3cCwvzCRkLYDNtidJRNaX6q3d9o0Htn0QYo8rXJV2faXGQdgKyakp
 +VzPfw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdvcaqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 22:16:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70a9f57f950so49462436d6.3
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 15:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755296160; x=1755900960;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=631U00JIllQ5tGvCHGj0/QsARpjFKQvULVL11clEJhU=;
 b=VKBGPYpzvnXC+O2xCwButsYCHWaxMUdJZsr/5C00p2U8o2m8PozSPxSZR64TH7KG0m
 nTU0+YCucpZJ5JcULsQtBBfEkmyd0nSuP/fUE3MePLtLk/bvYE199AKlyEGDgbIn3ocF
 +LWmwTW68FuLXaet6zl0+6TEpmEchEtb2AO9zyHlkkG8dUP61UvpSFFL0zSXqhJUvzG6
 tpOwuvxa7mmuFcLroMAqo6PEQnmLczDUz692QlFhV761yO6t9K1f2SZ9AkcKOr9IjZ/M
 Q0JCep6+Z7wRe0DXVqhKs7cw50av04WtNYWXtbLqanRfnrEkcEEVsLY+hwfLeqtNg1c0
 J/Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq1chKCTU2mZtzSjDOBkDLhvGoFPEcev+2h/dy74yc02xZXz1fn7RjCtIi4maMmwWh547DawgAnb0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEWpCYdOvpq7CHdBfe813Y++uDXnPM379MgdwSk7CsvynMjKkt
 OCZP+QTQViuom6jyZDSmfcA//h0FvULaAkEdO6U8kyan40kyYP+fuG1lpOBzLnFaOD8BYxgd5Z+
 AiQ8Cx8ULeCu9b8ambcfbA5S1qtGnvzITjTRIdYbV2GzVrdrY3qlmV6YB5wX+UaD1vQKQf+A=
X-Gm-Gg: ASbGnctytfy3RAj5JkGPTk8G5AnQ+dLbAXGddaUTtmKBgJ2QehUIIE/j9ib0fSLcpEl
 3qTImfNgf41L8pvcjNbug1D+GiQ1oleA7uP0wkBexouCA5ocf5y2akUH5VuPcsWji9MUfI7CCOe
 7L5P96c0pGV5RYbsnx8K7gr1I/uWUTOSYtT0ia9KhW5YTDHIBfVp5yAwCW0dhcDf2Nxp9k/CRq8
 hUs4qZqCIG/SI/Q2GVcxEdnF2dUl8k8ju/Ht/XfWOjf/ya5/I2ZVpg/36chbHv1Ml5xpGZokhJI
 IvpIima4iAovAAZM+s7bZd4U4jlcD05EomTfHE8mNfQprrCg+7mvhJ8lT0aWBk6w5Mb678mrvLf
 3wSVfNBL+jbzzmgSV7oxu57NrnoAyGh9veWwXb8oc7DlR+5t1NXxK
X-Received: by 2002:ad4:5c49:0:b0:709:e60f:660f with SMTP id
 6a1803df08f44-70ba7cfedd2mr44628536d6.48.1755296160182; 
 Fri, 15 Aug 2025 15:16:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJMmfksOfygkgd6BN8yhIeutfrsC40sqsqYSP9NrdOwrkUMB8qKqtZAlu4lefpDgV7C9ShxA==
X-Received: by 2002:ad4:5c49:0:b0:709:e60f:660f with SMTP id
 6a1803df08f44-70ba7cfedd2mr44628226d6.48.1755296159725; 
 Fri, 15 Aug 2025 15:15:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef414e07sm502689e87.139.2025.08.15.15.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 15:15:58 -0700 (PDT)
Date: Sat, 16 Aug 2025 01:15:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting
 for x1e80100 GPU
Message-ID: <pxigrjxtizcrhn4l25ph4yh4runebintfp4swqfiewfq5hqceo@g5cy3mdgjir5>
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
 <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
 <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
 <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
 <269506b6-f51b-45cc-b7cc-7ad0e5ceea47@linaro.org>
 <1727374d-0461-4442-ab35-9acb8ef7f666@oss.qualcomm.com>
 <df007b41-5c3d-4c69-81b9-27155485ccf9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df007b41-5c3d-4c69-81b9-27155485ccf9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689fb1a1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=uIWJvtJjTPQsrjMnxW8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: mjEMd_R9M6uopFrYP7wVWAiW4JJImygm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX4JHdOXxNXtFG
 MyBtIZy15mK5BPVsFfFfsciOA8Y5OrQehsr3utLUTkTaw6Kws9kg1yRQsJSOMu1Hgs0q+kRo2BN
 JgFbL2Duyr2iM2/uP8F29HIGpgfHxhu7ct4nwzRbdziZ3/e2iQN9ez4RtzRbmE0GX4F39yKmOrh
 iaTILZhMCy8WF2njDCOD8Uh65V2IE95tZAd9YCW1tlp/tlyX2uD/C0GSntnN2LaSMkUZ0BH9pcx
 vEQbr2l56MpWvplzhvoGPgZWpRKwfrfuZCQjHsOif6Y8G8DQArggZRu7Tx6GLl23Cze9c0qGrYT
 o3qTaYtF5TXS4C4Ig1ggzXJ60pNBsB2JZYj12iDEuO58F9/oBsKYtkGYDTgZlM/S/BrLxhcUzNh
 JpQsYXgR
X-Proofpoint-GUID: mjEMd_R9M6uopFrYP7wVWAiW4JJImygm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_08,2025-08-14_01,2025-03-28_01
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

On Thu, Aug 14, 2025 at 07:52:13PM +0200, Konrad Dybcio wrote:
> On 8/14/25 6:38 PM, Akhil P Oommen wrote:
> > On 8/14/2025 7:56 PM, Neil Armstrong wrote:
> >> Hi,
> >>
> >> On 14/08/2025 13:22, Konrad Dybcio wrote:
> >>> On 8/14/25 1:21 PM, Konrad Dybcio wrote:
> >>>> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
> >>>>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
> >>>>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth
> >>>>>> along
> >>>>>> the Frequency and Power Domain level, but by default we leave the
> >>>>>> OPP core scale the interconnect ddr path.
> >>>>>>
> >>>>>> Declare the Bus Control Modules (BCMs) and the corresponding
> >>>>>> parameters
> >>>>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
> >>>>>>
> >>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >>>>>> ---
> >>>>>> Changes in v2:
> >>>>>> - Used proper ACV perfmode bit/freq
> >>>>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-
> >>>>>> gpu-bwvote-v1-1-946619b0f73a@linaro.org
> >>>>>> ---
> >>>>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
> >>>>>>   1 file changed, 11 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/
> >>>>>> gpu/drm/msm/adreno/a6xx_catalog.c
> >>>>>> index
> >>>>>> 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
> >>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
> >>>>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
> >>>>>>               .gmu_chipid = 0x7050001,
> >>>>>>               .gmu_cgc_mode = 0x00020202,
> >>>>>> +            .bcms = (const struct a6xx_bcm[]) {
> >>>>>> +                { .name = "SH0", .buswidth = 16 },
> >>>>>> +                { .name = "MC0", .buswidth = 4 },
> >>>>>> +                {
> >>>>>> +                    .name = "ACV",
> >>>>>> +                    .fixed = true,
> >>>>>> +                    .perfmode = BIT(3),
> >>>>>> +                    .perfmode_bw = 16500000,
> >>>>>
> >>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>
> >>>> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)
> > 
> > You are right that BIT(2) is GPU specific, but that support was
> > commercialized from A7XX_GEN3. Anyway, the Win KMD uses BIT(2), so lets
> > use that in Linux too.
> > 
> > I know some docs show BIT(2) support, but lets not bring in untested
> > configurations.
> 
> Eh, then let's get the docs fixed if you don't trust them because we can't
> work like that..
> 
> FWIW this is information from per-platform RPMh cmd-db data

If it comes from cmd-db, then we should be requesting it from the cmd-db
driver rather than hardcoding it here.

-- 
With best wishes
Dmitry
