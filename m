Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A71B189AC
	for <lists+freedreno@lfdr.de>; Sat,  2 Aug 2025 01:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEE110E06F;
	Fri,  1 Aug 2025 23:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o07yc4Li";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FE310E06F
 for <freedreno@lists.freedesktop.org>; Fri,  1 Aug 2025 23:58:59 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571LfH1t022988
 for <freedreno@lists.freedesktop.org>; Fri, 1 Aug 2025 23:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sJil9fuANTIpmKQE7cP4cPGJ+csBLlaXLdFVNl5IgEY=; b=o07yc4LiXSNMEQ0m
 tPDQtTL9RKOocu7P/FqueYPSICyprAmwRxEO1PpDp3wZBie5R28tFQA/JcOhmbDi
 Fl1a5SRYUKy8/7LKsBp35BZISo7WN7qQHh68eCQmOx/v9FDCf3uo8lhxObDy9spF
 hMBTocTUEY4TIfIhvBayY9jAa/oHlow2IGFHABxhTWIl2/EfDVrOOXR9dzu2VUVf
 /a+JfVVphcxWsIwUuSr577sD+CQthPSeXG1UdkYl/SrwMLzTEW79t7gHcnaK7hee
 yPvuiWwmhH+qxzdU8kfDV4AVa2B2NFqZDB8f2cXIhAnRMpyrCU4/NdOvFUT8+Nmy
 DAp7Pg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qdad99e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 23:58:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-75ab147e0a3so3512495b3a.3
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 16:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754092737; x=1754697537;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sJil9fuANTIpmKQE7cP4cPGJ+csBLlaXLdFVNl5IgEY=;
 b=MXrFdaX5+Q4P2ldSwnQcWvmIDy8zu8eCMwPIJ5lAKO+zxD1Vh8DVqvY41rT8Q88bfZ
 EkZaGq/4iO3UTb5ZWAEJSw8PAqeN035mVtSJmpVQv04vA9c4lhcnH2Y2T18CmkDCMAEK
 zfolTjg+8mxa8skA9sJQHDoGRBKNAGYgRs1JkO6QUa105Ri3nzOtfSaG7k2PutU6DY0B
 YIjxs3r/4YIYgMLOGzkZDE6U6VPHiW2b2z+2KoCu9GcUYqdH680k7rfkJUB2VLImc4I+
 h+uLo0xOHPuTogqOtl0vccLEC7VhvSgUU3C+/YJsK4IOZmhYXeiEkhubZnonpeJ0eYWm
 m7HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDxZjyD8/YbtRjsI6p35ZvAt2CTSJbuQuNGwkzTY+KPOCvnV81a58qf7FVDxvkRsgHAxK0/mlHYzw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5ZQxWw9dLMR0MuyQQl0AXygI2PkddmRm31Z4Al5RA5GARhhtK
 k34Ks50FkKCaG5wZY0kSsh3xrdSeU6XAqh4qS6Diw9NKzZU/CH/FhFERDQGTSHhblD5l4MxKiGH
 Hw9bXyIJY0y6srsLkKCXYap1IRI8BChjeScfaNu6jjlSmsZ+HQYorpkkWbHBnVQ5IJftL5sc=
X-Gm-Gg: ASbGncu+qcz63zMoBbDb68nyEyQKi84hgHHcBB6aoj9wRjpZzS8bfcaAaHOmtSkOXnH
 8gsMzdjtAn/BQrSMKvWmPptQHYiKii1/0UPo+jmynx113Wt/w1Xb7cV0S5ma6ExSJEWI5Y3MXqC
 H24iZ1BhDosm8jmLVU/9HUOdyWyO+WUdylWxpIS9nhLzIQxT5+3rsq9lKWtd1t83qmnihu2XgUW
 LQCoRI/zUg+vKB3XTYA92IRf99FE/ACy8t9+o8D7bHekPqoPanipMcLIa2/cKhyJhwOZX3TvaJC
 /iQHn3Bxl1kuDKliqVyrTHMXaY8so/+0oiFDUcEk1k7/C9xTvDGidlN2kGreKVoKPtogcE9fARJ
 fGADWujIDDzoofl6ZG49Dgg==
X-Received: by 2002:a05:6a00:2ea4:b0:76a:d724:d712 with SMTP id
 d2e1a72fcca58-76bec302327mr1651999b3a.3.1754092737422; 
 Fri, 01 Aug 2025 16:58:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTfKbPm8IV20xoihIcyGu1iRejGkZ8MwdHaIanUdy4YR9la0eA1aJYMT5RSic/HhKvru8Tzg==
X-Received: by 2002:a05:6a00:2ea4:b0:76a:d724:d712 with SMTP id
 d2e1a72fcca58-76bec302327mr1651981b3a.3.1754092736990; 
 Fri, 01 Aug 2025 16:58:56 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfbd02csm4934867b3a.62.2025.08.01.16.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 16:58:56 -0700 (PDT)
