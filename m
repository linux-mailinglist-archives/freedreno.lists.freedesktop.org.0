Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB5BB0AF12
	for <lists+freedreno@lfdr.de>; Sat, 19 Jul 2025 11:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677A010E1E8;
	Sat, 19 Jul 2025 09:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LwVVF8mn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD1810E1E8
 for <freedreno@lists.freedesktop.org>; Sat, 19 Jul 2025 09:19:54 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J4K4nC014344
 for <freedreno@lists.freedesktop.org>; Sat, 19 Jul 2025 09:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=fgOH2EMBXPQoK79TfkIp2MYG
 GZpvPv+GXdFI8RzZGME=; b=LwVVF8mn8nWKHE79wwKCX/hA8cQPK322+nqhA+33
 cZ9GvIaRKii2zf/E6zXyQuBfmLMUiAGOHYfbAHXN9BvwpiIPLtQp8EzGPd0Wh3/s
 Mqlp0g/Jg/ymbQnVmmkUpjpOvnqKJhhMFEe2e4gzVKNAga6/SZMG1f95UUkXZmiJ
 HajOJzq1QS8+NBOpnhYbW/boGgdLJjITliS0tcU21xCzgeLbDOYUxB2Y9h/OKGSd
 ltMH1H0ZgFQAuaq1hOCZoV1cB1UKkmWGOdPTOlMRNM9+9cAa03HRYJzUcFA3KKw6
 p8xXhUrb0m6S4uUQPhcKMdAd/xJThltCxqqX/ndoV4Bo/Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q0d7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 19 Jul 2025 09:19:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e34399a08fso610361785a.1
 for <freedreno@lists.freedesktop.org>; Sat, 19 Jul 2025 02:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752916793; x=1753521593;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fgOH2EMBXPQoK79TfkIp2MYGGZpvPv+GXdFI8RzZGME=;
 b=JfhSHnZa/T3jB3To8I/V2ZrO/l4V5DPzp1Vo9ZP1dm4qFnMFRGAyR2ryCTnQGRS3wY
 VMxdXVRBBSnwU7+bMOfDuOIde9cKz+BE47aOBb2BX8lgffSY1WqXSBoWS8Ia3bwUDGB+
 ey51XLztxRzNhLXEpdOBTqVQ0DjFU1jogYMR8nP6uKgzMk3b8Zw5u+7WJtgwwvJjwKmk
 1ZbroQFiZ0S4ruDyDzpcntdq9n4j+df0qB5eJfoJJ/86BIyO6eKbxLofTlYp2h1RgnNZ
 Rs6Z3lSe4k2u0FNsDXzDqnlZaa8Fi0LRNwSzJ8qX9FU1c3WQGC7HLIj0UisimwckC3Ed
 MmTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUCRhgkZm0TRUuCRf1USefZup98RtZOHnfmXGwiWoGjz23jsPwPc7K0NxL/7IQjpz+cWl2A7tNDY4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwySTBCQ1PRIUm69vB1WeLOcoFDs2+3cwGUtPWOmsRvHjpEMlGE
 MjvHCdS138K9xCQjkR2ySB3OWf28xQneSCiGsXE0Hx6Ceu8RlN4YUnGlfC0DC9n+TLz3+vu4Gzq
 Lt6MSBYOVL1tz3Axlrx3f7AptAIPhH7CMMTAUtKtbn0mq3vcwneeXV5aKx4hWMN0T65OZzUE=
X-Gm-Gg: ASbGncumYFEUudloG9Dt66SlCg4ctW5SasQkQMJ0EZHMY4sHJNNL5C5sQTBsfuj6xB/
 iOVxNc86/BJ7TJyRiZxmFfdwrKToPWLzdQxpbI3boTqCjSVIwUvRbPz1vYAJ2tAmUrZ8ol7tZEs
 6Krc9JhkcTLNzZZnkXHKAop/8q+cx6Nb6fDh+Y+n4tUAOTCveuLAO++wYInsy+HNZoJqAZAsZp/
 nYgC3dqUhfAzwtbiaxoTis7hS/eI3KV94TnwiYXie6pETyGy7k2+gbXaX524TKhp+kqtr8Rp7VT
 WTbIfFOZoMqMjLaqxarSnEZWtScu0AXEil1tLECCavDWGyO6NPs7n8E/o23/0wS4M4s538w3zio
 Onth9kpfz14zABTdVpSp2cbSSwRU4Yhm5hDrx/xwt6CFd0NnjPTax
X-Received: by 2002:a05:620a:2943:b0:7e3:2c03:a198 with SMTP id
 af79cd13be357-7e34362d8cemr1715370885a.51.1752916792961; 
 Sat, 19 Jul 2025 02:19:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrTVJZ6H+BDUrXWMtyZHvBXjeITWziIhnLeZNZgm7ut9rW4DupNl8jJmWor3RXExsowMtcPQ==
