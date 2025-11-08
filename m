Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8241EC43048
	for <lists+freedreno@lfdr.de>; Sat, 08 Nov 2025 18:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084FA10E1D3;
	Sat,  8 Nov 2025 17:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W8zryxwm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NzTkGw5L";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E9D10E1DF
 for <freedreno@lists.freedesktop.org>; Sat,  8 Nov 2025 17:00:51 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A8FHrl42414735
 for <freedreno@lists.freedesktop.org>; Sat, 8 Nov 2025 17:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=SymD3woxruHShZlmzgGQ9Ao5
 sdm1n6xaKEBnyNrZI5I=; b=W8zryxwmyyS0uVOxyZdcWyJS7fEeS3r+4YSWjwAH
 0XsaGqv6tzTMZ3Pco9DdQqZSl2SDWFk+/GcF1CEWld8UTkEY7RcdX9bKPUdaI2ik
 MSIKK6If78PXQokl1VbgYqrE5UvCY+1p9ZJBIaWBsgSb6OftqJwRpa9N+iuLz5vB
 avPoz9QgcFuCQL2t785LjXPrOr1AK8mCQqaSlh1MolBFH71HQZrkAHq1hHm+/gCU
 I0F8y/Nkh2WkGUffdAXDrjwTEUKkD8SFX3r0sqWdBpsRrZ9yPnS5lTYruEkH1hSU
 eYtSU1MHNq9GN6+HMgz5HbHRaH0yn9NpB+Hwr5A+7khPgg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xwfgvmj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 08 Nov 2025 17:00:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed76a29beeso38426351cf.3
 for <freedreno@lists.freedesktop.org>; Sat, 08 Nov 2025 09:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762621250; x=1763226050;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SymD3woxruHShZlmzgGQ9Ao5sdm1n6xaKEBnyNrZI5I=;
 b=NzTkGw5LqsizL6ssv3i86nmILDQ95960u1JZqF/rTg47inBLvXPjcpboWIOtuLcHAQ
 4XMgPyuugaafTwRcM+cHDKDrpQmjy+fHFxhtfCblvO4BS1T22Erm/73PeQRNXi/l6Kry
 tEYaJIK30IsoQMX1uKkaC3F/QDDUPmD9Mcv7+e9qboHznr2EdFLkEbQ/CX0Y4yspARDV
 O4jeM2Mc7TERQgLKl1dMJXmeIy21qtL97azKYkKAn/tlW5yNKFJFh4pzDslevT3+qaaP
 qIcjf6ffb/AndCRFKZRaM4JlxTviEVw3MekfuaV/7Bxw9IOvNULaFhqFR6d+nXJQMp9d
 YlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762621250; x=1763226050;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SymD3woxruHShZlmzgGQ9Ao5sdm1n6xaKEBnyNrZI5I=;
 b=wA++nmRCEtMeFbhcr6yFNJFruste7/NEn5a95IPQJvnuRx0tYPNysFk6vvAv/gmNBy
 EpV2anz+P4w7vbs/Vjhd5ZVTwVlgsnteNJ5xP5in0KD1epN5OBr1YotIbiJtwEsnU5Yo
 TzZCDB6WvMQgU7t7tyD60HGU5eQuGEvYCQhoQ0+DI3kpC1giCw3sVlsFw9ZR5u8nHKv0
 /3yA/WegM0kuRhnu8UVxtNooh/A05GPubFbj22zja+5nhazdO2CNiPhSGyn66xZKmbOm
 P0yt0w62iFYjEi9aqpbrQsRF7Cn9W1LpQi++LOICM/cXXYcRfV4pDuY1euR24PEJDkcg
 yP+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpd/CSDnUuaHUYXpEsgDu1oP3+RAYoMRTS+IOhdnBLR2+/J4ZsChuLI/3bW3K25vdSfyxxSUnBeJs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziTvCDD2z3aXVKpVqgb8evl90DLY/sq/tKlkxkWSUxfXjxIFSU
 6MXI/QVNeXmrDYoYHACW64yX8FHh0IkS0J7CSXpJXypKIvVoZWU23rFOGwfM1Cw3tOXTsfHO5lt
 hxVonV42AY6zj8dsWWlA6alpTT7Q7YLCkXKHbLyY0Q0yB0rlxchDYNE26w7vi+v0NlYaS3dM=
