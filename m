Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69699B832BC
	for <lists+freedreno@lfdr.de>; Thu, 18 Sep 2025 08:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4093110E660;
	Thu, 18 Sep 2025 06:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PEi5s4iU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A613E10E663
 for <freedreno@lists.freedesktop.org>; Thu, 18 Sep 2025 06:40:23 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I3P7qF021414
 for <freedreno@lists.freedesktop.org>; Thu, 18 Sep 2025 06:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LjaNkwEord8IuaS2Ix8rlcQtQCl3eabfxMXBeTRj034=; b=PEi5s4iU6KYwPSv2
 idItjN3VAXrFN0lg13BbjJbAv5ozq/cA4AFCzZdrlNJp6gWJMtOKz/jy96u71rRo
 NrO6UvNnYQ1JtvJMtLgpFhc3FM0aJcjQ1vmqgIuFyd9koEHWPQTcFEyWxKC3iGbP
 yK2ORo7+AVDcCIy51gzwVU1X++S6nhE2gsccFlYqVfxRz8UcWeTTbLTDzGwZBWsU
 M1JF9K74zyuUQH3aGiBaAprvPSg+17JAqg+qFjHV91W/SOxAs83jZC+bfpL8DwmG
 Ad67IExQ9hjx6FMs4nnpkUAfopoDdEtw2EqALnCU8DLcR90T8LUA/E24RbUFrsFc
 46Cv6w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy5d868-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 18 Sep 2025 06:40:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-32ed282183bso200846a91.0
 for <freedreno@lists.freedesktop.org>; Wed, 17 Sep 2025 23:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758177621; x=1758782421;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LjaNkwEord8IuaS2Ix8rlcQtQCl3eabfxMXBeTRj034=;
 b=Z8lm8JWZoK7Gc3q8e1zC5oTfTssNE/Q/Oxt2UbavvdEKx8cH9Ig2kX3Y82gDATynn1
 Rvt5RnzLhVSGBQOcEwutTc0hqhJAksYReLVGK42eyOihgPH/jxXRLfLoxIhlcazxOT9z
 lUko2tWKVGUDfRQGS+PtxJRd8Hr/EyHT4Cg2MFXdXbhr273k0dHDMGv3yG91qnvcELSq
 VDtHGtSZdDH63NZfTzdX0n/LTrxhWumEv3EAv30rZSv+TJAGdfDbs2gap32osWn2CuMH
 aC0yuIrIE+IcSfFkSgJc2GKWLxAZWQtVft9i4p0LroUU397YtewGjMXsLc4uIvC06AHQ
 Yt2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMutVqow+or+XsF7qOW0G+VKf/R4jK4Fn9BjCF9SdEA+l/8yOgdu2C49bGJh03iqnWeBlzOqVTgx8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwySLJmOXEL59FF3txgERMkjmC6PP7QKQSdQbLHuvB1tgW9ImDS
 k319h9TonMBYwVZ+nCfWdiFfOyDTsNagYyuUHDGYur2jOULewbF7+kD1G/6hsBsG6fRDBO70LTR
 7SnEb6hXuksoUxDt6JH8d7ChIl/GLtFFl+E1D9eeFUNp7kj+N59MdFgr7td+cq4D4BvnkKqM=
X-Gm-Gg: ASbGncujBBbWVV4qCOpgNairlHs6RY9iftnImrlpuJwCHGoHlhSMqD6wi9km5IvCLYe
 540OtJB0rqYehWlxpMcfWbYbpQG0Jc8z0Vn06hXp3vDiLs1SJOG6kuXFCBDYDkfGRch3/Dqw54r
 zqDeXSgM3pTXdcgkPILFBRS5ULTWsWB6AHSl2tjrcxPbsTsmCIR9hPhX//212P1GzXKwkIF1Een
 w+1pW8aAZx5YYzLoNaD51RSCynW7XPhzZ18Jc31IK3vCZPhQje8Jq7OsrGbvXaRWwLjVpJ7Wyyd
 e1M5SLnnXyMqox5zjj0o4jMVUu5f2kEEcpZ937tYXwwbZLjk0eLC2FUN5M4kt8KNQ4dOm55y6fV
 PFQ9xOx3gONyhUTcbWyzslUvmnXeNPQGhOg==
X-Received: by 2002:a17:90b:1a85:b0:32b:dfd7:e42c with SMTP id
 98e67ed59e1d1-32ee3f81fb9mr3115606a91.5.1758177621303; 
 Wed, 17 Sep 2025 23:40:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5qY1sAAfH7rgQLI8TMzDM81toKk94++RXJMv41XuxHoyUPZDYMls2v+1O0U+ZGupHT65xDA==
X-Received: by 2002:a17:90b:1a85:b0:32b:dfd7:e42c with SMTP id
 98e67ed59e1d1-32ee3f81fb9mr3115576a91.5.1758177620860; 
 Wed, 17 Sep 2025 23:40:20 -0700 (PDT)
