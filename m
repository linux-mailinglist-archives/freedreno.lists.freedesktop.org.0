Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFEDA956A6
	for <lists+freedreno@lfdr.de>; Mon, 21 Apr 2025 21:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5415910E489;
	Mon, 21 Apr 2025 19:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jaA+ZPS+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3060E10E488
 for <freedreno@lists.freedesktop.org>; Mon, 21 Apr 2025 19:19:38 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LIg8CT024378
 for <freedreno@lists.freedesktop.org>; Mon, 21 Apr 2025 19:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=66he8wJaUK0BXjdYpq1b9tsi
 ThpKqiKwEnfuTBsAXos=; b=jaA+ZPS+WTAxCgmecMnXi8Ldi6FLV2+h0D8aiAQS
 8gaITNe1Jn6ylZzPjgPANg7opH3kcSXclq1+KcTwyZ9Ao9Yi8PohC338Kx7TcT7p
 6dfForP/CTruw6rrPlwxSm349cUVPUhCQnmbbPstDohSVDMl2QMRnu2dWaz4ND4L
 bXLxxFDiBlesIUbcUFgRzGjY15idzzSy0G3c3YaZWFxZNhg+A/UCUDnQhdzQJmnM
 4DWQRcLTsNyRUG3ZmoRlsWxhJNb6MPxHY8oeQsKZe6zNhkE3+qSgiWRkEMbD7E17
 ggx98fVkz6lZPt/ElRJ0UzOCEugO4K0DWMHKJgYMohxPJQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642u9d5ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 21 Apr 2025 19:19:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6ecfbdaaee3so78557786d6.3
 for <freedreno@lists.freedesktop.org>; Mon, 21 Apr 2025 12:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745263176; x=1745867976;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=66he8wJaUK0BXjdYpq1b9tsiThpKqiKwEnfuTBsAXos=;
 b=TOvlzXISC3UvQJrwKjEqzt8QWY/2c6L6/QiMKapPHJKpCSkCAXNH1VpzufaAOtwHhK
 lnBC2opySZzrfbbjxfsiVCpAK2JZ4pAnoJxrlBWjk+YUnMlY2F1/6PyVzAUZRGlMxi58
 vyyj1TNKuUi+eRDCSGT87pA/3cXkKZjlktFbJobfvdSfdyIwykK5sBq7rw5s5on6431I
 2Teh0bGHruqsz0wRK1NXqeFUU3Vy7GgKztjHl1TntpXaBBkSHFoScg5pcSY23w8eRJmq
 Jk5ZA3/2deKRxTtuzeVtr/1uTBarI+8WZQ/NTqJlwjSMvaCT+Vz4UmizS7wwHYH27N31
 /rNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0jRDpudCOOoZRsMMEFaHTgXt40J3XGxx4Cafg0Iiq6p/1DqlS/h6oMSCNkz2WZKoIkr5wDwviEME=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzl+0KC+93et5rFowwspvIemmkhlsRjloauLrRo87o7R5S1Skbm
 6L4/sQVru79R9k0EBUUBlC0CXNa8jqBu1er99bWVC7oUOhx9c9wo2rhRFzY4BlkFwA4xuVeMctI
 sc/ojWJvFUsmCpPG6pEScWfNCRnwO0WsHQgJ1NZCM+YLOF4kJ4bsMYLiq4X6ViTS2enw=
X-Gm-Gg: ASbGncvblkfxGnxUD8OZ4m0pSwoltHGFgJkhAnt2HxclutDcZRRZM4vmZ00scaHsx2b
 z3FNYeSI4Gg6dtEAX7cOM9VD/+LcKndWt/IGwlh9NEDavPL/x+avDAgtGcc3Qz/mtisihYuq5BC
 I3arCxyoOWxWDnujlQoJ1Ty+f5PeBkrhc7hmr0l9y/Vv8EWT4j3y7iigzEMFgZpIZ8twFN9OqGS
 LduiJuFxXawz2nYII+cCGsRiWsfAQ0hoEJqeJqPTkQ99MCQACVmNEBFmPrNz4ZDwsQgU70QqyFt
 qR2uUc+90v+8eC5E1GkJkqWvVPuZ1KOJOHiOjbaHky7v/bV8+4ExSm5wJmK4Tx2jxVfSSXyrFUg
 =
