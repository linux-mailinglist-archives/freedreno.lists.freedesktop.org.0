Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA22B941E7
	for <lists+freedreno@lfdr.de>; Tue, 23 Sep 2025 05:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E79810E546;
	Tue, 23 Sep 2025 03:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFz4IHVW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF65B10E544
 for <freedreno@lists.freedesktop.org>; Tue, 23 Sep 2025 03:38:51 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N1QlHw002158
 for <freedreno@lists.freedesktop.org>; Tue, 23 Sep 2025 03:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8Y+UxxpE5WuCRJKuL0hvK4qAyKZPxGwcP6Rwn7/3joE=; b=KFz4IHVWkCAuM+Gr
 ihh3zMOk3sz7yyPuq6meqSBY7YiXu9sJ3Ovl8LYI61cfbz09oYecTiJe/lyjqVDG
 KEzyoIpj/5TgH/SsGYfYwYD7zQIQWJC8qOPQoNYsrjJDPIbpNkVOn+KXq+DXYAW9
 y3CO1VYETWVuyFcDyAqLjhdHY8TbVuZA5F1G/ClJBVyqz+l+v+BDQsPZrEWehj5+
 uR0MMK0F2cfTQzQmaoioJKQmVrq1s1+8cZkEF1f9ICprkjT3PLKdm4e1oybwON9c
 S/MYHMgSWrU1SY9zq+nOOo9Q9q30ORUfz8qlA7MwxCFU4ipWeBlzFBjJtnLrKzqp
 Zl/9Bw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjr9ub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 23 Sep 2025 03:38:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-26970768df5so12025715ad.1
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 20:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758598730; x=1759203530;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8Y+UxxpE5WuCRJKuL0hvK4qAyKZPxGwcP6Rwn7/3joE=;
 b=gbgNzLlLHz41YZ7E1kStem4EaCIn0pn+AuDQOSMdlk6GcFVhdeOqOSmQ12cdAqbtti
 YX+PARsONfjJYpMTWRWhNuhwcryZ8A9kVXK2bVpAs5F6HgjcHW8+dpCtqM047qFSKt/P
 pRFbW+JTEmAnMz0mET+t6oI5oWOgJj6+/D02rwydhoabnNbIaeuUEVRWcun6NVbE4jxt
 KJLe/MmSqrMFXqJaVnEgMtjGCldsBYYf+9RFGvG1X2lmqrAuLUbrWYlpU7Ct9ofUw6rs
 iLtOkikr1fbSLoG0zpExUgjYJEiKYkMRxvK0fTwVj8e0fBreyOC83kpLcHTzHfzFw70h
 DXaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAS7kP9qF/uvgT9KkdXq4l529ZfzN4KjHO+CixSBiEka0THsrg0VcbAZP4Z+M3ZJkyBRoic6t2Tg8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyt0JRXAWpAnb14cv55rcLsWDf635kferGOxKrfETr3PD1wQ1xu
 xc2SWrADtZvFbLhEdGzo7nSHsJv0nk1570WO0ND0XtKwbPhQML57pGOsJ2yvLyuMjixBAxYFdg3
 lgoIrt7ej88jhvF3ANUo+U0r+JJaP7is9sJT88HiCkUVx7+jbLLeyJTHIg/wiL4UBVpVDcRw=
X-Gm-Gg: ASbGncsifS2Sfrh7hNLPoWktAWZteynML/uFvSXKg6s5dHywDbJCbMhHx7sLgkAZDle
 jmHkchlDWQKcMhZFrf7k1MQVu5eDcDUfUTHTnwA0ngJhYSyJ2MP1lq6pixqhQ3eQ/mu8UxkUfdv
 SWnjoMIsDvlAuYK3y9wtAJ7isW+1cbrv8bfMyNa8Ai3WpsJlvme0J2BRCLebA0FelHRVuiLETxi
 FdFIYBgpOCsVz1IeCukvsrCIergGHMT0XB0Y4+23tTAWZqE947Ngz+ICgFeIE3t9q5G/Zjuxqyv
 0k0gCFiIFZo16HOgo55teBOHk5HqBLZ6vn0jG8C8uckxG+J34SbY+IFS0El+VTGR8jqmo6iinj+
 awRSz1NHF3xe6cpX2WB6yo8jcipcHoOZWLy0=
X-Received: by 2002:a05:6a00:1828:b0:77f:3f06:1f78 with SMTP id
 d2e1a72fcca58-77f537a8173mr828276b3a.2.1758598729792; 
 Mon, 22 Sep 2025 20:38:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5W8YAPrrchgMVeHplJ5Ln5bt4yZvCXn/JchjMJMX2nlmqazlCN5vnpvVhSh9oEhVk8Z5oRg==
X-Received: by 2002:a05:6a00:1828:b0:77f:3f06:1f78 with SMTP id
 d2e1a72fcca58-77f537a8173mr828234b3a.2.1758598729324; 
 Mon, 22 Sep 2025 20:38:49 -0700 (PDT)
