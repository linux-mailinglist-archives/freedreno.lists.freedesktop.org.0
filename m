Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50406BFF328
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 06:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6AD10E86D;
	Thu, 23 Oct 2025 04:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQ+U1uLq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6C410E86D
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 04:59:19 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIembZ014657
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 04:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XQsBupsL/ZgYfSlapLK2m++RVhSfbnhRHhab9RRBi8E=; b=iQ+U1uLqYOp4Bu3s
 lJccRpzeSSbEFGG6YjQMr+6EpMj1ndegmHpI0LwFtUrfekBMj67QnC2Cxrx6Sf5P
 Zwcdh3t9u0VSQOtJ4m2X3uaRSJNTnUdITfFio2yrsFmgwpuIIxHzpaAED/sb33+V
 ehSlkH/g5RYfprMSNWkz9ay2vH4j5TjY52+2AISQgpZMeYrl1hP8HBgXcwNVKTuc
 yycoCkoYUJrYy78SBFaif0NsAfEJlcDE4XiqXugLxcigqX9iuD74uGbZauoW6GfY
 zVzQ3hDCWx7Pm1RFQxS+PfycskCOtZViHPHI/b915dJVrWtY9mJ9FyR/sIFtIZ/a
 Ry5Qbg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0mxge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 04:59:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2813879844cso1068055ad.2
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 21:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761195557; x=1761800357;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XQsBupsL/ZgYfSlapLK2m++RVhSfbnhRHhab9RRBi8E=;
 b=VSlWi36WT+qeazcidnJN30vwxjRe75Tb780ml99rpxn3myHVWZXibxE6G4wNZPXLXl
 6s0J+VEjtjWO63CC2Fi/k+b0/CASqWoSZLcv1fGI55WectYGjm2l/s/nhHDmH/1Gw8DF
 i5tm47yu92c/VC919qpuo84reTrjdXpY9o9mUuIAc+1uqMuG9M+BnE4kaR1ECDZtOfGp
 NJLvjxVsbGM7ZfgLpqFyhCOZ5zJW/ANepwFxiPdRL0nHwb1uF4TMqZWlUiQKtKONUNNo
 oORLU3lrNJqhUHK83jbTz2bGg/bcNQrYNP3eFpddAOpz3JaMzmFu8I7dbMlf/w5QXvxL
 4Z0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzgPuDGXmHxS2LpU2erYqxOmQngCdlYDN004PsgdG6murd09y5hZZkFH9bl0AtnbKUA9xj3zZdNiA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5fur+v+kNr4H2mYoxHueIiXEUqsuPjKLRcR54LY0/8CnXOkkN
 manxbgvZryKQY6LnZkMSxXioucosoqv5ZvC23Cm+KwqE8pruh9N0xS/zKv+iM/mIqozEezDgYcA
 tegt9ZLgP8D2n0x60uMHgcGqzl1UCc7IDwF79VqFcIXAWaq4IEJXVK2IY5ddCwuxqT2/xCoI=
X-Gm-Gg: ASbGncvib8cbHj6yOZDL/x90Zh3PBzpktz9cGbxhQDPJHxzhmcxCImogSMGiPoOQFOY
 aLU/NlBVw7lMDez/91G8A778LVs0QZWENn1HZ52m1mRBXSxXVAzDKXYLProYj+0s4giNeW4nFJd
 7wZtpG092Cm6GqGRhebvkBxHkxjj38qJMwfi5nJqc7zo6ZIaZVj15v3RhBp4bxdC/SX8YM4M9n0
 rqYtr4XGMEZiUxhsXJg58OPshXHBfUczi/7+CRtlPiqTGFEJBi6Kg0lGVKE+wtQ8os6WRdyzI6o
 YENtPNzPKJsnVCR1kC9TH1kMXrfWhDXnWYm22SbRt3NZ17OLVhfjMVe1n0SJtGYgXV83o7NzrCF
 VPevNAEPbjPfbwuOm9j8o+Vf2Mkv3UCQSSgB+waAc+WDC1I1GFZd70f1XVZXmu+U0+L41eA==
X-Received: by 2002:a17:903:907:b0:26c:3c15:f780 with SMTP id
 d9443c01a7336-292d3fcc93amr66496545ad.8.1761195556919; 
 Wed, 22 Oct 2025 21:59:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUEUehRXXgzmp6ooEZeaoA5HTI7QxvGAGO0q2zfheB5V5ozk+j8iZVJGdKIenvQrC3QbtL8w==
X-Received: by 2002:a17:903:907:b0:26c:3c15:f780 with SMTP id
 d9443c01a7336-292d3fcc93amr66496355ad.8.1761195556486; 
 Wed, 22 Oct 2025 21:59:16 -0700 (PDT)
Received: from [10.133.33.163] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946e0f4283sm9389085ad.85.2025.10.22.21.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 21:59:16 -0700 (PDT)
Message-ID: <3050390c-3407-457f-b62c-7adee759a61f@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 12:59:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: Add DisplayPort and QMP USB3DP
 PHY for SM6150
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com>
 <20251021-add-displayport-support-to-qcs615-devicetree-v5-2-92f0f3bf469f@oss.qualcomm.com>
 <59592a3d-447a-4c99-8654-d3cb9b9f9a58@oss.qualcomm.com>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <59592a3d-447a-4c99-8654-d3cb9b9f9a58@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX1hvaMfOsU5tl
 lkGg03ZJQ/a1ZOngLUlgrLOBD4a8DDUGn6LLdSYnqJ6h2/wh/XLl76/o994nRjPfQxYXAvs4l7f
 ySxUUfu3zzImUk84Pr3fMrZ2zAIXrxbxaznAUXNsw6Lip5aAXD25gZVG8yqH4eZVxr/tq27TvmV
 mSzD9PM26H1XssjDEgdzsLIZW55pou0aYeeq2mriw9pM2AsTKJj5gcKdIZCZMOB+J4BRvxkpaGW
 Ot5pUNqfXTiqDXcMTY3md79YLWJXmZLy2LY+UT0camVxO7IAURWnBRUsCKqvEgLI0mMzmVo8ypl
 B8Wt+nRnV/WbgMeVxzI3ICQNLch6mslV46cKR9F6glbc+Kmi02lh1IGJezZZVuUujiPyVcfDo6r
 qqSCTM1QpOPf9ud8z2R01Kyel/NY0A==
X-Proofpoint-ORIG-GUID: xqfw76RjDluTxW-38D-wfsLCU-1EBiT9
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f9b626 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Y0hPKdM277UiO7HlCU4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: xqfw76RjDluTxW-38D-wfsLCU-1EBiT9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167
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


On 10/22/2025 10:53 PM, Konrad Dybcio wrote:
> On 10/21/25 5:18 AM, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> Introduce DisplayPort controller node and associated QMP USB3-DP PHY
>> for SM6150 SoC. Add data-lanes property to the DP endpoint and update
>> clock assignments for proper DP integration.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
> [...]
>
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +						mdss_dp0_in: endpoint {
>> +							remote-endpoint = <&dpu_intf0_out>;
>> +						};
>> +					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +						mdss_dp0_out: endpoint {
> Ideally there should be a \n between the last property and
> the following subnode


Ok, will update.


> other than that
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
