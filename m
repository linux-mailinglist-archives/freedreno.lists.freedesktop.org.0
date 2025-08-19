Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CC6B2BF76
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 12:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C86410E32D;
	Tue, 19 Aug 2025 10:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKzL53i4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE9010E2AE
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 10:56:08 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90YU6001255
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 10:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7ghZKUm2aSWn//5Tci+9wfrDSWfLO9oHcOcQ8IQR6Q4=; b=lKzL53i4X+RI5ARV
 H6dGQrFJ5FDOsQfKbKoJAdcIu+/8dkobyoybJx1JjkFSzIC6f+Xwv8DMNGhEEJ0d
 fnYhCiEyndv/Ktj0OVZOFXa3J3Lh5njFVhfyuaqIQghosZIm/YW6pweyW7vnNQCl
 HO7hJ80aHk/ulVaRuPMikMrakI7cYzhPoLeG2pSbHEgVG6196wUZmYBYDZeW2mLR
 fq5WH/v4wsCNoFduSYa2Al6DbUv7xQCShvFy5qAVHdkX+0MUWlgHRvHF0znA/B0V
 T37O/Q1kBZh8Ueju6ywf7DrqxyEKcQgUl1FwmSgS4jNl7m9Fx3+aFC2Q42EjPuPB
 yUDEtg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh078800-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 10:56:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70a88de16c0so119070786d6.0
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 03:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755600966; x=1756205766;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7ghZKUm2aSWn//5Tci+9wfrDSWfLO9oHcOcQ8IQR6Q4=;
 b=ThDGXuvGqGVfntKO/GFQ5hZuMkXvhyPUQ8+q5Xqez2UZR6mxWkxn4DarW92nYmw3MY
 1Kb+gKfOcicIF6V+35sgWbayyEbx0hTp+kdSGBF2ZFLvNSJTMXpt3fJyGR/w5GKCg0KY
 SutvnRj6XMZWBj/XBZSdjWkZrW4+XMyU/avZrx9XGC2MYAPpZKfJSwk+5j2s6kU51Ww9
 NMNSZ03/DsiHSKm+sA33SfJZz8KpuX9NKngsIIn1dY+osclxJRwZnGzn6sfoTykR6RQi
 9Ujm+0/v3FP92NRvqSEwtegLQLVjzCSlJSr37clWIVlnSf6iDVqXTIOWsjpg0X+fFs3M
 DNow==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6RyJ52XAKpqZXjzTBS3YYXBiHEam9oZB+FssCTzHdBzhWaz7JCY+yJ19ZSO5Er5aftpLcr0+5vx8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxr+qTrj2CNLLdbJ47xzzVC6AHDXEIr5h7zmn/KrHxFK1b2Ir96
 6qp5wR5aepLb3d3NNi5+vCMoCFT2etzYrdcUTKS0QXO6fYiVEWIld5b2tmERdF2hjEQO1yJsVyw
 gxcwJS4VM/SS5IOBm07tkR+9sXoNf8JQtW+vwpeT6KNIN9hbQ0DkVvCnsjCdVVC/2Omnt7kI=
X-Gm-Gg: ASbGncuaY7gNiHbwRMNK6pTe0MMjmyWhpOKFN/fcnEx4ZfP7sVOobrfo+DZ6cr42w2H
 El+6IXUBax/fQhSj8GK7rs9A7DCwiwWunod1xeohq+mSYvPKeUFqcsiq/3C/FZcH9bJcdvp18cQ
 Oq9lESDkh+qFTX3yw0Q+FnruNHz9Bn0T1Jpi276hmocPmIOZ8EJQ0rF7Ggeony73s5tMov+EKhO
 59Qx8UBbzRSMElvxSbBP3ViwxdNGhs65urgBesPLYkFH8//m2Y3cqvTM0np3Udq1KrO4o4b8JLu
 dXbuHIfcAWLjzZWBpWgrlz/Raia0g/uGF+IWtRPU90ww0gCfvBgl4cZPSOrYeSSXjdYata7XzOU
 ICyxa3m7tI9Fi2ZDSNw==
