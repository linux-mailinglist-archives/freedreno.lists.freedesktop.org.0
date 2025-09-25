Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3F9BA1B1F
	for <lists+freedreno@lfdr.de>; Thu, 25 Sep 2025 23:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976F410E9B9;
	Thu, 25 Sep 2025 21:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBGGbHfO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06C810E9B9
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 21:54:47 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIRF0Q028176
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 21:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WK8fdvESA/OTliyL4dPj+6x8
 FLgnKUZvKWjsZ9ztQ+M=; b=CBGGbHfO5GieknXvJF57m5MG499qdch7gyJUxhyb
 g3jbSoSR02NbwiuFNxMLf5vGv/cD/MCt/137RrgBTFeOzk7h7up3903PMNdBT8CD
 SsgSMsRHjCADg2+8xHMXpzHACtm/vVWrgnzKPkXTHjk3wrrkochuAkr1TclpQhoI
 /xhZWJrkdG2oQqHjnIlXzQ4nr33rf12853oHOOKnqeZbXbbtWC/1rdVzFMBika/K
 msY/i/pQEEafSDhvpN2D2ZjquiboQqH63dqGJ5heFR+P8NAkX3uQBWHiJrrWzJCz
 Sy+l575LGFGEh2laL7WHJYS8qwFSo5eXchAhuGnkazU4oA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u0guf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 21:54:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4d8b8c3591fso41285311cf.2
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 14:54:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758837286; x=1759442086;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WK8fdvESA/OTliyL4dPj+6x8FLgnKUZvKWjsZ9ztQ+M=;
 b=SbmGNfeGm+qGa5e/rD6LRcSzVdNRz/ctuRxlN5n4ovzWWndFEZ+C0L7HCANsCVhCRL
 4X1WTkEgnNeoh5IwvZUoiYGVD6zKIZI6jCA7qHdSZCAtvrFaubKnqeVVcTnB1ikQG0om
 GO2OWxo/Weg2RDw56JcdXeAcSz2fP/NDtI74IVhBK8S+1vawjT8sd0aah0O9ZBhoEw45
 T9VuNn8IymeN671xdvpzwn8P9oTK46LAUSm7c+okyOZT4tCeU1BrCVM94fJs9CZUSI8j
 jZloLGcc5WdKKO1ddcABZYyh/mN5L3KpGZH7d52wyoX/AHDdI7uZPnPJyC4i0CaDeD1/
 9wsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW763kF8abK5Dg3QcSH0SzcF4y1LKeGB0pREN5xanQHQKobSTQKX2RxngoJd+TbGVtczYrihW0BYZg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLGYO1z5EEeFkwzXAHdbblq0A+3OBXkK7/sl2GkzF3Niq5C8Ll
 f42dmQ1b9NAMflQB22V0HdwjQsA8b2vcQjfdFCfJf/CBzcyTsCf4JNlRCWRqAcsGWGe6fJVI5/W
 Wj55f+2pzfn5IX6znzJv5ojTHFsjcx5H2f7xUXamviETym7ifa0HdXPa7StCJHd4V2HcpKu0=
X-Gm-Gg: ASbGncv8T44Q02Yr/NvlYQIOkkgksgZHFk+vfarTRLP9WKfiPAli0jFPToj9c7AoVhU
 mmpHnoKknNm03fzqIg7dbw000q5clG1WPZ6X/513D1bp8iYkfjqcKVvXnKmfoYt6+8Ie+0ps8k/
 GSxTZhme0bgpJO+sc4RpqHsG0RaJtQtnpisLOBJti4eRqIBogM7klLdFng7xDBmJN/LFe2sCm2y
 lt4f3C/O6W6zyM5VXuF834XGUjZfJ3kVga909cztzgj+wdR8OucWFPrjl76sUChWNNHUONTCZW3
 zrC5aWoWp1QIgU/rE+8V91RbhMW38ffHNA+dUIpyx7ldVrhvsudyHCMqLrPZOTw8CgPMzvsNQd1
 nQ19CfFhLDE0rFevfKMhtf6kkDZCYHhSSg3rc1xIIlEdQ8MApbyTR
X-Received: by 2002:ac8:5d02:0:b0:4c9:a975:de57 with SMTP id
 d75a77b69052e-4da4b8095fdmr62826031cf.40.1758837286016; 
 Thu, 25 Sep 2025 14:54:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIHqvgghJCvaOUOze81nukdnXAC7zdagDIbBSgvwres3Q7gPK8kP6rfKMTox4SKyvbSZXPWQ==
X-Received: by 2002:ac8:5d02:0:b0:4c9:a975:de57 with SMTP id
 d75a77b69052e-4da4b8095fdmr62825681cf.40.1758837285529; 
 Thu, 25 Sep 2025 14:54:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583139f99c1sm1117472e87.35.2025.09.25.14.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 14:54:43 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:54:40 +0300
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
Subject: Re: [PATCH v6 06/14] phy: qcom: qmp-usbc: add DP link and vco_div
 clocks for DP PHY
Message-ID: <soor7srlw3hoqh2onmn4ki6d6mp6psmrbz4simwvvemcy4s5hr@pzabx7comvc2>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
 <20250925-add-displayport-support-for-qcs615-platform-v6-6-419fe5963819@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-add-displayport-support-for-qcs615-platform-v6-6-419fe5963819@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: cO1Ud3wi1_EXbImbsq4QVHkSQOoTZ0jd
X-Proofpoint-GUID: cO1Ud3wi1_EXbImbsq4QVHkSQOoTZ0jd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX9SRYP0RYsu40
 NVgGilRQ1ywWBLa+58k/7jCWAqpfWsWhi0hTbiIakLsuaYvvJtsNzFsUOAQW+rhynlm56kRK838
 Ut92Ai0Fd2F9psEK8DjsE+LLt1NIOj3QJiytLx8j3hQ/ljjd9xsFs+wo2ryVRh6U1xjj1/wBHzd
 odLf+GKE8bh8ozEq39Aa3PiMP1cPuK+jcRygYfQ4AEZbxmo3fowDvtx3q62S4SvwneMcwKnBwYf
 73oG5W72KzVvdW5C9gETx/d3/iyLpjBhwDbyr7MMgFYMMdRcO3C7/k7cO9moonY2VRcWU5rGz3B
 Iuo80hZyRocWXaZIXj6TV06gq3XWQ55Lkp196X1VJYpja2HCd5GhwrLGG5bJpdFeZPu6kccJ24k
 CXTva2cl4S5H8rYb/9RIJQ51tBfMsQ==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d5ba26 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Ig_1WL0MwRJ8oiofZPAA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Thu, Sep 25, 2025 at 03:04:52PM +0800, Xiangxu Yin wrote:
> USB3DP PHY requires link and vco_div clocks when operating in DP mode.
> Extend qmp_usbc_register_clocks and the clock provider logic to register
> these clocks along with the existing pipe clock, to support both USB and
> DP configurations.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 210 ++++++++++++++++++++++++++++++-
>  1 file changed, 204 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