Message-ID: <a085fb45-91e2-4827-b8e9-8af90796cc49@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 16:58:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/19] drm/msm/dp: Move link training to atomic_enable()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov
 <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-18-33cbac823f34@oss.qualcomm.com>
 <cofa377vptj7on637u3c3mnxndplcmaegsb5h6idinz5wrvm6s@toylno4uapq4>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <cofa377vptj7on637u3c3mnxndplcmaegsb5h6idinz5wrvm6s@toylno4uapq4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nTUvUvxX7jonBnPKuetDIA4LQA2YZIBd
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688d54c2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=yJ1ceeCYH-zBWwCu-X0A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: nTUvUvxX7jonBnPKuetDIA4LQA2YZIBd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDE5NCBTYWx0ZWRfX/lVSF/BJFGlM
 llj835Xroa5n3LrE4bhlm3orFNpshS2PC+9DXoAeWHW8dIyvDW8ZxQtdGkix+c/bkUmuaEWURGV
 G5IYmU7iPqUfavA5WS58WIa65j6TlnRSYpwdjBDIpc48WWlkv6qi8XMfiuD8AeHOTM6IcrpZAAh
 3Q04AhekyZUto5+TMWkJ7cUqtwjjtjdkcKG5yFB92sVGo61cQCdU4MFLWdH2tRkfoIOH9SuRdZH
 wPoBYNq2ILplFEf8TLOv26cyAI0gy4u/4azA1gmMWBn0sPbstH2dcMOH7ntGTQ4FjR02T9WPxvo
 jsHUaRtlgGCQF7DB3Q7oXDRXEPDqi0ek5bZDrFGSPWwLxslaY4FLeXCMbjmV+CJOjhdJCDEvd7L
 YFYkSKil0QAv3RjlPONRZckkE3iYhvXd3LNcs36oLPghXgOJjyICIzLOzfPjHNFOQlnTx4lt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010194
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



On 7/14/2025 4:54 AM, Dmitry Baryshkov wrote:
> On Fri, Jul 11, 2025 at 05:58:23PM -0700, Jessica Zhang wrote:
>> Currently, the DP link training is being done during HPD. Move
>> link training to atomic_enable() in accordance with the atomic_enable()
>> documentation.
>>
>> In addition, don't disable the link until atomic_post_disable() (as part
>> of the dp_ctrl_off[_link_stream]() helpers).
>>
>> Since the link training is moved to a later part of the enable sequence,
>> change the bridge detect() to return true when the display is physically
>> connected instead of when the link is ready.
> 
> These two parts should be patch #2 in the series.
> 
>>
>> Finally, call the plug/unplug handlers directly in hpd_notify() instead
>> of queueing them in the event thread so that they aren't preempted by
>> other events.
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
>>   drivers/gpu/drm/msm/dp/dp_drm.c     |  6 +++---
>>   2 files changed, 11 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 87f2750a99ca..32e1ee40c2c3 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -410,11 +410,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>   	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>>   
>>   	msm_dp_link_reset_phy_params_vx_px(dp->link);
>> -	rc = msm_dp_ctrl_on_link(dp->ctrl);
>> -	if (rc) {
>> -		DRM_ERROR("failed to complete DP link training\n");
>> -		goto end;
>> -	}
>>   
>>   	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>>   
>> @@ -1561,6 +1556,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>>   		force_link_train = true;
>>   	}
>>   
>> +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
>> +	if (rc) {
>> +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
>> +		dp->connector->state->link_status = DRM_LINK_STATUS_BAD;
>> +	}
>> +
>>   	msm_dp_display_enable(msm_dp_display, force_link_train);
>>   
>>   	rc = msm_dp_display_post_enable(dp);
>> @@ -1706,7 +1707,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>>   		return;
>>   
>>   	if (!msm_dp_display->link_ready && status == connector_status_connected)
>> -		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
>> +		msm_dp_hpd_plug_handle(dp, 0);
>>   	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
>> -		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
>> +		msm_dp_hpd_unplug_handle(dp, 0);
> 
> This chunk should be separated from this patch. I'd ask to drop
> EV_HPD_PLUG_INT / EV_HPD_UNPLUG_INT completely and call DRM functions
> all over the place instead. You can do it in a single patch, which comes
> after this one.

Hi Dmitry,

Sure I can split this into a separate patch.

Is the goal here to remove the event queue entirely?

I can drop EV_USER_NOTIFICATION, but I'm not sure if I can completely 
drop EV_HPD_[UN]PLUG_INT entirely without major refactor of the 
plug/unplug handlers since they are used for the HPD IRQ handling.

Thanks,

Jessica Zhang

> 
>>   }
> 

