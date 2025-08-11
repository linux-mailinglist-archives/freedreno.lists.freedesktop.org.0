Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45154B20543
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 12:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026F110E423;
	Mon, 11 Aug 2025 10:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pWvBRDlF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED7910E422
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:26:35 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9d8J1000579
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/4tDhgxFTFm32rKj8OsdQCqN
 y65/pv1+di1cZhSEdpw=; b=pWvBRDlFziWWj5HuLW6H45HJTcZttvz9ESkLk0uM
 NtbaIchPIMRUyLPnyIR695bRbOQWNCjwWRwgAk98kCYBnBk2qh5jQ9es6go3Dgpg
 SX0ssCGAI/alg9bRIIxq88G2InB6hzr1moD5U2QhV8hcyL7P2ZOnVtuws4dAJudD
 P4Vl5Qf8a60HnW3Xrnv7Nj+bn70KreoYJvyxCBy2nKp1EHBjp1VEjRzZoYaV7NRR
 wr8dg/RegWDNJIexQISYO07Ju5oRebJOEov79b/yNy4tD2rXH16OGqiewyhKLbnP
 XhaGft8cga81AclHPne3cWxWUUNOydlCvoPt9MBVsTVZ1A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxq6uy1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:26:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b0a3557d05so87815821cf.2
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 03:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754907994; x=1755512794;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/4tDhgxFTFm32rKj8OsdQCqNy65/pv1+di1cZhSEdpw=;
 b=CyoNVAWb7ysIl1jkGqis3+glU6oXAh1xD7wzmrgScklNHvJD8WVm6dk4BUnDz2jFjM
 XX6h0N+6YdJt89S5SJQg1bMYzVbKE1ZgF9P8Are0wdNpWdYFgBj2Z7qgiHIjWh4Pws70
 Ohkh5eLyIEUJHegDAgBaSXju4xH7iMwNyMluSS42/syrwz2CRHM2hs1nHutCtwvNCETX
 STT1o1jirL76dbSHfjvVsksl0/+ggwDmdlSBtnHHY4mpCbIGRua+syxJOuyfYHH3GUJa
 /lny91ZmuqONXCUN9z1PyLq9RDnRZrVtRIbWYIUxZS7KqFnnQnw4FQRdXLFSWT+qPFhW
 0hsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8dqFWeeEi7TZ2IHqsyrWUwV2a7KT4IKmAvXGWEeC2c+je6S0OZmjTNxFYl5D7KdFBInzuRR4h9Tw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4J3Gb/CTb0GhXlVI4/KMfXh2F00gdFxXrvdUEJEGjX1greZLs
 1XFhGI/wdd6NI99HdRkF/QQkQ7bsPkX/rNC+75yRhppVnbpOjFX9nQzqLcrmZ7iamIl8AOOXLDu
 6OPy2AVFLUtIKlOYtc56gXEsm8GESG4xv2r+OqL1i2IswLQuQYmzj/0mQoFtto8WmwDNCni8=
X-Gm-Gg: ASbGncsbcQjYGduEQTWT6j1SmbW0BK9GzTTJ3gRwtA1EAP+sZ29Ww41VboLZ2mjDFg/
 dHtCZi19pWeVin0HNzQPKaVBbZrYo5VyHR0I/8+HdHZPtQJhRJB4S9Z0I0yfGTku9rq+MCBSLM1
 1jDN2a2hqT0bZpJ4dtLx+mQclutZLx/o7iV3r0WJ7dDNuFyEBU98aJePUNZe9Aa9hmr2Dv6hgNk
 vLisGW/vOwedvjCQkmCqSkekKZSnjeMIdxoWGw9IG3Si0l+biqChH0M18OJicqTVStJ4Hf/NiaD
 EGg9JzPez8lA7/mWU3kpws8k0U2kJDSnDw06JcfjqEtAh3R1T/CoRwxGiaL5v6CNPjyx2tTHujJ
 EGGSFLCm3oVHBpjoh6y5ZlcT3UdRWA7i74G9RM80YHIi/hqo7NUwZ
