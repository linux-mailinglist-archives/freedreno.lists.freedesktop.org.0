Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EF6B8F7EE
	for <lists+freedreno@lfdr.de>; Mon, 22 Sep 2025 10:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1DA10E3D4;
	Mon, 22 Sep 2025 08:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBPOekuy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B5E10E181
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 08:26:52 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M7p0YD005645
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 08:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5eooA/d0wFv524HBbqhcxXG4N6t67PHtqPoAMp99CLM=; b=gBPOekuy/TAuLDuw
 fYHLEtqZoWeB+TuYqIynVldqPB4Chu8KEJrz1Y/nSNhuA6KVMrMWQ2WMMALQHrWG
 tod986QwqjjTGkCzy0fa+kxiXGBnjh8DweQfKaRl66G52sKinHv7tfu7RC2y5Rqz
 gp6hEqCM7QaZyXb+OaihpmJz8RupD7umBfduqMvKLonFBpPYC6XyaGR0eyctEYub
 0qiIPjB7Qz/4lElNdcKVUsRRTbJ4YZHTvQKU+nhID+XzLCuz0eGaS9049JtfUR7s
 4xFFQALX11PAjG9og+4qFjMu9eeDSQeDgJcyXmVmopS+uQHJvYZ1MkSwtYczbRyu
 sXMxHA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b2e1039d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 08:26:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2696ab1bc16so11869675ad.2
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 01:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758529611; x=1759134411;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5eooA/d0wFv524HBbqhcxXG4N6t67PHtqPoAMp99CLM=;
 b=a5WsQNZq+BHyA6uuOmHnWm1o5pfZShv5KHCnMBMZ4F7lN0s56SWdCoj504rcS8dMEs
 GxqZhn+5L76okLZm9RhZimYSfgAiYjjI2Y5byo35O4fBVrneNXA8aP2+o4/vu5MOiWIh
 mhsEQzI/TOHW4kcmtTgfTXPozvwGWJh87gNEehaNiGDKazfesPGQkG3Y2YLJ9xnHodFq
 gtKWkwKZbda+euc6ZdqzexQSlPctad3Kskhp/8oZhoIvhLs0AhHP2HmOC1F6pK6y7KiS
 rJPVP7oHzP/U65N71SdmyM0mMMGYOltAJzCPW8/Siy/4AX1P537k+qt6oO3FRkQ4Fpa7
 zLdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4tOmXsB7loYXe5nA8oda4dJdQ+togxzaoCLb5r4RgygE5CKVbGkiBi4CkI0NOcwZTYdM1mHdVsoU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzepkkiGcjzvb63wR5S/BwQ8ZJmcyzVjo+Li953vkAZcW4zSQsQ
 4CycvZp5I+n6KT4HsxKg6yaoAj6GD/oyAzohtqqHl77EBlCSQkAeNXCmLLBurjRqdTrHDLYhZgj
 vz/GSi44+5oiQg33R1KPiKZJjRNdQiSU+7xRUUcYueRK4k16smNgI0e3b2Nu+jFAv3DErXIE=
X-Gm-Gg: ASbGnctYe5Y/kKWq5x2ZFjnxoqtBWpiI8gc++33D0Mx2j5guWZeMQnymfngl3iU5fYE
 InvLjIMs1ZadL9RwpBTdT5lcu2LQtHFainaDXz0pinbQS2zImzuoOXzAUM2rKXkV2GHU0uD+xdA
 CBl7E8EIdNhHolL0rFJ4qC8z53ki7q+SFVy3jkcuMz9NeDfLC4V4MA1zic2DT5H27SwxwZaDvFt
 dcl3cQLmdTg0yOjPpvYtQ/ypJp0cp7htXJAtqii9I8aa5f/XXGfVYkNclYbKCz51S2cjOWU6Ihk
 FIMU+5bDIIQefzHWigVNKzjMfiMCKbS8L7BaIGVOnNRBhFE0KnqiNim0wCgQ8Xun5mlOAYs/000
 GCe+g8e+ZuS7o48tEo1W0RQB+GXcCZ60RgQ==
X-Received: by 2002:a17:902:f706:b0:276:624c:6cb with SMTP id
 d9443c01a7336-276624c084cmr28410435ad.2.1758529611169; 
 Mon, 22 Sep 2025 01:26:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMC8JhklyE4iNEbU5+yB9CJsS1vFjF44g3zzVBlwELKRKjUfowiE8AinFLeQimo+OvsblUHg==
X-Received: by 2002:a17:902:f706:b0:276:624c:6cb with SMTP id
 d9443c01a7336-276624c084cmr28410225ad.2.1758529610654; 
 Mon, 22 Sep 2025 01:26:50 -0700 (PDT)
Received: from [10.133.33.87] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26980053078sm125956445ad.10.2025.09.22.01.26.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 01:26:50 -0700 (PDT)
Message-ID: <d09b2b45-3ca9-4808-8ff1-72b98d6fed2e@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 16:26:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/14] phy: qcom: qmp-usbc: Add USB/DP switchable PHY
 clk register
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
 <20250919-add-displayport-support-for-qcs615-platform-v5-6-eae6681f4002@oss.qualcomm.com>
 <xtosrpz6rzdvtmpyq73gboeckl3c2x23iqehlxzbaszqmzugjd@ixhj25qujqxo>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <xtosrpz6rzdvtmpyq73gboeckl3c2x23iqehlxzbaszqmzugjd@ixhj25qujqxo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA3NiBTYWx0ZWRfX1g8gQ1b/E9wt
 z1N7V/vHWkfp6x/OgfktXr3YOqGsofsRTkKch/8pYiKh/hYQnIDVy8v1SypzGmxjMsNeLBhyD+R
 l8jXW36136NH8VJ6FbiG7i01rDSrZEk2kinqgfSCQfjRLjh2Q7wSWh0X9F2ixAEIEJucDbvxrTD
 Zagzc0GH0Bo9pmxx0YLfUzsv9FBohhCSOnWvG2FUgYfCfOa4VQN3gVQPMOG9x1cNYdSYPVA6xB5
 F4o/OFHqUJLP4dcK2UMLse8ugQL20Lw9B7pCZCY0tIq1z4dPHSfpytA9U5V50tNTRiW9y0UVZqZ
 kHCcAOTX2A3CqbXzKzLmcLoDkij97WfJK723Ldrpu49WjCEhj94hYj4j6qyJ960ERbDsgXFmVW6
 h/3/TRRB
X-Proofpoint-ORIG-GUID: lL8bvvIex8geD4fZtFR7qME3SiFmoFJg
X-Authority-Analysis: v=2.4 cv=HM7DFptv c=1 sm=1 tr=0 ts=68d1084c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=0ewKxBccC1tKemf2ImcA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: lL8bvvIex8geD4fZtFR7qME3SiFmoFJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220076
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


On 9/20/2025 12:46 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 19, 2025 at 10:24:23PM +0800, Xiangxu Yin wrote:
>> Add USB/DP switchable PHY clock registration and DT parsing for DP offsets.
>> Extend qmp_usbc_register_clocks and clock provider logic to support both
>> USB and DP instances.
> Why?


Shall I update commit msg as below?

"phy: qcom: qmp-usbc: add DP link and vco_div clocks for DP PHY

USB3DP PHY requires link and vco_div clocks when operating in DP mode.
Extend qmp_usbc_register_clocks and the clock provider logic to register
these clocks along with the existing pipe clock, to support both USB and
DP configurations."


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 210 ++++++++++++++++++++++++++++++-
>>  1 file changed, 204 insertions(+), 6 deletions(-)
>>
