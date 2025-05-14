Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5B9AB7593
	for <lists+freedreno@lfdr.de>; Wed, 14 May 2025 21:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC21610E6F2;
	Wed, 14 May 2025 19:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lns3HHti";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9BF10E6FC
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:16:17 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAunwd012608
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=minyAMejHL/JFJSA+xnqXanR
 0wPcS9nRnV+dThvhjwE=; b=Lns3HHtiVUtP/NGibWUj+J6urosA2DXc5wZXE29E
 WVsS8lufGfsD95s6JIg7kr4Q88QfY0i71mZO3BE2c8SLk8JHX4ey2BYJiIPPhbww
 t845x1xlxtpI102dL1j05C+927cduWGj/S4HLVV2KfsEQYEia0QCVYr5emZSBT9B
 BenrRNn0ROazfBZiHajZCUmPm7o7XCOk4eWkwpdllVtDginRxEd0EXVtyrkuWJ0o
 nhRkmuGlT9iym4iq5rggruV+YEknguQC1A5wQrawfcXMvF4XfX3NnYelfZtLCW7L
 XooLD23kpBlhYX4HdWtM496ctZGJA2jvjn1L5R2LILLY9g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcykvpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:16:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f6f2c41eddso3550576d6.2
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 12:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747250175; x=1747854975;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=minyAMejHL/JFJSA+xnqXanR0wPcS9nRnV+dThvhjwE=;
 b=C0bsQC2fZUhrzwsbFWGL8QomZuraEKOBGUg9MHf1QAnPwsp5nNRYodcxU5S+XkC1Uo
 aDOn0k/IgYTbdT+mG9d9XG3auvEPICKYg3rraieZ22FjqM1zaoYkInUOkedkdtoHD6l/
 TsMNm+0YEb8ydIbUS3fedsk788hQsSimkB51yM0bbF54sZj0jQX103vh3VZedtKT8EB5
 i2x6Hxn+3yiHOi1+36HiwTEGTjeO5mswqCPmx0HOz/OH/ur9WWmEqtl0ilm0LaYD1mDL
 gdBhkyH8dBrdFdvusQF9uPAVFs8IzKDRHxH0y0MKOFc4eXXmW6VhS9RFuTHEXOxzJ7iy
 F0AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU9p3CBcfb3wElIDtFEA1LePcMd0uN8AqEASa6LUiZT+bkZ34u2KOXAXKbaRmLeHDfnCpcip28pPg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzCl3lXzXKPI+/NUDxrXsAqecDcQy2NtmE4XWfZP72dRzSizvL
 fbTiWzzJXQSndxgXZVgxuhBdLCPcWo2dIMHI161fmMXOCsXojAyqSB8LyDYn0sq1B8R5UWmtPB8
 M4J2Kp6DpUf3hdShpnM6++zsSe/v/fUESjQ3sYaNxA3Vs8bNWTJdi/DPvUb/dIh7xKFU=
X-Gm-Gg: ASbGnct251U13NjosW1w6uvME8EvzLqUPxf/lKFxSM6Roy+kSh3eaTZardPSU6vXJdu
 /6blBUkaqCWmc+IIPZyJ2ffuFiW1aNKcEb9hmvXLtGqFD4Sp0FYhoIXHTFUQJ+/HHpFiHhJelVm
 QO4y74X8/K5EMKHycm6PnetPuiiooPzQvbJBr2Lv+eaASDusQlLSbqPfOUtjy/rI7KvQHdjkaLh
 tVUfpVr/6qOmJZutLfs/1PI1Udjm0xJZBR/7i9NWh5C16F/TIisrgh5EWwkJBn7SlSkr9RjWlQj
 bNnahO8xAPDuRQsVBmf+Zd22JJgssd+3pUXTAiqlzcfkSrFEAi3pToiyhySPT/NO176TRM8HRe8
 =
X-Received: by 2002:a05:6214:5014:b0:6e8:e828:820d with SMTP id
 6a1803df08f44-6f896ed0844mr92863036d6.36.1747250172514; 
 Wed, 14 May 2025 12:16:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi4OASQm4gJGGxeccfV1ldsNxSDl4KQOG6jMf/3jYLWvcUhPLkhO6KcplkBwZ0Dv0kasxkIQ==
X-Received: by 2002:a05:6214:5014:b0:6e8:e828:820d with SMTP id
 6a1803df08f44-6f896ed0844mr92857286d6.36.1747250167947; 
 Wed, 14 May 2025 12:16:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64beae2sm2343713e87.161.2025.05.14.12.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:16:07 -0700 (PDT)
Date: Wed, 14 May 2025 22:16:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 05/15] drm/msm/a6xx: Resolve the meaning of AMSBC
Message-ID: <bkcbfzkgypyghmugpg2lopxyp2wfsogrclaqxfwrflcceimj3l@lhv3dv6mfrw6>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-5-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-5-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-GUID: SqikTEmVgmwkFPUzXSHiSthJYX-K8cJ-
X-Proofpoint-ORIG-GUID: SqikTEmVgmwkFPUzXSHiSthJYX-K8cJ-
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=6824ec00 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=UiqBTq1rjkrdqcEHUKQA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NSBTYWx0ZWRfX/yl9VogWFCyD
 3YfAbttxhgSX+CpMeqW4cKwWYxb8vD6NUtH4JIAgYdcR5iFPdQgYWLAM7d05TzGPqeOVru/6pKR
 LHKJmpZoyrPInh/MQCbmGMZGOcOVhmkfZXsoR0bgQjptHxAWEb08Sib4xt+DHeYqvyiZm8wePm3
 gIoXkn5zIWBfSIIKYE8gOR7aNwR5EVfqLggMzGVzBYnGWmn1pYvgWyAgTG60qJldNBp7AwzZS6g
 gCA3xDAZNrIwtV3RvQweqTpz45vS//owNzWKuiPbDk+QP7SvzuP0Jz9b7nu+tX9tmYiQAAx7EvI
 4MzNcLGeymtli3JUKsHJJ+J+HJ/3R1Lx04t/9ykSmgjtuukxRLlR0CqalA7SL1acAkT+LNrZCgG
 6gUYRvWwBBLy0/mVZPMtCrA647tli0kjcO+YmV9tbckV6EhBUfKb0JguGrj4QYIrbmJH4mPH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=796 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140175
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

On Wed, May 14, 2025 at 05:10:25PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The bit must be set to 1 if the UBWC encoder version is >= 3.0, drop it
> as a separate field.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
