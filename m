Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA6AB8F339
	for <lists+freedreno@lfdr.de>; Mon, 22 Sep 2025 08:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD7210E077;
	Mon, 22 Sep 2025 06:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hihU5vLu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C742610E077
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 06:58:28 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LNC9fZ025551
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 06:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4Y6J0JvZHZTyvNJ+YjUFLmgs0dQUdIkfQWhpixwMQlQ=; b=hihU5vLujTq8+L80
 Icsn6E7T6N+IaKbEkE4Wcozq/6of7Tg29DDnlCkpObJjZ6uhOhlgf6q9M7xjsJ+o
 eXMT/Fa4AM8pvf8sIEutFQ9UBw4yKbEl+UVJECznaYOxqd/BldofcAwj8h2UZvuQ
 TONAwpwmX3/TLT2H3aySHyxlPnJLhGThbxP0X0acwezvkyZIXwxuv1i+VMDAzZsZ
 Bvf6bUX46PMoBANDm3nbbKIpAXANZlSdvCrHUbQtDZJ6enK7XW/jG/b3qIdGuPu3
 +Vfp/2TJIwv8hPd63wue22DMQnNjT3MJ0N03Lb6h4zJaLkVxen2mcIvMZc98PYlW
 2XGrDQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mbv3mud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 06:58:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-26970768df5so10057135ad.1
 for <freedreno@lists.freedesktop.org>; Sun, 21 Sep 2025 23:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758524306; x=1759129106;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4Y6J0JvZHZTyvNJ+YjUFLmgs0dQUdIkfQWhpixwMQlQ=;
 b=ak8TJDHsy1+QYsnbWu9vNMFWsKGVbYpLZcHOkuZvNoARenQ4E/Ui+L1X7KGJ6V5H5X
 RjqiPj6wZ+ZE03WfxomV8dEz298TQXbeJPRRYASDbL5YGxmWgGm+i0TWBk1XCEB3JmEX
 2vPkMhnfFOYgAIb0DwIUMQSoEHcdunAep+83N8YAvmY2kTHTyymRPOAJ223KsLxoqzh/
 bbpPYUS7GZvxrFOM+HhORVMW5LKMHar6zTU4v1/q0cV5SrTKMeHK7Hwjw0/vSD4VIOuV
 1FT7PKIqB9S2WmUeHSrwi1g0rXnz/prI5JKdr6mkw/S4Xm+3zT78Vw2plVugi627yfAU
 mS5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKYxUZR8q4OFPJd9sR0cYquZoWL8kB+GyN5IWYwJqz1pIh903bzVl+D1tKmmpq3fNuZ6cWZoKDIP0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjvORtfaSMnPE6469VyLTUzz6mCKN+rWzmZAD1lnLzSWYq1qDU
 vyHR78S4JhMQsp7vhfQhzmL2nZ+W1oQc+jGFYn2k8Oph27X81q4ryhYe8ze2B0bGVdAmkYrsKlf
 44lwdQhNqYORX70oN+yURLg7IT7YpRHvLrGQqVFTRzBT9VuVmCfcl2KqEGdRlcFY16wPet0g=
X-Gm-Gg: ASbGncsxMssDMUI8qrxqhH2H9RNc33DdIuhlqvbH8H/AUMHlJ0walIIbtRRaC7M0EaG
 p0AGoYDtMRNDpomkWT4F9Yho9fnhX9w41aHr2SMJzFZgTE4rP9lzRWgxamc+UwtKGanmrSFDPOx
 JNPgsJqTH2ZTi9IX45aAAzmfzVPnj1Z7hdK8pxtxQj81v1igOhqYcaJl8M0PMHMYhJ6i678QLEf
 6B8cyGBV+Nqc1NaIXjSi2iYP6yuYBbYqFDQaD4vQfBLPhheGgcRrf0lMQ7lkQjAZRxyd1+Pp4RY
 35IUG4GDu9ZZ6dJ7xAawNrhKcztOQxzO4UwaKO1Do7fxJzI4hymgQDtfI+8NLCa+nAjTzKfAu8q
 iYshiG8twzUAunzBe21KiRsQ0kZmQ41jykw==
X-Received: by 2002:a05:6a21:32a5:b0:266:1f27:a035 with SMTP id
 adf61e73a8af0-292762e34e1mr8296809637.6.1758524306367; 
 Sun, 21 Sep 2025 23:58:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOnFw/Aim0P+Z+Av0f4nHGRdPopw7vSUWV5zLElAHa1cdJ6EyoyUbPMlHQZWh/gnjmhtMsIw==