Received: from [10.133.33.13] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77cfec3dadbsm1329619b3a.68.2025.09.17.23.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Sep 2025 23:40:20 -0700 (PDT)
Message-ID: <50346565-20d0-4ef9-80a5-e08070fdefb6@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 14:40:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] drm/msm/dp: Add support for lane mapping
 configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-13-2702bdda14ed@oss.qualcomm.com>
 <oex5463riqvvyfyntxcyissaznnfsd6xogcniqouqcn6yokgwu@dwhje4i5inj6>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <oex5463riqvvyfyntxcyissaznnfsd6xogcniqouqcn6yokgwu@dwhje4i5inj6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ogyp3lMwbLXpiRTCBHlVMJ2G0sTGChTh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXzM8yLjMPfgQw
 JLOqh6JQUrIbsT5Mif4piL4jm9bMrTTy0l1X4twC3FCR7vQkhngctfqkIgnER4IsCK4f13DkMEq
 OSBwj+EcsothGCX9yBYKjqmINcy0GkOHc20PPel93zNQkDEjFidd3dtMOqHdQTD08CHzs6VLcQ4
 4mYGHqAZUuamTZ9P3x55knDnpjT0SEkQyLCdZJM27xtv4NMDlTvMR3zMYPDgwxI6CRb/MpBxVP6
 GDXq4dKC89paTJRPUG4KZA64YF+ZCDM59POq5gJhpGxqxwn8aqKF7E8N60LYieapHT+iYjrm3nM
 ED3K2vFcvomGXYkONUjCNaRw2G/eZR+v+HpyYVZ0WOZ+4uvnw9xffssJ0ZXp4DKJ58IzP6+5SN9
 u80CKoMy
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68cba956 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=zEApyEmNphHiV2Xtq7IA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Ogyp3lMwbLXpiRTCBHlVMJ2G0sTGChTh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
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


On 9/12/2025 6:42 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 10:55:10PM +0800, Xiangxu Yin wrote:
>> QCS615 platform requires non-default logical-to-physical lane mapping due
>> to its unique hardware routing. Unlike the standard mapping sequence
>> <0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
>> configuration via the data-lanes property in the device tree. This ensures
>> correct signal routing between the DP controller and PHY.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 10 +++++-----
>>  drivers/gpu/drm/msm/dp/dp_link.c | 12 ++++++++++--
>>  drivers/gpu/drm/msm/dp/dp_link.h |  1 +
>>  3 files changed, 16 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index c42fd2c17a328f6deae211c9cd57cc7416a9365a..cbcc7c2f0ffc4696749b6c43818d20853ddec069 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -423,13 +423,13 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>>  
>>  static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
>>  {
>> -	u32 ln_0 = 0, ln_1 = 1, ln_2 = 2, ln_3 = 3; /* One-to-One mapping */
>> +	u32 *lane_map = ctrl->link->lane_map;
>>  	u32 ln_mapping;
>>  
>> -	ln_mapping = ln_0 << LANE0_MAPPING_SHIFT;
>> -	ln_mapping |= ln_1 << LANE1_MAPPING_SHIFT;
>> -	ln_mapping |= ln_2 << LANE2_MAPPING_SHIFT;
>> -	ln_mapping |= ln_3 << LANE3_MAPPING_SHIFT;
>> +	ln_mapping = lane_map[0] << LANE0_MAPPING_SHIFT;
>> +	ln_mapping |= lane_map[1] << LANE1_MAPPING_SHIFT;
>> +	ln_mapping |= lane_map[2] << LANE2_MAPPING_SHIFT;
>> +	ln_mapping |= lane_map[3] << LANE3_MAPPING_SHIFT;
>>  
>>  	msm_dp_write_link(ctrl, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
>>  			ln_mapping);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
>> index caca947122c60abb2a01e295f3e254cf02e34502..7c7a4aa584eb42a0ca7c6ec45de585cde8639cb4 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_link.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
>> @@ -1242,6 +1242,7 @@ static int msm_dp_link_parse_dt(struct msm_dp_link *msm_dp_link)
>>  	struct msm_dp_link_private *link;
>>  	struct device_node *of_node;
>>  	int cnt;
>> +	u32 lane_map[DP_MAX_NUM_DP_LANES] = {0};
>>  
>>  	link = container_of(msm_dp_link, struct msm_dp_link_private, msm_dp_link);
>>  	of_node = link->dev->of_node;
>> @@ -1255,10 +1256,17 @@ static int msm_dp_link_parse_dt(struct msm_dp_link *msm_dp_link)
>>  		cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
>>  	}
>>  
>> -	if (cnt > 0)
>> +	if (cnt > 0) {
>> +		struct device_node *endpoint;
>> +
>>  		msm_dp_link->max_dp_lanes = cnt;
>> -	else
>> +		endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
>> +		of_property_read_u32_array(endpoint, "data-lanes", lane_map, cnt);
>> +	} else {
>>  		msm_dp_link->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
>> +	}
>> +
>> +	memcpy(msm_dp_link->lane_map, lane_map, msm_dp_link->max_dp_lanes * sizeof(u32));
> This will break all the cases when data-lanes is not present in DT: you
> are storing the empty lane map instead of the 1:1 lane mapping that was
> in place beforehand.


You are right. It would overwrite the mapping with zeros when data-lanes is missing.

In the next patch I will:
1. Initialize to a default 1:1 mapping (<0 1 2 3>).
2. Validate and apply data-lanes only if present and valid.
3. Always produce a full 4-lane mapping, filling unused lanes with remaining physical lanes.


>>  
>>  	msm_dp_link->max_dp_link_rate = msm_dp_link_link_frequencies(of_node);
>>  	if (!msm_dp_link->max_dp_link_rate)
