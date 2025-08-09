Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824B9B1F1C5
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 02:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F37410E99B;
	Sat,  9 Aug 2025 00:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLXlz1SE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9493310E99B
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 00:53:48 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578EjP2e007642
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 00:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WJPnKcSRwQJ8Ja2LLFPMkF9M1PcIo3OLlDB6PIjUtdc=; b=HLXlz1SEAR4T5o9c
 Ili+g7sGiDniKXSyg/oaYrmFhcSPXFQqQGxqHTKJN6IVXAv7PndcOuZVdl/r3k8J
 M3LH88+1PoUQbDulBWiVRDJdRbQ0gtEhKvNViEQ+FChBiIS3fCQ6MpdhYbW7MIvI
 1wxnR164tQ5GRjFYzK1XbiU98MRMo+St8/GYU89q2PdKpBCDz23T94P055R8ee82
 E7jfOKKCfVQXSGnRf8MqRVm6Drcn9P3kY9mJn7mixYyHx+UCfK6O+3r5YFiepTiC
 XXaJjHmfZaP3qQD0ze0j12LINEF11qCgYgS5doLFpVkotUHHa+A42uxAyEsF04gg
 UUixvg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c8u28m17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 00:53:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-31ea10f801aso5143616a91.3
 for <freedreno@lists.freedesktop.org>; Fri, 08 Aug 2025 17:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754700827; x=1755305627;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WJPnKcSRwQJ8Ja2LLFPMkF9M1PcIo3OLlDB6PIjUtdc=;
 b=g7Qkt2p4jn3v7WRBpUuBMb8+nQZUsXIQG0UP1Xq2u795nKV55KFwFIhLwAwfrR3t9y
 cKvytJOnPJdBEYdPuym3dHIduebRxS0Dud4oH7iaJbTqpuu1GVudRDMewOGYOzigJYsm
 B+QPbJJ0EXR0q6gyq2eZ8Rbx2LU3Yyt3UPAgOoZBo9kVVWjFN3vBcAUgzHzDwTZjIfFf
 +eyyDvKqTG5+m+tpp4ubVRtp9/zHrZElu3CIZq57gIGVDRXHFwT7lF04gdgf28KRBgVF
 txidhclDCQRZfiFI6VM7pQTIMWc6rTOoX7tvSFODZJoqu8K0pn/KlbC423bwmJL2747P
 ONUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnxoDEvJBeJ5V87X/vU89rOxjbBD7pFA82PSjN09foiV/+6pjkz6IVudl40WK+i6lNL8XUBOC0qX4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZqc5LZAKWdcb8u2e8r73I6OnsMeVqwj0JuEhfp9+cirXB3URa
 vRpZziI9vjOPLe23Kjn1/DZllE8q1nkD0PnjndXfczH7uyfUNB3dwWiphXAc8pANjhxxpk/GRcH
 TiiEe8wG0GgfYKU5NwE35IG64iqZZzVlx8REYdyoynVFpiYkkKB5pnSB3+0cev/AcmyGzIOQ=
X-Gm-Gg: ASbGnctO2aygIHAYDVsE8i/iv6wW14kYMWpHNvpCNIcQsirn7OFJgTnjakmXfnxO0v0
 GCJURV5JFo2+0xIT2000xfbrQAjHmAzLAgoR6OKbPimH8v0PHY/+KJQwxDZpdvKeO5cmnPugk3T
 Nt+yAxFBMVz6Z00jeUxKOe2seJBcmCiwZqAUdpgjwPR1M1rhuney3ilphKmsl3dGKP2He24NsDc
 JkBlhr1TzC6e71jSUwW1F1QG6y7wuTPulOkf+kf6KwxCUKE6YOk7rMrDv+NKB9urp1McBmwb4L4
 8yTWgPHGaH73v4/6/4lsBaiRLyrJunGwRoImWOqeK+ebTl2sJA2rqH/BK6QU1U3amafPs4dlrVN
 KpPRpo8Oh/kVOYbNexmQdqg==
X-Received: by 2002:a17:90b:1fcc:b0:31f:762c:bc40 with SMTP id
 98e67ed59e1d1-32183e33936mr8167787a91.16.1754700827110; 
 Fri, 08 Aug 2025 17:53:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXRItAF80pITRrQiGf1tG4sDOi7TzqLz8/4xo7Al3rN4HvKGf5QUP1Fab2OCCqbCNxWsx8ag==
