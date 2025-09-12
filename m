Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C150BB54B86
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 13:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9788E10EC26;
	Fri, 12 Sep 2025 11:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P23j4hUn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E238A10EC26
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 11:50:02 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fKCD014034
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 11:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YzF2SVlfGn1ORuyJ7oHhWEvFtpmrZnuITZV7ypXxf3c=; b=P23j4hUnFVWwLMnE
 F6LQig/a0wxm5UQUp6+G2DMXP9+ABR6T/n+Vrkeyh7Gij5PeMMKBvcx6GqOfsAOq
 RYbkeeSi3QkVqV/wERaGFMo4O5LNwhCqJRp06Hka6FzLMCwTYGeNUczVcetKbIaq
 wsyqNdMz/SfG++cNyEF0jGuoKumN+3/tKNpvVrQVZTVCKDSO5XPqeWDesXYXMzxr
 KFK524t9rz3YoMeCM3MdmwdpgYwzdzFNckeEBUaYUDPvCC018hCc/OTh2udHLqH5
 OrxfprTgNkVlRxle6E87JTcncVrGwf9w3pYId9ESgnvabCpdkcB6cGjvqKUHqJxj
 zp8ZEQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493qphw7ub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 11:50:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-25bcad10907so3914005ad.1
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 04:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757677801; x=1758282601;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YzF2SVlfGn1ORuyJ7oHhWEvFtpmrZnuITZV7ypXxf3c=;
 b=fpmpZKYYpGeQfSkNKgvGJPONQGiFPRhoest7DbFo6LJYUlq2lkL/3fSKuiGwNGW8sa
 l/se6uAF3r50Z+8k/gbt/CDkbApcVRK/duto2+h0FaNvhnOrYt9osPLWb959zWJt36SY
 hBsHGG1VrgJbinz0LNIYaSLsVk21XHs6wU5mHZbp9m6djtaBG+7XBCTtIXAFvQuFTblj
 5X4Aj2vavUKFQ/ChDhID+wc9bJ535yfo4xbNIpvQKScGP8xVSOhHAl5M0A3HdlkIW3MU
 iBcmq87SB5k4uptY3I+Yy76c9wMiCsC0Y5OY2VG0GZ1XDvWJrOE+LvNQCIGDeblvxzp5
 XnKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8FWWc9QryX28X1A4F81mKNMH6IqTPrfQEqFRrqNYwe0fo6wXC1j93CnfsKoRr+y4FXhmQ0CUw7+Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLJ5JP/hZiSH1gOg8jO6DtTJkrJbhyCcnqSEzKt72SNKitk03u
 oFhbNkbssubZ0ckuQl+v91D9If3NA6Hk0pHoxWM8HoPJlBAReo4KNgP9NPIUzmf6a77gC9kFHnV
 a9u7ajuSlOaZQ3G3kSfKx9z17FG+b8uV4fzGq9q3JcNPBOVIq343uAvniuOsyxDm/Ds0aGZs=
X-Gm-Gg: ASbGncs2nEzpCsN/JpwLPO1zDJiAO0C9Z+Cb+eq/vKusMVglYBGq1mJfjdCJcdqL+ch
 lsiE24OKEiLFMoUknTvDkg9D3HB2koKY+xNS9aVH0qbHjiaNaHAJa6Etdxi0XWHOIif21ul3kSX
 OVDEYWGhU35tPO05daJwmkGoxSDiI5vr3w85YZd+/CWrVBhERUK7+qn/Fv+0XOQyc0TY57/rW6t
 zFkedt2zaz7XQlsTsKPpy5psTu15k2vKndnMkrrcZkjI3/QHj6Jt31jvZNMyje5tOhB43471Pi1
 n9xSswvFJSIwShspbsd09Nz3BPek/tELUQ65AT3m9qnzzkxAaofwjnrt0+RaTOgk0OdsDImibwi
 Y8oBZdIrQ+MrADVGmosLm4odZkZSJhA==
