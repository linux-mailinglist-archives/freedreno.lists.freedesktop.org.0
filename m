Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AC4AD45DF
	for <lists+freedreno@lfdr.de>; Wed, 11 Jun 2025 00:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED8010E5DA;
	Tue, 10 Jun 2025 22:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGoXBpPC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB5810E5E2
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 22:25:07 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIQfl5006681
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 22:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XDHd4ci76N1m7artzB98ac4U
 VLxKbD1UASxKG9cjK+o=; b=eGoXBpPCA8IG4+slW/R1e4StfS4i34M8KB9e9FoQ
 Lv2L/3o+DBHu8wLEii9tu5eomqy3mpHA8gMYHkzplcM0cWMc5zye38Iuv3IW6Lp3
 A0+leM91Up9WgHkVgiDuXdR58QAInOJ+PqE0CRhsN0C+rnoSBq+PunorAt8ekmwd
 /lmsycRnNt36QCNcavTjn4fPo6C4u9YiW2lpOMbgKJh9f0cNSLelpRsFx6tYoLby
 gjNoeTqYa0g8IpHSybMKrlgEcx+GvE1Ea3EeI398mOiRefwfyi/JtsVMku78GXCI
 3N+JZgLoTBlREVwdNFIO7YopgO8rRsrihBZ2TjpAQSXU2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y5th8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 22:25:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c92425a8b1so52100785a.1
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 15:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749594305; x=1750199105;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XDHd4ci76N1m7artzB98ac4UVLxKbD1UASxKG9cjK+o=;
 b=E9xJVEZBNB+nKqI0B7qcT6PVThwOB8qCSyu8/b0v/W3tunx/4jyqm2WuYkKF47UWbW
 uBLxoiB0NlQF8Agf9V9GqQclZ45E4TAmNEK2CliG82/rsPGwzu7cD7cxGs7PD2BpDVNU
 JEH0p5k2UrFuRSmwGSbcQZoEt2CN/HHrf6uzml0kVVe8/zBF4SIEHQuODAYrXMfPtKfQ
 3vbD0jqZN6CHDGC9j1afuNNTGPwRoV+mkhvDEdRNdEUUCdOlPPaem30H1M+wQkisUQuU
 FYSvGyeRu9U7iz7RC8+tmmZ1N7F1QYmWbX1xMUWbZP5QfkCA+1l8yTWPX+QlPlqIlaRp
 Vmkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrb1bfRdxcALMry1eqK9SCCo/8gaeVMaDDkPTYbrgqTCF+lWq+n61s2jDC5RD+jFnCO/AK9D4NIAU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLA/OoHXF0EN+4APxfmFp4lx/uPSUuSrRQixF2KI0KCr8A4HOr
 MuOHi4/7/LQilLCC7tw1NrcJE+BVF1bBzMfCmC5D6X/v2Bt8R0FKlE7/qGQ3e/VueqzME6uvB0N
 4hMZqsjGBTmvngcRTY56YeHCk2RLC4eUYPWFWVEXkhnmnWcT/RMo+YzAL606Ax7V9NjxCa1E=
X-Gm-Gg: ASbGncvtleoul1pAflggrIDt24rlL9dncNkZdNyLx7vW16Hu1cmXJu7dZJBNITzoj1y
 w1iKh3cp4s4KuF+TWEVJOBUMGVgmU5R3loTrpMDZofmG00wQqOJH2DMVpwZGDpqn32ttrIWblcJ
 XECBM6l/W8eoNd1YewiW+IBKVabULY1hVZZr2dtrii+Vo84WRewgmX7Puvx/BRl83pyaJ5lG/UG
 RjYoQvZQpnIZ6XQJPc1sKX0nhnQq97Vr3AWBMYNfjPHPkAbOS3GexR1jiNWuCS/w6uIFx11m3wF
 tr/951xnT8VwPyLHq0ToGzsLtR88auNIcO3L4Tz6StTEUUqxq97dc8wt+PSEk+ZI44CpenNuOch
 slpdedMbm592AbSCR/zwGqu7qlSMT1qAvYS0=
X-Received: by 2002:a05:620a:3184:b0:7ce:ea9d:5967 with SMTP id
 af79cd13be357-7d3a888cc40mr175308885a.15.1749594305565; 
 Tue, 10 Jun 2025 15:25:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEvri0NokR0cixmKJM7ugmHZgyYf1QPIBroXgD4LM3M5FEjj8mAWnMIjgTZswFHUeWxkQZCg==
X-Received: by 2002:a05:620a:3184:b0:7ce:ea9d:5967 with SMTP id
 af79cd13be357-7d3a888cc40mr175303985a.15.1749594305169; 
 Tue, 10 Jun 2025 15:25:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1ccdd53sm15739121fa.88.2025.06.10.15.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 15:25:03 -0700 (PDT)
Date: Wed, 11 Jun 2025 01:25:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v6 11/17] drm/msm/dsi: Add support for SM8750
Message-ID: <shj5i5bjauxfuynrdaw4dysx4ypfr5a4tyhjsweroemt4wcavl@anxzkf23onlm>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-11-ee633e3ddbff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-b4-sm8750-display-v6-11-ee633e3ddbff@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE4NSBTYWx0ZWRfX2mi4MaKKDhnH
 gkJCnJOY75evG6sztOfQQXEcaI7urh5mguDRD+M1WuZyE9Ds7RMmtAEihPoCVF28d/vFzmGWSr5
 KEr5Whx6oWbsPstrS1TTMuDvF8xg/nkapUQ+7mBOvdQKfuqiy3OiF2pHB62gGd0PSaCSre3AmwN
 XzLAqaIFk0qDaTLzCsNCTGRkMwcEqF79iEn1cKshRpBfn+MnqIegOj99CPU8AMGo5yokMzFKp6M
 s/MoulV7TrFnEt6mynNbLFUypt23A5St7ixnEX04BPTGGAzoOTj/ZjCRwQr5yqh+VsPOfI1z+vo
 CsnxcmjS/qzuh/F461UL0GWj3urF+jso6rrIJuKnjE6HmNwNxYJrC4qtuKPRHSaKjrHIlyAVb79
 Tzy4HnKesiqTx24GdnBv4GWXoHhMB4tYY3t6IXDg5vjscJ/WxXkTrQpbzIERLy0npX+x778i
X-Proofpoint-GUID: Csz8KMgnAxzZgpQJ60x4gvIRHlRqqHoT
X-Proofpoint-ORIG-GUID: Csz8KMgnAxzZgpQJ60x4gvIRHlRqqHoT
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=6848b0c2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Fe6Hossnl1h87qNRHPAA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=764 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100185
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

On Tue, Jun 10, 2025 at 04:05:49PM +0200, Krzysztof Kozlowski wrote:
> Add support for DSI on Qualcomm SM8750 SoC with notable difference:
> 
> DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
> parents before DSI PHY is configured, the PLLs are prepared and their
> initial rate is set.  Therefore assigned-clock-parents are not working
> here and driver is responsible for reparenting clocks with proper
> procedure: see dsi_clk_init_6g_v2_9().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
