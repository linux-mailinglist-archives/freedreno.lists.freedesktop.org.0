Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F03AB54C3A
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 14:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB1010EC2E;
	Fri, 12 Sep 2025 12:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AlvPbLkw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A255A10E1B7
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:03:39 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fKwu017543
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OC306+JLRzCtQu+HZoUMCL3Oa/U1/T4cictyJ1c0fJU=; b=AlvPbLkwvvsKmqNm
 f6Y2S2TTjOVpZGfIGtO8m6/ajO2w8M79nskwbh+1y6U1BmaWpYPIhsEplNPCUy/m
 Y+qYCkgf/yRC0tNSp4uFEinRpX4c7Mna3R0cYelOJx16RnTOAUZV9++6zpfviV0H
 12NNz+qZqZJGrNUzKpdgttXqJIp1TOrxaPCINyMRcNZrLXLTogG2WYJNt1W1i93P
 iRQHAh25vUwksHjRX8E6DR42yQ+eROeGx9kNbYTua3AmD1S/pDcWJvSE7zxCaCSV
 ekNLDJ5cxAfNgmw4fCn9hGw9yVu60KbDODPCM/1VTOcTW5SkiKFs0qUoRDDzJRsJ
 +9D/5w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwskprk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:03:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b54b25578f8so74751a12.3
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 05:03:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757678618; x=1758283418;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OC306+JLRzCtQu+HZoUMCL3Oa/U1/T4cictyJ1c0fJU=;
 b=ZdL3IKclVEblKD1Pv8ACoeLrldtzeQSkB6H/i5aLxUgBRL/SQQmUXtIl1dQHYwAFfi
 vgFH+UUFTpMR7mizr46f+xbOTxNJZhrT7LAH43cNDjMQdO/6cbXjSzVfPlZ43MfcG1ee
 zTNW+v7CU4zSVLhIbmIpg4nSEdjnH9V4Yk8rdnqmg6C6t7xYpxELBiW8OWf06HrvIa5A
 wj9SscoezBasO9xp6jETCycmeVCOfXOHGHlo8P2JdYb+FoHWdxzAxZ7Ucuqs/zlTpXI4
 UTW/Ke5dI+7nk64MIlsd+JitQbi9jLwk2AMkpNSMpj98koWUAyOoS09sMrDXs7y5Gyqo
 xhaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX38WcMJX1bFqTgersXiCEbroQXlXoPieSWgEZFmZAXg0zSYoo1xlN1yBkdwl1im6N45g2EoANAla0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTCQHk3RfpqxZA8v5e7vItccQnhO57n4/SgVJ8CFWRvusmxaEx
 MIfLGFhFUfNhL/jkoXdT9Ox0BrTyOnVc1zQchpT1vxao9RinS4D10b2ZR53buBpAVOaz4brZ7Kq
 eSU/JwybrJsPVa3ncwtPl5ZYFF6wARTR2GXKbWZsZ/w96s09rnyQBKj8jz1JjCfVyrWTRIBc=
X-Gm-Gg: ASbGncunH53RZxc20+P3IooSVzC24qverWt8fBVcqeNL4rK9Ra4W4mHVLhOf8v2/3f4
 1ty+ljvXZX7J9EKEOPGgEhNJvqywOZb7CyKJPV70BfeFjdAK+/ipQlb4589T4SGgjGVP/5+7QDD
 62/JZv2rqa3gq7Oi4CFDDIMDJkYi9q5i2XBclaATRVZk9Jy8e6+DXQr84ZaSuWp15+jVCXJBMUM
 FO6lpwio1tdoK1T8VMTiI2wlb/Locs0RY0eGgL5cwL6CkMrCX0Gf/Bg4WcYLfBqFpT7o2/OoXJt
 /tRa/HwgTlFqX83wLsHQp7VFnqVD+5t1SF1bkwygt3+1D5b5NPJ9FTd9LD5/rWc+wqJiij73ApR
 +9oOt6O3NYrqlUtRDHY80TIfOqXwRew==