X-Received: by 2002:a05:6214:5081:b0:6e8:9170:9d06 with SMTP id
 6a1803df08f44-6f2c4687a66mr208576636d6.37.1745263176482; 
 Mon, 21 Apr 2025 12:19:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAH//LryHJxNVjS/IO9xATu109Vj5+FzfGQDOXYk6kqWt7voiXhfMu7uNgM4ct3GZlNBErgA==
X-Received: by 2002:a05:6214:5081:b0:6e8:9170:9d06 with SMTP id
 6a1803df08f44-6f2c4687a66mr208576246d6.37.1745263176063; 
 Mon, 21 Apr 2025 12:19:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d70a20c36sm928895e87.225.2025.04.21.12.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 12:19:35 -0700 (PDT)
Date: Mon, 21 Apr 2025 22:19:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Arnd Bergmann <arnd@arndb.de>,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Christopher Snowhill <chris@kode54.net>,
 Jonathan Marek <jonathan@marek.ca>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Eugene Lepshy <fekz115@gmail.com>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 07/34] drm/msm: Rename msm_gem_address_space ->
 msm_gem_vm
Message-ID: <4kpzu2pjg4wahdv74kf6bpwmrgzsikkwlzwzqyko6ylt5m5fob@bhvg5s5ky6tj>
References: <20250319145425.51935-1-robdclark@gmail.com>
 <20250319145425.51935-8-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319145425.51935-8-robdclark@gmail.com>
X-Authority-Analysis: v=2.4 cv=TYaWtQQh c=1 sm=1 tr=0 ts=68069a49 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=bbRKhBg7HBMvg3avrSYA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: uBoZdSjp-beg8E3YmzZGJ_YERVGBZVOr
X-Proofpoint-GUID: uBoZdSjp-beg8E3YmzZGJ_YERVGBZVOr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_09,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210150
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

On Wed, Mar 19, 2025 at 07:52:19AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Re-aligning naming to better match drm_gpuvm terminology will make
> things less confusing at the end of the drm_gpuvm conversion.
> 
> This is just rename churn, no functional change.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c         | 18 ++--
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |  4 +-
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |  4 +-
>  drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     |  4 +-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         | 22 ++---
>  drivers/gpu/drm/msm/adreno/a5xx_power.c       |  2 +-
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c     | 10 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c         | 26 +++---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h         |  2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 45 +++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   |  6 +-
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c     | 10 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c       | 47 +++++-----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h       | 18 ++--
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 14 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   | 18 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 18 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 14 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  4 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |  6 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      | 24 ++---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    | 12 +--
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  4 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      | 18 ++--
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    | 12 +--
>  drivers/gpu/drm/msm/dsi/dsi_host.c            | 14 +--
>  drivers/gpu/drm/msm/msm_drv.c                 |  8 +-
>  drivers/gpu/drm/msm/msm_drv.h                 | 10 +-
>  drivers/gpu/drm/msm/msm_fb.c                  | 10 +-
>  drivers/gpu/drm/msm/msm_fbdev.c               |  2 +-
>  drivers/gpu/drm/msm/msm_gem.c                 | 74 +++++++--------
>  drivers/gpu/drm/msm/msm_gem.h                 | 34 +++----
>  drivers/gpu/drm/msm/msm_gem_submit.c          |  6 +-
>  drivers/gpu/drm/msm/msm_gem_vma.c             | 93 +++++++++----------
>  drivers/gpu/drm/msm/msm_gpu.c                 | 48 +++++-----
>  drivers/gpu/drm/msm/msm_gpu.h                 | 16 ++--
>  drivers/gpu/drm/msm/msm_kms.c                 | 16 ++--
>  drivers/gpu/drm/msm/msm_kms.h                 |  2 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c          |  4 +-
>  drivers/gpu/drm/msm/msm_submitqueue.c         |  2 +-
>  41 files changed, 349 insertions(+), 354 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
