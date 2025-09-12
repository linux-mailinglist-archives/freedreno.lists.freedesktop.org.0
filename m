Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4E3B54C0F
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 14:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF0A10E1B7;
	Fri, 12 Sep 2025 12:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lt+f6//T";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B24810EC2B
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:00:59 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CBCAct019810
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8MdWDU2Uyypxys9C+gGfTrGxJ8Ztl4i13k8tb6lf2HY=; b=Lt+f6//TKAvf+thd
 4RoLaVi38xbabaR0TvVfcaC0kLc9G720+QBnDakbquJ3gwVDgPtZL2dK6bLQYssW
 kBX3Yh0xE1GeFrkJeiaYwLN/bgMSJg1WzzGP++TI98hXn7/omCxCxIK3wyluLgNk
 qtOXTqvCYOd2B69u6zogxXTGldX4SiTHSRQkgCJU0m4Vg3GZGSqL4iQl9sZUF1bc
 Jwc/LmwvppGZkvZbcE1cPrs/k6aSaDTHzzNIGuOVAliYQloikBFzK2bsOtpYWRcb
 ZTNXwzwtevqsW/AqNlTH+c1rIbGW9eaGpvTp+/15L5QeuwxdKuxfO6BxfZ7t4DOr
 U1kC8g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494jdx044k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:00:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b4e516e0e2cso341352a12.0
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 05:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757678457; x=1758283257;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8MdWDU2Uyypxys9C+gGfTrGxJ8Ztl4i13k8tb6lf2HY=;
 b=gKeWOXbejsfPCj2cYHA7dtcVniLY7U9RyGohYi01LB38gNJrPlhGu4xmthFm5nwX6C
 4KuRqFnHLXzRlftglttALhbxko3sgfcUOSO+rp+NbhN3YaTTPpaeQbFSmUKJlZJ7SqIX
 UfHcQ0/f4IJvAKHGaWaMPfUTcSWfzOR0V2JEPERgyKiZsPvTPjURPU+ua5+pKD+ZIS5K
 vY0aJzEXt5PDtMAcwuOB12CnKi6iFJHQuekQBGGFQ8iXuW4+9bOBeqjFsTma3GNAWm7W
 hEPVXuiT6ukvAZ8u/25FAlkjh5Ktk679KdhOhaxUoaKGlREP7rZ71whlfA+eN6Uyu34I
 HjVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeShnJWuPWM3rcUQHHLCD5wGqYzTI18+CmBogDReC8RLethI5Zo/M2lvvxEFjuHrUhJfDH6EWzd00=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3TrYzJRAojZnDr03pykhTNo89OEXu1Oab762lPK3OpzQ1oR1P
 qN9jKZ0ZvhH2Fa0xHFL93fb1NCwgStdtedjdELrFqOS23md46HZGaCQEiCYnUNrUO010oPDUc92
 6ZNUv/CdV4J/PkbIMaq/ESYzIlAPE3vYkWy/uuahoo07q3RRWLS0lUclaF/LrBRurBNE69DU=
X-Gm-Gg: ASbGncs+6hZymju24+T5luBNjnOaljoLZ6ceaazSSYEr0lOpQgN8qgbv7Cr3gzksOpl
 RDjS7Is+10kaAx7CJB1HPxlJNjmjraQEWe62I4XJLyYD+hUggAd/np91QjHdqnyuELgdm96C+EW
 kuHTDksFWG0CxdgTx0rPz97wHsokc390naOTTQMXIq2z7+WGOpHZYHrK6DIGMiM5ULBg5t4DulX
 mxzSfDkBllMgtYz2/UoQ3PFawdRgcvzLKj1j72U8smONsVEIKwc1X7CCXI5LiDMWmHGgGiKFbC5
 vxhGuDmTz2NgHDq5j8Tkpz9rVjNfTeRYhzPHmz3t2No4CEGdoQ9n3suLSs+VDvecrHO+jQZjknw
 tsDFwmf2GyBWmRxfs4wCreBdU7Sbvww==
X-Received: by 2002:a05:6a00:39a9:b0:772:29be:e006 with SMTP id
 d2e1a72fcca58-77611fc4e71mr1825309b3a.0.1757678456671; 
 Fri, 12 Sep 2025 05:00:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyWZ/RCwH5uoedcQ8POSwjS4P2D41yWOMHKovMkWcY5GLr2xHum8zhLBWbP5bd/3+H2e7PZw==
X-Received: by 2002:a05:6a00:39a9:b0:772:29be:e006 with SMTP id
 d2e1a72fcca58-77611fc4e71mr1825274b3a.0.1757678455923; 
 Fri, 12 Sep 2025 05:00:55 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607a48c19sm5291497b3a.36.2025.09.12.05.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 05:00:55 -0700 (PDT)
Message-ID: <11fd5d7a-e084-4ee5-9f34-2ec0481a1d46@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 20:00:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/13] phy: qcom: qmp-usbc: Add TCSR parsing and PHY
 mode setting
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
 <20250911-add-displayport-support-for-qcs615-platform-v4-9-2702bdda14ed@oss.qualcomm.com>
 <x6p3hgatsauguzxryubkh54mue5adldkem2dh74ugf6jf3ige3@cb3mmigu6sjy>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <x6p3hgatsauguzxryubkh54mue5adldkem2dh74ugf6jf3ige3@cb3mmigu6sjy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDEwNiBTYWx0ZWRfXxfLlGlvO4PRa
 jLVDFSu8HemsYffCMZhPFHDVHsil6alI3MeaxtHYzaTiOF5PpglhuTzUH1hmDyNTj71ivMfKNvM
 dPJ9vWI2TB2mP9ueavykkvQdD50vpUZkr+qt8t8znfwKTIgriEkmWVFyh/3cxC1CU5pL1NiiwGB
 p99OoLP72VGRM4e5+X4nvvHkBAYLV92fBx3mKFY30U+7o845jAIX06sK69qCcP0bsWDL/QyyKHS
 rDUKsMmDTKXWPSYpLAxVjQb4x03w8Uo7m/n5MUwwMmHOodQDdlYiDT3/rtC6gkyRjqJFqNVdbqR
 Cf90y86/YBWfLeWd3RHrvUA7OOr9lLM2qTq1Fbzrw0ZkW6M99g3S6iRpNXtlJW3FXID4kV4m5nN
 5Y4O2QoT
X-Proofpoint-GUID: OXC33KWvgVHHk8s-nF3WRvmnHGMhTfPW
X-Authority-Analysis: v=2.4 cv=JMM7s9Kb c=1 sm=1 tr=0 ts=68c40b7a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1bTgUAhQIaiSlqBNWd0A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: OXC33KWvgVHHk8s-nF3WRvmnHGMhTfPW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509120106
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


On 9/12/2025 6:20 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 10:55:06PM +0800, Xiangxu Yin wrote:
>> Parse TCSR registers to support DP mode signaling via dp_phy_mode_reg.
>> Move USB PHY-only register configuration from com_init to
>> qmp_usbc_usb_power_on.
> Two sets of changes. Two commits.


Ok, will split.


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 47 ++++++++++++++++++++------------
>>  1 file changed, 29 insertions(+), 18 deletions(-)
>>
