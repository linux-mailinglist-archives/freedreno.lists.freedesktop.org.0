Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BC0B905A4
	for <lists+freedreno@lfdr.de>; Mon, 22 Sep 2025 13:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDDB10E42A;
	Mon, 22 Sep 2025 11:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="n1nb9aYO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659DB10E42A
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 11:28:29 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8vCri010120
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 11:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vhPS2DpVO5rMmjT/67K3Kgtn22q0loN6kh/+0Y18da0=; b=n1nb9aYOq3EyHaOj
 c4UBjNTgHUM9vgFrThXaqHS1hfPu1iMbOUHCh6iKl/L1F1Zcaea+R2gwTtejObuc
 SOY3KNd1R+57NuGeHMOfpZ9wsghm0SlG05acoIW55/VOhHnL/SLGyOa4VOTv2/ac
 7HBMVoFFCaO7kvHLd2mLRdLYF2AJbRlpUA5L9VYsKJD9Zk5dbm1ORIDPBah/zBZq
 Dx6AJ3pO1SPme64NP9ZSHL9314yOKJW5pBmmiZuthVX6xzJRcTIorD9Z6uGcvH/t
 zu9TTWsxcV33O4NULgx1A9R5fFDtfujo1aS6CsNhVnOYA5uo/Uyy9uMmRtM4pUxI
 fM7q5w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnmttc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 11:28:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-25bcad10907so8577485ad.1
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 04:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758540507; x=1759145307;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vhPS2DpVO5rMmjT/67K3Kgtn22q0loN6kh/+0Y18da0=;
 b=v+F5OppB42zLTT/8U2FXCQ842KuUWSk+dDAC+PFKIAelm7y9Xn36CH04H11VYUi6W3
 nRLEa3W2mLQ+0Sr3SvyeLL8FbCbIM/hBmvsv1gd7TzhB/i/PHAh22KO2fuLJ8FcYUwV7
 RjWhWaYpX582MzKqB8nE0ZSdCtPgT47cRU6SvReN0TboHO7KAdH6JG6fKannAwm7uv6u
 Q0KKiLcGBgx9DQjWgMkf4Lc8zN5c2gCi+nhUz0R+JvmKsu/X290Y+Xcn89QOOBoRB2Wx
 oj4+cYstdgEuceHTLEcy+HaNxJ7issz1USRO5lGTq1mHF7cuHfekIOjJh+GxmR6yaNHF
 hJvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkW4JufZGB+6EoEHXq5rhSlrBIAP6hBLHFtDjhuBR4im+YNhTzBsF2knhKgdhKiLcsMZhp1CZSRSU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzp0n/v00uJ4Rzn6yBmmjstqc7ICnH/Ml0acGJ/2R1CeXS+sgZN
 Dfr1VLtrza0Yd+f0+aJ7PRcFkl2FmF/dfPJqOY6eW1+FDieUUW6QZeMzpvRpW+QeVP7GPPXGY7a
 +A6lEldiZQn76X975a9ilHkkqCis+Kftptfk9Uk2D/7cZ7ikDqonhp/LNhcig35E+B4DUCL0=
X-Gm-Gg: ASbGncvfdMxxvNpI/Itvgu975zkf7LYCU+VW7n+ZJDFdECJZlUj+ihB0GRQN8IeA9jN
 Bt9zpsdyfS+twUtWbW9SkA1Sywra4/070fIuWhcFOJRk29tlD8pp8pZANxIIOrELpiMYAZ5tn7F
 EAQSUDFctTMrT5vADfiJegsyFhj6RkT4VV19Qmxotv2o3L+7movKqg06XWZgP4yyGuLMKe85G3/
 UIvvj4UTi+PF4E9vcqt97aL+y5hRuQGyFyzeAcZ88qjBxxLYEz8Zk6nCyS3AaqbPTF+3EYj5d2U
 MlXUdjSaZ5y7FOTXa00KIurkIo61MFsBUW4yggCwl1Om+4c/ZvhXXUnoPMVC4DXXrrrg+GqXsId
 QgFcpalJGEtp8vM520VTrwFME+h4GhqqQ1fI=
X-Received: by 2002:a17:902:e751:b0:27a:186f:53ec with SMTP id
 d9443c01a7336-27a186f5486mr11582535ad.9.1758540506956; 
 Mon, 22 Sep 2025 04:28:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbTTlEoreUEOX6AkaJ7bnWs6eRBLiaiABm7kGf/pBZ+bhPDPXyhXj4EX3Eva+nVibdWRmp5A==
X-Received: by 2002:a17:902:e751:b0:27a:186f:53ec with SMTP id
 d9443c01a7336-27a186f5486mr11582105ad.9.1758540506290; 
 Mon, 22 Sep 2025 04:28:26 -0700 (PDT)
