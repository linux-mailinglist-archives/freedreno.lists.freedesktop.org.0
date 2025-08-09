Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9849B1F1B8
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 02:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C175510E07C;
	Sat,  9 Aug 2025 00:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBvuEjws";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAA810E0D2
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 00:45:29 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578NvITV013733
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 00:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +SdmD8y1mIxLj5DFoiniCJvWmuKL4tKZkoBsj7bVLx4=; b=bBvuEjwsd1/kxE2D
 ZDXgvJfxNQCPttMaRWVcjiODIqCxZdVCSSpeaPAL5y3oE/RF5yYvvLIBa4nE7ZDO
 o6s8aRij5d3v9ZeXxITxp2fjw62faOGIiDjghxKg6GRUQcNKT8qf/ZGzKf0iC9zX
 mAw/g+nQX6nCJcHmJYEQYiq8sem9vb1zoPkFtzH9RFYgUxqPgTR9BeqR8CpgVQc9
 pjU2ZXAHpJVB2tDAcp2K5aO+bBA3EpMb9O+nbANZHwtetKBcc3GznisbOvqGHPcC
 6JsWYTFOMjSS7HnlltjidLxb4dTuTLxVsGBOcIG/3ktdGD9fW8+KAO6fFHPlMoNI
 50leHQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48cpvy69xn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 00:45:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4af199d0facso76718641cf.0
 for <freedreno@lists.freedesktop.org>; Fri, 08 Aug 2025 17:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754700328; x=1755305128;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+SdmD8y1mIxLj5DFoiniCJvWmuKL4tKZkoBsj7bVLx4=;
 b=XRQlgSeqDlpE4MiAgxRH+s5SEG9OB3YzqnYUbNiYrIw/cPYTbUf5BIHL3LtAkAgiBW
 2H5S+33dUu1kDZs92c+ry0Jq9h3HO6nUlZcVHMWacaGZgsBJfj/4V2zTSPpPLzcCMkn3
 zou35fY2ZT5qkLDgEd4HcGqFiONeREc9iTxVpp1KdQis69V0kyP//Ax1l/239EPZkqg7
 pNEjDTg8H8dGAICD4o5v3mICCth3xOFGINTyifUBCiioNedkY+qAuflVPJgQutV6h2Iu
 bWNHdx1H9igorEbViuKBaIUWdqqWitT90CZ1NsaMUiJqz9XPd92o9890VIZ4a2NQTgPi
 dYqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnefxgDVTatptKXEuyBD/bv/F4UD4VHuQzmJv2V892SbKundEW8GNZApBg5k7DrKmeavUNXkSA0KU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhqGyWJPvc5PswPHqikokHV84LIR19EKfXgmmKj4duq5VHbBUG
 j3JTVjzZiCY22+17GXqYt5TMYppHo6/NTjQU2aYoij6E5HOk1nho4PAfD0lcurfK0CDyjdrAK/h
 M2yUxzDx0rXXz4v2tJYGZrJGLMC3K/U7wOWwRgo9UxjpMaRUrYai58eZrg406wPawq5gIxhc=
X-Gm-Gg: ASbGncvcVBBYKv6aKOb1aNLMwuBO28uJCJCLiZiskDTH5ylEQpeMuWcCTwqfFcM9E9x
 CoX4jAlmp+yB0ithBniDrMBiBVVMANLrN0qDn9vivTL6FWF6oflTiwBGhm966m9b9/EWYVeURfD
 lycXkpNJoGcGt1252xFFskGALN5/tiViovoifYdrzJ7AyDJW2s3NujMuYZxCTBLHQq0yWTbgJI6
 Q9k4pE9np6JtwGjN63+gNnWiKRsZVc5kHq1taQjlHht0y8mQYYPK4Wja8iLKLGOiSjeSgeoTTNi
 n09/wQqoU1C2YAUro6ArXft7kvpQgDtqUReuU2fUdtg0/XJGL8ClCCBcoDANDfCY6yY1V/GGCUz
 cMc5h+3ENnjFCV5MehPX3RLUNJcXAKLOOaDH4rYLISrA=