X-Received: by 2002:a05:6214:c28:b0:70b:c900:c554 with SMTP id
 6a1803df08f44-70c35d70672mr17885226d6.51.1755600966218; 
 Tue, 19 Aug 2025 03:56:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGUxbouQ23f5n9Nb/Ax/PRMhBNA4fuV1P2n23CV0Mrc7Iqs7S7DSWRnZn8F0Lk+cpHItsHnA==
X-Received: by 2002:a05:6214:c28:b0:70b:c900:c554 with SMTP id
 6a1803df08f44-70c35d70672mr17884996d6.51.1755600965717; 
 Tue, 19 Aug 2025 03:56:05 -0700 (PDT)
Received: from [10.207.49.70] (84-253-220-51.bb.dnainternet.fi.
 [84.253.220.51]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a41d325sm21592351fa.5.2025.08.19.03.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 03:56:04 -0700 (PDT)
Message-ID: <24392da1-02f4-4d57-a145-6285d46d3bad@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 13:56:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/bridge: ite-it6232: declare supported infoframes
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
 <20250816-drm-limit-infoframes-v1-3-6dc17d5f07e9@oss.qualcomm.com>
 <9e77615a-9d5b-4971-b1db-74d6bed39533@nxp.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <9e77615a-9d5b-4971-b1db-74d6bed39533@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: x42VhngiHOz-ie_k8T5c85XoU1WveY92
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfXzY6O5w8QTH/n
 OtdHx8P3cBawdj8vETO59uOCTlisvHSQIWyKU57OfrV+sbe24YpaCgHffs/4MO8SfHRHHUJw19D
 G1sE4b16RJNvaGmNBhjzlaJ8thPEjrrjH/N/xcHVBqTTNiCYDYa4mcEDKQFgq8Dyi2013ufp21T
 ixxi9uJ5s7FG+iCAAR28HTSSnnACAWgBiFS8At8pVkqyOmaRzO6wiMpXs/bRUSh1ebLPgm5TK+V
 NpHAjPWSfop0vGB5mXhppS/9LCXAlTQ7VREevvAfAjg4MQW+rNj/Dz5TF1iWRc15JR33+hEjmIU
 XcG6sY5VLNfDFGDOJJasGEmDdUXcM1dTySXTvxXhSOcZ6P12Vu0iAit7tww/xHlQhPE4Ei2b8ND
 TUurUHYU
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a45847 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=JdIsBVl79nXNK9flUcZCTw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8
 a=y4d4D-FnMFCReEbV-5EA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: x42VhngiHOz-ie_k8T5c85XoU1WveY92
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020
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

On 19/08/2025 12:49, Liu Ying wrote:
> Hi Dmitry,
> 
> On 08/16/2025, Dmitry Baryshkov wrote:
>> Declare which infoframes are supported via the .hdmi_write_infoframe()
>> interface.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/bridge/ite-it6263.c | 1 +
>>   1 file changed, 1 insertion(+)
> 
> For subject, s/it6232/it6263.

Ack

> 
>>
>> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
>> index cf813672b4ffb8ab5c524c6414ee7b414cebc018..b1956891a8388401c13cd2fc5c78f0779063adf4 100644
>> --- a/drivers/gpu/drm/bridge/ite-it6263.c
>> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
>> @@ -875,6 +875,7 @@ static int it6263_probe(struct i2c_client *client)
>>   	it->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>>   	it->bridge.vendor = "ITE";
>>   	it->bridge.product = "IT6263";
>> +	it->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
> 
> With supported_infoframes set, the two lines setting vendor and product
> are dead code.  I think it's worth dropping them and updating kerneldoc
> for vendor and product members because they don't have to be required if
> DRM_BRIDGE_OP_HDMI is set.  But, this could be done with future patch(not
> in this patch series).

They are still required by the framework itself, see 
drmm_connector_hdmi_init().

BTW: I don't have ITE datasheet. Do you know if it really supports only 
the AVI frame?


> 
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> 
>>   
>>   	return devm_drm_bridge_add(dev, &it->bridge);
>>   }
>>
> 
> 


-- 
With best wishes
Dmitry
