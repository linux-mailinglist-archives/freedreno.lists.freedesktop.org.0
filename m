Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EB4B94262
	for <lists+freedreno@lfdr.de>; Tue, 23 Sep 2025 05:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8132C10E549;
	Tue, 23 Sep 2025 03:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mR0xTMk7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC0210E549
 for <freedreno@lists.freedesktop.org>; Tue, 23 Sep 2025 03:48:40 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N1RBA1002396
 for <freedreno@lists.freedesktop.org>; Tue, 23 Sep 2025 03:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2tzkEhv21yTBLeb655r/JRLn+hEu6MSXtvaBf3prN/k=; b=mR0xTMk7SYm1YjCV
 WkPMqhpmOqIXsElhJzbZ7XVz/ATIzxT1wf+Mp2nHpYBOQtv5GqqYlZEZnNjyMMDg
 aoErKwfUe+1uuEYXWKMXU5vH2/HJuXe7Yeyr4C54NJ9UakD8DwoSl1SUyH3m3Ish
 gZ9xpv87yBI+jo4DGggh54wuhBTnyEbdM4vymCLSz6KDnDaJSgonExwBYMSAP+iY
 3ihwjPNdcv2haCwKexoWhhKFor12Bgv+JpnpatS9XkP+tGyoB95DWNj4lholDFl1
 LfwU/5/n559eoA9pMByq0sjByOob47xx94qh1roNBcvVROJMH45FqkJ3IqVx5jRb
 7Q2Piw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjrap2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 23 Sep 2025 03:48:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-26970768df5so12041215ad.1
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 20:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758599319; x=1759204119;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2tzkEhv21yTBLeb655r/JRLn+hEu6MSXtvaBf3prN/k=;
 b=Jf+YWcGenAqczU9Gql/yZ11dTUj4W+DsllzJv9ngLvzoHfnrTUGzoiAgrsSEdRJRHE
 MQS4Np0ap8MKxyTXqRBXfvwe5MvkjYMfnRfQt0NoYXYpez+kmcUWgRMQU8Q6f6Sw8FEQ
 RsOYOC8oyNaxbMfl8ayrxwECmt7edHVd+efBiWA2HchOQ9k8EGvdvKAplycU2Ansq+yw
 5rvwf5FXhUGTvOY+5aKTtUvhkuSyvteZcO8t6qYnhprcn0WwmZiTdRfh+jA10XqDN0jT
 VQrXmKSj3CUskDW3/ZFGhvpfx8Wmw4FpmTd51nlunElejlh2PUyoyd8RfJOk7OXYhXmT
 BlkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOD3WMcZ6R9BacYaqDG72Cx/CoG71+CG4vRHrOvGC22fRtziFqnLrvkSG3qnTjz43pNEvLJizbQQ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz67YSg8hHZlfde+n7ZRDsRZK1qi4D/owEfU18GX//NhTWg/NiW
 V3g0AEHWZvBOzOBk64re6lYN36t6Lmy31gyMXV7SujMZRRcFF3qo/Wl0HigJp8hxlXqJC4xK5P1
 jTvmr6Ja87t9tSZfBAjMbXrmGdtMI0XkZVlvPPWsY0QYYblXFx7BbnunizMOB7a6RJk0WxEc=
X-Gm-Gg: ASbGncvhPlRYfo4bMyE9PULREyh8OndFEEScPqp6ix4Qmld+sfG8qfKAntrC96vEepJ
 kQM6VtAEINb/ItC1Lyt0g7WfW+nTSA9gCr4Q6c4TSWCKkEwJIeqUXFQqvBeKg6TJGZg4zeRc4B2
 D+KFTzQk7+Q3A2C5sg3UduGqlU17nBZHRxPIDgXpuu+vqjObXBYtF8/zRGbAkhckZvPgO07UdNQ
 YS8DqO9ouV/3cAWwarcpc7Yu8CK4NvnACfRaZ/x9ncjFRF8s7ZIMdo0BtzepNVZiREqDtHe3lVN
 amZoZZxn0FvdHvTu0f/Yq8s2ovU2RYn7MqdI1z5Mp3pvG65CNuUO2+zkGsmc1ET7/27Ekw5f7bn
 jaFsqLNOeA9+2bYTp+PrI9XHzxTCruqA6zZw=
X-Received: by 2002:a17:902:cecd:b0:26b:1871:1f70 with SMTP id
 d9443c01a7336-27cc3ef18c4mr7163135ad.5.1758599319024; 
 Mon, 22 Sep 2025 20:48:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuGCVKMlhrcuNyLUyo+F4+9Dcxv31AiSgDCtjDNN8GbHcs7dWnyk69V9F4hUnIXmzLqt7jMw==
X-Received: by 2002:a17:902:cecd:b0:26b:1871:1f70 with SMTP id
 d9443c01a7336-27cc3ef18c4mr7162965ad.5.1758599318561; 
 Mon, 22 Sep 2025 20:48:38 -0700 (PDT)