Received: from [10.133.33.111] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77f41b85e84sm3439351b3a.86.2025.09.22.20.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 20:38:48 -0700 (PDT)
Message-ID: <d7b2a904-97de-4716-b179-4ad8d3ecbe58@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 11:38:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/14] drm/msm/dp: Add support for lane mapping
 configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-14-eae6681f4002@oss.qualcomm.com>
 <j7ooyi5vih6ofnjigdgj6uk3ycutugunpm5pu5zf55pu5ua6r2@agg73zakjicn>
 <CACSVV00Bat6LE=joM+Wh3HnC1=c3_Y=crxUGdhLQWxxpZ17Q3g@mail.gmail.com>
 <t4x7okzjvh5ltyoniwlreoyy76735igtnxpeohpbojn4hkqk4q@v3ayfjrkez3e>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <t4x7okzjvh5ltyoniwlreoyy76735igtnxpeohpbojn4hkqk4q@v3ayfjrkez3e>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QxAnJfRSSdcAm6uAT4nmrRjFccM1qwNC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX9E7A/+Rz8yis
 QXny0DElrqmO5ELpPewkGYVUzTtaEFhZMRXNDpcKI1iWUd7Dnf3MfF2FTaJAGVS2OYYSB1k8XjH
 MfXEWu8Bm9Igbg+Wo1JCZHxduOmiH81ibKr8UIBuVQvp1Fjw/gGXbFp2ecsL/PHZ1DcmR5zP5XG
 9uliCC6BMs9/Jsr0cUekZWQJCQn1dwHwVLIWufAYFYK/w0yU96mmtX4qnW/I1M6ayE0QNqNusRL
 1FDSGOk01rHkvZyp1phuiNUj1avQgOHfxagk6bvwr+QTqBf8Olyt02Br0DJdp1I3AGPQJm8/AP8
 WpsnYXu+fKGN7WRKjW8X+R0dTBlQk9MQICCw5uX5uzKbsrXadx+wKFxL4d0pdfSFFfCYZbx0+D/
 Wtm/Pb6E
X-Proofpoint-GUID: QxAnJfRSSdcAm6uAT4nmrRjFccM1qwNC
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d2164a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gP3TSUq4Lgg7EeaY2V8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011
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


On 9/23/2025 7:39 AM, Dmitry Baryshkov wrote:
> On Mon, Sep 22, 2025 at 08:13:00AM -0700, Rob Clark wrote:
>> On Fri, Sep 19, 2025 at 11:35 AM Dmitry Baryshkov
>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>> On Fri, Sep 19, 2025 at 10:24:31PM +0800, Xiangxu Yin wrote:
>>>> QCS615 platform requires non-default logical-to-physical lane mapping due
>>>> to its unique hardware routing. Unlike the standard mapping sequence
>>>> <0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
>>>> configuration via the data-lanes property in the device tree. This ensures
>>>> correct signal routing between the DP controller and PHY.
>>>>
>>>> For partial definitions, fill remaining lanes with unused physical lanes
>>>> in ascending order.
>>>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 10 +++----
>>>>  drivers/gpu/drm/msm/dp/dp_link.c | 60 ++++++++++++++++++++++++++++++++++++++++
>>>>  drivers/gpu/drm/msm/dp/dp_link.h |  1 +
>>>>  3 files changed, 66 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
>>>> index 2aeb3ecf76fab2ee6a9512b785ca5dceebfc3964..34a91e194a124ef5372f13352f7b3513aa88da2a 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_link.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
>>>> @@ -1236,6 +1236,61 @@ static u32 msm_dp_link_link_frequencies(struct device_node *of_node)
>>>>       return frequency;
>>>>  }
>>>>
>>>> +/*
>>>> + * Always populate msm_dp_link->lane_map with 4 lanes.
>>>> + * - Use DTS "data-lanes" if present; otherwise fall back to default mapping.
>>>> + * - For partial definitions, fill remaining entries with unused lanes in
>>>> + *   ascending order.
>>>> + */
>>>> +static int msm_dp_link_lane_map(struct device *dev, struct msm_dp_link *msm_dp_link)
>>>> +{
>>>> +     struct device_node *of_node = dev->of_node;
>>>> +     struct device_node *endpoint;
>>>> +     int cnt = msm_dp_link->max_dp_lanes;
>>>> +     u32 tmp[DP_MAX_NUM_DP_LANES];
>>>> +     u32 map[DP_MAX_NUM_DP_LANES] = {0, 1, 2, 3}; /* default 1:1 mapping */
>>>> +     bool used[DP_MAX_NUM_DP_LANES] = {false};
>>>> +     int i, j = 0, ret = -EINVAL;
>>>> +
>>>> +     endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
>>>> +     if (endpoint) {
>>>> +             ret = of_property_read_u32_array(endpoint, "data-lanes", tmp, cnt);
>>>> +             if (ret)
>>>> +                     dev_dbg(dev, "endpoint data-lanes read failed (ret=%d)\n", ret);
>>>> +     }
>>>> +
>>>> +     if (ret) {
>>>> +             ret = of_property_read_u32_array(of_node, "data-lanes", tmp, cnt);
>>>> +             if (ret) {
>>>> +                     dev_info(dev, "data-lanes not defined, set to default\n");
>>>> +                     goto out;
>>>> +             }
>>>> +     }
>>>> +
>>>> +     for (i = 0; i < cnt; i++) {
>>>> +             if (tmp[i] >= DP_MAX_NUM_DP_LANES) {
>>>> +                     dev_err(dev, "data-lanes[%d]=%u out of range\n", i, tmp[i]);
>>>> +                     return -EINVAL;
>>>> +             }
>>>> +             used[tmp[i]] = true;
>>>> +             map[i] = tmp[i];
>>>> +     }
>>>> +
>>>> +     /* Fill the remaining entries with unused physical lanes (ascending) */
>>>> +     for (i = cnt; i < DP_MAX_NUM_DP_LANES && j < DP_MAX_NUM_DP_LANES; j++) {
>>> Nit: i = cnt, j = 0; Don't init loop variables at the top of the
>>> function.
>> These days we can party like it's c99 and declare loop variables
>> inside the for(), instead of at the top of the function.  My
>> preference is to do so, unless the loop variable is used after the
>> loop.
> Ack, works for me too. I think I'm not used for having theese parts of
> C99 allowed in the kernel.


Got it. j is only used in that for loop, so I'll update it to use C99-style declaration as suggested.


