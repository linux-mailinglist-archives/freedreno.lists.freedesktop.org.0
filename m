Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47141A90F36
	for <lists+freedreno@lfdr.de>; Thu, 17 Apr 2025 01:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4A910E9E5;
	Wed, 16 Apr 2025 23:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMfnBcr5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AE510E9E4
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 23:11:59 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GMIfJI022281
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 23:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=10e9Gm2RPGDf+oQLDehdobGU
 Daa+U5XpyPoSez3rMCg=; b=aMfnBcr5HCNeSj3J1sOS2UQQrEYYtqAMgtbc13hx
 jrEzDtXXg3gWz6c/NrKgCvfKPZC2j40txojwvXbjEsizncb4L6qY7gHYOdZljgfm
 SDw/HUs5kAQzeCZNC0oL8XFZxP8y3Y2iw0HGEYU7EFtcAmQvW6NPsjiIAos6Q9eO
 fOS8ohEQ2RuImLrQiioMaGRH2satLxtF6m2T3A1aiE6aOiAfx17EnuKzOiZ0QPqh
 Q+ygy9ShgjRD6CMklNGkOG02z3NTVTLxKLg8hsSvIEbtSMdVq0RssXiYgLWsJA47
 hTnkCKFIcnkZw+N1zW4hPf0/+9Tkv1duW6l+RAx3s/Slng==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9cykp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 23:11:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e8f9450b19so4481186d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 16:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744845117; x=1745449917;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=10e9Gm2RPGDf+oQLDehdobGUDaa+U5XpyPoSez3rMCg=;
 b=nq7WILeFKeSYp5jSCpvEChddxWbo4RYFeIXlCn901UHwWqNif7OVJJxVfPSdndokCY
 0l6QKQ+2OuNeEgRzxFuozF2T2KaVnudJAb5z1iMgB743//UOnd7vjvvEcchux+aAWQW8
 GJoTaIiKeAtNLSBuVrlKn6x2hppPN8zS9fvWgF7RUCTCRbkhC54u1YH5YmG1YBETtC0/
 XlgVXZ87FxFYv8b8LyqJOlIIhUdQMOGM/NbuDCvOxLkqpPUOPw7KducMqFrIlbqX09A8
 Fa1DdlPTDx2joj5JdTyVYWW3Hc5wVhgr/PNuoN+qgMDwHLecgGZ/X1JAYQVP1I0ZJhvE
 2mhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmWxcS0xzN5D4UIneBjQjLYG8p09LuVZSL9EUt0WpYfy3sLgW0g3FxNwfHRlDflOq6nt6RtHeruH8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGivA9z9kZzdmNgpElcEW3aIg/BkgERc345WwWcPmfQstIgo33
 tyTShStswfw45LE+uFTLy2BBZsaurIGxlMkMLtF/mCwZEC3ri9f4v0rNIqvGpG0sBy+qWkSYfbQ
 bANj7WXs+P6ZC8HGdF3adlR4C5qq37UVz+SjKFOi06o7AwiFfWCLchv19k50mrmWPfRY=
X-Gm-Gg: ASbGnctozQDNuAKWbln5+lfB998kyWGjdwmvWqFSoV30gjJxtAi/+nPaGVi4ZLLf71g
 xTTYabVrna0xC4/KnmnnPRgTaWt/a66fZeHw1jP3TcYKCAxlFVLB2Rrt+cqEUKjLGx0xp02U979
 7Bisg1/Pd7/vj4vRf/m6ehoMJupeH/qUs9QfOrWWoOs5TBPD4Gh5Av5Tb91gHa7Wq/qYCXYQqX1
 14zdIWrhsmlvGBjfjKcjS4aHJW8MtW074Fj8A4CAGmiuUB3FQCzgh7q6bTwmwvpXNxxPRnLAz9U
 J51G3So+cQUzgBWvEzykI2bvblqbKygpTVBUORPuaoRIQM+qgda5vhssYUHq3NHgnndXPllEO8w
 =
X-Received: by 2002:a05:6214:226f:b0:6e6:9b86:85d0 with SMTP id
 6a1803df08f44-6f2ba665fecmr13701576d6.8.1744845117518; 
 Wed, 16 Apr 2025 16:11:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgAiezriok5YJFlEPY56geiSrXUHE9y3nHh405AYuoPCKrzUZwk1oQwHN9lCS5j+H7KnD9zQ==
X-Received: by 2002:a05:6214:226f:b0:6e6:9b86:85d0 with SMTP id
 6a1803df08f44-6f2ba665fecmr13701116d6.8.1744845117120; 
 Wed, 16 Apr 2025 16:11:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464e9f2dsm25270101fa.53.2025.04.16.16.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 16:11:56 -0700 (PDT)
Date: Thu, 17 Apr 2025 02:11:54 +0300
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
Subject: Re: [PATCH v2 05/34] drm/msm: Rename msm_file_private -> msm_context
Message-ID: <lb4to65g2xr3ryzhhabrejau3h6b7impchrlcfpv7bogme33r4@5b5gdqldk5h2>
References: <20250319145425.51935-1-robdclark@gmail.com>
 <20250319145425.51935-6-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319145425.51935-6-robdclark@gmail.com>
X-Proofpoint-ORIG-GUID: MlDDvWkAl0YD6zmU6Zqod7BVoErEd3h2
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=6800393e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=OUvj5yb-mTn8qsDSrQoA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: MlDDvWkAl0YD6zmU6Zqod7BVoErEd3h2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=783
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
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

On Wed, Mar 19, 2025 at 07:52:17AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This is a more descriptive name.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  4 +--
>  drivers/gpu/drm/msm/msm_drv.c           | 14 ++++-----
>  drivers/gpu/drm/msm/msm_gem.c           |  2 +-
>  drivers/gpu/drm/msm/msm_gem_submit.c    |  2 +-
>  drivers/gpu/drm/msm/msm_gpu.c           |  4 +--
>  drivers/gpu/drm/msm/msm_gpu.h           | 39 ++++++++++++-------------
>  drivers/gpu/drm/msm/msm_submitqueue.c   | 27 +++++++++--------
>  9 files changed, 49 insertions(+), 51 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
