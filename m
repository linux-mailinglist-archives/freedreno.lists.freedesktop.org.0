Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1532B31281
	for <lists+freedreno@lfdr.de>; Fri, 22 Aug 2025 11:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0EEA10EAA7;
	Fri, 22 Aug 2025 09:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZGLmcP9n";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F8710EAA6
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 09:05:18 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UTxv020970
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 09:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 we5kOYIR9rQ9t3N19Qt3EpeOAg+A9dfHS8z2hNw9bB4=; b=ZGLmcP9nYIXNfPDT
 gU9FtFbEBKZSTsVW8aLigBY5uEQ/hnFdyNcvyHFUZD9fPKNDnHTRCJBlN8/Qt7UC
 vBgrKPcz0yA2adVkAsptuqijCFbVEc8H9ejj31wnFtreBmRb6oCLnNZ3NGVJfbmP
 8GlXXefuEt80YiooSQ0riLJyEJ2oSppWw4XNysM51MQSLPJ6xKkw0JDyZ0cyHUh/
 K1p3uKUyoZCwLheemmfi0z/PcE5UNZynhwHqy+njDzVy+o9yURLG/LQXcMmJ8ouV
 nWcXj/CFMTBlFX8adGal7WHiD83vbzUXo/jA3NBQJOG/2FDu0ZOIZgdWiWBZb9am
 M/mYpg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5290mh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 09:05:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70d7c7e9732so43904766d6.3
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 02:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755853517; x=1756458317;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=we5kOYIR9rQ9t3N19Qt3EpeOAg+A9dfHS8z2hNw9bB4=;
 b=niSradvtqwCf36bOMjjCJgY1PilGVwj5GGej/i8Mm+2tDBxvmO/tjlZTy3iE8p7lVI
 dfBqxufuQn0Ob0Jx/lyZiT8GWjVoXB1/rH+Am1T31LS6L2O1zUm6L2NAW+0b1RIfh/v4
 XZ7E6kqdzzpR4V6kp5l3wsVDUfGREIhk3b+4W6F3yltHDK+o0cKn3JUb8RKljPQw1XAU
 4SEixW+E6TAHYjO2Dy0aVQt8CyaTf+YScvuSJ/WwxGs+bKNk1L4sJuxFBQjorb4CcLvV
 a0v9E8SjXRCa1QwIYJGr2+yuB5toAbOnJkWbQu25PITedzSvGl40FNH6GWkqZBKZs5QV
 Zc/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSeLYRKcMerEvPd+BtVVMoz7pID1ClRRVn4/EJhCdC/u+xGp8dz8z9o+6xMk+ICXj/joirIyQs3Bs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzKi1vYH4Kb7MsEHrMjr7ukTUYzZo0o843KOTUo5GwoJRT44kD
 jl6hIIwWt15lQRtrfin+3x8SUv4JNiFmvFOHzoynamTU5s0w5V03iQG8v6RXyOwCFewlnG5tIoq
 P4KNnfP/Nkcevs2T3dOObwRPi1nbDprikZryMjwm8OAR+KikjrN9yF1zAZzuDJyFM/vaZ12Y=
X-Gm-Gg: ASbGncsjMoXKdEoRSVMs8V+QqujBQ1aU9+TTBpopBD8ZdNMuV8O5uZgSTpYUCar7g9H
 vRuxDEARTe9/WYXFi4bTEnVYN0TLm3l1rVelVve8ezdMlELXalgl4NhN2hV8RskjJIpC6bPifLm
 j/b/M5YkU8SJlDf4LoqpjXcqcptpJGF2jef/4D6LEIHO20TyqDQ78dwm8rsp8PZ2Qi27nySUbsO
 EUm7c6fks9ASIRud97jWw6l/WXBT0A7ExzQysNJXVvEwHjvQXhRyX1tX+0lfzmT0rgdKDqZwZ7q
 TFXfh+L1ADg5A3Ya6JHlBezhBr8OK+Rht+b7Bz4Cv8tv7TzSnxl2kyde9xirCFAQ51oGlVjFfUy
 Mh1syTwTHa9S/Mm3YCA==
