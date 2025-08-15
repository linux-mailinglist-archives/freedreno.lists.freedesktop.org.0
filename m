Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FBFB28836
	for <lists+freedreno@lfdr.de>; Sat, 16 Aug 2025 00:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB9510E9BC;
	Fri, 15 Aug 2025 22:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZYORBlw2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B5210E9BC
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 22:15:28 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJJQo027916
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 22:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vLwoZ01402e5OUdx+YObu7+diNTS+/oRxZLwC4jp6ok=; b=ZYORBlw2Y0wJA99p
 ZFQw/o9vfPMrDngZv/ZJrpowjeNtqjCvXoPnz8dwFhXQMh0hnRNlXrMyZ7OxaWQU
 2GrkL9yVwR22+jBq1SA2HN9k3vcRN8Zg9hY4rWLL4sO/VFkEjHZ0J6IjbOBKYhUZ
 2BIGXaeqjD7iN7mbiwO0wrvNv/6SBiXzY8GJ18sMTQbLE34ub381+H0PWg1/1ZKD
 Bd/ciQtTPW4pNNf+09k3IZ6mIb5jjk6Aro/Yv0ShHBGdpLSZGpCC9pHFKZ6UzQz/
 zURKTzyASfE5/CQ+uIqc7BzDHtNVJX5GGmcdh4QZYCxu1ykctE+D6vSycS+7MENN
 Z7trfw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhk04uy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 22:15:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a88de16c0so49510266d6.0
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 15:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755296127; x=1755900927;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vLwoZ01402e5OUdx+YObu7+diNTS+/oRxZLwC4jp6ok=;
 b=mM4aIvvsN2i8DfpZjkyf5bGaURLIb7Gh1y0tWp+rdYlft9jEwb/oLT3Etf+zxkxHM3
 sP9UEwSq38GyLqAMGeSNycD+kw/LxHCUOvWUNtuR1SOYQYT0vId684v/Fv92D/LAPV3P
 ZPGxygtPB11TtdHLVgEfR6/SUDhBNvdVxgKcOdd5JhZY8l2nurGDQBS9B/CGqUanGbrJ
 DaOAksQmAlRdlz/Xpi7DX+vbDZ6JrRtLL/tr/9YTduepkrqamy2CQTXfyYwliGJ+eUvP
 zY4JVAXmBiUZZTiSmniaObcbl0BVdKmB4PJXWZVcNprzWkHRtuNl8lHMJhqvyqhICNZV
 Rfkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZJRx+lbox9dx94JN6wHhVCexXYGU2LPavD169l1Nf2kV2mCD3Alhe0423kPqUAxxnWducTBOOpjc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyopuBdPSt2o255ewD/QDITx2bjiIh8kqcrJigRSJAtRS+PLOsK
 htQz3Eu5HJHns3MzdXBoz7YcLnboFvkiL7wfJoPxuc3gH2o4np0A787WVzKZ0DyGmTd2XJFxg7c
 ynvp583u5Mp1Y64UIe2FhLb88AXw97XPBhdIJ7bxufeHEkLWzTAaI5zp5D/Lq0loY8XtVdjY=
X-Gm-Gg: ASbGncvVnOFh3O4SIRaArruZF8BG0mIESEpvyCfCgE/ni9n0QBI/SJGSq4+XCjda6XC
 vrZLtKhMawa7IpmRU1IzhTSxpPlk+PJKn98/ohwwh9APTGBe/YrWuik2jMyTyKKj75yXT3a0Wss
 fUf2E8uQ2Z1xKc1f88nPM6wTaY+6HBzWkbsNL7fzRYbAhaH2NjOcJsik+L9r44pAJbq9SreEGuv
 CJVaor/BCJn8xn7srBDwos30jN+cnTt5UAMI7X0S1ZUo7/jMQmMfoobCb6YtjGXVjEV7+TRf/e9
 b0G+/ryu6TwN7VJR3wrnB6rCG82Hb7kZ+EYUtE9Me7LYQ5z1ZtU1nbYWs3269FjouHUEo3imEkF
 W/m7iTE8udS4mMT5EPWmWI+SpvYunlwoOSMJlgr+utA7mNd4yX4Ps
X-Received: by 2002:a05:6214:1c47:b0:709:b94b:a6ad with SMTP id
 6a1803df08f44-70bb060c40bmr6445366d6.29.1755296126588; 
 Fri, 15 Aug 2025 15:15:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHetHJNt5dVNj424oIDhrEYTzfBXQUTAzwS+BLLxQUPTiMlfCIGu7YxB8m6v/QsySngCnMZ7A==