X-Received: by 2002:a05:622a:ca:b0:4b0:80c2:6674 with SMTP id
 d75a77b69052e-4b0aec9df57mr160251281cf.26.1754907993655; 
 Mon, 11 Aug 2025 03:26:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBtZfXQ4QunBGnECg8IgNPTThfg2oORkBUD9GYQsf+7kkjIYq2XXmXZ3mbOFg4UkIpF+IRdA==
X-Received: by 2002:a05:622a:ca:b0:4b0:80c2:6674 with SMTP id
 d75a77b69052e-4b0aec9df57mr160250851cf.26.1754907993170; 
 Mon, 11 Aug 2025 03:26:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332388fef31sm41894971fa.70.2025.08.11.03.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:26:32 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:26:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: kernel-list@raspberrypi.com, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 arun.r.murthy@intel.com, uma.shankar@intel.com, jani.nikula@intel.com,
 harry.wentland@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robin.clark@oss.qualcomm.com,
 abhinav.kumar@linux.dev, tzimmermann@suse.de,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org,
 laurent.pinchart+renesas@ideasonboard.com, mcanal@igalia.com,
 dave.stevenson@raspberrypi.com, tomi.valkeinen+renesas@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, louis.chauvet@bootlin.com
Subject: Re: [RFC PATCH 8/8] drm/msm/dpu: Adapt dpu writeback to new
 drm_writeback_connector
Message-ID: <ag34es6qm4b22qti4hbsju6sk5ny7ixq5fiwtni22vf7tvx5ba@ficntlx6i2hs>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-9-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811092707.3986802-9-suraj.kandpal@intel.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyOCBTYWx0ZWRfXxZgO9W2lTX3l
 QtGHTgN+TMXUaTPFDO6Q2IToTSsyqx1uTRKRf+2C/d6zw6ZzJvsX/nhbEJsL1FfBB4pkgKDJphw
 XpZThEuoNDTKkQRjxcemQnW8d+FGs0eiWeEAwfvO/US0vrEFS+c9H7KyB0pMsTlMAKIBk/zshiJ
 hYnnu7mHK7DlutfljT52QegcTP77Y5nzUKSyTN/mnpoDXEM07XbKebJMjE4pbbeAXp/XNAXx+v6
 g9FHaQMSqtPzefqAEZhF3JP8rUTTWHXN4ZwgKBSJpziJnFpOMptccGsds7uYgMn2IwTns/Mc7sy
 6jrYl7hKKk435G9bHDfYea5XTg7RnonxDEZChdb7KdRAQA2Xlwr2/gnGBBA8BtlGKTij0icIHkL
 q2CTR4SU
X-Authority-Analysis: v=2.4 cv=QYhmvtbv c=1 sm=1 tr=0 ts=6899c55a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=Fxrl8DOH8qgm06HfJ5gA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: FAFVpRTMECt4IasrqIqFCcroF16CZDM7
X-Proofpoint-ORIG-GUID: FAFVpRTMECt4IasrqIqFCcroF16CZDM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090028
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

On Mon, Aug 11, 2025 at 02:57:07PM +0530, Suraj Kandpal wrote:
> Now that drm_writeback_connector is embedded with the drm_connector
> adapt the dpu writeback functionality to this changes. This
> includes changing the drm_writeback_connector to be changed to
> drm_connector within the dpu_wb_connector.
> Some other changes are done which are a result of the all the above
> changes mentioned.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c  |  3 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c    | 16 +++++++++-------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h    |  4 ++--
>  3 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 56a5b596554d..0e60c1ac07c5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -484,7 +484,8 @@ static void dpu_encoder_phys_wb_prepare_for_kickoff(
>  		return;
>  	}
>  
> -	drm_conn = &wb_enc->wb_conn->base;
> +	drm_conn =
> +		container_of(wb_enc->wb_conn, struct drm_connector, writeback);

Just store drm_connector in dpu_encoder_phys_wb instead of
drm_writeback_connector.

>  	state = drm_conn->state;
>  
>  	if (wb_enc->wb_conn && wb_enc->wb_job)

-- 
With best wishes
Dmitry