Received: from [10.133.33.111] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3306061925esm13230568a91.2.2025.09.22.04.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 04:28:25 -0700 (PDT)
Message-ID: <28eef277-c778-4ffe-94c6-2e90d58633de@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:28:17 +0800
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
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <2ewxoe76rrii4w3n5b6wl32vmatcp2boj75o65cuq5nx4f2a55@7cn6m7oxzu6c>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d132dc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XVeZa78dugChcG7OFuEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: HGEWUW9j6iChl3cDnpK52AuvAuDC-eYV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfXyH3ofQGazU+f
 Zx89WEjhmF83CVq5QJ4BB2huMaIvAmehNjabpWt2ACV72FzoPNVDzrFqvMQ+JFtRebrdpsYHOMl
 gAAhQ/LCbluIJbqhubQl8PFvVgBLfQZGOoUi4aLE9xwC9Rn1M6UBIMEsp99Z8ZEX+7F+OO8NDSn
 HSuDkspJtrXy5R1Ka+OwiScgZTBWQJRJrtAAz/S51lAhbp+pwpxOFPCz93ew2eaue1KaFkHpy20
 I7o54B347vVEIFq9humjPETeDi8dInWyw781pD8TFPenBVRZlBUkop72lX1bjLrPFpLB2kjTZ4A
 K9YUT4xWParhFt9CnGniHCtddoKCD/gaqx23hEZOBdCB1eHomRB9QAPN+8j+vReXONSgbmMd6Y/
 d7RU+c80
X-Proofpoint-GUID: HGEWUW9j6iChl3cDnpK52AuvAuDC-eYV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000
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


On 9/22/2025 5:45 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 22, 2025 at 02:58:17PM +0800, Xiangxu Yin wrote:
>> On 9/20/2025 2:41 AM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 19, 2025 at 10:24:29PM +0800, Xiangxu Yin wrote:
>>>> Add QCS615-specific configuration for USB/DP PHY, including DP init
>>>> routines, voltage swing tables, and platform data. Add compatible
>>>> "qcs615-qmp-usb3-dp-phy".
>>>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 395 +++++++++++++++++++++++++++++++
>>>>  1 file changed, 395 insertions(+)
>>>>
>>>> +
>>>> +	writel(0x3f, qmp->dp_tx + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
>>>> +	writel(0x10, qmp->dp_tx + QSERDES_V2_TX_HIGHZ_DRVR_EN);
>>>> +	writel(0x0a, qmp->dp_tx + QSERDES_V2_TX_TX_POL_INV);
>>>> +	writel(0x3f, qmp->dp_tx2 + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
>>>> +	writel(0x10, qmp->dp_tx2 + QSERDES_V2_TX_HIGHZ_DRVR_EN);
>>>> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V2_TX_TX_POL_INV);
>>> Are you sure that these don't need to be adjusted based on
>>> qmp->orientation or selected lanes count?
>>>
>>> In fact... I don't see orientation handling for DP at all. Don't we need
>>> it?
>>
>> Thanks for the review.
>>
>> I agree with your reasoning and compared talos 14nm HPG with hana/kona
>> 7nm PHY HPG; the 7nm COMBO PHY series has orientation/lane-count dependent
>> configs, but the 14nm PHY series does not. On QCS615 (talos), the TX_*
>> registers you pointed to are programmed with constant values regardless
>> of orientation or lane count. This has been confirmed from both the HPG
>> and the downstream reference driver.
> Thanks for the confirmation.
>
>> For orientation, from reference the only difference is DP_PHY_MODE, which
>> is set by qmp_usbc_configure_dp_mode(). The DP PHY does have an
>> SW_PORTSELECT-related register, but due to talos lane mapping from the
>> DP controller to the PHY not being the standard <0 1 2 3> sequence, it
>> cannot reliably handle orientation flip. Also, QCS615 is a fixed-
>> orientation platform (not DP-over-TypeC), so there is no validated hardware
>> path for orientation flip on this platform.
> Wait... I thought that the the non-standard lane order is handled by the
> DP driver, then we should be able to handle the orientation inside PHY
> driver as usual.


Yes, I have confirmed this with our verification team.

For the non-standard lane order, handling flip requires swapping mapped 
lane 0 ↔ lane 3 and lane 1 ↔ lane 2 in the logical2physical mapping.
This is a hardware limitation, and with the current PHY driver we cannot
propagate orientation status to dp_ctrl for processing.


> Anyway, please add a FIXME comment into the source file and a note to
> the commit message that SW_PORTSELECT should be handled, but it's not a
> part of this patch for the stated reasons.


OK, I will add a |FIXME| comment in |qmp_usbc_dp_power_on| and update the
related commit message.


>>
>>>> +
>>>> +	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>>>> +	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>>>> +
>>>> +	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
>>>> +			       status,
>>>> +			       ((status & BIT(1)) > 0),
>>>> +			       500,
>>>> +			       10000)){
>>>> +		dev_err(qmp->dev, "PHY_READY not ready\n");
>>>> +		return -ETIMEDOUT;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
