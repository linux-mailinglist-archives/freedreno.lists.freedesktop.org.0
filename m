Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3312B54E37
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 14:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDC810E1B9;
	Fri, 12 Sep 2025 12:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UdLbu8ZQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7D010E1BD
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:40:49 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fJl2009059
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lck0ubW29GTUmJ4yHo3n97jc1CGQR/8xVg8aTbAeFj8=; b=UdLbu8ZQ6J4UEA0L
 y2kLUExUGGRGmeuwnYa2xXBQ6fqhD/Vkzd9GY8vl/d/u1RzJ/Md+n0NskL8eP5T0
 03bOX39b/gRl0pt0WyC3ScvW093pGL1zmgaRYPYKhRGjpbmTPqTTVVSjPuu+D/t7
 KxJa3uRkANs8uS7g1Q+6FRNmVDh80kVwaC07GrklWtV28nY/Ps4+hZXcegP0Aabr
 4ssNQn8T8Uaq3RZX01rjRfO7Kaxr36qyShPsU8YhnD364xojCLEJ496S6rFhu1Mr
 UQ1WPPJ0RzkKAnvRF+vPMdlqNp8NLuITOW4XnlSaIjfcbp/oIZbDtH9G6nbliWJ3
 LvI+ZA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj13m5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:40:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70dca587837so4390046d6.3
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 05:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757680847; x=1758285647;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lck0ubW29GTUmJ4yHo3n97jc1CGQR/8xVg8aTbAeFj8=;
 b=aZ+5nHzf+inyNBNbjnCzb2sJ8aUqKLyWK2UDpGmG9m1ehkYw40YnnttH3jtTCSHxUP
 NP3K/xD98ByPORluFhhXA9Wf54Ed1HuJ1hvUYTGD5vzVhKRBz6L0QJykiC48PoQiPJvX
 A0qkF2r/7S2qCsR0HyU3Lk1VABqbTx3jUHAiyk8GXuO5Qmi3FQM3YMa0WdNuB6aB18it
 +LiLDA5A6Y/5M9zQM3+mHS6fwlvM1Ob5FlU7GCozSJKmfHqa4A/ko6ovCXwiGcVxJEmb
 HvtPRJpz9jXd7T+jSNHKiLxKOijkDplDJ/njFGvkHbd9UvpUCxdPn1WMFDdCzEEJTDXa
 x7RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTl3KMMnyV/KMwmqLZNjWymaZtM4MzO3wfR1RlK+uIystLxVjGy4GwI8sbihQ3XivofNluEWy0o2w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIlj5qdvCEAjes7slebLdGOA7L0zhW88RgSIkPQB+9tWTUF3w2
 BC/UhDnlQogcoODmS0qLhFw+0q4mlow1spz5dVXWHg1oQ2WEZn/3lUVLt0PbPT6+2CDeROQLZsE
 BI353xQbRgVO2Hb0bDqKk83WmgDUMJ0e8Sp7MJT6AyDae306Nmij895pLsEw2kLX3HOvDrbI=
X-Gm-Gg: ASbGncv84y2COofFhehdUOTgZzjQsa43xhDYWWIB32JbQ3K1k79yR2XDzQq2kwTa9QJ
 prlcH//9t8esewrsaZcGFarmauJdxPgVlgjpHns4PcDgbZr94nln7NYM+bnqgFPYK0IySdoL0b2
 zfc1pWeB727t4OZ6ncYfQF1Yo8F23bnvneICZzd39ZGpxMewhvfJAMq/TYc+bFIPyYd0EXl659K
 S4pfjxnqSLpfS1IOspF2xg8QtI9gqoDSq5RM39OI0i8wX6RHl4SHjfszpWuYjW20AxB3Kf5jLg8
 1C2RovPivN8ojNx5cF5TPt6bZSSWTjdMriP5xcsEdG2ToqyRzsY41ywsVRww3tjwM1Mhy5iX7Fu
 xrbO5biOfMd8qyuCHXCcD2A==
X-Received: by 2002:a05:6214:27e7:b0:70d:e276:efd3 with SMTP id
 6a1803df08f44-767bc025260mr23384016d6.1.1757680847500; 
 Fri, 12 Sep 2025 05:40:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBBLxtMxPZfLylJXd171i5aVZ91RwAFkVf95DRlbwCzPJuiY8Ut+YWJNPZGJ8wj/hfASSNlg==
X-Received: by 2002:a05:6214:27e7:b0:70d:e276:efd3 with SMTP id
 6a1803df08f44-767bc025260mr23383616d6.1.1757680846902; 
 Fri, 12 Sep 2025 05:40:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec6b6cec5sm3015885a12.1.2025.09.12.05.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 05:40:46 -0700 (PDT)
Message-ID: <f610e2d3-cc8b-4a79-8c28-4be11dbbe38b@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 14:40:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/msm/a6xx: Fix GMU firmware parser
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Jonathan Marek
 <jonathan@marek.ca>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
 <20250911-assorted-sept-1-v2-2-a8bf1ee20792@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250911-assorted-sept-1-v2-2-a8bf1ee20792@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QNSD9m2lzyPi0_CLqwqHBGHHS0Mle_ui
X-Proofpoint-GUID: QNSD9m2lzyPi0_CLqwqHBGHHS0Mle_ui
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX5uOrZ2r5gqh9
 pdqns4mmhZZud/qyjOxmPvPESvzrgjWTUbEsrzIyH2XiNrXIZZlkn7GJKDetC90ZIg1LV4WAGDZ
 MdduFAGpEVHX1cWiHxQ2n/SndaEtzloSsmL6iiHeWo0Ivj6mj/4MN54/oAvBxxuGfZ23FA46yH8
 eOogcmGh6Yc9XxVpGLvgCKvW8U7RMRypRCKgl9X848MCp6NVRYkdvwcRHXmGn40HNO0RcrguLz4
 yNQ8h6WEE8UY+0WbskzPkd4WLSI02XVxaHTU9ll59K4GgVFKfJqu7KtalSImbZK6i97aEyCdyTH
 EF6nluw3xTgzipl0BfnnIhX1b2xmx6qWyycN7r0u+OUpjia+fDWpwCS5TWEN/36zrWmZTde6rOZ
 5dUUeIi5
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c414d0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1NxERlzXQmXK-yb5iVsA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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

On 9/10/25 10:44 PM, Akhil P Oommen wrote:
> Current parser logic for GMU firmware assumes a dword aligned payload
> size for every block. This is not true for all GMU firmwares. So, fix
> this by using correct 'size' value in the calculation for the offset
> for the next block's header.
> 
> Fixes: c6ed04f856a4 ("drm/msm/a6xx: A640/A650 GMU firmware path")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

I'm not sure what memcpy translates into for unaligned addresses,
but I'm going to assume it's handled properly..

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

