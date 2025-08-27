Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D73B38219
	for <lists+freedreno@lfdr.de>; Wed, 27 Aug 2025 14:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F77D10E0F9;
	Wed, 27 Aug 2025 12:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lR8vuIvd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2759910E0F9
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 12:17:52 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kEw7031362
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 12:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 X8RSqvNCRDDgijasg0nbutFMmtBqyja8T4LtC7m2lA8=; b=lR8vuIvdVjrFz78j
 ZphFCEx85h7qmFpG4lXcHddG6+Uo/V6xt+7hh51h9rUmisheQ/iPYr0OHEDEYnsM
 Wt9dfgxex3zll6bUY1mXRrVSULlVA1pFczVpGvBsM9QtZ+j9WdlF1XvhxgvYMthp
 r2NY1ev16MXzsOTvfUjrWyfo+tnHs7TdEIINU4XQac0ygWRPBBci1JV7hjE7VGEM
 1W//Rw9/SIszUvctz6T6wpKOCoR6IpbB8wDNmFpxQEl/pQCeRogqEW2LXLimkmPS
 RLJvSgZPvb+6nYNgNhVO4HdLoUvX+u3wgGinYyuXSD+old4avxQkFK9T0vD0pIx1
 1OaPMA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpvrtg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 12:17:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2465a387372so14403245ad.2
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 05:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756297071; x=1756901871;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=X8RSqvNCRDDgijasg0nbutFMmtBqyja8T4LtC7m2lA8=;
 b=j5E7GhSvbiMbsCSP1nzZInRP0NAkgPRWjsqqXm4FcrGuBaliz78KdBMtjvDJnL47TM
 npU2uifKJoIJjIFhu17Gzb1t3YXNOGJVa+6LnuCJNAYhUDOORzjXbMAM1k9mYwUcplUZ
 /vw/MmQfktgDX9DbynVkW9yG6QBngkSQq1X/QqTFeTWzRYubXIinzAF/ajUYvF5l7VPe
 6swsv7k1V2JQn+zlroWqad49olQwEdiX0vnz6fA/0hNB7C7F7vl0hsqMRGv3tq7Qok1Z
 uoPsBk6KfmFBDZN2ILuI+CFasWu1u8fsrxJEz5ypIcFeuVvgosiS+PduzCEwnNL9Y39g
 DQTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgchCkNgCFUyNwV0Fs1kKjswL7ra1FQil0PiYyfJnJQ1bD2urqUJqDVyJ452abOy5IzGiVqL8FGy0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjMEU5bEJvHwWavaoKRmjK1FP+Vr0+O3Flw8FDwRt2YmZAZ1dD
 9WDQwe77SJCkVTvFybZnnCH8u7/gjHg+zPzHfwprD8xD/KQdYcv+Vmoq35YorgQX8F8dyXAa9Eq
 piccFNsqKL7xEZRZq4cLt262p3ttFgf5Rg6LNu30Ti3uMiOpAoViFkDbk/wcw+cpYCmow49o=
X-Gm-Gg: ASbGnctt7i2Wdw3vompAhNj6NTkGCav9FvC+AZdz7M1lez2J4LHsh6mLAErFLTjbWf6
 KYoOtS/xmMIn4RR2UD4IrvqaROeoD5wCX7y9o3LqBxDbcPgRCLXMPkmqbUvTX99GsWEB1kZbS4y
 Lth/RRmAIzpLRcGJU88pY6jR7aS68iILRzZ2UmUhTvlqhy+k42fHXjvcI9iy+8heafdQxQrcdCv
 aSIBIfOyrStakOIiK5lKCzesKoYOo/ois0SlK/o8Zv6Qp8fra6hRtFd+0z4klizUBpCl4QHElYw
 YqAlILmi9+DdzRc+s/5Nl+NUSMXonSjxIKRC2hiUuqCW8ChowN1i0qcdziI8kp4uxK5Lye5+Hlx
 3Ypyy/sPEySExR9VaRXsp7rwYw0BckQ==
X-Received: by 2002:a17:902:fb8b:b0:248:bf0a:a127 with SMTP id
 d9443c01a7336-248bf0aa1bfmr1663295ad.1.1756297070521; 
 Wed, 27 Aug 2025 05:17:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWwdfvw8f7MeJn13rr7IAskUSFh8jN+On8IyJ79l4iyWHwbCU7vdfd6HxX6olsZxDiEsjN2A==