Received: from [10.133.33.111] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698016bea0sm148159875ad.40.2025.09.22.20.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 20:48:38 -0700 (PDT)
Message-ID: <83e8c8b6-fd2c-41f5-8732-703d47764d0f@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 11:48:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/14] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
 config and DP mode support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
 <20250919-add-displayport-support-for-qcs615-platform-v5-12-eae6681f4002@oss.qualcomm.com>
 <bfpgktxgo2hb6dpzy3i7jdr6w4de5boorx4n6qeapct2vre4sn@4z2mnppridn5>
 <14cdf3a4-714c-4136-8c1d-99392e7911f5@oss.qualcomm.com>
 <2ewxoe76rrii4w3n5b6wl32vmatcp2boj75o65cuq5nx4f2a55@7cn6m7oxzu6c>
 <28eef277-c778-4ffe-94c6-2e90d58633de@oss.qualcomm.com>
 <bonlc3rnfizezrobyuazv2cmyu3hqqck7tbk2g5ryln24eiwno@jxsz2rg2dyex>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <bonlc3rnfizezrobyuazv2cmyu3hqqck7tbk2g5ryln24eiwno@jxsz2rg2dyex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5rGQP_7r5DYtTnZlw0UDt7-BJnIovhSM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX7Y76PlrmiVwx
 nKv9DufJpfJVCNMr3NhgqJMXA+KDe7lFC0NUCykO4fB2KByy/uVRpvmXJtcgT8CL78HscBdpg1f
 QeUKr8VHdPlGyvcdcCtZ1LxG3INUH+MrT5p0c02qa8Z8IIJIn48pkLfdQln9x/4uXyb7bRDsCU8
 +FvnJT5MuVjnoz1OVGbpLSjITs7bKHwwfGKV5i/joxcQYb730FfiJbO3EU/ep8lXpaGy237bm+L
 9YMOoGi0y4+CTzRi9BS5E0PD045BsqusPlEl/ZOzkVWdARS7Z5TNSYUcDyQcAs80YHbamVIgHue
 zRY25/O7r4BfeIjjzLz2pF58+61xwMTC/ww7DZskIj7Kr9lpg67tfpMi6HATKbfDyChPbJ8loD2
 4hep6XcT
X-Proofpoint-GUID: 5rGQP_7r5DYtTnZlw0UDt7-BJnIovhSM
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d21897 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=NbDaqmtucRuFR4rafzwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
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


On 9/23/2025 7:38 AM, Dmitry Baryshkov wrote:
> On Mon, Sep 22, 2025 at 07:28:17PM +0800, Xiangxu Yin wrote:
>> On 9/22/2025 5:45 PM, Dmitry Baryshkov wrote:
>>> On Mon, Sep 22, 2025 at 02:58:17PM +0800, Xiangxu Yin wrote:
>>>> On 9/20/2025 2:41 AM, Dmitry Baryshkov wrote:
>>>>> On Fri, Sep 19, 2025 at 10:24:29PM +0800, Xiangxu Yin wrote:
>>>>>> Add QCS615-specific configuration for USB/DP PHY, including DP init
>>>>>> routines, voltage swing tables, and platform data. Add compatible
>>>>>> "qcs615-qmp-usb3-dp-phy".
>>>>>>
>>>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 395 +++++++++++++++++++++++++++++++
>>>>>>  1 file changed, 395 insertions(+)
>>>>>>
>>>>>> +
>>>>>> +	writel(0x3f, qmp->dp_tx + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
>>>>>> +	writel(0x10, qmp->dp_tx + QSERDES_V2_TX_HIGHZ_DRVR_EN);
>>>>>> +	writel(0x0a, qmp->dp_tx + QSERDES_V2_TX_TX_POL_INV);
>>>>>> +	writel(0x3f, qmp->dp_tx2 + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
>>>>>> +	writel(0x10, qmp->dp_tx2 + QSERDES_V2_TX_HIGHZ_DRVR_EN);
>>>>>> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V2_TX_TX_POL_INV);
>>>>> Are you sure that these don't need to be adjusted based on
>>>>> qmp->orientation or selected lanes count?
>>>>>
>>>>> In fact... I don't see orientation handling for DP at all. Don't we need
>>>>> it?
>>>> Thanks for the review.
>>>>
>>>> I agree with your reasoning and compared talos 14nm HPG with hana/kona
>>>> 7nm PHY HPG; the 7nm COMBO PHY series has orientation/lane-count dependent
>>>> configs, but the 14nm PHY series does not. On QCS615 (talos), the TX_*
>>>> registers you pointed to are programmed with constant values regardless
>>>> of orientation or lane count. This has been confirmed from both the HPG
>>>> and the downstream reference driver.
>>> Thanks for the confirmation.
>>>
>>>> For orientation, from reference the only difference is DP_PHY_MODE, which
>>>> is set by qmp_usbc_configure_dp_mode(). The DP PHY does have an
>>>> SW_PORTSELECT-related register, but due to talos lane mapping from the
>>>> DP controller to the PHY not being the standard <0 1 2 3> sequence, it
>>>> cannot reliably handle orientation flip. Also, QCS615 is a fixed-
>>>> orientation platform (not DP-over-TypeC), so there is no validated hardware
>>>> path for orientation flip on this platform.
>>> Wait... I thought that the the non-standard lane order is handled by the
>>> DP driver, then we should be able to handle the orientation inside PHY
>>> driver as usual.
>>
>> Yes, I have confirmed this with our verification team.
>>
>> For the non-standard lane order, handling flip requires swapping mapped 
>> lane 0 ↔ lane 3 and lane 1 ↔ lane 2 in the logical2physical mapping.
>> This is a hardware limitation, and with the current PHY driver we cannot
>> propagate orientation status to dp_ctrl for processing.
> This might mean that we might need to make DP host receive mux
> messages...


Yeah, downstream handles this by passing orientation and lane_cnt info via the
DP_PHY_SPARE0 PHY register. But even with that approach, dp_ctrl would still 
need access PHY address area.

Let's see if there’s any follow-up on extending this in the future.


>>
>>> Anyway, please add a FIXME comment into the source file and a note to
>>> the commit message that SW_PORTSELECT should be handled, but it's not a
>>> part of this patch for the stated reasons.
>>
>> OK, I will add a |FIXME| comment in |qmp_usbc_dp_power_on| and update the
>> related commit message.
> Thanks!
>