X-Received: by 2002:a05:6214:1c47:b0:709:b94b:a6ad with SMTP id
 6a1803df08f44-70bb060c40bmr6444836d6.29.1755296125981; 
 Fri, 15 Aug 2025 15:15:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a41d5a0sm5871491fa.2.2025.08.15.15.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 15:15:25 -0700 (PDT)
Date: Sat, 16 Aug 2025 01:15:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Message-ID: <ihpfgzrl4xizlhpm2w53oesmdhc63cwbjwq43ano7avbrd6emb@qjdgnzxsoo35>
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
 <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
 <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
 <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
 <269506b6-f51b-45cc-b7cc-7ad0e5ceea47@linaro.org>
 <1727374d-0461-4442-ab35-9acb8ef7f666@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1727374d-0461-4442-ab35-9acb8ef7f666@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfXw56S0Matqpvo
 3DQz6T0Rp/Vkn6oEZIu99pkntg6CI/8mYUv1ePak+/F0DFEhC0ufTx3VzceXtb75lhGFeIe2HhH
 tDDIoFnuwj7aHLf1DINEvKW1p3VFx/XalW5v07Pgs114ohmlFVM0lEAoh2dfCkObkHjkpVETl2z
 ZRG0etyr7IDD64mfyZSQJN7QeP/jbyv6nYOvOJABImr2aYap7biR6fCDpxdruviUS5iNKQBmGa5
 VO3u3wS5wYJX15drNPQuHa2icF1AueRBpzE9d8H+waN44wdJzFgxfi6qLVesH/q7nHpB0hybvz4
 zuRf6ghfIOgC0dRPdeCZn59XYYEbhAK4JUIt6ZRA4P7TBgw5rI3Em8XpHIzWnG3vIxGUUg80M/l
 t6YkXLm2
X-Proofpoint-GUID: fQMChktOzTDFj0w0aHyXs6kb45f44MSD
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689fb17f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=2EPmbxBH5dp_UOPDRz4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fQMChktOzTDFj0w0aHyXs6kb45f44MSD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_08,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
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

On Thu, Aug 14, 2025 at 10:08:26PM +0530, Akhil P Oommen wrote:
> On 8/14/2025 7:56 PM, Neil Armstrong wrote:
> > Hi,
> > 
> > On 14/08/2025 13:22, Konrad Dybcio wrote:
> >> On 8/14/25 1:21 PM, Konrad Dybcio wrote:
> >>> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
> >>>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
> >>>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth
> >>>>> along
> >>>>> the Frequency and Power Domain level, but by default we leave the
> >>>>> OPP core scale the interconnect ddr path.
> >>>>>
> >>>>> Declare the Bus Control Modules (BCMs) and the corresponding
> >>>>> parameters
> >>>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
> >>>>>
> >>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >>>>> ---
> >>>>> Changes in v2:
> >>>>> - Used proper ACV perfmode bit/freq
> >>>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-
> >>>>> gpu-bwvote-v1-1-946619b0f73a@linaro.org
> >>>>> ---
> >>>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
> >>>>>   1 file changed, 11 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/
> >>>>> gpu/drm/msm/adreno/a6xx_catalog.c
> >>>>> index
> >>>>> 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
> >>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
> >>>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
> >>>>>               .gmu_chipid = 0x7050001,
> >>>>>               .gmu_cgc_mode = 0x00020202,
> >>>>> +            .bcms = (const struct a6xx_bcm[]) {
> >>>>> +                { .name = "SH0", .buswidth = 16 },
> >>>>> +                { .name = "MC0", .buswidth = 4 },
> >>>>> +                {
> >>>>> +                    .name = "ACV",
> >>>>> +                    .fixed = true,
> >>>>> +                    .perfmode = BIT(3),
> >>>>> +                    .perfmode_bw = 16500000,
> >>>>
> >>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>
> >>> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)
> 
> You are right that BIT(2) is GPU specific, but that support was
> commercialized from A7XX_GEN3. Anyway, the Win KMD uses BIT(2), so lets
> use that in Linux too.
> 
> I know some docs show BIT(2) support, but lets not bring in untested
> configurations.
> 

I'd say, I can't parse the comment. Should we use BIT(2) or BIT(3) here?

> -Akhil.
> 
> >>
> >> This is *very* platform-dependent, goes without saying..
> >>
> >> I see BIT(2) is also valid for X1P4
> > 
> > 
> > I'm confused, Akhil can you confirm ?
> > 
> > Neil>
> >>
> >> Konrad
> > 
> 

-- 
With best wishes
Dmitry
