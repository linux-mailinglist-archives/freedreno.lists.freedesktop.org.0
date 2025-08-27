Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D61DB38280
	for <lists+freedreno@lfdr.de>; Wed, 27 Aug 2025 14:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F335410E7FE;
	Wed, 27 Aug 2025 12:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HP6Pd2lg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B648A10E7FE
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 12:36:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kHT9008289
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 12:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aE8zBC2r3Q0RIEhAPiMKgJEgO09ak2j9Srq2WGlHICA=; b=HP6Pd2lgIf3+Ff91
 zdA15rB7L979ZlVWxyvt9V+gX7l8lhk/YtxeUULsYWP+dZWXurOIURgs04oH4KNS
 Z/bgwUxV6lP20vVPOCcyPix+DqDw1Ox8eNXjp8japbIeEbJAqF1m5yaEtb6t0pFq
 fLCElBTU0sSvJTulxTPPQFvFPl1AHiiJ+FntF7mfCQ19RAeDtrdAaTniSVlS9Cnq
 66JB+bFkO4VQmM28jkAjxofCz6ha4w3eI1nXmdkrVPrxpjZw/Kv/scqkwPqZ1n2W
 gSild69dNrPSBcFjVEieZb6WT0hQ7IyrUWWLvmtqWNTMcfjWjZ/W8Ynk3LGGEApY
 ehvgsg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48sh8ajuuh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 12:36:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2465a387372so14441215ad.2
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 05:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756298160; x=1756902960;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aE8zBC2r3Q0RIEhAPiMKgJEgO09ak2j9Srq2WGlHICA=;
 b=V3wscCJr3UlsoAAzm1Z/mTBI5sQu+fAn3siqwIKQ4Qy904Cg9lR0/3gCMq7Kl/mFnD
 0MwFgPhvJjE7u3+oeZ54+qYOaMOnb10hQVAv52R3to1gMfitWmpau3w4d7EKBWk4FSuc
 5aSGJtCt4ytIhXTO479huvCNKKr21L7V0UjDE+v7PL7+qQ2qfs949LdWxprIpnrqfGpM
 JcSr1DU/+bWkNglgrUUWbHuenC9/ohud/dwyn/CT+xJw8wVqw8eWM5gFstpubO+Gu2G6
 VBNMjZ5A8sJe3q7buLphji92B6cx0ydH1gXPlJpV6C7+1N6Jj4XtPlpq9WkXFRw+RHe1
 d2wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwwC6ZJA1tXtqQqhBJJILmF1QlylTdH6k39vOXiKTrtdDXehoYWm2DKybfBsupcEcyLX+kyNczGpM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQdDQkfJcWgQD0PHIYzuEPExl2eLTjUTozQ592ZYnpbdIfok/M
 AJsDe7MYfGUES4Ml2FwcIVIJIFGZXCN+UedPu4ZPbCtD7MwVAgLv0bSWwN1h5yqfu0/ViDRqrlz
 r+lgnftUYd70wFdgBSKommrd2osU9iEBDm+q5I+QkhMeIKVkOHBIFL4FX1PwAKOMUYRPEUhY=
X-Gm-Gg: ASbGnctpaYXd8iwz7nkdtufiZpYE0fd/0ooeslfvXhfceb2NeFBtssLZZAFV6dzkATl
 FdkQUOP3TfERnXRdkVGNwqtnENJpaWlLZmWhRUWPnzpGG2gCiFQRfSmdFDT7llFc//tMpQIafDQ
 scV8iSI1xpWl8O5X83XI6DDZ5qn5KXgxBU5gyUXys2BDeDWSh4Q/RM6GozL3Ip6VrOly9xNfhhL
 m5tn1cAC76fHA9EET4Uypz2KoLgZ/pkZZ6U7XLHzDPa/CTTrQGEL/+S6iW0Ek5h4Jfl5e1rkmLT
 sC5k1exkGPOt/+fQkLM8ZYc1vKi3TW+y79ikICJYV9fOqUNaprnAXHVKgMdTlDRWKzeLrzBEkGR
 VytgY16lJ8d8Fgw17iJuWNcpDATzWBg==
