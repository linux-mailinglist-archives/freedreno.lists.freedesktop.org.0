Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F32A0ABAEEE
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 11:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BD210E194;
	Sun, 18 May 2025 09:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eQKz+doQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF53C10E194
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:24:25 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I7FRBo022428
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8adgWh/hWNFS/Xt0M8yK5bfg
 fpi+Em2QHRbR8lIk0N8=; b=eQKz+doQfwzx7JurT6dHNy6N/tar0UJZncyIGAV+
 zoO/Z4AdHSX2XkbineQUuh93Y4jBo5FA1VPz99MsWTfn9GbE0gD1Glv5a8Hlrql2
 jBZMrXwDJekjOtuiUjpE1aVgUPdG0bI6gr7BciPFMS/Di23rm+f83a8Wp2R+wM5m
 hUdI0e/0Agx+9al8cyhrlyEIbqkhFNOA9RO4WzOFD5ARulH4dwdnOxC/AOIkFzyT
 Y/KAcBaj1GU33EcyoH0cOkqDhzbxjNKGLY39KsnQd4iu++nI3ACV4moSJe8v4dxa
 ZIDTVuUSRFHAxr476ZvRkToSgStFrAYeOCz8Urt584/pLQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkcssvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:24:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f8d3f48f35so4111156d6.0
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 02:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747560264; x=1748165064;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8adgWh/hWNFS/Xt0M8yK5bfgfpi+Em2QHRbR8lIk0N8=;
 b=YiaUuOHEMspUK/u9KL/lblzJx5+qOEzTFfluyB960dPVYe0LBD7mUWsjGcdehyu5K1
 27NFe+ybsP/cihgEc0ppKP/e3kGyJJVeC4j2TuVucmazRtqtkJehWehYF8ScdG3+msFq
 gBtHgRH+YpFLPNOscGUZgEGZdL5Zg1u2h81UOeA9uLdiLwaZwWB/Y0xUYIFSEGYKMfyM
 iqMj0PD5IaIbXG4tqDMQbf8cxEURwDjTdAVOuTeMhY/0VUXJVdciwJiqAecXB2uUYz1x
 mAn5etw9SVCaVxvd9Wk/rQ9CJgWxHeneOGviDuznyJ3Ud8N/x8TNawnedQwXfroRQWsa
 PJTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWahdTiKt76gGG1IFTOTmZf2aT4br8XijxYcNahF5f3YeMXoXmUts2gP9jr6srw6TkCPtBalIRrF2o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/u7I4d4kxL6DTdE/GW/+wUsFj58mUkhl8JbgiWBnGel4i/8vO
 SZDcqeontezIUDUsaGyeduI5u/H21kUqb8Yz/MYCOtUtd5xB90STwMA/oWmqWgMY5GS/886CdXP
 br/wey6zCxQMTPVMsKQW6pDsAU2O/8CUP3usQn1rX1Vzc78tcAbkYyioxUwAnuS8/imFJWdQ=
X-Gm-Gg: ASbGncsAUe4yKtPfAGQPmWE5WL45Y4M6wtDXX870KnJC7JAksIFpuNgQvJBHUtbvPGK
 daGrY8WOxt10oRJQA00aIQKICPjdXlhIgh79+nB9KfjfFWpUJaAXMbd1fH5GabrmJbKo9gZ7dt2
 Z4tF6DqdnJqSWYOQ4YBSzQISKwIKgNbVCZzp8unKTl7st7oSIBkRAJ1R5ZloRguHA0xZiDfwINo
 5ApkbnmIIzKMvRGUA57XcSm2QpfyLzTXA5ydx6vW8xA1On/nQQzVJxjMB5ZMKY67Ol979Yg28lO
 2OygZ7G+TRORa/Ud5Sq7yX0MuAM8hKInRl2fMnJ4gwPguBv05drKbN5Bu9oGIQi8oe3JykoqlZY
 =
X-Received: by 2002:a05:6214:1cca:b0:6f2:c94f:8cfe with SMTP id
 6a1803df08f44-6f8b08b7479mr165682836d6.23.1747560263955; 
 Sun, 18 May 2025 02:24:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUs9JyXLQMqLiJw+mJBxX8dsSHNhuvKCwCIcelIHVBLDBUriVWMpazHRFkx+FOTJbGlzEbsg==
X-Received: by 2002:a05:6214:1cca:b0:6f2:c94f:8cfe with SMTP id
 6a1803df08f44-6f8b08b7479mr165682586d6.23.1747560263591; 
 Sun, 18 May 2025 02:24:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e702cf90sm1359428e87.177.2025.05.18.02.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:24:22 -0700 (PDT)
Date: Sun, 18 May 2025 12:24:19 +0300
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
Subject: Re: [PATCH RFT v3 04/14] drm/msm/a6xx: Get a handle to the common
 UBWC config
Message-ID: <6mlja3igqehhxdxgfyhlmknmcvbz5j64vxhevejlg4om6xuhkk@6exwpmczaoqr>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-4-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-4-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-GUID: j7IcJy5jcHS7Z6GWWBhONpNwzCxmCI2R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA4OCBTYWx0ZWRfX+KPlJJJ0Smop
 9jcSNg1s2BzX6r86MYjT8PYunKoDgAoooxMRWhOIFYqojrNuIgTNxfKLv46GIFWvXnjl8MTsOUQ
 BfWAzEEDre1A9Pu1F5OD3AfjSWFWbfOpt38c87jTpYYLJWSwrI4UTYBULyQ/CendLulPPFawONW
 KiZ6xrtf2zOaHZCpuiQvex7TJSKtOgf98QWXoClWBwAvplch7zF5an8mlJROLP85hp9T8GkF3cl
 00ZGprdqav0qqKUXdQQsGmbp86sy4upACQ4nNQKZEdvl35aELgrTMkkBEJazHi98G3KL+fRarfY
 PjxqkpTqpNIspGQ3U3uH3WkByTdIQTPGGx6qoq/CWyjRQlWSWHEv2SjwCdFXkLlxZTb/21N0Sp6
 vMjKdpc3ZRJsrXhd2U2AmhH7NRIkYk+i3O0LMX6Vqlm97XbvWnrLfDrKnuOizZV+iXKO9j52
X-Authority-Analysis: v=2.4 cv=aJXwqa9m c=1 sm=1 tr=0 ts=6829a748 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=93Yf4Y-vqGi4v4eIoEMA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: j7IcJy5jcHS7Z6GWWBhONpNwzCxmCI2R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180088
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

On Sat, May 17, 2025 at 07:32:38PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Start the great despaghettification by getting a pointer to the common
> UBWC configuration, which houses e.g. UBWC versions that we need to
> make decisions.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
>  2 files changed, 17 insertions(+), 2 deletions(-)

It is possible to build DPU-less DRM_MSM driver, so DRM_MSM should also
select new UBWC CONFIG entry. I've started a work on splitting GPU part,
but it is not yet merged.

-- 
With best wishes
Dmitry
