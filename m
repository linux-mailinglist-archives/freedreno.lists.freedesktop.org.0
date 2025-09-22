Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B391AB8FCB1
	for <lists+freedreno@lfdr.de>; Mon, 22 Sep 2025 11:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8939D10E16A;
	Mon, 22 Sep 2025 09:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RLQ6+NuC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB43910E194
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 09:40:35 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8xSDD016215
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 09:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hj4Upp6DvQZMXvyU0WYeHHC7
 m3sQ62ahNFhZ9X5v5Eo=; b=RLQ6+NuCiPUV/W2JulyLLZL6rEnT51TRuFjybdHd
 tkFtkdlQJASvNLju4ImrI+Y1E+Zk45K7z6vcnBJWtoS+MtjDj80cqbJ4qubWfuUf
 FBsbjyzvU/nGHL+zuxQjslKcwLO+ohd4L9CWfFBOT6JfD5hw4kP9CH8S0fLEUue1
 hO4xFWEUOhNm7ov69+ut/ZOZS9BIAyX3ovHXOagvcikYF7Jbnbcmq49pf52DKaHi
 Kb5O7uDHt5aUBAB5QjrMv49+B9uHO2hLZoyvrtkSTAB2lu7DYYfS7PV/upznyikY
 b8Tk5sDL5qrrVPe79ijAYvccl0gEUYkqAvhX46zXuahbvw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98c9jx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 09:40:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4cfa9501871so5541541cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 02:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758534034; x=1759138834;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hj4Upp6DvQZMXvyU0WYeHHC7m3sQ62ahNFhZ9X5v5Eo=;
 b=o+KMIDcFhSJxN5HnCu47/cWMeOdx0gO2rqQEog2X6ls59U3iJC3ikD2ehk0v9skdd5
 +2t8Hkj9S/k492po516Qlm4gw9HNs/q7EjRt1jRnnP0yxbQRYvMMM7dwKKRVfojftBqm
 G1NDlJGTeNZ4nN2+4xqkb6In4OVw2ng3W6Pzo9pl1YhqS01pZ045AVYechX/HM/it+oN
 zCuOBEabKesqWklmsu/S6FX7WVO4c4XHpuw6WDmlRwsJFNKO3veST9WDIj7Vgf5yUSjL
 5AVP1QCzb3bVtXPhZFZEQh5qLmCMNgkruaVqqmio3K8ld9PdBQYYUmKYvfzpxdjwCPsu
 REfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1wo1+NWx/b1hFtofr7Xk7xPdXuQdrHgzCpAJah4eLnuaXYHIXPgrERUSgjg5BPquvj3FHIv+O+T0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrimEwOCrDdr7Vy2tP1TECYRd//tzFmlqWiKtZuLCndB1bKilV
 rZwOBZbm8RXPBSPs+b3AB/mWIdJElOHzh7m7l1vKUjmi4m86fzpd4IRRZVcnkyDEfj+jIZq8TNN
 8BB+oiXvZbFziLd9uXSAvULyKaj0LvEDdBp/Ox7AQwlzVHDJQch5SwrvKWjdm9GlaweOLwFo=
X-Gm-Gg: ASbGnctip4kiJmyR0kXzFGE8nX5KDPMr254z2zGXpu/8vOkGQLLUfMECMIInQh0iJNb
 h7SEc494L9HGgxvgZvoqbbLXetZUDPK04heKBiLEwrDFVPKuOjVNMTwc1Y7l2Sd79omaRAWFPJv
 Q5d6wLj/mGCKi7H4I7U5oFW6sulaHWXPsdgajYfbHbsnnS9Rr2ytCLXevSZ/1wanzEexdiF4xtU
 w2iv9H0jRvCorCLi9YiYyx3k86VtdgXRYNu21M0MhRxT7LxNjuHOCcZrL1WcOfRok0Px0BXoZBg
 4BNReRuBJ717SQ4f39wbzdD9oLuQSeRy6Xc/7W3DCoPPrwXIB2rLe8Vowdd57HYNtIynvzgS7eu
 uKXrN2X/ch5T3pOwMZkunXTfw4KZP7M47nH1WdPrHU2BXAzc+vUKW