X-Gm-Gg: ASbGncvv3BVFfEazj+FqWdjOpTFQE3c9I67tUn0GwsY29FKhF5WC46N8lDg/cHIAmHE
 Euh4ncWLVsOGCUOosQ6wmBQP1+ZX1ZHoG9j8ogjDyMLerNIIw2OpSSpo0VadhTapxd2sKHwePve
 3qKbYcb7EfAaF8MumOtqjSV+GH1GIARNNl763SUrWjYT5440mqhAhDjp4g70RXcS6Nw0T/5v5Qr
 7Z3nZBAoFaJ98jfMyz3FJOabfyB9NCdgTv5xCINIBbvsZtAzTG+pm3kW7DBm9FwvxLXUlAA3JIN
 FvTaQzjwEjb2UZaf1UxxOcux3Dq73Idqfq9KhAHjevc2jXAQ5ZNtCgvQkj8jxZHJlwgImwdhIFd
 CwLcfYqlLtkRdhuNjoPJ6rkQzlN65TDHYF5Qt3QTNeFI6we0s99jnjnchAZvonPVkb0Aq8uHwiU
 4EAKkFpf58qFuw
X-Received: by 2002:ac8:5acd:0:b0:4ed:43c4:5e79 with SMTP id
 d75a77b69052e-4eda4e7bf1cmr44278641cf.12.1762621250268; 
 Sat, 08 Nov 2025 09:00:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1ot36r/5empkRXCspZfcIecbvIzABkFl724CS94Vw2gQkEMA6LYJRcTmCK9inn074sbu6tw==
X-Received: by 2002:ac8:5acd:0:b0:4ed:43c4:5e79 with SMTP id
 d75a77b69052e-4eda4e7bf1cmr44277961cf.12.1762621249762; 
 Sat, 08 Nov 2025 09:00:49 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5944a01a67asm2305233e87.38.2025.11.08.09.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Nov 2025 09:00:49 -0800 (PST)
Date: Sat, 8 Nov 2025 19:00:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/6] drm/msm: use drm_crtc_vblank_waitqueue()
Message-ID: <hvbwatl37zseui27epzns5btxdzrjehamtua34ja6flenjxz3q@ac57pl6niv62>
References: <cover.1762513240.git.jani.nikula@intel.com>
 <5917fd537f4a775a1c135a68f294df3917980943.1762513240.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5917fd537f4a775a1c135a68f294df3917980943.1762513240.git.jani.nikula@intel.com>
X-Proofpoint-GUID: z2h9vOfw1zLixgTNur9jtM0Mt0n7uY5T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDEzNiBTYWx0ZWRfX4Pz3XyaPNBuP
 /kfepdhuOUk3HdS9MKIR4eleok1HM5FdgWUn4p1Xs3f/IZU/70caVmvw/noLmEtEJAamf4jt7pN
 381YeJnko84FrFYFYS+YPEsNaEsLsxbipywyk6Uv+c9n0hfVU9oQB+ut9VmeVZDBxLJ7JWhAGvv
 xI8gBQuoiDQYMgJeOvLYo2n8uldZHf9naJ9XMac2bgnXNrnQ+50VSstjS/ZCsXt99Ss7thWnIee
 +9tdld5JqUNLcOcMdgi/CFr4cvlQVjjb8zF0vgzYk0iprUBb8n47AveLMNu6vOMd8x1hJEu087S
 TO8oBssWbcwjO+7gH6M6GzHnZOoZU7MUSRuYYSmBOtBtnLS4O+AUVDsL+1kcpV4eGkZclHK7q4s
 psR3i5lwqL15D6dYaeJgAuSIc+AkXA==
X-Authority-Analysis: v=2.4 cv=LaoxKzfi c=1 sm=1 tr=0 ts=690f7743 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8
 a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8 a=32IxprGEISmnaGXNLfEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: z2h9vOfw1zLixgTNur9jtM0Mt0n7uY5T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511080136
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

On Fri, Nov 07, 2025 at 01:04:57PM +0200, Jani Nikula wrote:
> We have drm_crtc_vblank_waitqueue() to get the wait_queue_head_t pointer
> for a vblank. Use it instead of poking at dev->vblank[] directly.
> 
> Due to the macro maze of wait_event_timeout() that uses the address-of
> operator on the argument, we have to pass it in with the indirection
> operator.
> 
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 3 ++-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
