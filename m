Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E96BB1F1C1
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 02:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259C510E99B;
	Sat,  9 Aug 2025 00:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjDZdxC1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9E010E99B
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 00:51:22 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5790K2uq030370
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 00:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hoY+FkRGPvkEWeTlAjY+LGALIacEK+UKYHyKEaey/U0=; b=SjDZdxC1B2ihfoPV
 zJAtoPipUXkKb9YvMUdmfZBd2sq8xucQF1NTwsjKMkMVf0fV5kwBpGW0A/CQ3176
 kQ7cKSeB10YCLn0QYM9H2lhzJhinXEOq+PIocIugDPcCO6qS3TSccJqkGDqtrQTP
 fqeDz4OR+5Ih7n6reDWAK4e+ts4LdA+mkqL6xeZ3YqgeekY9rjretjbHRREnbZgb
 rTTGDjAcJ1l0DaRxBwMRcy8qlXRa6WJihdvoaMXV7lSYjYWPCE4NbnIph4DzmnS8
 Z69XxojM+rCFAhHfWXrMXhrKP70vNfBHnwAVGOZ6P5reSlqPozzsisDW/9V6s2pG
 2lU+Aw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmg1dp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 00:51:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e686308729so656291385a.3
 for <freedreno@lists.freedesktop.org>; Fri, 08 Aug 2025 17:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754700680; x=1755305480;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hoY+FkRGPvkEWeTlAjY+LGALIacEK+UKYHyKEaey/U0=;
 b=RrWN6qTpvJvf0sMhzjJb0Wr7fzwLWqqoDcYoiO2bS4YU5U/pz46fikKqjn17NB0b6X
 5XwfpFReY0Pk8dU6Edk/lZGXmD20eJRWWk+NqwhHt46xNtuGy6W2TdhJ9f1nIyud8HCk
 JpbfGOIvArVevMfZTxcyaD/NTGHSGf+qC2OOkkj2qNNLEVJ024BEYKlh98fhXu53YEK8
 ZUilLWIhaL5TznGMPqYktJf3RNF/vYST/Nvt4md8wtSQl4tFEMvc+qrpJqQwmyymAFWh
 KjdHgfXxeETx4/sKxHJBTa6rupzl26r3XOihTTOQLE/Xhn8D7k6ZTpDfnY59ksm70rnz
 Luog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV+BiPWTk19b+GTAHrR6cezXtC+uPqqb5v9OCt4ADakTOV45UiYyX0lf3tVD1z+iLqco32RA/5oSk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBg4ZFd+W2glAvHRd/OPiPhp5+Kptc1zIIEAgcYFnho+KZOzcn
 pm4Z2l58jZXHe41Od01d+XcyX9VcXpLzlppeiWdoPQDHpaq5jyfCPBzhk1zJqJpIG4jQ24qUrFn
 hHJU49yVu7MCr40mAPRfK1k3DVGT1E+tcdFGbyqLbFFKAqZa+rF7nSDFWgpRyK7udYd1FrnI=
X-Gm-Gg: ASbGncs63jH4vLjo2/fDfJdVKr1muDG1O0DCefkSGYC0N1GhY4Itd0Jyy0h9XKqSuk6
 YgUFxc3tP/cbNN8mK7tCO7eoW0ITOv8pS2bKVwPrJeaaH34IG1iJ/IUy6g/EZcu8yNTODEnxBJc
 B0KLNT+3gP4duEVD18/uadBtKa6p62UFH4QyVCwBkKjEtClz7zYCfk2diyxXrWp8OqVCcsS4M9k
 kNgDeS2m2pLuaqh5DKdbG5yxYlahsBi+XwMqGeJsA5fWX8cYoQcZYCiQjIaOm5QhiBtcqqGpVf5
 vvzoWT9FOJ7bskP1VSdk6SgkH+4R4nZxPnt5dKQ2qnFID49dj0OZCIAc14b1Aujk+4euzAYPfcM
 ZA0ON/crjQ6GGjCw0gqbrZ0dYbPd6IcuKmtwcoBuns/0=
X-Received: by 2002:a05:620a:25ce:b0:7e6:2f6a:5bae with SMTP id
 af79cd13be357-7e82c7e299fmr653881685a.62.1754700680407; 
 Fri, 08 Aug 2025 17:51:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPoGDX+jX9Hh/iCn+TDzNM/k/SOiIlgU5Ry8cmMIkFdfpBCLAzWw1Nb92a+F2Yl2/QRzGpgg==
X-Received: by 2002:a05:620a:25ce:b0:7e6:2f6a:5bae with SMTP id
 af79cd13be357-7e82c7e299fmr653879285a.62.1754700679888; 
 Fri, 08 Aug 2025 17:51:19 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9?
 (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-33238272dd4sm31445181fa.17.2025.08.08.17.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 17:51:17 -0700 (PDT)
Message-ID: <8f59ad23-4f86-4006-8163-a1feca3ae346@oss.qualcomm.com>
Date: Sat, 9 Aug 2025 03:51:14 +0300
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
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=68969b89 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=tir8h9pnGiVj9xZly-MA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: NrhM4XpUTaBNLWA5o0HPNHzvr6MJxhNh
X-Proofpoint-ORIG-GUID: NrhM4XpUTaBNLWA5o0HPNHzvr6MJxhNh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfXyuUQgMq8AwH7
 J6MNV8TsBNHgbblefcJlOg2paJKVdGQ8fZuYdJ3qOdrJnhin+chikzcRDGxfYxcwjdR3cAToE+b
 et7s7Zq+b/8SJvkVzl/hwJhkn3N6kmmNyuRzkNezMSTteSXTEQSKE5K7G56pHtaNZsPoSjCEQNt
 WuDSfN1jElb+KlP+FcphjC17n5yA7bs683V6r0g4fgJkTxHxftnq0rR+uJj0TJx0XmZ0o8OWgfP
 gah1kWHmDfby1ij6bWvrJzeyEUiSf7GG//OJnquG5MuEz3t51fi5P9skm00oK2zRyfBngd2T4xq
 9CaEvicH90m1MzU0/tDn8Wlit0Uux2oXi2szchRfRMfo98UtkmaLQ98Q0yI4eX8IXLD/KIJm07Y
 FeVh6v1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000
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

Also at this point we enqueue event, which will set link_ready to true 
(which is obviously incorrect).

>   
> @@ -1680,6 +1675,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>   		force_link_train = true;
>   	}
>   
> +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> +	if (rc) {
> +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> +		dp->connector->state->link_status = DRM_LINK_STATUS_BAD;

Add a comment why it's set directly rather than through 
drm_connector_set_link_status_property().


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
