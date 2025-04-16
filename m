Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBA6A90F72
	for <lists+freedreno@lfdr.de>; Thu, 17 Apr 2025 01:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5D310E9E9;
	Wed, 16 Apr 2025 23:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="isKcqbjP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3BA10E9F3
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 23:19:14 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLsnbI006993
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 23:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=lPOdN2D2GxjUoOAn8DxazkVb
 UBcosChdPZCm0x/++yg=; b=isKcqbjPdj1B+U3d6/lwTNFGP7pNtzyZPMsbGmcD
 yBUwTkJY7ki5BxgIZMYogs7OG/XJIcAXu8EBRzPqbUaHpOzImMSDYDjE/vtbb7IJ
 emRBE+5c6emYTv34rLrqyUT50ihPKHl46Fs9/abXlvON6gIvspjeKZvSXyHV+1vl
 DN8DHfx3Fp+wyDmBFMkDD7XitKXHtejAmRPHQMsT0rEue5Bt0XvkWdrG2GpMoaDC
 Py17yvSHsFrEbw89ItXmgixhgVGA6ZjJweqac7Nwkx/mulIUNW5QA5sZ4UqpydGs
 6V4lDRYocK9z4l0/DV7ADFDUM/NOFfSZxNz60aacfdOx3A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6n46t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 23:19:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e91ee078aaso3647146d6.3
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 16:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744845553; x=1745450353;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lPOdN2D2GxjUoOAn8DxazkVbUBcosChdPZCm0x/++yg=;
 b=ZqzgZXJP32XuMBl7/8VGUwHnX5i6Qwj2dUNmlO26NrmKmss2MWoKGE+JaPKrhT3IO/
 ATHGdfrukXnePLXNyskbqQ/+VM0rR68cGzGV3F7my5ywdH95GqDtXP3mdoFm/zjCYKgZ
 CLvrWLw4HE+122PgMeOTrQSSPc1U1WXHkEHvacwhLEdPXA2X0DiSYqBDTdliBgRByvZO
 fIiJ8HEUcUnGhy4GUALV9pESTrYioi8VheJ/vCdbGLEUqkmQ5h8YZR8ZXT2rdrgwAwGa
 mpAzJy/O3tEOddW84s3Fg/v49rFnjNjhrx33DGTcPsfc/rt4tayDDqdTXEVuV3wuk035
 ioaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI8l5PVubSe1XVEJLD64ahcOQaZfDJ7pmffIhLPfedfTBLef9EMOH9UsAaxdXksZRsC8wLYo9nXu0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQUBm0VB+5A2sVGfs2YpbdmFHm+jB5rNP7ZpZvhUajmJPxpr1Q
 K5aKjaNDugPEFv9td+W8S4daFhF25AHShTF0D3NdAJZtHseQIMyJxUte4X9iuA7SEuhm1xIn3ab
 TT1oZUcEfdsLMjrAo6XHsatddXrYkOSPB6U7E1J38wZGt7XDbZrcseOj9WufuusFwa6g=
X-Gm-Gg: ASbGncvmOV9uNpjXsrpe1VHlALWeXbFYNTZx4BEqp6LXqT4VGtVInKTZ1L3uNlx9vVd
 4BEJpeDPT3+ZwrB20Ir7xFndYD3unDRgzJhijHgToQywYJDKkFj5Zemtk49o6fes5BU3OdyeV3a
 VIFrpSKIx65qpG9t3RNh1YehvHwOh+yOTsej1Atb0pEGRxVXBlJCqg83hA45njlpqda020Y2usi
 2CIxBrJHOKytOQm9tu9niq+Ti4SiISSGK/jfxKm9oCvPKP220qf+K1nsArygCvPavOncfFJ649P
 a4mt2jOXN7fxCHMpewIX7WHw0ZiLumoovQSWVoZkK6GsbLc2oxpq7gs3Z4mIKoScAT8gZIMmvMc
 =
X-Received: by 2002:a05:6214:cc8:b0:6e8:eabf:fd55 with SMTP id
 6a1803df08f44-6f2b305af6dmr55384066d6.39.1744845553032; 
 Wed, 16 Apr 2025 16:19:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUGj8KXJI5k/hfuMcwByep+3dU/C//eMqavaVyCZMY9db41fx7/QT3SCEfUNFYr5xIkDR6KQ==
X-Received: by 2002:a05:6214:cc8:b0:6e8:eabf:fd55 with SMTP id
 6a1803df08f44-6f2b305af6dmr55383796d6.39.1744845552643; 
 Wed, 16 Apr 2025 16:19:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-31080864bb2sm2487691fa.71.2025.04.16.16.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 16:19:11 -0700 (PDT)
Date: Thu, 17 Apr 2025 02:19:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 06/34] drm/msm: Improve msm_context comments
Message-ID: <3co4r3aj6rhydqzg23dxnh3e5asrny5zrkzchjg2dov22tzpho@qptuyivzqv4n>
References: <20250319145425.51935-1-robdclark@gmail.com>
 <20250319145425.51935-7-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319145425.51935-7-robdclark@gmail.com>
X-Proofpoint-ORIG-GUID: mpk0arBCBWRrIPvnsamLtixHNlFGq8bd
X-Proofpoint-GUID: mpk0arBCBWRrIPvnsamLtixHNlFGq8bd
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=68003af2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Xk0_UyW-TLBMhFL3eOIA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=699 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186
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

On Wed, Mar 19, 2025 at 07:52:18AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Just some tidying up.

Probably there is nothing more to say.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu.h | 44 +++++++++++++++++++++++------------
>  1 file changed, 29 insertions(+), 15 deletions(-)
> 

-- 
With best wishes
Dmitry