X-Received: by 2002:a05:6a21:32a5:b0:266:1f27:a035 with SMTP id
 adf61e73a8af0-292762e34e1mr8296796637.6.1758524305726; 
 Sun, 21 Sep 2025 23:58:25 -0700 (PDT)
Received: from [10.133.33.87] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b55138043b6sm8998663a12.26.2025.09.21.23.58.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Sep 2025 23:58:25 -0700 (PDT)
Message-ID: <14cdf3a4-714c-4136-8c1d-99392e7911f5@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 14:58:17 +0800
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
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <bfpgktxgo2hb6dpzy3i7jdr6w4de5boorx4n6qeapct2vre4sn@4z2mnppridn5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZcAdNtVA c=1 sm=1 tr=0 ts=68d0f393 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JsSO4BFUhKJy4KAi8vwA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: SgdRDrRXEs27ZZ5AyiO_v4CH60FnfEla
X-Proofpoint-GUID: SgdRDrRXEs27ZZ5AyiO_v4CH60FnfEla
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMSBTYWx0ZWRfX03opKYg1MXsq
 mYpzcG10YBIVJwXgkQhmbOKlluyf7bif2X+E5S/AL+uVHVCK1CW5YB7ExS0z5sDP9RiLOxHTNxp
 g5f/H7aCshzN98S//vyuYUIlkcjtfv8HFnrxtyJ5OjlxhhjXF87OwelGUkol+4RtJ9ol9Y3erpA
 0aTEJRGvrYRpXxOozsKbSv3xyA7M2tQWGsdiG7jgjRzLyGyiDiVa4JovhyyNJq7qiHFr3aiMme0
 Js1KsaoiDW/WVhsxwFdVsFA7rpHGehXI0yqKmm1Nl/7qiJLK6q5b0j1jQWoT51OUNk7j/LPrMvF
 TpeyGLhre5TiADfNeQOIr2JoRG+IZfgdojY2qS58tl3/BUMM+HRgJ49IidbA9i2Kg+L9DDcqyoR
 D4Hr3V7L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200031
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


On 9/20/2025 2:41 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 19, 2025 at 10:24:29PM +0800, Xiangxu Yin wrote:
>> Add QCS615-specific configuration for USB/DP PHY, including DP init
>> routines, voltage swing tables, and platform data. Add compatible
>> "qcs615-qmp-usb3-dp-phy".
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 395 +++++++++++++++++++++++++++++++
>>  1 file changed, 395 insertions(+)
>>
>> +
>> +	writel(0x3f, qmp->dp_tx + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
>> +	writel(0x10, qmp->dp_tx + QSERDES_V2_TX_HIGHZ_DRVR_EN);
>> +	writel(0x0a, qmp->dp_tx + QSERDES_V2_TX_TX_POL_INV);
>> +	writel(0x3f, qmp->dp_tx2 + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
>> +	writel(0x10, qmp->dp_tx2 + QSERDES_V2_TX_HIGHZ_DRVR_EN);
>> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V2_TX_TX_POL_INV);
> Are you sure that these don't need to be adjusted based on
> qmp->orientation or selected lanes count?
>
> In fact... I don't see orientation handling for DP at all. Don't we need
> it?


Thanks for the review.

I agree with your reasoning and compared talos 14nm HPG with hana/kona
7nm PHY HPG; the 7nm COMBO PHY series has orientation/lane-count dependent
configs, but the 14nm PHY series does not. On QCS615 (talos), the TX_*
registers you pointed to are programmed with constant values regardless
of orientation or lane count. This has been confirmed from both the HPG
and the downstream reference driver.

For orientation, from reference the only difference is DP_PHY_MODE, which
is set by qmp_usbc_configure_dp_mode(). The DP PHY does have an
SW_PORTSELECT-related register, but due to talos lane mapping from the
DP controller to the PHY not being the standard <0 1 2 3> sequence, it
cannot reliably handle orientation flip. Also, QCS615 is a fixed-
orientation platform (not DP-over-TypeC), so there is no validated hardware
path for orientation flip on this platform.


>
>> +
>> +	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> +	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> +
>> +	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
>> +			       status,
>> +			       ((status & BIT(1)) > 0),
>> +			       500,
>> +			       10000)){
>> +		dev_err(qmp->dev, "PHY_READY not ready\n");
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
