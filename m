Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4F4B8FCA2
	for <lists+freedreno@lfdr.de>; Mon, 22 Sep 2025 11:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D6110E16A;
	Mon, 22 Sep 2025 09:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXKZRq/9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A31F10E11C
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 09:40:16 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8xJdH003414
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 09:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7YluqLjFkeDBsYKSBhPJwBbp0COj/3zoNrL6kINO3I8=; b=pXKZRq/9CE6rRZBi
 Jky4PBi9rEiRdx/UtJ49BKRg39I3qn6KPqZ7JbDsFC+VZ5u7i96zjwhIbWjnyQJw
 OKsskdpkAPiWwJHqpK9W45VCgi4gIRGtbVgyDRaDxLwxnr5WAq+nRDZGKl8EeASH
 92AWXuxGg6RRhILFrJ1caqk5iyvkZ2PgVam+dVTzcPEsXwVe4bUhInEGxOHLoVdR
 VmGbjCkCkPnH+/ksnlrW22jnvtqDPm+Rfzp89mL3AfjDsEnmYC/5C77WAgu1LmOi
 ASjDpqPWKy7lis9fVDzCdoD0iX+5MrkGNfx8xG9xY2miUqdr4soYidhBHd7YcbBD
 U3pDaw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mg3484e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 09:40:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b5f818eea9so68498821cf.2
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 02:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758534007; x=1759138807;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7YluqLjFkeDBsYKSBhPJwBbp0COj/3zoNrL6kINO3I8=;
 b=rSG6Eu5nKn1SpbhORmghcAZ5NYxFI3NSDg5eqyDUL3c1eeAToRhx1iYs+1oP3peZVl
 FFhIHfuUio3FtNKBODksQa8zvhlKA5508X6RmSQSTcirPDEq3rM6We8cG73a6GMCljhN
 K8OD7oO3us9eMz9n0fecDLuA4Vw3qfVzl+8MewDuGqaSNF6Dl/qCBNmk7w+1vnXae8hy
 XrTmF4ji1p2m1tzLNrstsoFEeqjH2O6Itowtz1lpOCrv0s0OGX1ePwKTVvP8WO2prLMP
 00WvERMWOSzgNNiFpm6AwQh6yiwiK+cQUblkAgOJPIEbOg0hUwAKw+cyTRcOXOTtnk6U
 VkQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/sWlcgA0i97U3PFbjGXKaN0Y+rS1B1nb3r2h/INJ12TOvR96N9Q4vASd+UKpU7OTkJuKzwwN/dOA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2U0/3/PF/SVSXzi0rWuDqq30EvC8qsMr8WzDc2yVcXktIx/m8
 TPttpqkys89lleWgPpln/m3bpCqJAIfB5zBl4GL8IaPulIv4pw9ymXcIM5hyUJkea6+sXxQqUPG
 nkpRaMX9hTcktFE0OPLV0KIKCZuU7dIhF4vSW6BJ+WbooA8w63O22JIL58VarHk4KPiRbEF4=
X-Gm-Gg: ASbGnctKClVz7oVuvFV94oAZm2+z8K82FQx5GK5irRbnRJsKOZPottzLk1CJj5zHcZ5
 YrL10QWtY2rdZyNp84cy8hpJjVGiWcJdQrOjglzPppHCJk8zj3Fu2V4Uy1M7cRJF+zjuoWTN/lu
 XE/98SSmVmZsyNjvVBMPEm9KIxRqbhZ8ftDhjlLxqvZ0VR2jOjZJngbGCBMd7xGEiZaH/XcODvQ
 BdnL62rK9S5S5IH5QyoV5gwz8Aal5mR7oRMWENPhzbFJT5xM4FdAF9ukQYkHlPaau3JVK/LsQyD
 dkA8EF7LOEXbjW1qtnkx8cRVPQ6wZtozy1lQ8VYZGj64iU+/SCvg8grVGteQfHPwuzR+1kZ/NKQ
 sOPVOs3TUfC4pw0yR+xqukCc6xTSlB/swLB2QSHL8K/H9nA8dyR14