X-Received: by 2002:a17:902:fb8b:b0:248:bf0a:a127 with SMTP id
 d9443c01a7336-248bf0aa1bfmr1663025ad.1.1756297069957; 
 Wed, 27 Aug 2025 05:17:49 -0700 (PDT)
Received: from [10.133.33.166] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3276fcd3285sm1910956a91.14.2025.08.27.05.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 05:17:49 -0700 (PDT)
Message-ID: <9bf7f51b-dcfb-4ff8-848e-dcf144936f2e@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 20:17:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/14] phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP
 switchable Type-C PHYs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-9-a43bd25ec39c@oss.qualcomm.com>
 <3pr7ninjxr4pgsz56dr6ojjmx27fzzszmtt6mx4r6qaqt25tnc@nrgx5qiqc7z4>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <3pr7ninjxr4pgsz56dr6ojjmx27fzzszmtt6mx4r6qaqt25tnc@nrgx5qiqc7z4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68aef76f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=eEvFyuGTnR1_S7nXHuIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: vPIqKmmyYVxBi5H2W29vlosFQLNndml7
X-Proofpoint-ORIG-GUID: vPIqKmmyYVxBi5H2W29vlosFQLNndml7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX/LeTTRtm9PtU
 4s/XfKXY6RVX4CoBEsofuOghF9Gw+klUzdtA91F65CHIFPNDJm2s1QkSzq1Ln8t5VYpAXbPJ5td
 WOPK/PtiVq7Y8Zj97l9EbIsBzukLGoycbTLwayBnuVLemMacrNTaiaqoQjdH7O2UEHuvjPxMLSN
 T3aEzp/xZkxZhQU74vM4VS71TQKzMAqIyNvSYEwwU7QHAt7ky03DnSa5K6YZ8B2Qq0Dec9XgKDa
 A2oQ2N/Qs0fai53sQw3yHi7bRI/lDVwygCiFKjqxqP8SuzgDY6DelEMmEIutwb0bkEyb9ClK4y8
 UWgEGQhTvbL3ndAvN55y2/U3og41mB+GVND7EonykiDZb/Ah0xbH2XZ3dWbnW0Y8KlbZeFIw46v
 TSlB5XKg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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


On 8/20/2025 7:45 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:51PM +0800, Xiangxu Yin wrote:
>> Define qmp_usbc_dp_phy_ops struct to support DP mode on USB/DP
>> switchable PHYs.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 163 +++++++++++++++++++++++++++++++
>>  1 file changed, 163 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> index 1508a4a5f57aff85318485b79528325f28a825a4..a1495a2029cf038bb65c36e42d0a4f633e544558 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> @@ -22,6 +22,8 @@
>>  #include <linux/slab.h>
>>  #include <linux/usb/typec.h>
>>  #include <linux/usb/typec_mux.h>
>> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>> +#include <drm/bridge/aux-bridge.h>
> This one is not necessary yet


Ok, will remove unnecessary aux-bridge related part.


>>  
>>  #include "phy-qcom-qmp-common.h"
>>  
> [...]
>
>>  static const struct phy_ops qmp_usbc_usb_phy_ops = {
>>  	.init		= qmp_usbc_usb_enable,
>>  	.exit		= qmp_usbc_usb_disable,
>> @@ -1095,6 +1248,16 @@ static const struct phy_ops qmp_usbc_usb_phy_ops = {
>>  	.owner		= THIS_MODULE,
>>  };
>>  
>> +static const struct phy_ops qmp_usbc_dp_phy_ops = {
> Please try restructuring your patches so that there are no unused
> warnings in the middle of the series. You can split the next patch into
> 'parse' and 'enable' parts, then squash this patch into the 'enable'
> one.


You mean it's better to define and register new functions in the same patch 

where they're first used, to avoid unused warnings? And for things like parse_dt and phy_ops,

it's fine to split them into separate patches if each part is used right away?


>
>> +	.init		= qmp_usbc_dp_enable,
>> +	.exit		= qmp_usbc_dp_disable,
>> +	.configure	= qmp_usbc_dp_configure,
>> +	.calibrate	= qmp_usbc_dp_calibrate,
>> +	.power_on	= qmp_usbc_dp_power_on,
>> +	.power_off	= qmp_usbc_dp_power_off,
>> +	.owner		= THIS_MODULE,
>> +};
>> +
>>  static void qmp_usbc_enable_autonomous_mode(struct qmp_usbc *qmp)
>>  {
>>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>>
>> -- 
>> 2.34.1
>>