X-Received: by 2002:a05:620a:2943:b0:7e3:2c03:a198 with SMTP id
 af79cd13be357-7e34362d8cemr1715369185a.51.1752916792436; 
 Sat, 19 Jul 2025 02:19:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a91c1575sm5342391fa.52.2025.07.19.02.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 02:19:51 -0700 (PDT)
Date: Sat, 19 Jul 2025 12:19:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
 sean@poorly.run, marijn.suijten@somainline.org
Subject: Re: [PATCH v3] drm/msm/dsi: Fix 14nm DSI PHY PLL Lock issue
Message-ID: <y7tffafhe3skb7pgx7r4hx2dxccfl36jylko2ujndejxktfbiw@gzbrhnesntxn>
References: <20250709140836.124143-1-loic.poulain@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709140836.124143-1-loic.poulain@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA5MSBTYWx0ZWRfX0+M/Yp7yQGYa
 5If6DAs69aa5lmpfrfiE1H/Z7GanOCL64k2Kv01qQbRE15FAmgjNQW4iLhpMnNCb/GaW+RGuz9c
 v/C3NOgjEbLPTpHWXi21/dvBvK4f7tas9FWlxPz7ezQskZkoO/sSnZNu4KxAcMOWCBPTo4JMycF
 gYWL+CEvXVfR9iGS5Ym1LpGzDN2KIIBQ5cOTnK1lvWSuYzAjq2g3JG+2sOa6+QQXpebKvJ5mp/x
 Zy1q+aYMLIitn6g8enLuLBgBsZGQIOL36AzlKSy90Y0xZ78LcFwQ68xI+En9psTVQsVZMdD11XC
 1OfWyWzJYSrtOeBS7woZyuXZTxVva90gNHXs7J70tU6TDUx4PwbOO+vDQA2zIsitRwpGfkGZmDB
 6D1sUgWVzp5Rcmc5qy0Q5nQvvwB/GumsJxbj8U2dJ84GrcZeim9948n7CwRXfLEMYFfymm7q
X-Proofpoint-ORIG-GUID: l7O2CkBPBh-8sTl9WWi6_okw3J2wYudz
X-Proofpoint-GUID: l7O2CkBPBh-8sTl9WWi6_okw3J2wYudz
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687b6339 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=vVdACntxX79Zt9NN4_cA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507190091
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

On Wed, Jul 09, 2025 at 04:08:36PM +0200, Loic Poulain wrote:
> To configure and enable the DSI PHY PLL clocks, the MDSS AHB clock must
> be active for MMIO operations. Typically, this AHB clock is enabled as
> part of the DSI PHY interface enabling (dsi_phy_enable_resource).
> 
> However, since these PLL clocks are registered as clock entities, they
> can be enabled independently of the DSI PHY interface, leading to
> enabling failures and subsequent warnings:
> 
> ```
> msm_dsi_phy 5e94400.phy: [drm:dsi_pll_14nm_vco_prepare] *ERROR* DSI PLL lock failed
> ------------[ cut here ]------------
> dsi0pllbyte already disabled
> WARNING: CPU: 3 PID: 1 at drivers/clk/clk.c:1194 clk_core_disable+0xa4/0xac
> CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted:
> Tainted: [W]=WARN
> Hardware name: Qualcomm Technologies, Inc. Robotics RB1 (DT)
> pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [...]
> ```
> 
> This issue is particularly prevalent at boot time during the disabling of
> unused clocks (clk_disable_unused()) which includes enabling the parent
> clock(s) when CLK_OPS_PARENT_ENABLE flag is set (this is the case for the
> 14nm DSI PHY PLL consumers).
> 
> To resolve this issue, we move the AHB clock as a PM dependency of the DSI
> PHY device (via pm_clk). Since the DSI PHY device is the parent of the PLL
> clocks, this resolves the PLL/AHB dependency. Now the AHB clock is enabled
> prior the PLL clk_prepare callback, as part of the runtime-resume chain.
> 
> We also eliminate dsi_phy_[enable|disable]_resource functions, which are
> superseded by runtime PM.
> 
> Note that it breaks compatibility with kernels before 6.0, as we do not
> support anymore the legacy `iface_clk` name.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  v3: Drop extra pm_runtime calls from probe
>      Reword resume error on message 
>      Document compatibility break
> 
>  v2: Move AHB clock into a proper PM dep instead of manually toggling it
>      from the PLL clock driver.
> 
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 59 ++++++++-------------------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h |  1 -
>  2 files changed, 18 insertions(+), 42 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
