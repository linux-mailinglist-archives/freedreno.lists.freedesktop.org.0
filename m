Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9A6B2057F
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 12:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC8210E430;
	Mon, 11 Aug 2025 10:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aj2ELdzs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4908F10E41A
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:59 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dADS029203
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=Aj2ELdzsgekhYgRt
 ClktyV2PtJ2CPU1+yHxzLljbB7VL8jO6/Qu75jWuF4fCwLZRtRfpwD2z+8UHaQlR
 F91dHXHznoR/VAZnbcxOhAUWozo1E/eSg7+hcF4UbaaP1SS8dX3A3ul8wwIvfskb
 kAQKD2pNqF5Ooj94/JJfwt0Adj5BvQ99j7X7bZlnKoz6n05iJ5U0uT2yhvQsERrj
 OPufcVYx7EdUIj9e+yP6ogpa/JGZLbfNiHq5zeUzmzO6ksgpYxhYFm8dXIuLIxOM
 ZaqxieeJm4j532hLK/vWcm7CSL9NeRS7c2KyCBW+NCpiuXBPao/WoB81t22D9wFK
 aerQIQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmbyh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70941c8a17aso12942006d6.3
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 03:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908437; x=1755513237;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
 b=r0/drei9i9NSFsOTdH6WJZSWRinzMfDUAHQvREGkBsfOixM3s3mraklsE5OaIHL7yN
 jXlQZ1CE0kVdSNzEaihjPsp8HXUUfPP+L84bwl3c8SGiUoz1d94nLRIVrpcrqMHOffU+
 5HiV1q4JXlI1Z2IX/jsg1iJ6QV33YKpYQoUIdIYgelHcGWEv99AMhdF8eOXps2qP3t9+
 eL4oweR69/6fh46547gS8x74iJYnzrTw+RogqGfhLXn62DhwdaYXcDJJ2Z+YkteWx+bJ
 RY6uvib4bWwDRkUcPKmhxhEcWpkr7/wU8WPuefWUQ3EsSnbTyCZ3KVBqWCorwjim541J
 JpCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9wOh+1tKLcFbXGYDWgBEj5A9TfkV4RVqDGha1Rsxp9TDFh/vYNeHYisjVguij5J4NW+Hkx9Qww38=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6KAIFS7Ps5jP/GyFv5LoH+bKfVkYrm2G98eXmCc2TLAqWYXIX
 4lriKAutL9LZoR7UI+3kGDcQt5MNT38TLnbxRima5mkK732EuTDl53jt9DN4bbJKf30ODhpu610
 FuO3a4tVaLonPR04MvYkZqR6L103TUo7+GNMtkbUhOEC84fYcJ6S7wmeCDjx40wWFvH9zuog=
X-Gm-Gg: ASbGncsLUqWOSXaqHoDvD/5VDQFFW49u6sq16yZmlXVB915UMmhxO2VeFvz7G1Rzc2A
 AAai8f8JYkHnIIWpb7o1DpgyjXUh/5LD7uAFIYOT2bobMi4XA4z6ZoO0VUkPDoxSqUKFSrYisTZ
 f9O6AMvnguRxzQX99uboQOwq6Ttj4ZFtGGAcHHGfRgYzPocLQ2WDFzjPHPg2a2EUedYEyQgB5Sv
 qd2GUQYRsDruiJanjsWntvL2c1IVt2DcbmdgOmI+6fKLKi9IbD5lwoPm3vep80PyeE0/VdEgHaT
 GC2NC63MxC/2y80f2YK9AI5olvwsOnF4EORnZwkxcsSTRFlGIo8fHy8hW1b5L6SoyZydwNwI1eC
 FudnHlVaYPTmJthQ0xg==
X-Received: by 2002:a05:6214:21c9:b0:707:76b6:2135 with SMTP id
 6a1803df08f44-709ac152639mr49721886d6.4.1754908437529; 
 Mon, 11 Aug 2025 03:33:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZPUcFhvJ+o3XZIPZBMeA11da0VhO9plin+aeS/4AZ3/QDcw95Q3QsJu+fTZO17e7WElJo9g==
X-Received: by 2002:a05:6214:21c9:b0:707:76b6:2135 with SMTP id
 6a1803df08f44-709ac152639mr49721596d6.4.1754908437064; 
 Mon, 11 Aug 2025 03:33:57 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:33:56 -0700 (PDT)
Message-ID: <1442a1f1-8cba-4f63-a9c8-85118d728365@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] drm/msm/dsi_phy_10nm: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-1-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-1-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfXzjYmQjjm9RPj
 P8Gc/0lheuei8umTwluGGF6k2Brkw6VYzCteAZ7X0JICLliKx7xJecYYzKmR+G9TPmbM3jHY85E
 6onJ+xkGZpbnROU//OQsKRoGVcAt4UCElAXTPu4G2IfgFCMPMa3NIPqMMiUWVYYidqQQpB9Byeq
 Ziy6T/sfGOfgdGZYIE7kS2JmfxChZTvItgj0SaKvmUpcjHb4+8fubO4olYGAIGkX4BmHWFOW6VW
 evPDTrkAIT0rMPhpFHK7WESvpv13lSQwrUpBGfX0Wq/Krejw8ZNHantZMwnRJOPsMbwee/DQfxU
 y/z9/lYmyeuVWXFigk7Iz5x7Z9X9zajenCBrDKeBFXMUXAd+cYRT0Uhiar0w/SwFkCwweupH3Dk
 G0MHON3P
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=6899c716 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: haAZHoo3E1r0dKxrQmTbc4Gw7BEe-Y1j
X-Proofpoint-ORIG-GUID: haAZHoo3E1r0dKxrQmTbc4Gw7BEe-Y1j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035
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

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