X-Received: by 2002:a17:903:1245:b0:248:dd61:46e8 with SMTP id
 d9443c01a7336-25d25a7294bmr16547725ad.5.1757678617837; 
 Fri, 12 Sep 2025 05:03:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0bcpdWZ5JtOcYfmEEQBTJNc9tzJlPspC8jR11YZhBs8DDVX3VE8+HBzzj6SRFPVGJrjwKeg==
X-Received: by 2002:a17:903:1245:b0:248:dd61:46e8 with SMTP id
 d9443c01a7336-25d25a7294bmr16547335ad.5.1757678617295; 
 Fri, 12 Sep 2025 05:03:37 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c3a84957bsm47241905ad.80.2025.09.12.05.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 05:03:36 -0700 (PDT)
Message-ID: <70e9d5a3-53b7-4e2a-9a2f-19e3be1e197d@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 20:03:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/13] drm/msm/dp: move link-specific parsing from
 dp_panel to dp_link
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
 <20250911-add-displayport-support-for-qcs615-platform-v4-12-2702bdda14ed@oss.qualcomm.com>
 <4kajb4imv4mvpf4bdzoqfw7f4qoqxsu3ca4pbgsunhxnortfig@kmsqgsj547hi>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <4kajb4imv4mvpf4bdzoqfw7f4qoqxsu3ca4pbgsunhxnortfig@kmsqgsj547hi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WWmOd2qJcOyyTMfUlZYWJ8NwfKzSoa9s
X-Proofpoint-GUID: WWmOd2qJcOyyTMfUlZYWJ8NwfKzSoa9s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX5sEDhccGZ8//
 bth2kq0olq4hNgMJo4cNaUsonDw8ZH9/aDTNh+ZtCrcF9HvjCnkyO3bDR0uIDS8/+KvDJfT6j50
 QqSkxFnQh1PKIT6Tb2r8P0Nt1dZMHXKQxxqSitGcZ/TDQQgtbGKKU5Oc4fWtzJVDUUpilXMXtiW
 7FYnIZ4FUMhXpvDgp6ItfZATSJeK7MQCmn3fmam+sWqfcolT270PKfYvtJImMWC6IEpmSvmi+8B
 J5T28YC4dRjGWAonnr0jcE3Aurd0YOaztJY0ryTL+zJG8u5cB6OJ+AzUaLXeGa6X+JC0O3X/M1f
 q7OaiTrCM/+/T6H+a8ANLm94DH0pZFYxEkZIxhsir3Cwej4+CueEsgWN1lA+RP5XlzAEiU/oT7J
 6yeYvzcM
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c40c1b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=3J_imRUleR0CZ10obY8A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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


On 9/12/2025 6:39 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 10:55:09PM +0800, Xiangxu Yin wrote:
>> Since max_dp_lanes and max_dp_link_rate are link-specific parameters, move
>> their parsing from dp_panel to dp_link for better separation of concerns.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> I thought that you've split all DP patches...
>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_link.c  | 63 +++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/dp/dp_link.h  |  4 ++
>>  drivers/gpu/drm/msm/dp/dp_panel.c | 78 +++++----------------------------------
>>  drivers/gpu/drm/msm/dp/dp_panel.h |  3 --
>>  4 files changed, 76 insertions(+), 72 deletions(-)
>>
>> @@ -1225,9 +1283,14 @@ struct msm_dp_link *msm_dp_link_get(struct device *dev, struct drm_dp_aux *aux)
>>  		return ERR_PTR(-ENOMEM);
>>  
>>  	link->aux   = aux;
>> +	link->dev   = dev;
> It is only used during parsing of DT data. There is no need to store it
> inside the struct.
>
> With that fixed:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>

Ack.


>>  
>>  	mutex_init(&link->psm_mutex);
>>  	msm_dp_link = &link->msm_dp_link;
>>  
>> +	ret = msm_dp_link_parse_dt(msm_dp_link);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>>  	return msm_dp_link;
>>  }