X-Received: by 2002:ac8:5a0c:0:b0:4cd:ff33:1ce7 with SMTP id
 d75a77b69052e-4cdff51a4eemr13103131cf.3.1758534033772; 
 Mon, 22 Sep 2025 02:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELhFuWdjsYSdj9FPHM6ic0X6+DJCEC6Pmfu51Xrw6oDaWX8H/IWt6E6CzyE1gUwe2UoHrcGg==
X-Received: by 2002:ac8:5a0c:0:b0:4cd:ff33:1ce7 with SMTP id
 d75a77b69052e-4cdff51a4eemr13102901cf.3.1758534033229; 
 Mon, 22 Sep 2025 02:40:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57b9545a8f0sm1561000e87.83.2025.09.22.02.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:40:32 -0700 (PDT)
Date: Mon, 22 Sep 2025 12:40:30 +0300
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
Subject: Re: [PATCH v5 06/14] phy: qcom: qmp-usbc: Add USB/DP switchable PHY
 clk register
Message-ID: <we6q6eg6ho4hvf2b6ibhakoxl2gdph6siokkgvzrnpp2iampl4@xomenqunmssw>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-6-eae6681f4002@oss.qualcomm.com>
 <xtosrpz6rzdvtmpyq73gboeckl3c2x23iqehlxzbaszqmzugjd@ixhj25qujqxo>
 <d09b2b45-3ca9-4808-8ff1-72b98d6fed2e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d09b2b45-3ca9-4808-8ff1-72b98d6fed2e@oss.qualcomm.com>
X-Proofpoint-GUID: YLU8BYhdf0gv13-12DP6eDWd9pkZrhyw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX1Qrwbiy523iD
 6xLfk9yVe72ZIjikLpwohwbmn+mM2X1Ew6vS+BFcvJdC8jG0JtFgzytSg0BDrW9euS81bkAPFnB
 Ofv1U/a/xcpUxO2UrpiwNYdd7bFdHou1xA+qcD8YlNZGq43YrftqEsrr8HUIcvxOnx/9PTjf/h/
 i01uT+2XJ/r4VqPjhU4b/SYRPB1zWmDLKWY90IBUI5yicShLCaCsGz5u+73OR7ch2v3QhFydeTH
 jHj8uEZCuokGZ8Hj1LGHVjJ1EXGEvXqtogVQxu1eivXZ6xxYgxaH9CjfBV6oQCWgnh6Fl5eWaxP
 nJY2G7tVe8gePdHUM6BmTP8HlPW0UncEyfi2i9sO8OvdViyFLUckrnoVUazZIEifbvoit9gJu8k
 BaUxmVmg
X-Proofpoint-ORIG-GUID: YLU8BYhdf0gv13-12DP6eDWd9pkZrhyw
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d11992 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=o0wnlFsxEizOfUfN_0IA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018
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

On Mon, Sep 22, 2025 at 04:26:43PM +0800, Xiangxu Yin wrote:
> 
> On 9/20/2025 12:46 AM, Dmitry Baryshkov wrote:
> > On Fri, Sep 19, 2025 at 10:24:23PM +0800, Xiangxu Yin wrote:
> >> Add USB/DP switchable PHY clock registration and DT parsing for DP offsets.
> >> Extend qmp_usbc_register_clocks and clock provider logic to support both
> >> USB and DP instances.
> > Why?
> 
> 
> Shall I update commit msg as below?
> 
> "phy: qcom: qmp-usbc: add DP link and vco_div clocks for DP PHY
> 
> USB3DP PHY requires link and vco_div clocks when operating in DP mode.
> Extend qmp_usbc_register_clocks and the clock provider logic to register
> these clocks along with the existing pipe clock, to support both USB and
> DP configurations."

Yes, please.

> 
> 
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 210 ++++++++++++++++++++++++++++++-
> >>  1 file changed, 204 insertions(+), 6 deletions(-)
> >>

-- 
With best wishes
Dmitry