X-Received: by 2002:a05:622a:3cb:b0:4bd:8a70:8419 with SMTP id
 d75a77b69052e-4c0740771efmr132175721cf.49.1758534006500; 
 Mon, 22 Sep 2025 02:40:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHPdl7qbXwWAyMzAb2xrKkqm9pTpnhem1oin/ZkSbUrYmV5Vp09P9ycfD9quaP9yIYnQ94uw==
X-Received: by 2002:a05:622a:3cb:b0:4bd:8a70:8419 with SMTP id
 d75a77b69052e-4c0740771efmr132175461cf.49.1758534005900; 
 Mon, 22 Sep 2025 02:40:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57e06875b8dsm981204e87.2.2025.09.22.02.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:40:05 -0700 (PDT)
Date: Mon, 22 Sep 2025 12:40:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 05/14] phy: qcom: qmp-usbc: Move reset config into PHY
 cfg
Message-ID: <ysxjabaah6rcbsjlreteo32zdljjcd547vgqeoxototwicjj74@rwovxeg6rnli>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-5-eae6681f4002@oss.qualcomm.com>
 <z3phuuokrhonbukct2siz3ujear5ymtnoviea2epxzvjdmsvkj@w4puf4c44tmk>
 <83b5a265-1c5f-49f5-a89e-22f466df3304@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83b5a265-1c5f-49f5-a89e-22f466df3304@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMiBTYWx0ZWRfX3yII0tgZ9N/c
 9QK6ufPC4oL9U4fo2yPrriYgALJkjVVMD+8GY/CmSnyQLRcOEK9HkPyGGLCAwT7OwlVNzPboUkF
 JPl1t3o96BmqxZVANgvN7ntHRckXmuJbb1gNLH8BIU+NgVxH7TDTXdBQAu7XKr72TWOr0ZOPDig
 /D/gWeyBUWx1xXSopBQgGNGQEajCnWmg7zEq4sK9oYFxyEFNflyeBk5ddT3u3Qs9eii4zFHiDqX
 pwRUzaKDlDd9whLSbgbRUc8Cx6CtQYGzg2Y3GAe32nDJeIo5EtIjrKwRlJ6YKvFECnt6KA1p1kH
 f36Inzuc6XfyOGJT+6OBk9KHplvQRjeQqYonrC0HSVksqcgcTLVHnPl3OU8uRkZA/ly8FYySzUt
 eEUmaeBt
X-Proofpoint-GUID: dqoQPPTw35G4cOiLdK2gQKtj4gDqxfwt
X-Authority-Analysis: v=2.4 cv=UvtjN/wB c=1 sm=1 tr=0 ts=68d1197f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=zhdrUoIqCuD_tm7jGOwA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: dqoQPPTw35G4cOiLdK2gQKtj4gDqxfwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200032
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

On Mon, Sep 22, 2025 at 04:04:42PM +0800, Xiangxu Yin wrote:
> 
> On 9/20/2025 12:45 AM, Dmitry Baryshkov wrote:
> > On Fri, Sep 19, 2025 at 10:24:22PM +0800, Xiangxu Yin wrote:
> >> Move resets to qmp_phy_cfg for per-PHY customization. Keep legacy DT
> >> path on the old hardcoded list; non-legacy path uses cfg->reset_list.
> > Why? Start your commit messages with the description of the issue that
> > you are trying to solve.
> 
> 
> The original reset list only works for USB-only PHYs. USB3DP PHYs need different
> reset names like "dp_phy", so they use a separate list. Moving resets to
> qmp_phy_cfg enables per-PHY config without special-case logic in DT parsing.
> I will update commit msg with issue description.
> 
> Or do you suggest using (offs->dp_serdes != 0) to choose the reset list instead
> using new attributes?

You can't because othe DP PHYs supported by this driver will use 3
resets: phy, phy_phy and dp_phy.

> 
> 
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 18 +++++++++++++++---
> >>  1 file changed, 15 insertions(+), 3 deletions(-)
> >>

-- 
With best wishes
Dmitry