X-Received: by 2002:a17:902:c406:b0:24c:b36d:637 with SMTP id
 d9443c01a7336-25d246da083mr18921355ad.1.1757677800639; 
 Fri, 12 Sep 2025 04:50:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWi4TjYFXB7GnUvOOedYDlXm03TtmgN9ypPJ2FZ+xs8IcitlyLZkYRTQqPLihrLpPvtOZrUQ==
X-Received: by 2002:a17:902:c406:b0:24c:b36d:637 with SMTP id
 d9443c01a7336-25d246da083mr18920925ad.1.1757677800095; 
 Fri, 12 Sep 2025 04:50:00 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c37294b5asm47417025ad.50.2025.09.12.04.49.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 04:49:59 -0700 (PDT)
Message-ID: <5d25d05e-d545-4b2f-98f5-40bfbcd24d7a@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 19:49:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/13] phy: qcom: qmp-usbc: Move reset config into PHY
 cfg
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
 <20250911-add-displayport-support-for-qcs615-platform-v4-6-2702bdda14ed@oss.qualcomm.com>
 <ejwrkogssqdzxraacvxdbasxg2ud4t53rb6da2g4vdryyjuzoi@evdibveq7w46>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <ejwrkogssqdzxraacvxdbasxg2ud4t53rb6da2g4vdryyjuzoi@evdibveq7w46>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPDwqa9m c=1 sm=1 tr=0 ts=68c408e9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=vDXniOzG41h6BQfMLKwA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: MjVWaUf41JJGhz3sGEG_GJSlqy0cQrbA
X-Proofpoint-ORIG-GUID: MjVWaUf41JJGhz3sGEG_GJSlqy0cQrbA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA0MCBTYWx0ZWRfX1QqtAzY9gdVU
 H4tO6Q7PPRGEahl1Wk7rvCMPjyLZQ08HaeeE8+pfI6kiu+cWwM6Vci0VwE9uvW64mS56SUyAi8t
 rtKzhhDpR1Ii+OkkMi8BurET2nXkmtuWPJzOfGNx8k3nMpr5IWqNPKy9ha2FCa7CmrTC8Gb7/kI
 3O0ahOTMtmBBNefDlCA4bs9Z/0na7ImcRe2T4I8j2dbJwoCDl/7mB5J7z9iykOWNCSGZy9acDJx
 qR38CKGro6e2lhzRv95aUcayK0jAq5w38FTarEN89gUW+hiP1bmwpPqdFGGy9suWmTtgwkjyCQ8
 JZ9G/pFPj+9NnazTRYGBUtjfPOxVe2/VgQMwZvX3/LYbFiKIcUNTjkC+SbCh99svd9fzoWn9T2U
 XJVwE8bZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509110040
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


On 9/12/2025 5:56 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 10:55:03PM +0800, Xiangxu Yin wrote:
>> Move reset configuration to be managed via qmp_phy_cfg instead of
>> hardcoded lists. This enables per-PHY customization and simplifies
>> initialization logic for USB-only and USB/DP switchable PHYs.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 56 ++++++++++++++++++--------------
>>  1 file changed, 31 insertions(+), 25 deletions(-)
>>
>> @@ -1147,11 +1159,6 @@ static int qmp_usbc_parse_dt_legacy(struct qmp_usbc *qmp, struct device_node *np
>>  
>>  	qmp->num_clks = ret;
>>  
>> -	ret = qmp_usbc_reset_init(qmp, usb3phy_legacy_reset_l,
>> -				 ARRAY_SIZE(usb3phy_legacy_reset_l));
> You can not do this, it will break compatibility with the historical
> DTS. Legacy code should continue using the old list of resets.


Ok, then I'll update it, since qmp_usbc_parse_dt_legacy still uses the old
list, and qmp_usbc_parse_dt should use the one from cfg.


>> -	if (ret)
>> -		return ret;
>> -
>>  	return 0;
>>  }
>>  
