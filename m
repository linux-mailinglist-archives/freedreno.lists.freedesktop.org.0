Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 743F9BDBFD8
	for <lists+freedreno@lfdr.de>; Wed, 15 Oct 2025 03:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E503810E6C7;
	Wed, 15 Oct 2025 01:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkHXfgjX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4813C10E6C7
 for <freedreno@lists.freedesktop.org>; Wed, 15 Oct 2025 01:35:20 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKRtMs017110
 for <freedreno@lists.freedesktop.org>; Wed, 15 Oct 2025 01:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 k2n5J3Jvlq5ovhLn5DGN5KkteKpvoUV0qo2PgJM6Fp0=; b=WkHXfgjXNdO/iuhp
 iSWmUM3w50cjnd4o7FH7Yc7dq20uzSaIAHKnp766ugBFJbUpt/i+WluFzWTu4wWp
 IcY1HybFxkhHF2Ck2kRyeljJhsliSzo/gkQe66b90M15G9LdbKmJSVU+ypnmvL7K
 01DcAPUvK6sSRvTnOIrZ3M2NwYI/fjUR2P7yMWXVmsohrFNApmm39hsqnGdjl+3t
 80PL6jhZGrbor9cqVMql3jDzipq6lT4iRFhUNOAzVDux4vW49Aj3Y990UlOOQUmy
 AQwd/2H2aETVxO1u6lr2RBDXcc+Q4My+zdZ9bCQkRgS4uR4+zampQ/zvEN9t0STt
 T7zupg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c2jqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 15 Oct 2025 01:35:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-33085284badso1987098a91.1
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 18:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760492119; x=1761096919;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=k2n5J3Jvlq5ovhLn5DGN5KkteKpvoUV0qo2PgJM6Fp0=;
 b=rrN8zko2HPxO48d7qYN4HY2VKpKsBgopYLn9GgslI3hMifqdXmFfAtTFS9rju7X8uK
 P+mPxBr/qSEffNxYr0L3yHDM1iLuaDG2lDnQeJCQY3pGQ5rgTQdEbqKKrO23N7eyYr6Y
 9MUd4BJUW36VlXmP2JvDN2Leho3zL1W8v/ZQTJnOh4pYgRa/IjIGhVyUx87zgz4lNA3N
 59wq02IuJuquJOkSZBnw2pmL9os7YMRmK9GFP6nQTKV74fNCiBVnFkdlvse/WycIUk8s
 mSWCU/WHZ4PvWtVRlFGpJGTOyxxsy0wM8pA6HqE616XHwl42chuvGfVLJ+YC6gXKcAIh
 /rJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkrYh/1L21a1GAaW/ywfolztdXTcvFcpnjr8ksOysNTm11JEBmZOV+uD3YDlUCsNnlPINM69lAJt8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdDvqvq5ylh8ILnk2TurD1Rb6kpUniEKLE9/wdVosU9e4FsMQK
 pt8lDMcSf/kwRxFMtxaugVVjkWmSrJwtOLA3WW9DVe+/u9A79RfhA6Evm0xo3wwPHMBJH9AA7Kn
 RCiVcKK9CCmM2QBpfEforql6f4u3bQUL4aOlF0Ndgs28TY2f8g08yTC+6OA6szUgphDzoxeU=
X-Gm-Gg: ASbGnctKCUxHqxlt+YBuU4+sJns1FSIvotBNcxDQaeXz719afHkr72E7f/5Dq++laAW
 XexQSLQCXAXmSz3XzEYsRK22XAopLkM7f2zVuJ2bdEMA0CsnQJH4UkP7eHYO00loVYjFvEhM7IO
 m7LZmLF5VsqSYLhMP7AZRJ2ZsJlSUmpnPlfhGp/1+iapUBV/N4ejhtIwqobC80oN2No7BmywClp
 ZN4cy/A7Toe+oxczPx56orDcovSIpiOXvbOVdrpk3ZgdyrnFtJBmE1lEAwczGxqkKE7qQzqrl9R
 UlKmyd8cebSCb5v1t6425MZMTdfilO+dXVW9zf/0OiB/34P5UFiJr4Pv5C64sD0SmJ8ovbAiLw2
 SQAuK47XKo2HKNygraohGnQAtjXx9lkVgeUI=
X-Received: by 2002:a17:90b:1d10:b0:32b:dfd7:e42c with SMTP id
 98e67ed59e1d1-33b95dfc275mr970066a91.5.1760492118740; 
 Tue, 14 Oct 2025 18:35:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHc+CZt0xREG6/4LPwJm/Rd0O6qubFBGwHV4l8y5dMCUoHmdZH14Lg5AhY6jiw29nPPSwGWyA==
X-Received: by 2002:a17:90b:1d10:b0:32b:dfd7:e42c with SMTP id
 98e67ed59e1d1-33b95dfc275mr970028a91.5.1760492118252; 
 Tue, 14 Oct 2025 18:35:18 -0700 (PDT)
Received: from [10.133.33.159] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b678df7e1d1sm13305597a12.40.2025.10.14.18.35.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 18:35:17 -0700 (PDT)
Message-ID: <fb83f6b4-019d-4dca-86d5-87ed018153a3@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 09:35:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qcs615-ride: Enable DisplayPort
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
References: <20251014-add-displayport-support-to-qcs615-devicetree-v3-0-74ec96ba8144@oss.qualcomm.com>
 <20251014-add-displayport-support-to-qcs615-devicetree-v3-3-74ec96ba8144@oss.qualcomm.com>
 <geh3pbatv53bnk2zgyalnwvumvcsqaz6n7x6dniohsfk7r56sq@mpflfuye62ly>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <geh3pbatv53bnk2zgyalnwvumvcsqaz6n7x6dniohsfk7r56sq@mpflfuye62ly>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6ZAGDVIIhee_PmtceDwTw1N5zm4qBjxX
X-Proofpoint-ORIG-GUID: 6ZAGDVIIhee_PmtceDwTw1N5zm4qBjxX
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68eefa57 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2THbcKMbQ0HsdItsycQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfXy3NIdsv0t3aU
 znUK88B+66j8G4ha2tB8gkC30GU8DAUVRAXgTRg09zeplinS0szgvMnmryXdlo2nlWTQbzVKUaY
 u5NcDNQaWYSXxygsQDFJl9C3qLoAQhoF1appt6oLdexGeHbeYmxybgjfmQqjLqSbYgXHIUjucN+
 yzJr2+wnhb166e0Eh/6E9cluDlilWWuVL0sw8560mmnB+kbJhDm7uYfURRGDkk3Oe1PFyFN0wRm
 mGcp1vGI5y/PsaHc8l5fftKABQSfapTPbnsWAf57GBj/cEPNLE7OpoUCapRKY7nngIU4TdtKXbZ
 wtMhxtsdzJO5gYm5sPhTBi5oUGXPWeGaT2llYuhVcon1YaXy9266KagQD93P6r9S9kcLHv2heQ0
 I+3nbDrBpH+BrEzTk4GjEXm6b67svQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022
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


On 10/15/2025 6:16 AM, Dmitry Baryshkov wrote:
> On Tue, Oct 14, 2025 at 07:54:56PM +0800, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> Add DP connector node and configure MDSS DisplayPort controller for
>> QCS615 Ride platform. Include lane mapping and PHY supply settings
> The "lane mapping" no longer applies. LGTM otherwise.


Oh, I forgot to update the commit message. I’ll fix it in the next version.


>> to support DP output.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 30 ++++++++++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