X-Received: by 2002:ad4:596b:0:b0:70d:6de2:1b32 with SMTP id
 6a1803df08f44-70d9723e3d8mr27746716d6.62.1755853516697; 
 Fri, 22 Aug 2025 02:05:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxMWfBZW68IB/KZovde+NRVxhgZvhNidsma5/daN4tO/i9zHYH0AJAj9sHGZxcIBJB4AMYUw==
X-Received: by 2002:ad4:596b:0:b0:70d:6de2:1b32 with SMTP id
 6a1803df08f44-70d9723e3d8mr27746106d6.62.1755853515855; 
 Fri, 22 Aug 2025 02:05:15 -0700 (PDT)
Received: from [10.207.49.70] (84-253-220-51.bb.dnainternet.fi.
 [84.253.220.51]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a48b46bsm32794951fa.36.2025.08.22.02.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Aug 2025 02:05:15 -0700 (PDT)
Message-ID: <d4e1f836-afbb-4cc7-a5fd-fa961e3203ec@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 12:05:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/14] phy: qcom: qmp-usbc: Add DP-related fields for
 USB/DP switchable PHY
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
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
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-5-a43bd25ec39c@oss.qualcomm.com>
 <7b6utbnibia767bp55vhvg6ghdavb66ubdpabyguohuwtmz3mp@unvm36jttota>
 <8922ae6e-9be6-49f7-ac84-d4a1dd60421b@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <8922ae6e-9be6-49f7-ac84-d4a1dd60421b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a832ce cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=JdIsBVl79nXNK9flUcZCTw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=G97a9vFw7kLByEIGoT4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: nhCcyaBPITCNwudBuvW4uj0wWLAFwPyb
X-Proofpoint-ORIG-GUID: nhCcyaBPITCNwudBuvW4uj0wWLAFwPyb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzaAfcHGxSrcf
 RSISj1QSuj65xzvmpFqNFjKMtJyK0Yxgsn76SSI5NH/UNZAmeMxemA3DtcS0GeTL7ZeODP23vJc
 M41RVdaPrBd7p5wtooPQJU+SbtyGyIaynUw2YFKlZvIK0Ug8kb/i4wS31c5w/qrllCOLKtwoexg
 03PwSlDFAEfNCWG08a5vh77M6xRy6gx9VepQKgRhMVF3SyMvTas9cZqhqdOq30RFPI0cCAaGYpY
 wZCC3d/R6PSf7hkXsvgvv0pjXWtf3mZ1XlP/3tTGISeDNwsIXXeugnmbq71hZVHWpilB6TiLZxx
 ZGQMmN75a5YfyIpc0qtOOrOyNXV7Uykujy/khJYdep7VsNwtpQ7zHxXlr4ux+TgAqT+goMnPan6
 TPWN23iJFrc+up4zF6C8/K1SwDtDfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On 22/08/2025 09:59, Xiangxu Yin wrote:
> 
> On 8/20/2025 7:47 PM, Dmitry Baryshkov wrote:
>> On Wed, Aug 20, 2025 at 05:34:47PM +0800, Xiangxu Yin wrote:
>>> Extend qmp_usbc_offsets and qmp_phy_cfg with DP-specific fields,
>>> including register offsets, init tables, and callback hooks. Also
>>> update qmp_usbc struct to track DP-related resources and state.
>>> This enables support for USB/DP switchable Type-C PHYs that operate
>>> in either mode.
>>>
>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>> ---
>>>   drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 73 ++++++++++++++++++++++++--------
>>>   1 file changed, 55 insertions(+), 18 deletions(-)
>>>
>>>   
>>> +	struct regmap *tcsr_map;
>>> +	u32 vls_clamp_reg;
>>> +	u32 dp_phy_mode_reg;
>>> +
>>>   	struct mutex phy_mutex;
>>>   
>>> +	struct phy *usb_phy;
>> Should be a part of the previous patch.
> 
> 
> Ok, will move usb_phy rename to patch 'Rename USB-specific ops',
> 
> then shall I need drop the |Reviewed-by| tag in that patch since it will change?

Depends on the amount of changes.

-- 
With best wishes
Dmitry