X-Received: by 2002:a17:90b:1fcc:b0:31f:762c:bc40 with SMTP id
 98e67ed59e1d1-32183e33936mr8167763a91.16.1754700826572; 
 Fri, 08 Aug 2025 17:53:46 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32102a77576sm13938214a91.2.2025.08.08.17.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 17:53:46 -0700 (PDT)
Message-ID: <4941c486-ccff-40bd-9b4b-9b84a0c028e4@oss.qualcomm.com>
Date: Fri, 8 Aug 2025 17:53:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] drm/msm/dp: Move link training to atomic_enable()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
 <e217fb72-36e4-4222-b5da-9608af57c665@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <e217fb72-36e4-4222-b5da-9608af57c665@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ACDOtzOR-PuTwyllg5-0Fion3tIsWv6k
X-Authority-Analysis: v=2.4 cv=Q/TS452a c=1 sm=1 tr=0 ts=68969c1c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=YAZOsL1__VChtR82wIAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: ACDOtzOR-PuTwyllg5-0Fion3tIsWv6k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA5MCBTYWx0ZWRfX/kxpMJrng/5M
 hPbo3cB2qPvyB3NB3dAUtbIMtDr+rt/Tx42I3VprKzJYCfQxurvMVXRI/YmgrgMP3KyKuOzn7Qt
 frZZlNpUVjOjuhJayUnqcHy9oggDgY9ePBN7umj1GKOyIzBd0HvBEJAf2eoz28IqWf1/sWAZCxF
 690fUDYCGedehD8ILFgCEVrNZSNNe6YL2yker5eY31OrvVX4aiU/2Wui30zV7750UXt+aXTlRNS
 f+iPfRPMRVj5aO01hhZgauxj8BtilcH249SiYB7rcwmppVWfBxxxBAmF0jQlWMTaRtYTUTtWPhN
 Lr4i9SAbprvHBx89Msp+rqfchZ2o0rTWJyJvjbujuieR0k4vefy2SRKTkUz8fB435RGH7R91vNG
 fswEp1a/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060090
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



On 8/8/2025 5:45 PM, Dmitry Baryshkov wrote:
> On 09/08/2025 03:35, Jessica Zhang wrote:
>> Currently, the DP link training is being done during HPD. Move
>> link training to atomic_enable() in accordance with the atomic_enable()
>> documentation.
>>
>> Link disabling is already done in atomic_post_disable() (as part of the
>> dp_ctrl_off_link_stream() helper).
>>
>> Finally, call the plug/unplug handlers directly in hpd_notify() instead
>> of queueing them in the event thread so that they aren't preempted by
>> other events.
> 
> This feels like two unrelated changes.

Hi Dmitry,

Ack. Would it make more sense to squash the hpd_notify part with the IRQ 
thread change?

Thanks,

Jessica Zhang

> 
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
>>   1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/ 
>> msm/dp/dp_display.c
>> index e2556de99894..c849befe58f0 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -427,11 +427,6 @@ static int msm_dp_display_process_hpd_high(struct 
>> msm_dp_display_private *dp)
>>       msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>>       msm_dp_link_reset_phy_params_vx_px(dp->link);
>> -    rc = msm_dp_ctrl_on_link(dp->ctrl);
>> -    if (rc) {
>> -        DRM_ERROR("failed to complete DP link training\n");
>> -        goto end;
>> -    }
>>       msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>> @@ -1680,6 +1675,12 @@ void msm_dp_bridge_atomic_enable(struct 
>> drm_bridge *drm_bridge,
>>           force_link_train = true;
>>       }
>> +    rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
>> +    if (rc) {
>> +        DRM_ERROR("Failed link training (rc=%d)\n", rc);
>> +        dp->connector->state->link_status = DRM_LINK_STATUS_BAD;
>> +    }
>> +
>>       msm_dp_display_enable(msm_dp_display, force_link_train);
>>       rc = msm_dp_display_post_enable(dp);
>> @@ -1839,7 +1840,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge 
>> *bridge,
>>           return;
>>       if (!msm_dp_display->link_ready && status == 
>> connector_status_connected)
>> -        msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
>> +        msm_dp_hpd_plug_handle(dp, 0);
>>       else if (msm_dp_display->link_ready && status == 
>> connector_status_disconnected)
>> -        msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
>> +        msm_dp_hpd_unplug_handle(dp, 0);
>>   }
>>
> 
> 