X-Received: by 2002:a05:622a:115:b0:4af:21a0:c65b with SMTP id
 d75a77b69052e-4b0a074ef32mr134768311cf.13.1754700327997; 
 Fri, 08 Aug 2025 17:45:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfQjmXMV853672JK0fEpKkYRjhS8uwOvkShC3Xw9ZNKFNAKoVWBbGdYfzTQ4X2DquHWVzT1A==
X-Received: by 2002:a05:622a:115:b0:4af:21a0:c65b with SMTP id
 d75a77b69052e-4b0a074ef32mr134767951cf.13.1754700327474; 
 Fri, 08 Aug 2025 17:45:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9?
 (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-33238271bdfsm31713131fa.6.2025.08.08.17.45.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 17:45:25 -0700 (PDT)
Message-ID: <e217fb72-36e4-4222-b5da-9608af57c665@oss.qualcomm.com>
Date: Sat, 9 Aug 2025 03:45:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] drm/msm/dp: Move link training to atomic_enable()
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov
 <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
 <20250808-hpd-refactor-v2-4-7f4e1e741aa3@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-4-7f4e1e741aa3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TJpFS0la c=1 sm=1 tr=0 ts=68969a29 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=tir8h9pnGiVj9xZly-MA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 2ByT7diQl56ma9JEMXz-_CWBC1L9WmyP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA0NiBTYWx0ZWRfX8rBPlx0MbE4i
 V4HtXcelhGIVHzZC1ypCvQecFQwYRmT99e6IPBxEeuomn0b4vyB8mm2cs1Uzc5Y0Wyw6gMg4V0F
 Ku9igwLFgdFhQwaRrqlgqRDvkZS15qBZLwTGgFU3rKg1W9py7lq8s881xTBesYcHORXx/owjMzJ
 2uhWV/MrwM0iEKoF3NvowiXgHQ35ykqJgXvaJgXXmMcwjAPEn1cuT4PCISo5dn4tzN3BDckIOco
 HCSRQ0YUKwuTXQJX3HGxgh2qosDz0kSL09urWFF+siY3BKeUdN2BuCTHG8u7208bk947LrFGAuG
 6/vQy5l7OAP7JRsau0wjofHGDh48NLsZrRchQeVorC1MDctQbkPMKjT4JCkvBxGpuBrd0Y16nxZ
 Up4h+an0
X-Proofpoint-ORIG-GUID: 2ByT7diQl56ma9JEMXz-_CWBC1L9WmyP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508070046
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

On 09/08/2025 03:35, Jessica Zhang wrote:
> Currently, the DP link training is being done during HPD. Move
> link training to atomic_enable() in accordance with the atomic_enable()
> documentation.
> 
> Link disabling is already done in atomic_post_disable() (as part of the
> dp_ctrl_off_link_stream() helper).
> 
> Finally, call the plug/unplug handlers directly in hpd_notify() instead
> of queueing them in the event thread so that they aren't preempted by
> other events.

This feels like two unrelated changes.

> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e2556de99894..c849befe58f0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -427,11 +427,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>   	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>   
>   	msm_dp_link_reset_phy_params_vx_px(dp->link);
> -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> -	if (rc) {
> -		DRM_ERROR("failed to complete DP link training\n");
> -		goto end;
> -	}
>   
>   	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>   
> @@ -1680,6 +1675,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>   		force_link_train = true;
>   	}
>   
> +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> +	if (rc) {
> +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> +		dp->connector->state->link_status = DRM_LINK_STATUS_BAD;
> +	}
> +
>   	msm_dp_display_enable(msm_dp_display, force_link_train);
>   
>   	rc = msm_dp_display_post_enable(dp);
> @@ -1839,7 +1840,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>   		return;
>   
>   	if (!msm_dp_display->link_ready && status == connector_status_connected)
> -		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> +		msm_dp_hpd_plug_handle(dp, 0);
>   	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
> -		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> +		msm_dp_hpd_unplug_handle(dp, 0);
>   }
> 


-- 
With best wishes
Dmitry