X-Received: by 2002:a17:902:c951:b0:248:9afa:7bc3 with SMTP id
 d9443c01a7336-2489b09c5damr16498705ad.8.1756298160289; 
 Wed, 27 Aug 2025 05:36:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYZ+xD3z7w+wdaYRdOi1NqLqGkN8knb7naudF58SoA0hWReYupg5b3LgtyFq8V+9Sa/QcFuQ==
X-Received: by 2002:a17:902:c951:b0:248:9afa:7bc3 with SMTP id
 d9443c01a7336-2489b09c5damr16498445ad.8.1756298159732; 
 Wed, 27 Aug 2025 05:35:59 -0700 (PDT)
Received: from [10.133.33.166] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-248787e1bb2sm37647865ad.96.2025.08.27.05.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 05:35:59 -0700 (PDT)
Message-ID: <521fc2c7-d58f-4051-89b4-4c5a5a29d798@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 20:35:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/14] drm/msm/dp: Add support for lane mapping
 configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-14-a43bd25ec39c@oss.qualcomm.com>
 <wwn24kjpwexl66hd3wufa53lkqojb2bkpdogtxwr3uqotjpf3u@hclfgsv64ajn>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <wwn24kjpwexl66hd3wufa53lkqojb2bkpdogtxwr3uqotjpf3u@hclfgsv64ajn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cLDgskeN c=1 sm=1 tr=0 ts=68aefbb1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=o8qHn1sYNikkEtO5ub0A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDE1MyBTYWx0ZWRfXx/+0ojFMNXI/
 Qu8gFIiV9RosIksKVAzvVU+wsbA9XnxZeRxJS54PdhSlufhmYipcqTWgUBPEUoQQLNyo/jAXezb
 sIU4SXXDzskQ8xoyS5hdO4ivXco23xpFIycwKjuR4TsssLe52/PBDu1ugPNN0BoTlgnk6iemLQe
 2Ficl+gZdW85oxTDfni04qNZEYOpDgRaM5xoPB+H5f4z9wXFxZzEpxISrnt7m6T5fN+G6J0+JbV
 GTTwhs3xKIq6viJc5zQ3n4K3xRrfp8Ot3Xz017qhci6zSx3OyQ5Oe/tU5Nlb89/zjiZ3ZXzJkgr
 OUCgLn1CCthMKIfODs5PljaX84Ay5dIvvqo/yhqWjJ37iwG1F8jeIndtnnBg95KCEC6QXMQnMPk
 hRFBhGdy
X-Proofpoint-GUID: MGLx5yg3IlCP1xhKCzrWlUw8uDQGihUM
X-Proofpoint-ORIG-GUID: MGLx5yg3IlCP1xhKCzrWlUw8uDQGihUM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_03,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508260153
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


On 8/20/2025 7:49 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:56PM +0800, Xiangxu Yin wrote:
>> Since max_dp_lanes and max_dp_link_rate are link-specific parameters,
>> move their parsing from dp_panel to dp_link for better separation
>> of concerns.
>>
>> Add lane mapping configuration for the DisplayPort (DP) controller on
>> the QCS615 platform.
> Separate patch


Ok. will separate in next patch.


>> QCS615 platform requires non-default logical-to-physical lane mapping
>> due to its unique hardware routing. Unlike the standard mapping sequence
>> <0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
>> configuration via the data-lanes property in the device tree. This
>> ensures correct signal routing between the DP controller and PHY.
>>
>> The DP PHY supports polarity inversion (PN swap) but does not support
>> lane swapping. Therefore, lane mapping should be handled in the DP
>> controller domain using REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c  | 10 ++---
>>  drivers/gpu/drm/msm/dp/dp_link.c  | 71 +++++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/dp/dp_link.h  |  5 +++
>>  drivers/gpu/drm/msm/dp/dp_panel.c | 78 +++++----------------------------------
>>  drivers/gpu/drm/msm/dp/dp_panel.h |  3 --
>>  5 files changed, 90 insertions(+), 77 deletions(-)
>>
