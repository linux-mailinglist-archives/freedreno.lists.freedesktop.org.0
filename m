Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFD7BDBEFC
	for <lists+freedreno@lfdr.de>; Wed, 15 Oct 2025 02:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3A310E6C2;
	Wed, 15 Oct 2025 00:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i827RoeF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558D610E252
 for <freedreno@lists.freedesktop.org>; Wed, 15 Oct 2025 00:52:35 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKR3dI014352
 for <freedreno@lists.freedesktop.org>; Wed, 15 Oct 2025 00:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Tzf0L6D3EH2YPFle2aNSiWYB
 7DpBkZTDjjS3DEmFzrg=; b=i827RoeFhLPic9UObH3TaIK+lvH5+VKKHubOmnOi
 ZWHtKvaevO9HzkKFGhtkA+Xt+iKVQw3ELG6zgtVGwTZZvBlwyCKaCJLoQnPPSdPT
 naEvfpe3BLRlgallQBHRh6C/9pxlJ3OuUieGVuyDrhOyQE4EpXFVRzWEiDu4tBNm
 +aqdQPkqG54EcteRe0lMhwW8Ey0LOyGbTPqUh+2My1dy2UuukBTumGHbyJcRGzPz
 GbubbPJdQe7d3NGdVK2KIhWaZrqrutj940Ic/xeu91cKGtcME3janE1UIFOa9q5H
 T2XiGsy9TiPAqU/Caopy3gTEs7gr72O7PeF2CNxQwzcPiw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwmu41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 15 Oct 2025 00:52:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-883feb13e83so3378373385a.1
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 17:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760489553; x=1761094353;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tzf0L6D3EH2YPFle2aNSiWYB7DpBkZTDjjS3DEmFzrg=;
 b=plQHIiYYFW+/WdgywiV7fcWjp93RpA8N0A+zSXREWWO0M4OQX/4Dj357UoyTBYwwMR
 O2lCsRDiaZlx+PX/9q9MbahRu0WxwEoUal9CsMtsC2Euh8UVKy/6IhMiWTdpnt5zI3BA
 JRfWKP+8yUQhkMl8lyBwrc5MI74/syuiG+GcEnLehDVQbH3hnA6eDPu2nEubxttb00Wh
 TDd6yEexDyUo/o7NDEDnWEQRkNrrLOUPPQmn151e0Y4YtanrjMx8/sFOswVxbQ9Wisxr
 oCCpp0CSZehI74psTClXzHa1dKkRlg6ZL8996dLFp0woma5JyuVevTGLczbckwjAmirE
 0puQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7smDNdA0sHB8HW33DvCyzCRA/vDelENR4oNGiKeZlPEveZ7fJu+n0vA4EdlyJoaWPdVSkNOvorZA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWNsUcbczhvyykLXQbZ+gToDyDPNnUMPxNM5C/cdV9JB8UKhmn
 YbP8redcZAyVGsAkdf2fTKpj6Zp+jIvJBxufiQ5FJew/wcYuG5bqwXCl9NveS8MCwcNYZcIQs+a
 c/raYKjGx/ua+4QpM8flgA5wehjJTRpSbOi/7tVG2gSYo7bEvoOSWNUhLn+0WG8DyoGygCDA=
X-Gm-Gg: ASbGncumyngNOrYV95iE+emkk636je5F0yCoM5Ty2xj5ojd65akeJjaQKjPjemeiNAd
 bKEJzIg17kEJRbH6aDehL10QpsV2aR32+lJT8b8pxc/GoDABj4NzDQUWIKUhK8e2gz/iKJliJoT
 zVTaIccqm+AV3Mxg9Hl9T0x2z6Cmbv9DK5E1PiwQMw0HBzYY7VcfCdsMEhkuscRxUS49H43dXdy
 +Wqs2z6Lcw/jFc30iaj4uvOeD3sGiN71Ugs3TXS9KNsqriNLNMxuB7q70ZgD0Lrx/pNZ9bcQalx
 v+Rp6Q2M8ULBP4KCrmPff/W5feN4G74h7NC2mWYHtCZCqM3j4G9a1RpVt51nic6NjKGbyQl20Zm
 gNjhk5aNeA8UYohMChBr9fSuSUWIGGPGUr8IpwTsvKlbkJMPLtsPl
X-Received: by 2002:ac8:5dcd:0:b0:4e7:2506:ec79 with SMTP id
 d75a77b69052e-4e72506ee30mr135584871cf.63.1760489552887; 
 Tue, 14 Oct 2025 17:52:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT5gGmEBzy/fGeyfAc0o95IohcwAF602kc7JGNMpkeULruHi8pVrT9U/c3E39PE+wY0ybzoQ==
X-Received: by 2002:ac8:5dcd:0:b0:4e7:2506:ec79 with SMTP id
 d75a77b69052e-4e72506ee30mr135584611cf.63.1760489552446; 
 Tue, 14 Oct 2025 17:52:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59092ed98e4sm4876671e87.4.2025.10.14.17.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 17:52:31 -0700 (PDT)
Date: Wed, 15 Oct 2025 03:52:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 11/16] drm/msm: mdp5: Switch private_obj
 initialization to atomic_create_state
Message-ID: <z2y7vtahoot6s2otwtvfvaulagqd6q3oz2bysj3zudj4lpu2id@jknxi66wq45t>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
 <20251014-drm-private-obj-reset-v2-11-6dd60e985e9d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-drm-private-obj-reset-v2-11-6dd60e985e9d@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX7HJb9xJrCwyF
 ZZcWvCP2D0ZTlrm48tWqhDO91d4bvHCZnaenOsJ85Wvk1PecgmhcRVJGaEhIe7KBHbt6kDD1iCO
 ldO7DVwQF4mEgGLDFguVX9XiGLHc2/4M9u/ZsEg/o+PqYF9bGZtLC6vv0+ndc0/Hi4TTMS5fNNJ
 PoFFEJbzua+9Ukzm9S6x1xxJcWwvqB2fpEcClDg0Bno/tSY+G9CsiTNPsXmtM9pFfsjV0SQeZCU
 bmzarQV0yCSSxc8pcxea+UFxA4ohJVSv0gVt3wisas3i/DfgE/nm9jDYnULL2skTrU0vLh6NwKa
 WW/kJlzH/z+ya6vq39bRNyalbVfcTMYMLJ1bOtX+2lkGwUdccqPNc6ZZ3XO/SB0bMawkgV1Ccjq
 sB+B5wk7d1AJdjw3UpKg21NlNsZrHg==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68eef052 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=tVI0ZWmoAAAA:8 a=e5mUnYsNAAAA:8 a=irzjlvPHKc5pWT2xi-0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: g0dOMyMD0gFOfxGqx3ce8Ny2O3ohnDhE
X-Proofpoint-ORIG-GUID: g0dOMyMD0gFOfxGqx3ce8Ny2O3ohnDhE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083
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

On Tue, Oct 14, 2025 at 11:31:55AM +0200, Maxime Ripard wrote:
> The MSM mdp5 driver relies on a drm_private_obj, that is initialized by
> allocating and initializing a state, and then passing it to
> drm_private_obj_init.
> 
> Since we're gradually moving away from that pattern to the more
> established one relying on a atomic_create_state implementation, let's
> migrate this instance to the new pattern.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> 
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 41 +++++++++++++++++---------------
>  1 file changed, 22 insertions(+), 19 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
